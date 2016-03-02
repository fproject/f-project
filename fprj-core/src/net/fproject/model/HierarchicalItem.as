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
package net.fproject.model
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	
	import net.fproject.collection.AdvancedArrayCollection;
	
	
	/**
	 * A hierarchical object, that is base class for all hierarchical model classes
	 */
	public class HierarchicalItem extends AbstractModel implements ISerializableModel
	{
		/**
		 * Constructor 
		 * 
		 */
		public function HierarchicalItem()
		{
		}
		
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
				var oldOutLineLevel:int = this.outlineLevel;
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
				if(outlineLevel - oldOutLineLevel != 0)
				{
					updateOutLineLevelForChild(outlineLevel - oldOutLineLevel);
				}
				var b:Boolean = true;
			}
			else
				b = false;
			
			if(firePropertyChange)
				dispatchParentChanged(oldParent, _parent);
			
			return b;
		}
		
		// outline = 1 cho trường hợp indent, outline = -1 cho trường hợp outdent
		public function updateOutLineLevelForChild(outLine:Number):void
		{
			for each (var note:HierarchicalItem in this.allChildren){
					note.outlineLevel = note.outlineLevel + outLine;
			}
			
		}
		
		//----------------------------------
		//  children
		//----------------------------------
		
		/**
		 * Storage for the children property
		 */
		protected var _children:AdvancedArrayCollection;
		
		[Transient]
		[Bindable("propertyChange")]
		/**
		 * The children of this element 
		 */
		public function get children():ArrayCollection
		{
			if(_children == null)
				_children = new AdvancedArrayCollection();
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
		
		public function hasChild(child:HierarchicalItem, recursive:Boolean=false):Boolean
		{
			if(children.getItemIndex(child) != -1)
				return true;
			if(recursive)
			{
				for each(var i:HierarchicalItem in children)
				{
					if(i.hasChild(child, true))
						return true;
				}
			}
			return false;
		}
		
		/**
		 * Add a child to children collection.
		 */
		public function addChild(element:HierarchicalItem, index:int=-1, 
								 replaceIfExist:Boolean=true, updateParent:Boolean=false,
								 firePropertyChange:Boolean=true):void
		{
			var i:int = children.getItemIndex(element);
			if(i != -1)
			{
				children.setItemAt(element, i);
			}
			else
			{
				if(index == -1)
					children.addItem(element); 
				else
					children.addItemAt(element, index)
			}
			
			if(updateParent && element.parent !== this)
			{
				var oldParent:HierarchicalItem = element.parent;
				if (oldParent != null)
					oldParent.removeChild(element);
				element._parent = this;
				if(firePropertyChange)
					element.dispatchParentChanged(oldParent, this);
			}
			
			dispatchChildrenChanged();
		}
		
		/**
		 * Add an multiple childs to children collection.
		 * @param children an array of childs or a IList instance that contains childs
		 */
		public function addChildren(children:Object, index:int=-1,
									replaceIfExist:Boolean=true, updateParent:Boolean=false,
									firePropertyChange:Boolean=true):void
		{
			if(children is Array)
				var list:IList = new ArrayList(children as Array);
			else
				list = IList(children);
				
			for(var i:int=0; i<list.length; i++)
			{
				var item:Object = list.getItemAt(i);
				var idx:int = children.getItemIndex(item);
				
				if(idx != -1)
					children.setItemAt(item, idx);
				else if(index == -1)
					children.addItem(item); 
				else
					children.addItemAt(item, index);
				
				if(updateParent && item is HierarchicalItem)
				{
					var element:HierarchicalItem = item as HierarchicalItem;
					if(element._parent !== this)
					{
						var oldParent:HierarchicalItem = element.parent;
						if (oldParent != null)
							oldParent.removeChild(element);
						element._parent = this;
						if(firePropertyChange)
							element.dispatchParentChanged(oldParent, this);
					}
				}						
			}
			if(list.length > 0)
				dispatchChildrenChanged();
		}
		
		/**
		 * Set/reset the <code>source</code> property for <code>children</code> collection.
		 * 
		 * This method helps improve performance especially when you want to add a large number of children.
		 * 
		 * @param source the source array.
		 * 
		 */
		public function setChildren(source:Array):void
		{
			for each(var item:HierarchicalItem in source)
			{
				item._parent = this;
			}
			children.source = source;
		}
		
		/**
		 * Called when a child is removed.
		 */
		public function removeChild(element:HierarchicalItem):void
		{
			var index:int = children.getItemIndex(element);
			if (index == -1)
				return;
			children.removeItemAt(index);
			dispatchChildrenChanged();
		}
		
		/**
		 * @private
		 */
		private function dispatchChildrenChanged():void
		{
			dispatchChangeEvent("children", null, children);   
		}
		
		/**
		 * @private
		 */
		private function dispatchParentChanged(oldParent:HierarchicalItem=null, newParent:HierarchicalItem=null):void
		{
			if(newParent == null)
				newParent = _parent;
			dispatchChangeEvent("parent", oldParent, newParent);   
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
