///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component.supportClasses
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import mx.utils.StringUtil;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.InjectionUtil;
	import net.fproject.event.AppContextEvent;
	import net.fproject.utils.ApplicationUtil;
	
	import org.as3commons.reflect.Metadata;

	/**
	 * Utility component to load a list of RSLs.
	 * The loading RSLs are divided tin to groups by loading priority.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class RslsLoader
	{
		private var _rsls:Array;
		/**
		 * 
		 * The list of RSLs that need to be loaded
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
					_rsls = parseRsls(value);
				createRslGroups();
			}
		}
		
		public function allRslsLoaded():Boolean
		{
			for each (var rsl:Object in this.rsls)
			{
				if(!rsl.loaded)
					return false;
			}
			return true;
		}
		
		/**
		 * Load all RSL files of this RSLs list
		 * @param completeCallback
		 * 
		 */
		public function load(completeCallback:Function):void
		{
			this.completeCallback = completeCallback;
			recusiveLoadPriorityGroups(0);
		}
		
		public var completeCallback:Function
		
		private var rslGroups:Array;
		
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
		
		private function recusiveLoadPriorityGroups(groupIdx:int):void
		{
			if(groupIdx >= rslGroups.length)
			{
				if(completeCallback != null)
					completeCallback();
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
		
		private static var urlToRsl:Object = {};
		
		public static function parseRsls(rslsStr:String):Array
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
		
		
		/**
		 * Get module's URL from module's interface 
		 * @param componentInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @return The module's URL
		 * 
		 */
		public static function getLoadInfoFromInterface(componentInterface:Class, metaInfo:Object):Object
		{
			var obj:Object = InjectionUtil.findClassMetadataValue(componentInterface, metaInfo.metaName);
			if(obj is Array)
				obj = obj[0];
			if(obj is Metadata)
			{
				var arg:Metadata = Metadata(obj);
				var info:Object = {};
				for each (var key:String in metaInfo.args)
				{
					info[key] = arg.hasArgumentWithKey(key) ? arg.getArgument(key).value : null;
				}
			}
			return info;
		}
		
	}
}