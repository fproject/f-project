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
package net.fproject.collection
{
	import mx.collections.HierarchicalCollectionView;
	import mx.collections.IHierarchicalData;
	import mx.collections.IViewCursor;
	import mx.collections.errors.ItemPendingError;
	import mx.core.mx_internal;
	
	import net.fproject.utils.DataUtil;
	
	use namespace mx_internal;
	
	/**
	 * This class is a workaround for http://bug.f-project.net/view.php?id=48 (FLEX-32249) 
	 * 
	 * @see http://stackoverflow.com/questions/4320678/advanced-data-grid-error-bookmark-no-longer-valid
	 * @see https://issues.apache.org/jira/browse/FLEX-32249
	 * @see https://issues.apache.org/jira/browse/FLEX-34119
	 * 
	 */
	public class HierarchicalCollectionView extends mx.collections.HierarchicalCollectionView
	{
		/**
		 * The function used to compare two items, return true if and only if they are equals.
		 * Should have following signature:
		 * <pre>
		 * 	function itemEqualFunction(a:Object, b:Object):Boolean
		 * </pre>
		 */
		public var itemEqualFunction:Function;
		
		public function HierarchicalCollectionView(hierarchicalData:IHierarchicalData=null,
												   argOpenNodes:Object=null,
												   itemEqualFunction:Function=null)
		{
			this.itemEqualFunction = itemEqualFunction == null ? DataUtil.equalsByUid : itemEqualFunction;
			super(hierarchicalData, argOpenNodes);
		}
		
		/**
		 *  @inheritDoc
		 */
		override public function createCursor() : IViewCursor
		{
			return new HierarchicalCollectionViewCursor(this, treeData, this.source);
		}
		
		/**
		 *  @inheritDoc
		 */
		override public function contains(item:Object):Boolean
		{
			if(itemEqualFunction == null)
				return super.contains(item);
			
			var cursor:IViewCursor = createCursor();
			while (!cursor.afterLast)
			{
				if (itemEqualFunction(cursor.current, item))
					return true;
				
				try
				{
					cursor.moveNext();
				}
				catch (e:ItemPendingError)
				{
					// item is pending.
					// we are not sure if the item is present or not, 
					// so return false
					return false;
				}
			}
			return false;
		}
	}
}