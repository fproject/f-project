///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component.supportClasses
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.mx_internal;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;

	public class DeferredCallHelper
	{
		public static function invokeCall(hostObj:Object, hostClass:Class, methodName:String, args:Array,
										  token:AsyncToken, classFromInstance:Boolean=false):Function
		{
			var f:Function = applyFunction(hostObj, methodName, args, token);
			if(f == null)
			{
				if(classFromInstance && hostClass == null && hostObj != null)
					hostClass = getDefinitionByName(getQualifiedClassName(hostObj)) as Class;
				f = applyFunction(hostClass, methodName, args, token);
			}
			return f;
		}
		
		private static function applyFunction(thisArg:Object, methodName:String, args:Array, token:AsyncToken):Function
		{
			if(thisArg != null && thisArg.hasOwnProperty(methodName))
			{
				var f:Function = thisArg[methodName] as Function;
				if(f != null)
				{
					var result:* = f.apply(thisArg, args);
					if(token != null)
					{
						var event:ResultEvent = new ResultEvent(ResultEvent.RESULT, false, true, result, token);
						token.mx_internal::applyResult(event);
					}
				}
			}
			
			return f;
		}
			
	}
}