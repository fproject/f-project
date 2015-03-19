///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	
	import mx.core.IVisualElement;
	import mx.events.ModuleEvent;
	
	import spark.components.Group;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.InjectionUtil;
	import net.fproject.event.AppContextEvent;
	import net.fproject.gui.component.supportClasses.RslsLoader;
	import net.fproject.utils.ResourceUtil;
	
	import org.as3commons.reflect.Metadata;
	
	/**
	 * The ComponentLoader extends Spark's ModuleLoader with convenience utility method for module loading, 
	 * invoking module methods using dependency injection
	 */
	public class ComponentLoader extends Group
	{
		private static var urlToLoader:Object = {};
		
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
		
		public var componentInterface:Class;
		
		public var componentClass:String;
		
		/**
		 * Get component loader by a module interface. The module loader will use <code>[ModuleImplementation]</code>
		 * dependency injections specified in module interface to load the actual module implementation later.
		 * @param componentInterface the interface of component class that is using dependency injection 
		 * with <code>[ComponentImplementation]</code>
		 * @param loadAsNeed
		 * @param readyCallback
		 * @param errorCallback
		 * @param defferredCallArgs Last deferred method call's arguments
		 * @return An instance of <code>ComponentLoader</code>
		 * 
		 */
		public static function getLoaderByInterface(componentInterface:Class, loadAsNeed:Boolean=false,
													readyCallback:Function=null, errorCallback:Function=null,
													defferredCallArgs:*=undefined):ComponentLoader
		{
			var info:Object = getLoadInfoFromInterface(componentInterface);
			if(info != null)
			{
				var loader:ComponentLoader = urlToLoader[info.url] as ComponentLoader;
				if(loader == null && loadAsNeed)
				{
					loader = new ComponentLoader();
					loader.lastDeferredCallArgs = defferredCallArgs;
					loader.name = info.url;//temporary use property 'name' to store URL
					loader.readyCallback = readyCallback;
					loader.errorCallback = errorCallback;
					loader.componentInterface = componentInterface;
					loader.rsls = info.rsls;
					loader.load(info.implClass);
				}
			}			
			return loader;
		}
		
		/**
		 * Get module's URL from module's interface 
		 * @param componentInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @return The module's URL
		 * 
		 */
		private static function getLoadInfoFromInterface(componentInterface:Class):Object
		{
			var obj:Object = InjectionUtil.findClassMetadataValue(componentInterface, "ComponentImplementation");
			if(obj is Array)
				obj = obj[0];
			if(obj is Metadata)
			{
				var arg:Metadata = Metadata(obj);
				if(arg.hasArgumentWithKey("implClass"))
					var implClass:String = arg.getArgument("implClass").value;
				if(arg.hasArgumentWithKey("relativeUrl"))
					var relativeUrl:String = arg.getArgument("relativeUrl").value;
				if(arg.hasArgumentWithKey("rsls"))
					var rsls:String = arg.getArgument("rsls").value;
				var info:Object = {implClass:implClass, relativeUrl:relativeUrl, rsls:rsls};
			}
			return info;
		}
		
		public var child:Object;
		
		/**
		 * Make a deferred call to an instance-method of a module.
		 * If the module is already loaded, the method is invoked instantly.
		 * If the module is not loaded before, it will be load and the method will be
		 * invoked right after the loading is finished.
		 * @param componentInterface the interface of module that is using dependency injection 
		 * with <code>[ModuleImplementation]</code>
		 * @param methodName the method's name
		 * @param args method's argument
		 * 
		 */
		public static function callDeferredModuleMethod(componentInterface:Class, methodName:String, ...args):void
		{
			var loader:ComponentLoader = ComponentLoader.getLoaderByInterface(componentInterface, false);
			if(loader != null)
			{
				if(loader.pendingClass == null)
					(loader.child[methodName] as Function).apply(loader.child, args);
			}
			else
			{
				ComponentLoader.getLoaderByInterface(componentInterface, true, 
					function(e:ModuleEvent):void
					{
						loader = ComponentLoader(e.currentTarget);
						(loader.child[methodName] as Function).apply(loader.child, loader.lastDeferredCallArgs);
					}, null, args);
			}
		}
		
		private var pendingClass:String;
		
		public function load(implClass:String):void
		{
			if(pendingClass != null || (this.child != null && implClass == this.componentClass))
				return;
			
			if(this.rsls == null || this.rslsLoader.allRslsLoaded())
			{
				var msg:String = ResourceUtil.getString('loading.dynamic.component');
				createComponent(implClass);
			}
			else
			{
				msg = ResourceUtil.getString('loading.rsl.dependencies');
				
				pendingClass = implClass;
				
				rslsLoader.load(onRslsLoaded);
			}
			
			if(AppContext.instance.hasEventListener(AppContextEvent.ENTER_BUSY_STATE))
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.ENTER_BUSY_STATE, msg));
		}
		
		private function createComponent(implClass:String):void
		{
			if(ApplicationDomain.currentDomain.hasDefinition(implClass))
			{
				var clazz:Class = ApplicationDomain.currentDomain.getDefinition(implClass) as Class;
				if(clazz != null)
				{
					if(this.child is IVisualElement)
						this.removeElement(IVisualElement(child));
					else if(this.child is DisplayObject)
						this.removeChild(DisplayObject(child));
					
					this.child = new clazz();
					
					if(this.child is IVisualElement)
						this.addElement(IVisualElement(child));
					else if(this.child is DisplayObject)
						this.addChild(DisplayObject(child));
				}
			}
		}
		
		/**
		 *  @private
		 *  Create components that are children of this Container.
		 */
		override protected function createChildren():void
		{
			if (pendingClass == null && this.componentClass != null)
			{
				if(this.child == null)
					load(this.componentClass);
				else if(this.child is IVisualElement)
					this.addElement(IVisualElement(child));
				else if(this.child is DisplayObject)
					this.addChild(DisplayObject(child));					
			}
			
			super.createChildren();
		}
		
		private function onRslsLoaded():void
		{
			if(pendingClass != null)
			{
				var implCls:String = pendingClass
				pendingClass = null;
				load(implCls);
			}
		}
		
		/**
		 * Constructor 
		 * 
		 */
		public function ComponentLoader()
		{
			rslsLoader = new RslsLoader;
		}
	}
}

