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
	
	public class JSONMessage extends HTTPRequestMessage
	{
		public static const CONTENT_TYPE_JSON:String = "application/json";    
		
		/**
		 * The operation name 
		 */
		//public var operation:String;
		
		public function JSONMessage(operation:JSONOperation, sendingArgs:Array, token:AsyncToken)
		{
			super();
			
			var preparedMsg:Object = prepareImpl(operation, sendingArgs, token);
			
			this.clientId    		= UIDUtil.getUID(FlexGlobals.topLevelApplication);
			this.messageId   		= UIDUtil.createUID();
			//this.operation   		= operation.name;
			this.method      		= operation.method;
			this.url         		= preparedMsg.url;
			this.destination 		= operation.service.destination;
			
			this.body = preparedMsg.body;
		}   
		
		private function prepareImpl(operation:JSONOperation, sendingArgs:Array, token:AsyncToken):Object
		{
			var ub:Object = parseUrlAndBody(operation.route, sendingArgs);
			var url:String = JSONRemoteObject(operation.service).source + ub.url;
			if (operation.method == HTTPRequestMessage.POST_METHOD ||
				operation.method == HTTPRequestMessage.PUT_METHOD)
			{
				this.contentType = CONTENT_TYPE_JSON;
				var body:Object = Serializer.getInstance().toJSON(ub.body);		
			}
			
			return {url:url, body:body};
		}
		
		private function parseUrlAndBody(route:String, sendingArgs:Array):Object
		{
			var remainingArgs:Array = [];
			if(route != null)
			{
				for (var i:int = 0; i < sendingArgs.length; i++)
				{
					if(route.indexOf("{" + i + "}") == -1)
					{
						remainingArgs.push(sendingArgs[i]);
					}
					else
					{
						route = route.replace(new RegExp("\\{"+i+"\\}", "g"), sendingArgs[i]);
					}					
				}
			}
			
			var body:Object = remainingArgs.length == 0 ? {} : remainingArgs.length == 1 ? remainingArgs[0] : remainingArgs;				
			
			var routeData:Object = {url:route, body:body};
			
			return routeData;
		}
	}
}