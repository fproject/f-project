///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	import mx.core.mx_internal;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.HTTPChannel;
	import mx.messaging.channels.SecureHTTPChannel;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	
	import net.fproject.fproject_internal;

	/**
	 * The JSONRemoteObject class provides access to JSON-based RESTful services on remote servers.
	 *  
	 */
	public dynamic class JSONRemoteObject extends AbstractService implements IRemoteObject
	{	
		/**
		 * Constructor 
		 * @param destination [optional] Destination of the JSONRemoteObject; 
		 * should match a destination ID in the services-config.xml file.
		 * 
		 */
		public function JSONRemoteObject(destination:String = null)
		{
			super(destination);
		}
		
		private var _source:String

		/**
		 * Lets you specify a source value on the client;
		 * This is an absolute URL to use for accessing a service
		 *     
		 */
		public function get source():String
		{
			return _source;
		}

		/**
		 * @private
		 */
		public function set source(value:String):void
		{
			_source = value;
		}
		
		public override function getOperation(name:String):AbstractOperation
		{
			var op:AbstractOperation = super.getOperation(name);
			if (op == null)
			{
				op = new JSONOperation(this, name);
				mx_internal::_operations[name] = op;
				op.mx_internal::asyncRequest = mx_internal::asyncRequest;
				op.mx_internal::setKeepLastResultIfNotSet(_keepLastResult);
			}
			
			return op;
		}
		
		private var _endpoint:String;
		
		[Inspectable(category="General")]
		/**
		 * This property allows the developer to quickly specify an endpoint for a JSONRemoteObject
		 * destination without referring to a services configuration file at compile time or programmatically creating 
		 * a ChannelSet. It also overrides an existing ChannelSet if one has been set for the JSONRemoteObject service.
		 *
		 * <p>If the endpoint url starts with "https" a SecureHTTPChannel will be used, otherwise an HTTPChannel will 
		 * be used. Two special tokens, {server.name} and {server.port}, can be used in the endpoint url to specify
		 * that the channel should use the server name and port that was used to load the SWF. </p>
		 *
		 * <p><b>Note:</b> This property is required when creating AIR applications.</p>
		 *  
		 */
		public function get endpoint():String
		{
			return _endpoint;
		}
		
		public function set endpoint(url:String):void
		{
			// If endpoint has changed, null out channelSet to force it
			// to be re-initialized on the next Operation send
			if (_endpoint != url || url == null)
			{
				_endpoint = url;
				channelSet = null;
			}
		}
		
		fproject_internal function initEndpoint():void
		{
			if (endpoint != null)
			{
				var chan:Channel;
				if (endpoint.indexOf("https") == 0)
				{
					chan = new SecureHTTPChannel(null, endpoint);
				}
				else
				{
					chan = new HTTPChannel(null, endpoint);
				}
				
				// Propagate requestTimeout.
				chan.requestTimeout = requestTimeout;
				
				channelSet = new ChannelSet();
				channelSet.addChannel(chan);
			}
		}
		
		fproject_internal var operationNameToMetadata:Object;
	}
}