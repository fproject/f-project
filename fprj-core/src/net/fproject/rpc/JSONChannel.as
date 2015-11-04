///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLVariables;
	
	import mx.core.mx_internal;
	import mx.messaging.Channel;
	import mx.messaging.MessageAgent;
	import mx.messaging.MessageResponder;
	import mx.messaging.config.LoaderConfig;
	import mx.messaging.errors.MessageSerializationError;
	import mx.messaging.messages.AcknowledgeMessage;
	import mx.messaging.messages.ErrorMessage;
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.messaging.messages.IMessage;
	import mx.netmon.NetworkMonitor;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	
	import net.fproject.utils.ApplicationGlobals;
	
	use namespace mx_internal;
	
	[ResourceBundle("messaging")]
	
	/**
	 * The JSONChannel class is used to turn an HTTPRequestMessage object into an HTTP request.
	 * This channel is generally used to connect to REST web services.
	 * This channel does not connect to a AMF endpoint.
	 */
	public class JSONChannel extends Channel
	{
		/**
		 *  Constructs an instance of a JSONChannel.
		 *  The parameters are not used.
		 *  
		 */
		public function JSONChannel(id:String, uri:String="")
		{
			super(id, uri);
			clientId = ("JSONChannel" + clientCounter++);
		}
		
		/**
		 * @private
		 * Used by JSONMessageResponder to specify a dummy clientId for AcknowledgeMessages.
		 * Each instance of this channel gets a new clientId.
		 */ 
		mx_internal var clientId:String;
		
		/**
		 *  @private
		 */
		private var resourceManager:IResourceManager =
			ResourceManager.getInstance();
		
		/**
		 *  Indicates if this channel is connected.
		 *  
		 */
		override public function get connected():Boolean
		{
			return true;
		}
		
		/**
		 *  Indicates the protocol used by this channel.
		 *  
		 */
		override public function get protocol():String
		{
			return "http";     
		}
		
		//----------------------------------
		//  realtime
		//----------------------------------
		
		/**
		 *  @private
		 *  Returns true if the channel supports realtime behavior via server push or client poll.
		 */
		override mx_internal function get realtime():Boolean
		{
			return false;
		}    
		
		/**
		 *  @private
		 *  Because this channel is always "connected", we ignore any connect timeout
		 *  that is reported.
		 */
		override protected function connectTimeoutHandler(event:TimerEvent):void
		{
			// Ignore.
		}
		
		/**
		 *  Returns the appropriate MessageResponder for the Channel.
		 *
		 *  @param agent The MessageAgent sending the message.
		 * 
		 *  @param message The IMessage to send.
		 * 
		 *  @return The MessageResponder to handle the send result or fault.
		 *  
		 */
		override protected function getMessageResponder(agent:MessageAgent, 
														message:IMessage):MessageResponder
		{
			return new JSONMessageResponder(agent, message, this, new URLLoader());
		}
		
		/**
		 *  Because this channel doesn't participate in hunting we will always assume
		 *  that we have connected.
		 *
		 *  @private
		 */
		override protected function internalConnect():void
		{
			connectSuccess();
		}
		
		override protected function internalSend(msgResp:MessageResponder):void
		{
			if(msgResp is JSONMessageResponder)
			{
				var httpMsgResp:JSONMessageResponder = JSONMessageResponder(msgResp);
				var urlRequest:URLRequest;
				
				try
				{
					urlRequest = createURLRequest(httpMsgResp.message);
				}
				catch(e: MessageSerializationError)
				{
					httpMsgResp.agent.fault(e.fault, httpMsgResp.message);
					return;
				}
				
				var urlLoader:URLLoader = httpMsgResp.urlLoader;
				urlLoader.addEventListener(ErrorEvent.ERROR, httpMsgResp.errorHandler);
				urlLoader.addEventListener(IOErrorEvent.IO_ERROR, httpMsgResp.errorHandler);
				urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, httpMsgResp.securityErrorHandler);
				urlLoader.addEventListener(Event.COMPLETE, httpMsgResp.completeHandler);
				urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpMsgResp.httpStatusHandler);
				urlLoader.load(urlRequest);
			}			
		}
		
		/**
		 * @private
		 */
		/*override */mx_internal function createURLRequest(message:IMessage):URLRequest
		{
			var httpMsg:HTTPRequestMessage = HTTPRequestMessage(message);
			var req:URLRequest = new URLRequest();
			
			// Propagate our requestTimeout for those platforms
			// supporting the idleTimeout property on URLRequest.
			if ("idleTimeout" in req && requestTimeout > 0)
				req["idleTimeout"] = requestTimeout * 1000;
			
			req.contentType = httpMsg.contentType;
			
			var contentTypeIsXML:Boolean = 
				req.contentType == HTTPRequestMessage.CONTENT_TYPE_XML 
				|| req.contentType == HTTPRequestMessage.CONTENT_TYPE_SOAP_XML;
			
			var urlVariables:URLVariables = new URLVariables();
			
			if (!contentTypeIsXML)
			{
				
				var body:Object = httpMsg.body;
				for (var p:String in body)
					urlVariables[p] = httpMsg.body[p];
			}
			
			var headers:Object = httpMsg.httpHeaders;
			var requestHeaders:Array = [];
			
			if (headers)
			{				
				for (var h:String in headers)
				{
					requestHeaders.push(new URLRequestHeader(h, headers[h]));
				}				
			}
			
			if(ApplicationGlobals.isDesktop())
			{
				if(this.credentials != null && (headers == null || !headers.hasOwnProperty('Authorization')))
					requestHeaders.push(new URLRequestHeader('Authorization', 'Bearer ' + this.credentials));
				
				if(headers == null || !headers.hasOwnProperty('Accept'))
					requestHeaders.push(new URLRequestHeader('Accept', JSONMessage.CONTENT_TYPE_JSON));
				
				req.requestHeaders = requestHeaders;
			}
			else
			{
				if(this.credentials != null)
					urlVariables['access-token'] = this.credentials;
					
				urlVariables['_format'] = JSONMessage.CONTENT_FORMAT_JSON;
			}
			
			var url:String = httpMsg.url;
			var params:String = urlVariables.toString();
			
			if (params && params != "")
			{
				url += (url.indexOf("?") > -1) ? '&' : '?';
				url += params;
			}
			req.url = url;
			
			if (httpMsg.method == HTTPRequestMessage.POST_METHOD || contentTypeIsXML)
			{
				req.method = "POST";
				if (req.contentType == HTTPRequestMessage.CONTENT_TYPE_FORM)
					req.data = urlVariables.toString();
				else
				{
					// For XML content, work around bug 196450 by calling 
					// XML.toXMLString() ourselves as URLRequest.data uses
					// XML.toString() hence bug 184950.
					if (httpMsg.body != null && httpMsg.body is XML)
						req.data = XML(httpMsg.body).toXMLString();
					else
						req.data = httpMsg.body;
				}
			}
			
			
			if (NetworkMonitor.isMonitoring())
			{
				NetworkMonitor.adjustURLRequest(req, LoaderConfig.url, message.messageId);
			}
			
			return req;
		}
		
		/**
		 * Set OAuth 2.0 token 
		 * @param credentials the OAuth 2.0 token 
		 * @param agent this parameter is ignored
		 * @param charset this parameter is ignored
		 * 
		 */
		override public function setCredentials(credentials:String, agent:MessageAgent=null, charset:String=null):void
		{
			this.credentials = credentials;			
		}
		
		/**
		 * @private
		 * Incremented per new instance of the channel to create clientIds.
		 */
		private static var clientCounter:uint;
	}
}

import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;

import mx.core.mx_internal;
import mx.messaging.MessageAgent;
import mx.messaging.MessageResponder;
import mx.messaging.messages.AbstractMessage;
import mx.messaging.messages.AcknowledgeMessage;
import mx.messaging.messages.ErrorMessage;
import mx.messaging.messages.HTTPRequestMessage;
import mx.messaging.messages.IMessage;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

use namespace mx_internal;

[ResourceBundle("messaging")]

/**
 *  @private
 *  This is an adapter for url loader that is used by the HTTPChannel.
 */
class JSONMessageResponder extends MessageResponder
{
	//--------------------------------------------------------------------------
	//
	// Constructor
	// 
	//--------------------------------------------------------------------------    
	
	/**
	 *  Constructs a JSONMessageResponder.
	 *  
	 */
	public function JSONMessageResponder(agent:MessageAgent, msg:IMessage, 
											   channel:net.fproject.rpc.JSONChannel, urlLoader:URLLoader)
	{
		super(agent, msg, channel);
		this.urlLoader = urlLoader;
		clientId = channel.clientId;
	}
	
	//--------------------------------------------------------------------------
	//
	// Variables
	// 
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private var clientId:String;
	
	/**
	 * @private
	 */
	private var lastStatus:int;
	
	/**
	 * @private
	 */
	private var resourceManager:IResourceManager = ResourceManager.getInstance();
	
	/**
	 *  The URLLoader associated with this responder.
	 *  
	 */
	public var urlLoader:URLLoader;
	
	/**
	 * X-HTTP Method Override.
	 * Available methods: PUT, PATCH, DELETE, HEAD, OPTIONS
	 */
	public var xMethodOverride:String;
	
	//--------------------------------------------------------------------------
	//
	// Methods
	// 
	//--------------------------------------------------------------------------    
	
	/**
	 *  @private
	 */
	public function errorHandler(event:Event):void
	{
		status(null);
		// send the ack
		var ack:AcknowledgeMessage = new AcknowledgeMessage();
		ack.clientId = clientId;
		ack.correlationId = message.messageId;
		ack.headers[AcknowledgeMessage.ERROR_HINT_HEADER] = true; // hint there was an error
		agent.acknowledge(ack, message);
		// send fault
		var msg:ErrorMessage = new ErrorMessage();
		msg.clientId = clientId;
		msg.correlationId = message.messageId;
		msg.faultCode = "Server.Error.Request";
		msg.faultString = resourceManager.getString(
			"messaging", "httpRequestError");
		var details:String = event.toString();
		if (message is HTTPRequestMessage)
		{
			details += ". URL: ";
			details += HTTPRequestMessage(message).url;
		}
		msg.faultDetail = resourceManager.getString(
			"messaging", "httpRequestError.details", [ details ]);
		msg.rootCause = event;
		msg.body = URLLoader(event.target).data;
		msg.headers[AbstractMessage.STATUS_CODE_HEADER] = lastStatus;
		agent.fault(msg, message);
	}
	
	/**
	 *  @private
	 */
	public function securityErrorHandler(event:Event):void
	{
		status(null);
		// send the ack
		var ack:AcknowledgeMessage = new AcknowledgeMessage();
		ack.clientId = clientId;
		ack.correlationId = message.messageId;
		ack.headers[AcknowledgeMessage.ERROR_HINT_HEADER] = true; // hint there was an error
		agent.acknowledge(ack, message);
		// send fault
		var msg:ErrorMessage = new ErrorMessage();
		msg.clientId = clientId;
		msg.correlationId = message.messageId;
		msg.faultCode = "Channel.Security.Error";
		msg.faultString = resourceManager.getString(
			"messaging", "securityError");
		msg.faultDetail = resourceManager.getString(
			"messaging", "securityError.details", [ message.destination ]);
		msg.rootCause = event;
		msg.body = URLLoader(event.target).data;
		msg.headers[AbstractMessage.STATUS_CODE_HEADER] = lastStatus;
		agent.fault(msg, message);
	}
	
	/**
	 *  @private
	 */
	public function completeHandler(event:Event):void
	{
		result(null);
		var ack:AcknowledgeMessage = new AcknowledgeMessage();
		ack.clientId = clientId;
		ack.correlationId = message.messageId;
		ack.body = URLLoader(event.target).data;
		ack.headers[AbstractMessage.STATUS_CODE_HEADER] = lastStatus;
		agent.acknowledge(ack, message);
	}
	
	/**
	 *  @private
	 */
	public function httpStatusHandler(event:HTTPStatusEvent):void
	{
		lastStatus = event.status;
	}
	
	/**
	 *  Handle a request timeout by closing our associated URLLoader and
	 *  faulting the message to the agent.
	 */
	override protected function requestTimedOut():void
	{
		urlLoader.removeEventListener(ErrorEvent.ERROR, errorHandler);
		urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
		urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		urlLoader.removeEventListener(Event.COMPLETE, completeHandler);
		urlLoader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
		urlLoader.close();
		
		status(null);
		// send the ack
		var ack:AcknowledgeMessage = new AcknowledgeMessage();
		ack.clientId = clientId;
		ack.correlationId = message.messageId;
		ack.headers[AcknowledgeMessage.ERROR_HINT_HEADER] = true; // hint there was an error
		agent.acknowledge(ack, message);
		// send the fault
		agent.fault(createRequestTimeoutErrorMessage(), message);
	}
}
