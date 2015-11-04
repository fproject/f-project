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
	import mx.collections.ArrayList;
	
	import net.fproject.utils.DataUtil;
	
	/**
	 * 
	 * <p>The AdvancedArrayList class extends <code>mx.collections.ArrayList</code> class
	 * and provides <code>itemEqualFunction</code> property that used to specify
	 * the method to compare two items that used for <code>getItemIndex()</code>.</p>
	 * 
	 * <p>For example, if you want the <code>getItemIndex()</code> return index of the item
	 * with the same value in 'id' fields, you can use this:
	 * <pre>
	 * c = new AdvancedArrayList(usersArray);
	 * c.itemEqualFunction = function(a:User, b:User):Boolean
	 * {
	 * 	if(ObjectUtil.compare(a,b) == 0)
	 * 		return true;
	 * 	else
	 * 		return a.id == b.id;
	 * };
	 * </pre></p>
	 * 
	 * @see mx.collections.ArrayList
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class AdvancedArrayList extends ArrayList
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
		 * Construct a new AdvancedArrayList using the a source array an a function
		 * used for comparing items.
		 * If no source is specified an empty array will be used.
		 * 
		 * @param source The Array to use as a source for the ArrayList.
		 * @param itemEqualFunction The function used to compare two items, return true if and only if they are equals.
		 * Should have following signature:
		 * <pre>
		 * 	function itemEqualFunction(a:Object, b:Object):Boolean
		 * </pre>
		 *  
		 */
		public function AdvancedArrayList(source:Array=null, itemEqualFunction:Function=null)
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
			var n:int = source.length;
			for (var i:int = 0; i < n; i++)
			{
				if (itemEqualFunction(source[i], item))
					return i;
			}
			
			return -1;   
		}
	}
}