///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	import mx.core.FlexGlobals;
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.rpc.AsyncToken;
	import mx.utils.UIDUtil;
	
	import net.fproject.serialize.Serializer;
	import net.fproject.utils.StringUtil;
	
	public class JSONMessage extends HTTPRequestMessage
	{
		public static const CONTENT_TYPE_JSON:String = "application/json";    
		
		/**
		 * The operation name 
		 */
		public var operation:String;
		
		public function JSONMessage()
		{
			super();
			this.contentType = CONTENT_TYPE_JSON;
		}   
		
		/**
		 * Create an instance of JSONMessage from JSONOperation and the arguments of <code>send</code> method
		 * @param operation
		 * @param args
		 * @return 
		 * 
		 */
		public static function prepare(operation:JSONOperation, sendingArgs:Array, token:AsyncToken):JSONMessage
		{
			// Determine parameters to send.
			var params:Object = {};
			if (operation.method == HTTPRequestMessage.GET_METHOD || operation.namedParams)
			{
				// Named parameters MUST be used
				if (sendingArgs.length > 1) 
				{
					throw new Error("Un-named parameters can only be used if 'requestType' is 'POST' and 'useNamedParams' is set to false.");
				}
				
				for (var argName:String in sendingArgs[0])
				{
					params[argName] = sendingArgs[0][argName];
				}
			} 
			else
			{
				// Using array parameters
				params = sendingArgs;
			}
			
			// Create message to send.
			var rpcMessage:JSONMessage 	= new JSONMessage();
			
			rpcMessage.clientId    		= UIDUtil.getUID(FlexGlobals.topLevelApplication);
			rpcMessage.messageId   		= UIDUtil.createUID();
			rpcMessage.operation   		= operation.name;
			rpcMessage.method      		= operation.method;
			rpcMessage.url         		= rpcMessage.getServiceOperationUrl(operation);
			rpcMessage.destination 		= operation.service.destination;
			
			if (rpcMessage.method == HTTPRequestMessage.POST_METHOD) 
			{
				// JSON encode parameters in POST body
				rpcMessage.body = Serializer.getInstance().toJSON(params);
			} 
			else 
			{
				// encode parameters in URL
				rpcMessage.body = params;
			}
			
			return rpcMessage;
		}
		
		/**
		 * Get the full URL to use when invoking operation.
		 */
		private function getServiceOperationUrl(operation:JSONOperation):String
		{
			var jsonSvc:JSONRemoteObject = JSONRemoteObject(operation.service);
			if(StringUtil.endsWith(jsonSvc.source, "/"))
				return jsonSvc.source + operation.name;
			else
				return jsonSvc.source + "/" + operation.name;
		}
	}
}