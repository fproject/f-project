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
	
	import spark.modules.ModuleLoader;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.Injector;
	import net.fproject.event.AppContextEvent;
	import net.fproject.gui.component.supportClasses.RslsLoader;
	import net.fproject.utils.ApplicationUtil;
	import net.fproject.utils.ResourceUtil;
	
	[EventHandling(event="mx.events.ModuleEvent.READY","moduleLoader_ready")]
	[EventHandling(event="mx.events.ModuleEvent.ERROR","moduleLoader_error")]
	/**
	 * The AdvancedModuleLoader extends Spark's ModuleLoader with convenience utility method for module loading, 
	 * invoking module methods using dependency injection
	 */
	public class AdvancedModuleLoader extends ModuleLoader
	{
		private static var urlToModuleLoader:Object = {};
		private static var urlToRsl:Object = {};
		
		private var readyCallback:Function;
		private var errorCallback:Function;
		private var lastDeferredCallArgs:*;
		
		private var rslsLoader:RslsLoader;
		
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
		
		/**
		 * Get module loader by a module interface. The module loader will use <code>[ModuleImplementation]</code>
		 * dependency injections specified in module interface to load the actual module implementation later.
		 * @param moduleInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @param loadAsNeed
		 * @param readyCallback
		 * @param errorCallback
		 * @param defferredCallArgs Last deferred method call's arguments
		 * @return An instance of <code>AdvancedModuleLoader</code>
		 * 
		 */
		public static function getLoaderByInterface(moduleInterface:Class, loadAsNeed:Boolean=false,
													readyCallback:Function=null, errorCallback:Function=null,
													defferredCallArgs:*=undefined):AdvancedModuleLoader
		{
			var info:Object = RslsLoader.getLoadInfoFromInterface(moduleInterface, 
				{metaName:"ModuleImplementation", args:["relativeUrl", "rsls"]});
			if(info != null)
			{
				var url:String = ApplicationUtil.getModuleUrl(info.relativeUrl);
				var loader:AdvancedModuleLoader = urlToModuleLoader[url] as AdvancedModuleLoader;
				if(loader == null && loadAsNeed)
				{
					loader = new AdvancedModuleLoader();
					loader.lastDeferredCallArgs = defferredCallArgs;
					loader.name = url;//temporary use property 'name' to store URL
					loader.readyCallback = readyCallback;
					loader.errorCallback = errorCallback;
					loader.moduleInterface = moduleInterface;
					loader.rsls = info.rsls;
					loader.loadModule(url);
				}
			}
			
			return loader;
		}
		
		/**
		 * Make a deferred call to an instance-method of a module.
		 * If the module is already loaded, the method is invoked instantly.
		 * If the module is not loaded before, it will be load and the method will be
		 * invoked right after the loading is finished.
		 * @param moduleInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @param methodName the method's name
		 * @param args method's argument
		 * 
		 */
		public static function callDeferredModuleMethod(moduleInterface:Class, methodName:String, ...args):void
		{
			var loader:AdvancedModuleLoader = AdvancedModuleLoader.getLoaderByInterface(moduleInterface, false);
			if(loader != null)
			{
				if(loader.pendingLoadParams == null)
					(loader.child[methodName] as Function).apply(loader.child, args);
			}
			else
			{
				AdvancedModuleLoader.getLoaderByInterface(moduleInterface, true, 
					function(e:ModuleEvent):void
					{
						loader = AdvancedModuleLoader(e.currentTarget);
						(loader.child[methodName] as Function).apply(loader.child, loader.lastDeferredCallArgs);
					}, null, args);
			}
		}
		
		private var pendingLoadParams:Object;
		
		override public function loadModule(url:String=null, bytes:ByteArray=null):void
		{
			if(pendingLoadParams != null || this.child != null)
				return;
			
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
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.MODULE_LOADED, 
					{url:this.url, rsls:this.rsls}));
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