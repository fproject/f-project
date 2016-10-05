///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2013 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.ui.menu.supportClasses
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.core.UIComponent;
	import mx.events.MenuEvent;
	import mx.states.State;
	
	import net.fproject.gui.component.IContextMenuOwner;
	import net.fproject.gui.component.IMenuOwner;
	import net.fproject.ui.menu.ContextMenu;
	import net.fproject.ui.menu.Menu;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;
	import net.fproject.utils.StringUtil;
	
	/**
	 * 
	 * Helper class to initialize Menu and ContextMenu.
	 * 
	 */
	public class MenuUtil
	{
		/**
		 * Parse all items of a menu and return the array of initialized items 
		 * @param owner the menu owner
		 * 
		 */
		public function getMenuItems(owner:IMenuOwner):Array
		{
			return parseItems(owner.menuData, owner);
		}
		
		/**
		 * Parse all items of a context menu and return the array of initialized items 
		 * @param owner the context menu owner
		 * 
		 */
		public function getContextMenuItems(owner:IContextMenuOwner):Array
		{
			return parseItems(owner.contextMenuData, owner);
		}
		
		/**
		 * Create and initialize a menu 
		 * @param owner the menu owner
		 * @param eventConstructor a callback function that will be used to construct the
		 * data event that is dispatched when a menuitem is clicked.
		 * @return the Menu instance
		 * 
		 */
		public function createMenu(owner:IMenuOwner, eventConstructor:*=undefined) : Menu
		{
			var menu:Menu = Menu.createMenu(owner as DisplayObjectContainer, null, false);
			var items:Array = getMenuItems(owner);
			initMenu(items, menu, eventConstructor);
			parseMenuItemStates(menu, owner.menuData, items);
			return menu;
		}
		
		/**
		 * Create and initialize a context menu 
		 * @param owner the context menu owner
		 * @param eventConstructor a callback function that will be used to construct the
		 * data event that is dispatched when a menuitem is clicked.
		 * @return the ContextMenu instance
		 * 
		 */
		public function createContextMenu(owner:IContextMenuOwner, eventConstructor:*=undefined) : ContextMenu
		{
			var menu:ContextMenu = new ContextMenu;
			var items:Array = getContextMenuItems(owner);
			initMenu(items, menu, eventConstructor);
			parseMenuItemStates(menu, owner.contextMenuData, items);
			if (owner is UIComponent)
				UIComponent(owner).flexContextMenu = menu;
			return menu;
		}
		
		private function parseItems(menuData:Object, owner:IEventDispatcher):Array
		{
			if (menuData != null && menuData.hasOwnProperty("menuItems"))
			{
				var a:Array = menuData.menuItems;
				if (a != null)
				{
					for each (var item:Object in a)
					{
						item.owner = owner;
					}
				}
				else
				{
					a = [];
				}
			}
			else
			{
				a = [];
			}
			return a;
		}
		
		
		/**
		 * 
		 * The item icon function
		 * Must follow this signature:
		 * <pre>public var getItemIcon(item:Object, iconFile:String, width:Number=NaN, height:Number=NaN):Class</pre>
		 * 
		 */
		public var defaultItemIconFunction:Function;
		
		public var defaultBundle:String;
		
		private function initMenu(items:Array, menu:Menu, eventConstructor:*):void
		{
			for each (var item:Object in items)
			{
				if(eventConstructor != undefined)
					item.eventConstructor = eventConstructor;
			}
			var mdp:ArrayCollection = new ArrayCollection(items);
			
			menu.labelFunction = function(item:Object):String
			{
				return ResourceUtil.getLabel(item.label, defaultBundle);
			}
			menu.iconFunction = function(item:Object):Class
			{
				if(item.hasOwnProperty("owner"))
				{
					var o:Object = item.owner;
					if (o != null)
					{
						if (o.hasOwnProperty("menuData"))
							o = o.menuData;
						else if (o.hasOwnProperty("contextMenuData"))
							o = o.contextMenuData;
					}
				}
				if (o != null && o.hasOwnProperty("itemIconFunction"))
					var f:Function = o["itemIconFunction"];
				if (f == null)
					f = defaultItemIconFunction;
				
				var icon:String = item.icon;
				if (!StringUtil.isBlank(icon) && f != null)
					return f(item, icon, 16, 16);
				return null;
			};
			
			menu.addEventListener(MenuEvent.ITEM_CLICK, onMenuItemClick);
			
			menu.dataProvider = mdp;
			
			menu.setCurrentStateCallback = menuSetCurrentStateCallback;
		}
		
		private var propSetToOriginalValue:Object;
		
		private var defaultPropertyValues:Object = {
			enabled:true,
			visible:true
		}
		
		private function menuSetCurrentStateCallback(menu:Menu, stateName:String, oldStateName:String):void
		{
			var stateSet:Object = menuToStates[menu];
			if (stateSet == null || stateSet[stateName] == undefined)
				return;
			
			var dp:IList = menu.dataProvider as IList;
			if (dp == null)
				return;
			
			if(propSetToOriginalValue != null && oldStateName != null && stateSet.hasOwnProperty(oldStateName))
			{
				var state:Object = stateSet[oldStateName];
				for each (var propSet:Object in state.overrides)
				{
					var i:int = int(propSet.target);
					if (i < dp.length)
					{
						var propVal:* = propSetToOriginalValue[propSet.target + "." + propSet.name];
						if (propVal != undefined)
							dp.getItemAt(i)[propSet.name] = propVal;
					}
				}
			}
			
			state = stateSet[stateName];			
			
			if (propSetToOriginalValue == null)
				propSetToOriginalValue = {};
			
			for each (propSet in state.overrides)
			{
				i = int(propSet.target);
				if (i < dp.length)
				{
					propVal = propSetToOriginalValue[propSet.target + "." + propSet.name];
					
					if (propVal == undefined)
					{
						propVal = dp.getItemAt(i)[propSet.name];
						if (propVal == undefined)
							propVal = defaultPropertyValues[propSet.name];
						
						propSetToOriginalValue[propSet.target + "." + propSet.name] = propVal;
					}
					
					dp.getItemAt(i)[propSet.name] = propSet.value;
				}
			}
		}
		
		private var menuToStates:Dictionary;
		
		private function parseMenuItemStates(menu:Menu, menuData:Object, menuItems:Array):void
		{
			if(menuData == null || !menuData.hasOwnProperty("states"))
				return;
			var stateDataList:Array = menuData["states"];
			if (stateDataList == null)
				return;
			
			var stateSet:Object = {};
			menu.states = [];
			
			for each(var stateName:String in stateDataList)
			{
				stateSet[stateName] = parseItemState(stateName, menuItems);
				menu.states.push(new State({name:stateName}));
			}
			
			if (menuToStates == null)
				menuToStates = new Dictionary;
			menuToStates[menu] = stateSet;
		}
		
		private function parseItemState(stateName:String, menuItems:Array):Object
		{
			var setProps:Array = [];
			
			for (var index:int = 0; index < menuItems.length; index++)
			{
				var item:Object = menuItems[index];
				for (var s:String in item)
				{
					var i:int = s.indexOf(".");
					if (i > 0)
					{
						var propName:String = s.substr(0, i);
						var stName:String = s.substr(i + 1);
						if (stName == stateName)
						{
							setProps.push({target:index.toString(), name:propName, value:item[s]});
						}
					}
				}
			}
			
			return {name:stateName,overrides:setProps};
		}
		
		private function onMenuItemClick(e:MenuEvent):void
		{
			var eventName:String = e.item.event;	
			if (!StringUtil.isBlank(eventName))
			{
				var menu:Menu = e.currentTarget as Menu;
				if (menu != null)
				{
					var owner:IEventDispatcher = e.item.owner;
					if (owner != null)
					{
						var i:int = eventName.lastIndexOf(".");
						if(i > 0)
						{
							var className:String = eventName.substr(0, i);
							if(ApplicationDomain.currentDomain.hasDefinition(className))
								var c:Class = ApplicationDomain.currentDomain.getDefinition(className) as Class;
							else
								c = getDefinitionByName(className) as Class;
							
							if (c != null)
								eventName = c[eventName.substr(i+1)];
						}
						
						if(e.item.hasOwnProperty("eventConstructor"))
						{
							var f:Function = e.item.eventConstructor as Function;
							if (f == null && Object(owner).hasOwnProperty(e.item.eventConstructor))
								f = owner[e.item.eventConstructor] as Function;
						}
						
						if (f == null && Object(owner).hasOwnProperty("menuEventConstructor"))
							f = owner["menuEventConstructor"] as Function;
						
						if (f != null)
							var event:Event = f(c, eventName);
						
						if (event == null)
						{
							if (c != null)
							{
								try
								{
									event = new c(eventName, true);	
								}
								catch (e:Error)
								{
									LoggingUtil.warn(MenuUtil, "Cannot create event: " + eventName);
									return;
								}
								
							}
							else
							{
								event = new Event(eventName, true);
							}
						}
						
						owner.dispatchEvent(event);
					}
				}
			}
		}
		
		private static var _instance:MenuUtil;
		public static function get instance():MenuUtil
		{
			if (_instance == null)
				_instance = new MenuUtil;
			return _instance;
		}
	}
}