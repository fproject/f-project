///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di.supportClasses
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	import mx.events.PropertyChangeEvent;
	
	import spark.events.SkinPartEvent;
	
	import net.fproject.reflect.ReflectionUtil;
	import net.fproject.di.Injector;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.reflect.Metadata;
	
	/**
	 * 
	 * PropertyBindingHandler define a set of methods for handling a [PropertyBinding] declaration
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class PropertyBindingHandler
	{
		private var property:String;
		private var executor:Function;
		private var host:IEventDispatcher;
		private var bindings:Object;
		private var bindingEvents:Vector.<String>;
		
		/**
		 * 
		 * Constructor.
		 *  
		 * @param property
		 * @param executor
		 * 
		 */
		public function PropertyBindingHandler(property:String, executor:Function)
		{
			this.property = property;
			this.host = host;
			this.executor = executor;
			this.bindings = {};		
		}
		
		/**
		 * Add binding information 
		 * @param key
		 * @param chain
		 * @param target
		 * @param targetField
		 * 
		 */
		public function addBindingInfo(key:String, chain:Array, target:Object, targetField:String):void
		{
			if(this.bindings[key] == undefined)
				this.bindings[key] = {chain:chain, target:target, targetField:targetField};
		}
		
		/**
		 * 
		 * Start applying handlers to a host. 
		 * 
		 * @param newHost
		 * 
		 */
		public function start(newHost:IEventDispatcher=null):void
		{
			if(newHost != host)
			{
				stop();
				host = newHost;
			}
			
			if(host != null)
			{
				this.bindingEvents = extractBindingEvents();
				if(this.bindingEvents != null)
				{
					for each(var s:String in bindingEvents)
					{
						var handler:Function = StringUtil.isBlank(s) || s == PropertyChangeEvent.PROPERTY_CHANGE ?
							propChangeHandler : changeEventHandler;
						host.addEventListener(s, handler, false, 0, true);
						if(s == SkinPartEvent.PART_ADDED)
							host.addEventListener(SkinPartEvent.PART_REMOVED, partRemovedHandler, false, 0, true);
					}
				}
			}
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function propChangeHandler(e:PropertyChangeEvent):void
		{
			if(property == e.property)
			{
				for(var s:String in bindings)
				{
					var info:Object = bindings[s];
					executor(e.oldValue, e.newValue, info.chain, info.target, info.targetField);
				}			
			}		
		};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function changeEventHandler(e:Event):void
		{
			for(var s:String in bindings)
			{
				var info:Object = bindings[s];
				executor(null, host[property], info.chain, info.target, info.targetField);
			}
		};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function partRemovedHandler(e:SkinPartEvent):void
		{
			for(var s:String in bindings)
			{
				var info:Object = bindings[s];
				executor(host[property], null, info.chain, info.target, info.targetField);
			}
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function stop():void
		{
			if(host != null)
			{
				for each(var s:String in bindingEvents)
				{
					var handler:Function = s==PropertyChangeEvent.PROPERTY_CHANGE ? propChangeHandler : changeEventHandler;
					host.removeEventListener(s, handler);
				}
			}
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function extractBindingEvents():Vector.<String>
		{
			var clazz:String = getQualifiedClassName(this.host);
			var cacheKey:String = clazz + "." + property;
			if(bindingEventsCache[cacheKey] != undefined)
			{
				var evts:Vector.<String> = bindingEventsCache[cacheKey];
			}
			else
			{			
				var meta:Object = ReflectionUtil.findMemberMetadataValue(host, property, net.fproject.di.Injector.BINDABLE);
				if(meta != null)
				{
					evts = new Vector.<String>;
					
					if(meta is Array)
					{
						for each(var md:Metadata in meta)
						{
							if(md.arguments.length > 0)
								var s:String = md.arguments[0].value;
							if(StringUtil.isBlank(s))
								s = PropertyChangeEvent.PROPERTY_CHANGE;
							evts.push(s);
						}
					}
					else if(StringUtil.isBlank(meta as String))
					{
						evts.push(PropertyChangeEvent.PROPERTY_CHANGE);
					}
					else
					{
						evts.push(meta);
					}
				}
				
				bindingEventsCache[cacheKey] = evts;
			}
			
			return evts;
		}
		
		private static var bindingEventsCache:Object = {};
		
		/**
		 * 
		 * Caching events
		 * 
		 */
		public static function addEventsToCache(classOrInstance:*, property:String, events:Array):void
		{
			var clazz:String = getQualifiedClassName(classOrInstance);
			var cacheKey:String = clazz + "." + property;
			bindingEventsCache[cacheKey] = Vector.<String>(events);
		}
	}
}