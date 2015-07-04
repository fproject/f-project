///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2013 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.model
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.events.PropertyChangeEvent;
	
	import net.fproject.collection.AdvancedArrayCollection;
	
	
	/**
	 * A hierarchical object, that is base class for all hierarchical model classes
	 */
	public class HierarchicalItem extends LocalUID
	{
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------    
		
		//----------------------------------
		//  parent
		//----------------------------------
		
		/**
		 * Storage for the parent property.
		 */
		protected var _parent:HierarchicalItem;
		
		[Transient]
		[Bindable("propertyChange")]
		/**
		 * The parent for this element
		 */
		public function get parent():HierarchicalItem
		{
			return _parent;
		}
		
		/**
		 * @private
		 */
		public function set parent(value:HierarchicalItem):void
		{
			setParent(value);
		}
		
		/**
		 * Set the parent node and/or changing hierachical layout 
		 * @param newParent the new parent
		 * @param newIndex the new index of the item in the children list of the new parent
		 * @return <code>true</code> if the new parent is set, <code>false</code> if nothing was set
		 */
		public function setParent(newParent:HierarchicalItem, newIndex:int=-1, firePropertyChange:Boolean=true):Boolean
		{
			if (_parent !== newParent)
			{
				var oldParent:HierarchicalItem = _parent;
				if (oldParent != null)
					oldParent.removeChild(this);
				
				_parent = newParent;
				
				if (_parent != null)
				{
					_parent.addChild(this, newIndex);
					outlineLevel = _parent.outlineLevel + 1;
				}
				else
				{
					outlineLevel = 0;
				}
				
				var b:Boolean = true;
			}
			else
				b = false;
			
			if(firePropertyChange)
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "parent", oldParent, _parent));
			
			return b;
		}
		
		//----------------------------------
		//  children
		//----------------------------------
		
		/**
		 * Storage for the children property
		 */
		protected var _children:AdvancedArrayCollection = new AdvancedArrayCollection();
		
		[Transient]
		[Bindable("propertyChange")]
		/**
		 * The children of this element 
		 */
		public function get children():ArrayCollection
		{
			return _children;
		}
		
		//----------------------------------
		//  allChildren
		//----------------------------------
		
		[Transient]
		/**
		 * The children and subchildren of this element. 
		 */    
		public function get allChildren():Array
		{
			var array:Array = [];
			flatten(children, array);
			return array;
		}
		
		/**
		 * Create an array that contains all tree-element of a hierachical list.
		 * @param hierachicalList the hierachical list
		 * @param result the output result array
		 */
		public static function flatten(hierachicalList:IList, result:Array):void
		{
			for each (var node:HierarchicalItem in hierachicalList)
			{
				result.push(node);
				if (node.children != null)
				{
					flatten(node.children, result);
				}
			}
		}
		
		/**
		 * Add a child to children collection.
		 */
		public function addChild(element:HierarchicalItem, index:int=-1, replaceIfExist:Boolean=true):void
		{
			var i:int = _children.getItemIndex(element);
			if(i != -1)
			{
				_children.setItemAt(element, i);
			}
			else
			{
				if(index == -1)
					_children.addItem(element); 
				else
					_children.addItemAt(element, index)
			}
			dispatchChildrenChanged();
		}
		
		/**
		 * Add an multiple childs to children collection.
		 * @param children an array of childs or a IList instance that contains childs
		 */
		public function addChildren(children:Object, index:int=-1, replaceIfExist:Boolean=true):void
		{
			if(children is Array)
				var list:IList = new ArrayList(children as Array);
			else
				list = IList(children);
				
			for(var i:int=0; i<list.length; i++)
			{
				var item:Object = list.getItemAt(i);
				var idx:int = _children.getItemIndex(item);
				if(idx != -1)
					_children.setItemAt(item, idx);
				else if(index == -1)
					_children.addItem(item); 
				else
					_children.addItemAt(item, index)
			}
			if(list.length > 0)
				dispatchChildrenChanged();
		}
		
		/**
		 * Called when a child is removed.
		 */
		public function removeChild(element:HierarchicalItem):void
		{
			var index:int = _children.getItemIndex(element);
			if (index == -1)
				return;
			_children.removeItemAt(index);
			dispatchChildrenChanged();
		}
		
		/**
		 * @private
		 */
		private function dispatchChildrenChanged():void
		{
			dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "children", null, children));   
		}
		
		/**
		 * Indicates whether the specified element is an ancestor of this element.
		 */
		public function isAnAncestorOf(value:HierarchicalItem):Boolean
		{
			if (value == null || value.parent == this)
				return true;
			else if (value.parent == null)
				return false;
			else
				return isAnAncestorOf(value.parent);
		}
		
		[Transient]
		[Bindable("none")]
		public var lid:Number;
		
		[Transient]
		[Bindable("none")]
		public var outlineLevel:Number;
	}
}
