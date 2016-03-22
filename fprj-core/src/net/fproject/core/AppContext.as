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
package net.fproject.core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface;
	import flash.utils.getDefinitionByName;
	
	import mx.core.FlexGlobals;
	import mx.rpc.CallResponder;
	import mx.rpc.Fault;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.ImplementationConfig;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
	import net.fproject.model.ISerializableModel;
	import net.fproject.model.User;
	import net.fproject.rpc.RemoteObjectFactory;
	import net.fproject.service.IAppContextService;
	import net.fproject.utils.ApplicationGlobals;
	import net.fproject.utils.ExternalInterfaceUtil;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;
	import net.fproject.utils.StringUtil;
	
	/**
	 * Dispatched when the app context initialization is completed.
	 *
	 * @eventType net.fproject.event.AppContextEvent.INITIALIZED
	 * 
	 */
	[Event(name="initialized", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when the app context initialization is failed.
	 *
	 * @eventType net.fproject.event.AppContextEvent.INITIALIZE_FAILED
	 * 
	 */
	[Event(name="initializeFailed", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when the app context is loaded successfully.
	 *
	 * @eventType net.fproject.event.AppContextEvent.LOADED
	 * 
	 */
	[Event(name="loaded", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when the app context is failed to load.
	 *
	 * @eventType net.fproject.event.AppContextEvent.LOAD_FAILED
	 * 
	 */
	[Event(name="loadFailed", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when the app context is saved successfully.
	 *
	 * @eventType net.fproject.event.AppContextEvent.SAVED
	 * 
	 */
	[Event(name="saved", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when a call to AppContextService is failed.
	 *
	 * @eventType net.fproject.event.AppContextEvent.SERVICE_CALL_FAILED
	 * 
	 */
	[Event(name="serviceCallFailed", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when the app context initialization is completed.
	 *
	 * @eventType net.fproject.event.AppContextEvent.ACCESS_TOKEN_CHANGE
	 * 
	 */
	[Event(name="accessTokenChange", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * Dispatched when the system network availability is changed
	 *
	 * @eventType net.fproject.event.AppContextEvent.NETWORK_CHANGE
	 * 
	 */
	[Event(name="networkChange", type="net.fproject.event.AppContextEvent")]
	
	/**
	 * <p>AppContext class is used to bootstrap Flex application by
	 * supplying properties and methods to store application context 
	 * data and application states.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class AppContext extends EventDispatcher
	{
		public var dataDescriptor:AppContextDataDescriptor;
		
		protected var _isOnline:Boolean;
		
		/**
		 * 
		 * <code>true</code> if the application can connect with server.
		 * <code>false</code> if otherwise.
		 */
		public function get isOnline():Boolean
		{
			if(ApplicationGlobals.isDesktop())
			{
				return _isOnline;
			}
			return isWebOnline();
		}
		
		fproject_internal function setNetworkAvailability(value:Boolean):void
		{
			_isOnline = value;
			if(this.hasEventListener(AppContextEvent.NETWORK_CHANGE))
				this.dispatchEvent(new AppContextEvent(AppContextEvent.NETWORK_CHANGE, value));
		}
		
		protected var _data:Object;

		/**
		 * 
		 * The application context data
		 * 
		 */
		public function get data():Object
		{
			return _data;
		}
		
		private function setContextData(value:Object):void
		{
			this._data = value;
			RemoteObjectFactory.setServerConfig(dataDescriptor.contextDataToServerConfig(value));
		}
		
		private function initContextData():void
		{
			if(this._data == null && appContextService != null)
			{
				setContextData(appContextService.createDefaultContextData());
			}
		}
		
		protected var _loginUser:User;
		/**
		 * 
		 * The current login user
		 * 
		 */
		public function get loginUser():User
		{
			if(_loginUser == null && appContextService != null)
				_loginUser = appContextService.createDefaultLoginUser();
			return _loginUser;
		}
		
		private function get appContextService():IAppContextService
		{
			return IAppContextService(InstanceFactory.getInstance(IAppContextService));
		}
		
		private var _initialized:Boolean;
		
		/**
		 * 
		 * A flag indicates whether the app context is initialized or not.
		 * 
		 */
		public function get initialized():Boolean
		{
			return _initialized;
		}
		
		/**
		 * Initialize application context 
		 * @param completeCallback callback that is invoked when initialisation completed.
		 * This must be a function having one Boolean parameter indicates that the initialisation
		 * context data is valid or not.
		 * 
		 */
		public function initialize():void
		{
			if(_initialized)
				return;
			initNetworkMonitoring();
			initContextData();
			if(appContextService != null)
			{
				try
				{
					appContextService.initialize(
						function(info:Object):void
						{
							loginUser.id = dataDescriptor.initInfoToLoginUserId(info);
							loginUser.fproject_internal::setToken(dataDescriptor.initInfoToLoginUserToken(info));
							if(hasEventListener(AppContextEvent.INITIALIZED))
								dispatchEvent(new AppContextEvent(AppContextEvent.INITIALIZED, info));
							_initialized = true;
							load();
						}, 
						function(fault:Fault):void
						{
							_initialized = false;
							if(hasEventListener(AppContextEvent.SERVICE_CALL_FAILED))
								dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_CALL_FAILED, fault));
							if(hasEventListener(AppContextEvent.INITIALIZE_FAILED))
								dispatchEvent(new AppContextEvent(AppContextEvent.INITIALIZE_FAILED, fault));
						});
				}
				catch (e:Error)
				{
					e.message
					dispatchEvent(new AppContextEvent(AppContextEvent.INITIALIZE_FAILED));
					trace(e.getStackTrace());
				}
			}
		}
		
		private static const NETWORK_CHANGE_CALLBACK:String="networkChangeCallback";
		
		private function networkChangeJSListerner(status:String):String
		{
			var id:String = FlexGlobals.topLevelApplication.id;
			return "window.addEventListener('" + status + "',function(){var fxControl=document." +
				id + " || window." + id + ";if(typeof fxControl." + NETWORK_CHANGE_CALLBACK +
				"=='function')fxControl." + NETWORK_CHANGE_CALLBACK + "('" + status + "');});";
		}
		
		private function initNetworkMonitoring():void
		{
			if(ApplicationGlobals.isDesktop())
			{
				var na:* = getDefinitionByName("flash.desktop.NativeApplication");
				var naInstance:IEventDispatcher = na["nativeApplication"];
				naInstance.addEventListener("networkChange", function(e:Event):void
				{
					fproject_internal::setNetworkAvailability(isDesktopOnline());
				});
			}
			else
			{
				var id:String = FlexGlobals.topLevelApplication.id;
				ExternalInterface.addCallback(NETWORK_CHANGE_CALLBACK, 
					function(sts:String):void
					{
						fproject_internal::setNetworkAvailability(sts=="online");
					});
					
				ExternalInterfaceUtil.invokeExternalCall("function(){" +
					networkChangeJSListerner("online") +
					networkChangeJSListerner("offline") +
					"}");
			}
		}
		
		public function isWebOnline():Boolean
		{
			return ExternalInterfaceUtil.invokeExternalCall("function(){return navigator.onLine;}");
		}
		
		private function isDesktopOnline():Boolean
		{
			var ni:* = getDefinitionByName("flash.net.NetworkInfo");

			var interfaces:*= ni.networkInfo.findInterfaces();
			
			if(interfaces.length==0)
			{
				return true;
			}
			
			for(var i:uint = 0; i < interfaces.length; i++)
			{
				var name:String = interfaces[i].displayName.toLowerCase();
				if(StringUtil.isBlank(name) || name == "wifi" || name == "wi-fi" || name == "mobile" || name == "ethernet")
				{
					if(interfaces[i].active)
						return true;
				}
			}
			return false;
		}
		
		/**
		 * Load application context
		 * 
		 */
		public function load(loginUserId:String=null, authToken:String=null):void
		{
			if(loginUserId != null)
				loginUser.id = loginUserId;
			if(authToken != null)
				loginUser.fproject_internal::setToken(authToken);
			
			appContextService.load(loginUser.id,
				function(data:Object):void
				{
					setContextData(data);
					_loaded = true;
					if(hasEventListener(AppContextEvent.LOADED))
						dispatchEvent(new AppContextEvent(AppContextEvent.LOADED, data));
				},
				function():void
				{
					_loaded = false;
					if(hasEventListener(AppContextEvent.LOAD_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.LOAD_FAILED));
				});
		}
		
		/**
		 * Save application context to storage
		 * @param application the application instance
		 * 
		 */
		public function save():void
		{
			var contextData:Object = _data is ISerializableModel ? ISerializableModel(_data).serializableClone() : _data;
				
			appContextService.save(contextData,
				function(b:Boolean):void
				{
					if(hasEventListener(AppContextEvent.SAVED))
						dispatchEvent(new AppContextEvent(AppContextEvent.SAVED));
				},
				function(fault:Fault):void
				{
					if(hasEventListener(AppContextEvent.SERVICE_CALL_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_CALL_FAILED, fault));
				});
		}
		
		private var _loaded:Boolean;
		
		/**
		 * 
		 * A flag indicates whether context data is loaded or not
		 * 
		 */
		public function get loaded():Boolean
		{
			return _loaded;
		}
		
		private var _authenticated:Boolean;
		
		/**
		 * 
		 * Indicates that current user is logged in or not
		 * 
		 */
		public function get authenticated():Boolean
		{
			return _authenticated;
		}
		
		/**
		 * Call LoginService to log a user in. 
		 * @param userName the user credential
		 * @param password the password credential
		 * @return a responder for this service call
		 * 
		 */
		public function login(userName:String, password:String):CallResponder
		{
			initContextData();
			return appContextService.login(userName, password,
				function(result:String):void
				{
					_isOnline = true;
					_authenticated = true;
					loginUser.id = dataDescriptor.loginResultToLoginUserId(result);
					loginUser.fproject_internal::setToken(dataDescriptor.loginResultToLoginUserToken(result));					
					load();
					if(hasEventListener(AppContextEvent.LOGGED_IN))
						dispatchEvent(new AppContextEvent(AppContextEvent.LOGGED_IN));
				},
				function():void
				{
					_authenticated = false;
					loginUser.id = null;
					loginUser.fproject_internal::setToken(null);
					if(hasEventListener(AppContextEvent.LOGIN_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.LOGIN_FAILED));
				});
		}
		
		/**
		 * Log the current user out 
		 * 
		 */
		public function logout():CallResponder
		{
			return appContextService.logout(
				function():void
				{
					if(hasEventListener(AppContextEvent.LOGGED_OUT))
						dispatchEvent(new AppContextEvent(AppContextEvent.LOGGED_OUT));
				}, 
				function(fault:Fault):void
				{
					if(hasEventListener(AppContextEvent.SERVICE_CALL_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_CALL_FAILED, fault));
				});
		}
		
		private static var _instance:AppContext;

		/**
		 * 
		 * Get the singleton instance of app context.
		 * This instace should be configured by <code>ImplementationConfig</code> component.
		 * 
		 */
		public static function get instance():AppContext
		{
			return AppContext(InstanceFactory.getInstance(AppContext));
		}

		
		/**
		 * 
		 * @private
		 * 
		 */
		public function AppContext()
		{
			if(_instance != null)
				LoggingUtil.logAndThrowError(ImplementationConfig, ResourceUtil.FPRJ_CORE, 2, null,
					ResourceUtil.FPRJ_CORE_BUNDLE, "singleton.violation");
			_isOnline = true;
			dataDescriptor = new AppContextDataDescriptor;
			_instance = this;
		}
	}
}