///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
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
			this.itemEqualFunction = itemEqualFunction == null ? DataUtil.equals : itemEqualFunction;
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