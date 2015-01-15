///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
﻿package net.fproject.utils
{
	import flash.display.*;
	import mx.core.*;
	import mx.utils.*;
	
	public class ItemRendererCache
	{
		private var _creationCount:int;
		private var _itemRenderers:Array;
		private var _itemRendererPool:Array;
		private var _recycledItemRendererPool:Object;
		private var _itemRendererFactory:IFactory;
		private var _creationFunction:Function;
		private var _destructionFunction:Function;
		private var _visibleOnCreation:Boolean;
		private var _useRecycledData:Boolean;
		private var _container:Object;
		private var _uidFunction:Function;
		private var _setDataFunction:Function;
		public var addToContainerFunction:Function;
		public var removeFromContainerFunction:Function;
		
		public function ItemRendererCache(factory:IFactory, container:Object = null, creationCount:int = 10, 
										  useRecycledData:Boolean = false, dataItemCreationFunction:Function = null, 
										  configurationFunction:Function = null, setDataFunction:Function = null, uidFunction:Function = null)
		{
			this._itemRenderers = [];
			this._itemRendererPool = [];
			this._itemRendererFactory = factory;
			this._creationFunction = dataItemCreationFunction;
			this._destructionFunction = configurationFunction;
			this._useRecycledData = useRecycledData;
			this._container = container;
			this._creationCount = creationCount;
			this._uidFunction = uidFunction;
			this._setDataFunction = setDataFunction;
			if (this._useRecycledData)
			{
				this._recycledItemRendererPool = [];
			}
		}// end function
		
		public function get itemRenderers() : Array
		{
			return this._itemRenderers;
		}// end function
		
		public function getItemRenderer(item:Object, create:Boolean = true, visibleOnCreation:Boolean = true, 
										fromRecycledDataCache:Boolean = true, subIndex:int = -1) : Object
		{
			if (item == null)
			{
				return null;
			}
			var itemUid:String = this.itemToUID(item);
			var renderer:Object = this.getFromCollisionMap(this._itemRenderers, itemUid, subIndex);
			//if (this.getFromCollisionMap(this._itemRenderers, itemUid, param5) != null)
			if(renderer != null)
			{
				return renderer;
			}
			if (this._useRecycledData && fromRecycledDataCache)
			{
				renderer = this.removeFromCollisionMap(this._recycledItemRendererPool, null, itemUid);
				if (renderer != null)
				{
					this._itemRendererPool.splice(this._itemRendererPool.indexOf(renderer), 1);
				}
			}
			if (create && renderer == null)
			{
				if (this._itemRendererPool.length == 0)
				{
					this.addItemRendererBatchToPool();
				}
				renderer = this._itemRendererPool.shift();
				var container:IVisualElementContainer = this._container as IVisualElementContainer;
				if (container != null && renderer.parent != container)
				{
					if (this.addToContainerFunction != null)
					{
						this.addToContainerFunction(this._container, renderer);
					}
					else
					{
						container.addElement(renderer as IVisualElement);
					}
					if (renderer is IInvalidating)
					{
						IInvalidating(renderer).validateNow();
					}
				}
				else if (renderer.parent != this._container)
				{
					if (this.addToContainerFunction != null)
					{
						this.addToContainerFunction(this._container, renderer);
					}
					else
					{
						this._container.addChild(DisplayObject(renderer));
					}
				}
				if (renderer.data != null && this._useRecycledData)
				{
					var dataUid:String = this.itemToUID(renderer.data);
					this.removeFromCollisionMap(this._recycledItemRendererPool, renderer, dataUid);
				}
				this.setItemRendererData(IDataRenderer(renderer), item);
			}
			if (renderer != null)
			{
				renderer.visible = visibleOnCreation;
				this.addToCollisionMap(this._itemRenderers, renderer, itemUid);
			}
			return renderer;
		}// end function
		
		private function addItemRendererBatchToPool() : void
		{
			for (var i:int = 0; i < this._creationCount; i++)
			{				
				var r:Object = this.createItemRenderer();
				r.visible = false;
				this._itemRendererPool.push(r);
				this.configureOnCreation(this._container, r);
			}
		}// end function
		
		protected function createItemRenderer() : Object
		{
			return this._itemRendererFactory.newInstance();
		}// end function
		
		protected function setItemRendererData(itemRenderer:IDataRenderer, data:Object) : void
		{
			if (this._setDataFunction != null)
			{
				this._setDataFunction(itemRenderer, data);
			}
			else
			{
				itemRenderer.data = data;
			}
		}// end function
		
		public function clearItemRenderers() : void
		{
			for each (var r:Object in this._itemRenderers)
			{				
				if (r is Array)
				{
					var a:Array = r as Array;
					for each (var item:Object in a)
					{						
						this.configureOnDeletion(this._container, item);
					}
					continue;
				}
				this.configureOnDeletion(this._container, r);
			}
			this._itemRenderers = [];
			this._itemRendererPool = [];
			if (this._useRecycledData)
			{
				this._recycledItemRendererPool = [];
			}
		}// end function
		
		public function recycleAllItemRenderers(clearRecycleMap:Boolean = false) : void
		{
			for each (var r:Object in this._itemRenderers)
			{				
				if (r is Array)
				{
					var a:Array = r as Array;
					for each (var item:Object in a)
					{						
						this.recycleItemRenderer(item);
					}
					continue;
				}
				this.recycleItemRenderer(r);
			}
			if (clearRecycleMap)
			{
				this._recycledItemRendererPool = [];
			}
		}// end function
		
		private function configureOnDeletion(container:Object, itemRenderer:Object) : void
		{
			if (container != null && itemRenderer != null && itemRenderer.parent == container)
			{
				if (this._destructionFunction != null)
				{
					this._destructionFunction(itemRenderer.data);
				}
				if (this.removeFromContainerFunction != null)
				{
					this.removeFromContainerFunction(container, itemRenderer);
				}
				else
				{
					var c:IVisualElementContainer = this._container as IVisualElementContainer;
					if (c != null)
					{
						c.removeElement(itemRenderer as IVisualElement);
					}
					else
					{
						container.removeChild(DisplayObject(itemRenderer));
					}
				}
			}
		}// end function
		
		private function configureOnCreation(container:Object, itemRenderer:Object) : void
		{
			if (this._creationFunction != null)
			{
				this._creationFunction(itemRenderer);
			}
		}// end function
		
		private function configureOnRecycling(container:Object, itemRenderer:Object) : void
		{
			if (itemRenderer is IVisualElement)
			{
				IVisualElement(itemRenderer).visible = false;
			}
			else if (itemRenderer is IUIComponent)
			{
				IUIComponent(itemRenderer).visible = false;
			}
		}// end function
		
		public function recycleItemRenderer(itemRenderer:Object) : void
		{
			var itemUid:String = this.itemToUID(itemRenderer.data);
			this._itemRendererPool.push(itemRenderer);
			this.addToCollisionMap(this._recycledItemRendererPool, itemRenderer, itemUid);
			this.removeFromCollisionMap(this._itemRenderers, itemRenderer, itemUid);
			this.configureOnRecycling(this._container, itemRenderer);
		}// end function
		
		public function recycleItemRenderersForItem(item:Object, subIndex:int = -1) : void
		{
			var itemUid:String = this.itemToUID(item);
			var r:Object = this.getFromCollisionMap(this._itemRenderers, itemUid, subIndex);
			while (r != null)
			{				
				this._itemRendererPool.push(r);
				this.addToCollisionMap(this._recycledItemRendererPool, r, itemUid);
				this.removeFromCollisionMap(this._itemRenderers, r, itemUid);
				this.configureOnRecycling(this._container, r);
				r = subIndex == -1 ? this.getFromCollisionMap(this._itemRenderers, itemUid) : null;
			}
		}// end function
		
		public function getRendererCount(item:Object) : int
		{
			var itemUid:String = this.itemToUID(item);
			var r:Object = this._itemRenderers[itemUid];
			if (r == null)
			{
				return 0;
			}
			if (r is Array)
			{
				return (r as Array).length;
			}
			return 1;
		}// end function
		
		public function getRenderersInUseForItem(item:Object) : Array
		{
			var itemUid:String = this.itemToUID(item);
			var a:Object = this._itemRenderers[itemUid];
			if (a == null)
			{
				return [];
			}
			if (a is Array)
			{
				return a as Array;
			}
			return [a];
		}// end function
		
		private function addToCollisionMap(collisionMap:Object, value:Object, key:String) : void
		{
			var v:Object = collisionMap[key];
			if (collisionMap[key] == null)
			{
				collisionMap[key] = value;
			}
			else if (v is Array)
			{
				(v as Array).push(value);
			}
			else
			{
				collisionMap[key] = [v, value];
			}
		}// end function
		
		private function removeFromCollisionMap(collisionMap:Object, value:Object, key:String) : Object
		{
			var v:Object = collisionMap[key];
			if (collisionMap[key] == null)
			{
				return null;
			}
			if (v is Array)
			{
				var a:Array = v as Array;
				if (value == null)
				{
					value = a.pop();
				}
				else
				{
					a.splice(a.indexOf(value), 1);
				}
				if (a.length == 1)
				{
					collisionMap[key] = a[0];
				}
			}
			else
			{
				if (value == null)
				{
					value = v;
				}
				delete collisionMap[key];
			}
			return value;
		}// end function
		
		private function getFromCollisionMap(collisionMap:Object, key:String, subIndex:int = -1) : Object
		{
			var value:Object = collisionMap[key];
			if (collisionMap[key] == null)
			{
				return null;
			}
			if (value is Array)
			{
				var a:Array = value as Array;
				if (subIndex == -1)
				{
					subIndex = a.length - 1;
				}
				else if ((a.length - 1) < subIndex)
				{
					return null;
				}
				var item:Object  = a[subIndex];
			}
			else if (subIndex == -1 || subIndex == 0)
			{
				item = value;
			}
			else
			{
				item = null;
			}
			return item;
		}// end function
		
		public function setFactory(factory:IFactory) : void
		{
			this._itemRendererFactory = factory;
			this.clearItemRenderers();
		}// end function
		
		protected function itemToUID(item:Object) : String
		{
			if (this._uidFunction != null)
			{
				var uid:Object = this._uidFunction(item);
				if (uid is String)
				{
					return uid as String;
				}
				return uid.toString();
			}
			if (!item)
			{
				return null;
			}
			return UIDUtil.getUID(item);
		}// end function
		
	}
}
