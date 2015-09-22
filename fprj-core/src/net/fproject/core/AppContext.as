///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	import flash.events.EventDispatcher;
	
	import mx.rpc.CallResponder;
	import mx.rpc.Fault;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.ImplementationConfig;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
	import net.fproject.model.User;
	import net.fproject.rpc.RemoteObjectFactory;
	import net.fproject.service.IAppContextService;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;
	
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
		
		protected var _networkAvailable:Boolean;
		
		/**
		 * 
		 * <code>true</code> if the application can connect with server.
		 * <code>false</code> if otherwise.
		 */
		public function get networkAvailable():Boolean
		{
			return _networkAvailable;
		}
		
		fproject_internal function setNetworkAvailable(value:Boolean):void
		{
			_networkAvailable = value;
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
			if(this._data == null)
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
			
			initContextData();
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
			appContextService.save(_data,
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
					_networkAvailable = true;
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
			dataDescriptor = new AppContextDataDescriptor;
			_instance = this;
		}
	}
}