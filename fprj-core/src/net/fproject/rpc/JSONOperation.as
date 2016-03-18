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
	import mx.core.mx_internal;
	use namespace mx_internal;
	import mx.rpc.*;
	import mx.rpc.events.*;
	import mx.messaging.messages.*;
	import net.fproject.fproject_internal;
	import net.fproject.serialize.Deserializer;
	import net.fproject.utils.StringUtil;
	import net.fproject.active.PaginationResult;
	
	/**
	 * A JSONOperation used specifically by JSONRemoteObject. A JSONOperation is an individual method on a service.
	 * A JSONOperation can be called either by invoking the function of the same name on the 
	 * service or by accessing the JSONOperation as a property on the service and
	 * calling the <code>send()</code> method.
	 *  
	 */
	public class JSONOperation extends AbstractOperation
	{
		/**
		 * Creates a new JSONOperation. This is usually done directly automatically by the JSONOperation
		 * when an unknown operation has been accessed. It is not recommended that a developer use this constructor
		 * directly.
		 * 
		 *  @param service The JSONOperation object defining the service.
		 *
		 *  @param name The name of the service.
		 *  
		 */
		public function JSONOperation(service:JSONRemoteObject = null, name:String = null)
		{
			super(service, name);
		}
		
		private function get remoteObject():JSONRemoteObject
		{
			return service as JSONRemoteObject;
		}
		
		/**
		 * <p>HTTP method to use when invoking rpc.</p>
		 * <p>To specify this value, use <code>method</code> argument in RESTOperation metadata for the service method.</p>
		 * Example:<pre>
		 * [RESTOperation(method="get")]
		 * public function findOne(id:String):CallResponder
		 * {...}</pre>
		 */
		public var method:String = HTTPRequestMessage.GET_METHOD;
		
		/**
		 * <p>HTTP URI route to use when invoking rpc.</p>
		 * <p>To specify this value, use RESTOperation metadata for the service method.</p>
		 * <p>To specify this value, use <code>route</code> argument in RESTOperation metadata for the service method.</p>
		 * Example:<pre>
		 * [RESTOperation(route="?criteria={0}&page={1}&per-page={2}&sort={3}")]
		 * public function find(criteria:Object=null, page:Number=NaN, perPage:Number=NaN, sort:String=null):CallResponder
		 * {...}</pre>
		 */
		public var route:String;
		
		/**
		 * <p>Retuning type, used to deserialize JSON data to strong typing models.</p>
		 * <p>To specify this value, use <code>returning</code> argument in RESTOperation metadata for the service method.</p>
		 * Example:<pre>
		 * [RESTOperation(returning="com.mypackage.User[]")]
		 * public function find():CallResponder
		 * {...}</pre>
		 */
		public var returning:String;
		
		/**
		 * <p>Specify extra URL parameters for remote call.
		 * This must be in format {0}, {1}... ofwhich the number is index of extraParams in the operation parameter list.</p>
		 * 
		 */
		public var extraParams:String;
		
		/**
		 * Send a method invokation
		 * 
		 * Parameters can be passed or set
		 * in the 'arguments' attribute of the 
		 * Operation instance.
		 * 
		 * If you are using named parameters,
		 * use a single argument that is an object
		 * with name/value pairs.
		 */
		public override function send(... args:Array):AsyncToken
		{
			if (service != null)
				service.initialize();
			
			if (remoteObject.convertParametersHandler != null)
				args = remoteObject.convertParametersHandler(args);
			
			if (operationManager != null)
				return operationManager(args);
			
			if (!args || (args.length == 0 && this.arguments is Array))
			{
				args = this.arguments as Array;
			}
			
			if(!remoteObject.endpointInitialized)
				remoteObject.fproject_internal::initEndpoint(asyncRequest.channelSet);
			
			if(remoteObject.fproject_internal::operationNameToMetadata != null &&
				remoteObject.fproject_internal::operationNameToMetadata.hasOwnProperty(this.name))
			{
				var meta:Object = remoteObject.fproject_internal::operationNameToMetadata[this.name];
				if(meta.hasOwnProperty("method"))
					this.method = meta["method"];
				if(meta.hasOwnProperty("route"))
					this.route = meta["route"];
				if(meta.hasOwnProperty("returning"))
					this.returning = meta["returning"];
				if(meta.hasOwnProperty("extraParams"))
					this.extraParams = meta["extraParams"];
			}
			
			var token:AsyncToken = new AsyncToken(rpcMessage);
			// Create message to send.
			var rpcMessage:JSONMessage = new JSONMessage(this, args, token);
			
			asyncRequest.requestTimeout = service.requestTimeout;
			
			invoke(rpcMessage, token);
			return token;
		}
		
		/**
		 * Decode our result from JSON.
		 */
		override mx_internal function processResult(message:IMessage, token:AsyncToken):Boolean
		{
			try 
			{
				if(this.returning != null)
				{
					if(this.returning.indexOf("{modelClass}") != -1)
					{
						if(this.remoteObject.modelClass != null)
							var retn:* = this.remoteObject.modelClass;
						else if(this.remoteObject.modelClassName != null)
							retn = this.returning.replace(/\{modelClass\}/g, this.remoteObject.modelClassName);
					}
					else
					{
						retn = this.returning
					}
				}
				var jsonBody:String = String(message.body);
				if(!StringUtil.isBlank(jsonBody))
					var body:Object = JSON.parse(jsonBody);
				if(body != null)
				{
					var decodedResult:Object = PaginationResult.fromJSON(body, retn);
					if(decodedResult == null)
					{
						decodedResult = Deserializer.getInstance().fromJSON(body, retn);
					}
				}
			} 
			catch (e:Error) 
			{
				if(jsonBody != null)
				{
					if(StringUtil.trim(jsonBody).charAt(0) != '{')
						decodedResult = jsonBody;
				}
				
				if(decodedResult == null)
				{
					var fault:Fault = new Fault('JSON Error', "Result decoding failed.", e.message);
					dispatchRpcEvent(FaultEvent.createEvent(fault, token, message));
					return false;
				}
			}
			
			// Decoding was successfull
			// check for an error
			// defined by the server application.
			if (resultHasError(decodedResult)) 
			{
				fault = new Fault('Application Error', decodedResult.error.message, decodedResult.error.text);
				dispatchRpcEvent(FaultEvent.createEvent(fault, token, message));
				return false;
			}
			
			if (remoteObject.convertResultHandler != null)
				decodedResult = remoteObject.convertResultHandler(this, decodedResult, message);
			
			_result = decodedResult;
			return true;
		}
		
		/**
		 * Checks to see if a result contains an
		 * error specified by the server application.
		 */
		private function resultHasError(result:Object):Boolean
		{
			if (result != null && result.hasOwnProperty("error") && result.error != null) 
			{
				return true;
			}
			
			return false;
		}
	}
}