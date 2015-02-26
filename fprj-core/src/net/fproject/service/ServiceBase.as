///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.service
{
	import flash.utils.Dictionary;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
	import net.fproject.model.AppContext;
	import net.fproject.rpc.IRemoteObject;
	import net.fproject.rpc.RemoteObjectFactory;

	/**
	 * <p>Base class cho tất các các service class.
	 * Cung cấp các common property và method cho các service</p>
	 * <p>Việc truy cập remote service được thực hiện thông qua <code>RemoteObject</code></p>
	 * 
	 * <p>Thông tin <code>source</code> và <code>destination</code> của RemoteObject được xác định như sau:
	 * <ul>
	 * <li><code>source</code> của service được định nghĩa ngay trong AS3 code bằng tham số thứ nhất của metadata
	 * <code>[RemoteObject("SourceName")]</code></li> của service class.
	 * <li>Nếu trong metadata có định nghĩa tham số thứ hai, ví dụ
	 * <code>[RemoteObject("SourceName","destination")]</code> thì tham số này sẽ được lấy làm destination
	 * của remote object</li>
	 * <li>Nếu trong metadata không định nghĩa destination, destination này sẽ được look-up từ 
	 * XML của AppContextData</li>
	 * </ul>
	 * </p>
	 * 
	 * @see mx.rpc.remoting.RemoteObject
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class ServiceBase
	{		
		protected var responderToCallbackInfo:Dictionary;
		
		protected var _remoteObject:IRemoteObject;

		/**
		 * 
		 * The remote service object
		 * 
		 */
		protected function get remoteObject():Object
		{
			if(_remoteObject == null)
			{
				//Initialize callback dictionary
				responderToCallbackInfo = new Dictionary();
				
				_remoteObject = RemoteObjectFactory.getInstance(this);
				
				//Set credentials if needed
				if(_remoteObject != null && _remoteObject.channelSet.authenticated == false)
				{
					_remoteObject.setCredentials(appContext.loginUser.id,
						appContext.loginUser.token);
				}				
				
				_remoteObject.addEventListener(FaultEvent.FAULT, onServiceFailed, false, 0, true);
			}
			return _remoteObject;
		}

		protected function deleteServiceCall(responder:CallResponder):void
		{
			responder.removeEventListener(ResultEvent.RESULT, onCallComplete);
			responder.removeEventListener(FaultEvent.FAULT, onCallFailed);
			delete responderToCallbackInfo[responder];
		}
		
		protected function onServiceFailed(e:FaultEvent):void
		{
			if(getNetworkFaultCode(e) != null)
			{
				changeNetworkAvailability(false);
			}
			
			trace("Service failed: " + e.currentTarget.source + "\n" + e.message);
			if(appContext.hasEventListener(AppContextEvent.SERVICE_FAILED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_FAILED, e.fault));
		}
		
		protected function onCallFailed(e:FaultEvent):void
		{
			if (responderToCallbackInfo[e.currentTarget]["failCallback"] != undefined)
				responderToCallbackInfo[e.currentTarget].failCallback(e.fault);
			
			trace("Service call failed: " + e.toString());
			
			deleteServiceCall(CallResponder(e.currentTarget));
		}
		
		protected function onCallComplete(e:ResultEvent):void
		{
			changeNetworkAvailability(true);
			
			if (responderToCallbackInfo[e.currentTarget]["completeCallback"] != undefined)
				responderToCallbackInfo[e.currentTarget].completeCallback(e.result);
			if(appContext.hasEventListener(AppContextEvent.SERVICE_COMPLETED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_COMPLETED));
			deleteServiceCall(CallResponder(e.currentTarget));
		}
		
		protected var _lastCallResponder:CallResponder;

		public function get lastCallResponder():CallResponder
		{
			return _lastCallResponder;
		}

		
		/**
		 * Create a remote call and initialize callbacks for it.
		 * @param callToken the service call token. Just pass a service call this parameter.
		 * @param completeCallback the call-back function that will be invoked after
		 * the remote object call succesfully returned. This function must have one parameter,
		 * which will be passed an result object of ResultEvent after the call responsed
		 * @param failCallback the call-back function that will be invoked after
		 * the remote object call failed. This function must have one parameter in type Fault:
		 * <pre>function failedHandler(fault:Fault):void</pre>
		 * 
		 * @return A call responder object
		 */
		protected function createServiceCall(callToken:AsyncToken,
											 completeCallback:Function, failCallback:Function = null):CallResponder
		{
			_lastCallResponder = new CallResponder();
			_lastCallResponder.token = callToken;
			
			if(appContext.hasEventListener(AppContextEvent.SERVICE_STARTED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_STARTED));
			
			_lastCallResponder.addEventListener(ResultEvent.RESULT, onCallComplete);	
			_lastCallResponder.addEventListener(FaultEvent.FAULT, onCallFailed);	
			
			responderToCallbackInfo[_lastCallResponder] = {};
			
			if(completeCallback != null)
				responderToCallbackInfo[_lastCallResponder].completeCallback = completeCallback;
			if(failCallback != null)
				responderToCallbackInfo[_lastCallResponder].failCallback = failCallback;
			
			return _lastCallResponder;
		}
		
		private function get appContext():AppContext
		{
			return AppContext(InstanceFactory.getInstance(AppContext));
		}
		
		private function changeNetworkAvailability(value:Boolean):void
		{
			appContext.fproject_internal::setNetworkAvailable(value);
			if(appContext.hasEventListener(AppContextEvent.NETWORK_AVAILABILITY_CHANGE))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.NETWORK_AVAILABILITY_CHANGE));
		}
		
		private function getNetworkFaultCode(e:FaultEvent):String
		{
			if(e.fault.faultCode == "Channel.Call.Failed" 
				|| e.fault.faultCode == "Client.Error.RequestTimeout"
				|| e.fault.faultCode == "Client.Error.MessageSend")
			{
				return e.fault.faultCode;
			}
			return null;
		}
		
		/**
		 * Returns a single model instance by a primary key or a compsite value of primary key.
		 *
		 * For example,
		 *
		 * <pre>
		 * // find a single customer whose primary key value is 10
		 * customer = customerService.findOne(10);
		 * 
		 * // find a single customer whose composite primary key value is "11,20"
		 * customer = customerService.findOne("11,20");</pre>
		 *
		 * @param id primary key value or a compsite value of primary key 
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be a model instance 
		 * matching the condition, or null if nothing matches.
		 */
		public function findOne(id:String,
								completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.findOne(id),
				completeCallback, failCallback);
		}
		
		/**
		 * Finds models by a filter condition and returns a set of model instances with pagination.
		 *
		 * For example,
		 *
		 * <pre>
		 * // find a all customers whose name is like "ABC"
		 * customer = customerService.find({condition:"name LIKE {name}",name:"ABC"});
		 * 
		 * // find a all customers whose name is like "ABC", paging with 10 records per page and
		 * // seek to page 2
		 * customer = customerService.find({condition:"name LIKE {name}",name:"ABC"},{page:2, perPage:10});</pre>
		 *
		 * @param filter the filter condition
		 * @param pagination the pagination information
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be an array of model instances
		 * matching the condition, or null if nothing matches.
		 */
		public function find(filter:Object=null, pagination:Object=null,
								completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.find(filter, pagination),
				completeCallback, failCallback);
		}
		
		
		/**
		 * Save a model object
		 *
		 * @param model the model to save
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be the the saved model
		 * with all auto-increment fields populated.
		 */
		public function save(model:Object,
							 completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.save(model),
				completeCallback, failCallback);
		}
		
		/**
		 * Remove a model by its ID
		 *
		 * @param model the model ID to remove
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event is a boolean value
		 * indicates whether the remove action is success or failed.
		 */
		public function remove(id:String,
							 completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.remove(id),
				completeCallback, failCallback);
		}
		
		/**
		 * Batch save an array of models
		 *
		 * @param models the array of models to save
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * If the models have auto-increment fields, the <code>result</code> 
		 * field of RESULT event will contains information to retrieve the
		 * auto-increment fields.
		 */
		public function batchSave(models:Array,
							 completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.batchSave(models),
				completeCallback, failCallback);
		}
		
		/**
		 * Remove a set of models by IDs
		 *
		 * @param model an array of model IDs to remove
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event is a boolean value
		 * indicates whether the remove action is success or failed.
		 */
		public function batchRemove(ids:Array,
							   completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.batchRemove(ids),
				completeCallback, failCallback);
		}
	}
}