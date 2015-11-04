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
	import flash.events.IEventDispatcher;
	
	import mx.messaging.ChannelSet;

	public interface IRemoteObject extends IEventDispatcher
	{
		/**
		 * 
		 * The name or ID of remote object (the source object)
		 * 
		 */
		function set source(value:String):void;
		
		/**
		 * The destination of the service. This value should match a destination
		 * entry in the services-config.xml file.
		 *
		 */
		function set destination(value:String):void;
		
		/**
		 *  Provides access to the ChannelSet used by the service. The
		 *  ChannelSet can be manually constructed and assigned, or it will be 
		 *  dynamically created to use the configured Channels for the
		 *  <code>destination</code> for this service.
		 *
		 */
		function get channelSet():ChannelSet;
		/**
		 * 
		 * @private
		 * 
		 */
		function set channelSet(value:ChannelSet):void;
		
		/**
		 *  Provides access to the request timeout in seconds for sent messages. 
		 *  A value less than or equal to zero prevents request timeout.
		 *
		 */
		function set requestTimeout(value:int):void;
		
		/**
		 * Sets the authentication/authorization token for the destination accessed by the
		 * service when using Data Services on the server side.
		 * The credentials are applied to all services connected over the same
		 * 
		 * @param token The authentication/authorization token.
		 *
		 */
		function setAuthToken(token:String):void;
		
		/**
		 * Set the convertParametersHandler function.
		 * This is an optional function, primarily intended for framework developers who need to install
		 * a function to get called with the parameters passed to each remote object invocation.
		 * The function takes an array of parameters and returns the potentially altered array.
		 *
		 * The function definition should look like:
		 * <code>
		 *   function myParametersFunction(parameters:Array):Array
		 * </code>
		 * @param value the value to set
		 * 
		 */
		function setConvertParametersHandler(value:Function):void;
		
		/**
		 * <p>Set the convertResultHandler function</p>
		 * 
		 * <p>This is an optional function, primarily intended for framework developers who need to install
		 * a hook to process the results of an operation before notifying the result handlers.</p>
		 *
		 * <p>The function definition should look like:
		 * <code>
		 *   function myConvertResultsFunction(operation:JSONOperation, result:&#42;, message:IMessage):&#42;
		 * </code>, wherea, <code>operation</code> is the currently invoking JSON operation,
		 * <code>result</code> is the deserialized result returned by the operation and <code>message</code>
		 * is the original HTTP message returned by the operation.</p>
		 * 
		 * It is passed the result just after the makeObjectsBindable conversion has been done
		 * but before the result event is created.
		 *  
		 */
		function setConvertResultHandler(value:Function):void;
	}
}