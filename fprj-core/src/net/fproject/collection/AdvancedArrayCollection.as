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
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.errors.SortError;
	import mx.core.mx_internal;
	
	import net.fproject.utils.DataUtil;
	
	use namespace mx_internal;
	/**
	 * 
	 * <p>The AdvancedArrayCollection class extends <code>mx.collections.ArrayCollection</code> class
	 * and provides <code>itemEqualFunction</code> property that used to specify
	 * the method to compare two items that used for <code>getItemIndex()</code>.</p>
	 * 
	 * <p>For example, if you want the <code>getItemIndex()</code> return index of the item
	 * with the same value in 'id' fields, you can use this:
	 * <pre>
	 * c = new AdvancedArrayCollection(usersArray);
	 * c.itemEqualFunction = function(a:User, b:User):Boolean
	 * {
	 * 	if(ObjectUtil.compare(a,b) == 0)
	 * 		return true;
	 * 	else
	 * 		return a.id == b.id;
	 * };
	 * </pre></p>
	 * 
	 * @see mx.collections.ArrayCollection
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class AdvancedArrayCollection extends ArrayCollection
	{
		/**
		 * The function used to compare two items, return true if and only if they are equals.
		 * Should have following signature:
		 * <pre>
		 * 	function itemEqualFunction(a:Object, b:Object):Boolean
		 * </pre>
		 */
		public var itemEqualFunction:Function;
		
		
		/**
		 * 
		 * Construct a new AdvancedArrayCollection using the a source array an a function
		 * used for comparing items.
		 * If no source is specified an empty array will be used.
		 * 
		 * @param source The Array to use as a source for the AdvancedArrayCollection.
		 * @param itemEqualFunction The function used to compare two items, return true if and only if they are equals.
		 * Should have following signature:
		 * <pre>
		 * 	function itemEqualFunction(a:Object, b:Object):Boolean
		 * </pre>
		 *  
		 */
		public function AdvancedArrayCollection(source:Array=null, itemEqualFunction:Function=null)
		{
			this.itemEqualFunction = itemEqualFunction == null ? DataUtil.equalsByUid : itemEqualFunction;
			super(source);
		}
		
		/**
		 *  @inheritDoc
		 */
		override public function getItemIndex(item:Object):int
		{
			if(itemEqualFunction == null)
				return super.getItemIndex(item);
			var i:int;
			
			if (localIndex && filterFunction != null)
			{
				var len:int = localIndex.length;
				for (i = 0; i < len; i++)
				{
					if (itemEqualFunction(localIndex[i], item))
						return i;
				}
			}
			else if (localIndex && sort)
			{
				var startIndex:int = findItem(item, Sort.FIRST_INDEX_MODE);
				if (startIndex == -1)
					return -1;
				
				var endIndex:int = findItem(item, Sort.LAST_INDEX_MODE);
				for (i = startIndex; i <= endIndex; i++)
				{
					if (itemEqualFunction(localIndex[i], item))
						return i;
				}
			}
			// List is sorted or filtered but refresh has not been called
			else if (localIndex)
			{
				len = localIndex.length;
				for (i = 0; i < len; i++)
				{
					if (itemEqualFunction(localIndex[i], item))
						return i;
				}
			}
			else
			{
				len = source.length;
				for (i = 0; i < len; i++)
				{
					if (itemEqualFunction(source[i], item))
						return i;
				}
			}
			
			// fallback
			return -1;
		}
		
		/**
		 *  @inheritDoc
		 */
		override mx_internal function findItem(values:Object, mode:String, insertIndex:Boolean = false):int
		{
			if(itemEqualFunction == null || !sort || !localIndex || localIndex.length == 0)
				return super.findItem(values, mode, insertIndex);
			
			try
			{
				return sort.findItem(localIndex, values, mode, insertIndex, 
					function(a:Object, b:Object):int
					{
						return (itemEqualFunction(a, b)) ? 0 : -1;							
					});
			}
			catch (e:SortError)
			{
				// usually because the find critieria is not compatible with the sort.
			}
			
			return -1;
		}
	}
}