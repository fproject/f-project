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
package net.fproject.gui.component
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.ModuleEvent;
	
	import spark.components.Group;
	import spark.events.ElementExistenceEvent;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
	import net.fproject.event.ComponentLoaderEvent;
	import net.fproject.gui.component.supportClasses.RslsLoader;
	import net.fproject.utils.ResourceUtil;
	
	/**
	 *  Dispatched when the child component is loaded.
	 *
	 *  @eventType net.fproject.event.ComponentLoaderEvent.LOADED
	 *  
	 */
	[Event(name="loaded", type="net.fproject.event.ComponentLoaderEvent")]
	
	/**
	 * The ComponentLoader extends Spark's ModuleLoader with convenience utility method for module loading, 
	 * invoking module methods using dependency injection
	 */
	public class ComponentLoader extends Group implements IComponentLoader
	{
		private static var interfaceToLoader:Object = {};
		
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
			var loader:ComponentLoader = interfaceToLoader[getQualifiedClassName(componentInterface)] as ComponentLoader;
			if(loader == null)
			{
				var info:Object = RslsLoader.getMetaInfoFromInterface(componentInterface, 
					{metaName:"ComponentImplementation", args:["implClass", "rsls"]});
				if(info != null)
				{
					loader = new ComponentLoader();
					loader.lastDeferredCallArgs = defferredCallArgs;
					loader.readyCallback = readyCallback;
					loader.errorCallback = errorCallback;
					loader.componentInterface = componentInterface;
					loader.rsls = info.rsls;
					loader.load(info.implClass);
				}	
			}
					
			return loader;
		}
		
		private var child:Object;
		
		public function get component():Object
		{
			return child;
		}
		
		/**
		 * Make a deferred call to an instance-method of a component.
		 * If the component is already loaded, the method is invoked instantly.
		 * If the component is not loaded before, it will be load and the method will be
		 * invoked right after the loading is finished.
		 * @param componentInterface the interface of module that is using dependency injection 
		 * with <code>[ComponentImplementation]</code>
		 * @param methodName the method's name
		 * @param args method's argument
		 * 
		 */
		public static function callDeferredMethod(componentInterface:Class, methodName:String, ...args):void
		{
			var loader:ComponentLoader = getLoaderByInterface(componentInterface, false);
			if(loader != null)
			{
				if(loader.pendingClass == null)
					(loader.child[methodName] as Function).apply(loader.child, args);
			}
			else
			{
				getLoaderByInterface(componentInterface, true, 
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
				createComponent(implClass);
				if(componentInterface != null)
					interfaceToLoader[getQualifiedClassName(componentInterface)] = this;
			}
			else
			{
				var msg:String = ResourceUtil.getString('loading.rsl.dependencies');
				
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
					
					if(this.child is UIComponent)
					{
						UIComponent(child).addEventListener(FlexEvent.CREATION_COMPLETE, onChildCreationCompleted);
					}
					
					if(this.child is IVisualElement)
					{
						this.addEventListener(ElementExistenceEvent.ELEMENT_ADD, onElementAdd);
						this.addElement(IVisualElement(child));
					}
					else
					{
						throw new Error("ComponentLoader: Not supported component type");
					}
				}
			}
		}
		
		private function onChildCreationCompleted(e:FlexEvent):void
		{
			IEventDispatcher(e.target).removeEventListener(FlexEvent.CREATION_COMPLETE, onChildCreationCompleted);
			if (this.hasEventListener(ComponentLoaderEvent.LOADED))
				this.dispatchEvent(new ComponentLoaderEvent(ComponentLoaderEvent.LOADED));
		}
		
		private function onElementAdd(e:ElementExistenceEvent):void
		{
			this.removeEventListener(ElementExistenceEvent.ELEMENT_ADD, onElementAdd);
			if (this.hasEventListener(ComponentLoaderEvent.LOADED))
				this.dispatchEvent(new ComponentLoaderEvent(ComponentLoaderEvent.LOADED));
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
			rslsLoader = InstanceFactory.getInstance(RslsLoader, undefined, false);
		}
	}
}

