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
	
	import net.fproject.fproject_internal;
	import net.fproject.di.ImplementationConfig;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
	import net.fproject.model.User;
	import net.fproject.rpc.RemoteObjectFactory;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;
	
	/**
	 * <p>AppContext class is used for bootstrapping this Flex application.
	 * It is also used for storing application context data and application states
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
		 * <code>true</code> if the ProjectKit Flex application can connect with server.
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
			if(_loginUser == null)
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
				function():void
				{
					_initialized = false;
					if(hasEventListener(AppContextEvent.SERVICE_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_FAILED));
				});
		}
		
		/**
		 * Load application context
		 * 
		 */
		private function load():void
		{
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
				function():void
				{
					if(hasEventListener(AppContextEvent.SERVICE_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_FAILED));
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
		public function logout():void
		{
			appContextService.logout(
				function():void
				{
					if(hasEventListener(AppContextEvent.LOGGED_OUT))
						dispatchEvent(new AppContextEvent(AppContextEvent.LOGGED_OUT));
				}, 
				function():void
				{
					if(hasEventListener(AppContextEvent.SERVICE_FAILED))
						dispatchEvent(new AppContextEvent(AppContextEvent.SERVICE_FAILED));
				});
		}
		
		private static var _instance:AppContext;
		
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