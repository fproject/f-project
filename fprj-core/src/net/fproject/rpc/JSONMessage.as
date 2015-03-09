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
		
		public function JSONMessage(operation:JSONOperation, sendingArgs:Array, token:AsyncToken)
		{
			super();
			
			var preparedMsg:Object = prepareImpl(operation, sendingArgs, token);
			
			this.clientId    		= UIDUtil.getUID(FlexGlobals.topLevelApplication);
			this.messageId   		= UIDUtil.createUID();
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
				for (var i:int = sendingArgs.length - 1; i > -1 ; i--)
				{
					if(route.indexOf("{" + i + "}") == -1)
					{
						remainingArgs.push(sendingArgs[i]);
					}
					else
					{
						route = replaceRoute(route, i, sendingArgs[i]);
					}					
				}
			}
			
			var body:Object = remainingArgs.length == 0 ? {} : remainingArgs.length == 1 ? remainingArgs[0] : remainingArgs;				
			
			var routeData:Object = {url:route, body:body};
			
			return routeData;
		}
		
		private function replaceRoute(route:String, i:int, argValue:*):String
		{
			if(argValue === null || isNaN(argValue))
			{
				const target:String = "{" + i + "}";
				var j:int = route.lastIndexOf(target);
				while (j != -1)
				{
					var k:int = j - 1;
					while(route.charAt(k) != "&" && route.charAt(k) != "?")
					{
						k--;
					}
					if(route.charAt(k) == "?")
						k++;
						
					route = route.substring(0, k) + route.substr(j + target.length);
					j = route.lastIndexOf(target);
				}
				
				if(StringUtil.startsWith(route, "&"))
					route = route.substr(1);
				else if(StringUtil.startsWith(route, "?&"))
					route = "?" + route.substr(2);
			}
			else
			{				
				route = route.replace(new RegExp("\\{"+i+"\\}", "g"), argValue);
			}			
			
			return route;
		}
	}
}