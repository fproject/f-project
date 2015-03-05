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
	use namespace mx_internal;
	import mx.rpc.*;
	import mx.rpc.events.*;
	import mx.messaging.messages.*;
	import net.fproject.fproject_internal;
	import net.fproject.serialize.Deserializer;
	
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
		 * HTTP method to use when invoking rpc.
		 */
		public var method:String = HTTPRequestMessage.GET_METHOD;
		
		/**
		 * HTTP URI route to use when invoking rpc.
		 */
		public var route:String;
		
		/**
		 * Retuning type, used to deserialize JSON data to strong typing models
		 */
		public var returning:String;
		
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
			
			// We delay endpoint initialization until now because MXML codegen may set 
			// the destination attribute after the endpoint and will clear out the 
			// channelSet.
			if (asyncRequest.channelSet == null && remoteObject.endpoint != null)
			{
				remoteObject.fproject_internal::initEndpoint();
			}
			
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
			}
			
			var token:AsyncToken = new AsyncToken(rpcMessage);
			// Create message to send.
			var rpcMessage:JSONMessage = JSONMessage.prepare(this, args, token);
			
			asyncRequest.requestTimeout = service.requestTimeout;
			
			invoke(rpcMessage, token);
			trace('JSONOperation.send():'+JSON.stringify(rpcMessage));
			return token;
		}
		
		/**
		 * Decode our result from JSON.
		 */
		override mx_internal function processResult(message:IMessage, token:AsyncToken):Boolean
		{
			try 
			{
				var decodedResult:Object = Deserializer.getInstance().fromJSON(String(message.body), this.returning);
			} 
			catch (e:Error) 
			{
				var fault:Fault = new Fault('JSON Error', "Result decoding failed.", e.message);
				dispatchRpcEvent(FaultEvent.createEvent(fault, token, message));
				return false;
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
				_result = remoteObject.convertResultHandler(_result, this);
			
			_result = decodedResult;
			return true;
		}
		
		/**
		 * Checks to see if a result contains an
		 * error specified by the server application.
		 */
		private function resultHasError(result:Object):Boolean
		{
			if (result.hasOwnProperty("error") && result.error != null) 
			{
				return true;
			}
			
			return false;
		}
	}
}