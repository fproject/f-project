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
package net.fproject.service
{
	import flash.utils.Dictionary;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.AppContext;
	import net.fproject.event.AppContextEvent;
	import net.fproject.rpc.IRemoteObject;
	import net.fproject.rpc.RemoteObjectFactory;
	import net.fproject.utils.DateTimeUtil;

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
	 * @see net.fproject.service.ActiveService
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class ServiceBase
	{		
		private var _lastCallResponder:CallResponder;
		
		public function get lastCallResponder():CallResponder
		{
			return _lastCallResponder;
		}

		private var _remoteObject:IRemoteObject;

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
				responderToCallbackInfo = new Dictionary(true);
				
				_remoteObject = createRemoteObject();
			}
			return _remoteObject;
		}

		private var responderToCallbackInfo:Dictionary;
		
		/**
		 * 
		 * Construct the remote object using RemoteObjectFactory.
		 * This is an optional function, primarily intended for framework 
		 * developers who need to install a hook to process the remote object construction.
		 * 
		 * For example, you can override this method to set the <code>convertResultHandler</code>
		 * or <code>convertParametersHandler</code> function. 
		 * 
		 */
		protected function createRemoteObject():IRemoteObject
		{
			var ro:IRemoteObject = RemoteObjectFactory.getInstance(this);
			
			//Set default request timeout to 1 minute.
			ro.requestTimeout = 60;
			
			//Set credentials if needed
			if(ro.channelSet.authenticated == false && appContext.loginUser != null)
			{
				ro.setAuthToken(appContext.loginUser.token);
			}				
			
			ro.addEventListener(FaultEvent.FAULT, onServiceFailed, false, 0, true);
			
			return ro;
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
		}
		
		protected function onCallFailed(e:FaultEvent):void
		{
			if (responderToCallbackInfo[e.currentTarget]["failCallback"] != undefined)
				responderToCallbackInfo[e.currentTarget].failCallback(e.fault);
			
			trace("\n[" + DateTimeUtil.formatIsoDate(new Date) + "] Service call failed: " + e.toString());
			
			deleteServiceCall(CallResponder(e.currentTarget));
			
			if(appContext.hasEventListener(AppContextEvent.SERVICE_CALL_FAILED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_CALL_FAILED, e.fault));
		}
		
		protected function onCallComplete(e:ResultEvent):void
		{
			changeNetworkAvailability(true);
			
			if (responderToCallbackInfo[e.currentTarget]["completeCallback"] != undefined)
				responderToCallbackInfo[e.currentTarget].completeCallback(e.result);
			if(appContext.hasEventListener(AppContextEvent.SERVICE_CALL_COMPLETED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_CALL_COMPLETED));
			deleteServiceCall(CallResponder(e.currentTarget));
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
											 completeCallback:Function, failCallback:Function,
											 responder:CallResponder=null):CallResponder
		{
			_lastCallResponder = responder != null ? responder : new CallResponder();
			_lastCallResponder.token = callToken;
			
			_lastCallResponder.addEventListener(ResultEvent.RESULT, onCallComplete);	
			_lastCallResponder.addEventListener(FaultEvent.FAULT, onCallFailed);	
			
			if(appContext.hasEventListener(AppContextEvent.SERVICE_CALL_STARTED))
				appContext.dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_CALL_STARTED));
			
			responderToCallbackInfo[_lastCallResponder] = {};
			
			if(completeCallback != null)
				responderToCallbackInfo[_lastCallResponder].completeCallback = completeCallback;
			if(failCallback != null)
				responderToCallbackInfo[_lastCallResponder].failCallback = failCallback;
			
			return _lastCallResponder;
		}
		
		private function get appContext():AppContext
		{
			return AppContext.instance;
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
	}
}