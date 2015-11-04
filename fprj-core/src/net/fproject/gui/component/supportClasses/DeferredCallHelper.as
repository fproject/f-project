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
package net.fproject.gui.component.supportClasses
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.mx_internal;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;

	/**
	 * Helper class for deferred method call .
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class DeferredCallHelper
	{
		/**
		 * Invoke call by method name and host class or host object 
		 * @param hostObj
		 * @param hostClass
		 * @param methodName
		 * @param args
		 * @param token
		 * @param classFromInstance
		 * @return method call result
		 * 
		 */
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
		
		/**
		 * 
		 * @private
		 * 
		 */
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