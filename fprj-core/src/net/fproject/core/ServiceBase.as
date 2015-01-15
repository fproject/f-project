///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	import flash.utils.Dictionary;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
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
		
		protected var _remoteService:IRemoteObject;

		/**
		 * 
		 * The remote service object
		 * 
		 */
		protected function get remoteService():Object
		{
			if(_remoteService == null)
			{
				//Initialize callback dictionary
				responderToCallbackInfo = new Dictionary();
				
				_remoteService = RemoteObjectFactory.getInstance(this);
				
				//Set credentials if needed
				if(_remoteService != null && _remoteService.channelSet.authenticated == false)
				{
					_remoteService.setCredentials(appContext.loginUser.id,
						appContext.loginUser.token);
				}				
				
				_remoteService.addEventListener(FaultEvent.FAULT, onServiceFailed, false, 0, true);
			}
			return _remoteService;
		}

		protected function deleteServiceCall(responder:CallResponder):void
		{
			responder.removeEventListener(ResultEvent.RESULT, onCallComplete);
			responder.removeEventListener(FaultEvent.FAULT, onCallFailed);
			delete responderToCallbackInfo[responder];
		}
		
		protected function onServiceFailed(e:FaultEvent):void
		{
			checkFaultForNetworkStatus(e);
			
			trace("Service failed: " + e.currentTarget.source + "\n" + e.message);
			if(appContext.hasEventListener(AppContextEvent.SERVICE_FAILED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_FAILED, e));
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
		
		private function checkFaultForNetworkStatus(e:FaultEvent):void
		{
			if(getNetworkFaultCode(e) != null)
			{
				changeNetworkAvailability(false);
			}
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
	}
}