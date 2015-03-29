///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	
	import mx.events.ModuleEvent;
	import mx.rpc.AsyncToken;
	
	import spark.modules.ModuleLoader;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.Injector;
	import net.fproject.event.AppContextEvent;
	import net.fproject.gui.component.supportClasses.DeferredCallHelper;
	import net.fproject.gui.component.supportClasses.RslsLoader;
	import net.fproject.utils.ApplicationUtil;
	import net.fproject.utils.ResourceUtil;
	
	[EventHandling(event="mx.events.ModuleEvent.READY","moduleLoader_ready")]
	[EventHandling(event="mx.events.ModuleEvent.ERROR","moduleLoader_error")]
	/**
	 * The AdvancedModuleLoader extends Spark's ModuleLoader with convenience utility method for module loading, 
	 * invoking module methods using dependency injection
	 */
	public class AdvancedModuleLoader extends ModuleLoader implements IComponentLoader
	{
		private static var urlToModuleLoader:Object = {};
		private static var urlToRsl:Object = {};
		
		private var readyCallback:Function;
		private var errorCallback:Function;
		private var lastDeferredCallArgs:*;
		
		private var rslsLoader:RslsLoader;
		
		public function get component():Object
		{
			return child;
		}
		
		/**
		 * 
		 * The dynamic loading RSLs that need to load before loading the module
		 * 
		 */
		public function get rsls():Array
		{
			return rslsLoader.rsls;
		}
		
		public function set rsls(value:*):void
		{
			rslsLoader.rsls = value;		
		}
		
		public function set moduleUrl(value:String):void
		{
			this.url = ApplicationUtil.getModuleUrl(value);
		}
		
		private var moduleInterface:Class;
		
		public var lastCallAsyncToken:AsyncToken;
		
		/**
		 * Get module loader by a module interface. The module loader will use <code>[ModuleImplementation]</code>
		 * dependency injections specified in module interface to load the actual module implementation later.
		 * @param moduleInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @param loadAsNeed
		 * @param readyCallback
		 * @param errorCallback
		 * @return An instance of <code>AdvancedModuleLoader</code>
		 * If the param <code>loadAsNeed</code> value is false, and the module is not loaded before,
		 * the return value is <code>null</code>
		 * 
		 */
		public static function getLoaderByInterface(moduleInterface:Class, loadAsNeed:Boolean=false,
													readyCallback:Function=null, errorCallback:Function=null):AdvancedModuleLoader
		{
			var info:Object = RslsLoader.getMetaInfoFromInterface(moduleInterface, 
				{metaName:"ModuleImplementation", args:["relativeUrl", "rsls"]});
			if(info != null)
			{
				var loader:AdvancedModuleLoader = getLoaderByUrl(info.relativeUrl,
					info.rsls, loadAsNeed, readyCallback, errorCallback);
				if(loader != null)
					loader.moduleInterface = moduleInterface;
			}
			
			return loader;
		}
		
		/**
		 * Get module loader by its URL.
		 * @param url the relative URL of module to load 
		 * with <code>[ModuleImplementation]</code>
		 * @param loadAsNeed
		 * @param readyCallback
		 * @param errorCallback
		 * @return An instance of <code>AdvancedModuleLoader</code>
		 * 
		 */
		public static function getLoaderByUrl(url:String, rsls:String, loadAsNeed:Boolean=false,
											  readyCallback:Function=null, errorCallback:Function=null):AdvancedModuleLoader
		{
			url = ApplicationUtil.getModuleUrl(url);
			var loader:AdvancedModuleLoader = urlToModuleLoader[url] as AdvancedModuleLoader;
			if(loader == null && loadAsNeed)
			{
				loader = new AdvancedModuleLoader();
				loader.name = url;//temporary use property 'name' to store URL
				loader.readyCallback = readyCallback;
				loader.errorCallback = errorCallback;
				loader.rsls = rsls;
				loader.loadModule(url);
			}
			
			return loader;
		}
		
		/**
		 * Make a deferred call to an method of a module.
		 * If the module is already loaded, the method is invoked instantly.
		 * If the module is not loaded before, it will be load and the method will be
		 * invoked right after the loading is finished.
		 * @param urlOrInterface the url or <code>Class</code> object of module inteface
		 * of the module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @param methodName the method's name
		 * @param rsls the dependency RSLs for the module to load. This parameter is skipped if
		 * value passed to <code>urlOrInterface</code> is a <code>Class</code> object
		 * @param args method's argument
		 * 
		 */
		public static function callDeferredMethod(urlOrInterface:*, methodName:String, rsls:String, ...args):AsyncToken
		{
			var token:AsyncToken = new AsyncToken;
			var loader:AdvancedModuleLoader = getLoader(urlOrInterface, rsls, false);
			if(loader != null)
			{		
				loader.lastCallAsyncToken = token;
				if(loader.pendingLoadParams == null)
					DeferredCallHelper.invokeCall(loader.child, null, methodName, args, token, true);
			}
			else
			{
				loader = getLoader(urlOrInterface, rsls, true,
					function(e:ModuleEvent):void
					{
						loader = AdvancedModuleLoader(e.currentTarget);
						DeferredCallHelper.invokeCall(loader.child, null, methodName, 
							loader.lastDeferredCallArgs, loader.lastCallAsyncToken, true);
					});
				if(loader != null)
				{
					loader.lastDeferredCallArgs = args;
					loader.lastCallAsyncToken = token;
				}
			}
			
			return token;
		}
		
		private static function getLoader(urlOrInterface:*, rsls:String, loadAsNeed:Boolean=false,
										  readyCallback:Function=null):AdvancedModuleLoader
		{
			if(urlOrInterface is String)
				return getLoaderByUrl(urlOrInterface as String, rsls, loadAsNeed, readyCallback);
			else
				return getLoaderByInterface(urlOrInterface as Class, loadAsNeed, readyCallback);
		}
		
		private var pendingLoadParams:Object;
		
		override public function loadModule(url:String=null, bytes:ByteArray=null):void
		{
			if(pendingLoadParams != null || this.child != null)
				return;
			
			if(url == null)
				url = this.url;
			
			if(this.rsls == null || this.rslsLoader.allRslsLoaded())
			{
				var msg:String = ResourceUtil.getString('loading.functional.module');
				super.loadModule(url, bytes);
			}
			else
			{
				msg = ResourceUtil.getString('loading.rsl.dependencies');
				
				pendingLoadParams = {url:url, bytes:bytes};
				
				rslsLoader.load(onRslsLoaded);
			}
			
			if(AppContext.instance.hasEventListener(AppContextEvent.ENTER_BUSY_STATE))
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.ENTER_BUSY_STATE, msg));
		}
		
		private function onRslsLoaded():void
		{
			if(pendingLoadParams != null)
			{
				var u:String = pendingLoadParams.url;
				var b:ByteArray = pendingLoadParams.bytes;
				this.pendingLoadParams = null;
				loadModule(u, b);
			}
		}
		
		/**
		 * 
		 * Event handler. Internal use only.
		 * 
		 */
		public function moduleLoader_ready(e:ModuleEvent):void
		{
			if(readyCallback != null)
				readyCallback(e);
			urlToModuleLoader[this.url] = this;
			if(AppContext.instance.hasEventListener(AppContextEvent.MODULE_LOADED))
			{
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.MODULE_LOADED, 
					{url:this.url, rsls:this.rsls}));
			}
				
			if(AppContext.instance.hasEventListener(AppContextEvent.EXIT_BUSY_STATE))
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.EXIT_BUSY_STATE));
		}
		
		/**
		 * 
		 * Event handler. Internal use only.
		 * 
		 */
		public function moduleLoader_error(e:ModuleEvent):void
		{
			if(errorCallback != null)
				errorCallback(e);
			if(AppContext.instance.hasEventListener(AppContextEvent.APP_ERROR))
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.APP_ERROR, e.errorText));
			if(AppContext.instance.hasEventListener(AppContextEvent.EXIT_BUSY_STATE))
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.EXIT_BUSY_STATE));
		}
		
		/**
		 * Constructor 
		 * 
		 */
		public function AdvancedModuleLoader()
		{
			this.applicationDomain = ApplicationDomain.currentDomain;
			rslsLoader = new RslsLoader;
			
			Injector.inject(this);
		}
	}
}