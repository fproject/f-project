///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import mx.events.ModuleEvent;
	import mx.utils.StringUtil;
	
	import spark.modules.ModuleLoader;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.InjectionUtil;
	import net.fproject.di.Injector;
	import net.fproject.event.AppContextEvent;
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
		
		private var _rsls:Array;
		/**
		 * 
		 * The dynamic loading RSLs that need to load before loading the module
		 * 
		 */
		public function get rsls():Array
		{
			return _rsls;
		}
		
		public function set rsls(value:*):void
		{
			if(value != _rsls)
			{
				if(value is Array)
					_rsls = value;
				else
					_rsls = rslsStringToArray(value);
				createRslGroups();
			}			
		}
		
		public function set moduleUrl(value:String):void
		{
			this.url = ApplicationUtil.getModuleUrl(value);
		}
		
		private var rslGroups:Array;
		
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
			var url:String = getUrlFromInterface(moduleInterface);
			var loader:AdvancedModuleLoader = urlToModuleLoader[url] as AdvancedModuleLoader;
			if(loader == null && loadAsNeed)
			{
				loader = new AdvancedModuleLoader();
				loader.lastDeferredCallArgs = defferredCallArgs;
				loader.name = url;//temporary use property 'name' to store URL
				loader.readyCallback = readyCallback;
				loader.errorCallback = errorCallback;
				loader.moduleInterface = moduleInterface;
				loader.rsls = getRslsFromInterface(moduleInterface);
				loader.loadModule(url);
			}
			return loader;
		}
		
		/**
		 * Get module's URL from module's interface 
		 * @param moduleInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @return The module's URL
		 * 
		 */
		private static function getUrlFromInterface(moduleInterface:Class):String
		{
			var relUrl:String = 
				InjectionUtil.findClassMetadataValue(moduleInterface, "ModuleImplementation", "relativeUrl") as String;
			return ApplicationUtil.getModuleUrl(relUrl);
		}
		
		/**
		 * Get module's RSLs from module's interface 
		 * @param moduleInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @return The module's URL
		 * 
		 */
		private static function getRslsFromInterface(moduleInterface:Class):Array
		{
			var rslsStr:String = 
				InjectionUtil.findClassMetadataValue(moduleInterface, "ModuleImplementation", "rsls") as String;
			return rslsStringToArray(rslsStr);
		}
		
		private static function rslsStringToArray(rslsStr:String):Array
		{
			var rslsArray:Array = null;
			if(rslsStr != null)
			{
				var a:Array = rslsStr.split(",");
				
				rslsArray = [];
				
				for each (var s:String in a)
				{
					s = StringUtil.trim(s);
					if(s != "")
					{
						if(s.match(/\{[0-9]+\}$/))
						{
							var i:int = s.lastIndexOf("{");
							var priority:int = int(s.substring(i + 1, s.length - 1));
							s = s.substring(0, i);
						}
						else
							priority = 0;
						
						if(s.length < 4 || s.substr(s.length - 4, 4).toLowerCase() != '.swf')
							s += ".swf";
						if(s.charAt(0) == '/')
							s = s.substr(1);
						if(urlToRsl[s] != undefined)
						{
							var rsl:Object = urlToRsl[s];
						}
						else
						{
							rsl = {url:s, loading:false, loaded:false, priority:priority};
							urlToRsl[s] = rsl;
						}
						
						rslsArray.push(rsl);
					}
				}
				
			}
			return rslsArray;
		}
		
		private function createRslGroups():void
		{
			var priorityToGroup:Object = {};
			for each (var rsl:Object in this.rsls)
			{
				if(priorityToGroup[String(rsl.priority)] != undefined)
					var group:Array = priorityToGroup[String(rsl.priority)];
				else
				{
					group = priorityToGroup[String(rsl.priority)] = [];
				}
				group.push(rsl);
			}
			
			this.rslGroups = [];
			for (var s:String in priorityToGroup)
			{
				this.rslGroups.push(priorityToGroup[s]);
			}
			
			this.rslGroups.sort(
				function(a:Array,b:Array):int
				{
					if(a[0].priority < b[0].priority)
						return -1;
					else
						return 1;
				});
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
		
		private function allRslsLoaded():Boolean
		{
			for each (var rsl:Object in this.rsls)
			{
				if(!rsl.loaded)
					return false;
			}
			return true;
		}
		
		private var pendingLoadParams:Object;
		
		override public function loadModule(url:String=null, bytes:ByteArray=null):void
		{
			if(pendingLoadParams != null || this.child != null)
				return;
			
			if(this.rsls == null || allRslsLoaded())
			{
				var msg:String = ResourceUtil.getString('loading.functional.module');
				super.loadModule(url, bytes);
			}
			else
			{
				msg = ResourceUtil.getString('loading.rsl.dependencies');
				
				pendingLoadParams = {url:url, bytes:bytes};
				
				recusiveLoadPriorityGroups(0);
			}
			
			if(AppContext.instance.hasEventListener(AppContextEvent.ENTER_BUSY_STATE))
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.ENTER_BUSY_STATE, msg));
		}
		
		private function recusiveLoadPriorityGroups(groupIdx:int):void
		{
			if(groupIdx >= rslGroups.length)
			{
				if(pendingLoadParams != null)
				{
					var u:String = pendingLoadParams.url;
					var b:ByteArray = pendingLoadParams.bytes;
					this.pendingLoadParams = null;
					loadModule(u, b);
				}
			}
			else
			{
				loadPriorityGroup(groupIdx,
					function(idx:int):void
					{
						recusiveLoadPriorityGroups(idx + 1);
					});
			}			
		}
		
		/**
		 * Load all RSLs in a group of same priority 
		 * @param rslGroup the same priority group of RSLs
		 * @param completeCallback the callback invoked when all RSLs loading of group is completed
		 * 
		 */
		private function loadPriorityGroup(groupIndex:int, completeCallback:Function):void
		{
			var groupLoaded:Boolean = true;
			for each (var rsl:Object in rslGroups[groupIndex])
			{
				if(!rsl.loading && !rsl.loaded)
				{
					groupLoaded = false;
					var rslLoader:Loader = new Loader();
					var urlRequest:URLRequest = new URLRequest(ApplicationUtil.getRslBaseUrl() + "/" + rsl.url);
					var context:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
					rslLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,
						function(e:Event):void
						{
							var allLoaded:Boolean = true;
							for each (var rsl:Object in rslGroups[groupIndex])
							{
								if(!rsl.loaded)
								{
									var li:LoaderInfo = LoaderInfo(e.currentTarget);
									var rslUrl:String = ApplicationUtil.getRslAbsoluteUrl(rsl.url);
									if(rslUrl.toLowerCase() == String(li.url).toLowerCase())
									{
										rsl.loaded = true;
										rsl.loading = false;
									}
									else
										allLoaded = false;
								}								
							}
							if(allLoaded)
							{
								completeCallback(groupIndex);									
							}
						});
					rslLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, 
						function(e:IOErrorEvent):void
						{
							trace(e.text);
							if(AppContext.instance.hasEventListener(AppContextEvent.APP_ERROR))
								AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.APP_ERROR, e.text));
							e.stopPropagation();
							e.preventDefault();
							if(AppContext.instance.hasEventListener(AppContextEvent.EXIT_BUSY_STATE))
								AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.EXIT_BUSY_STATE));
						});
					
					rslLoader.load(urlRequest, context);
					
					rsl.loading = true;
				}				
			}
			
			if(groupLoaded)
				completeCallback(groupIndex);
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
			
			Injector.inject(this);
		}
	}
}