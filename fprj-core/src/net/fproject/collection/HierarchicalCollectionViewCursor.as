///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2013 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.collection
{
	import mx.collections.HierarchicalCollectionView;
	import mx.collections.HierarchicalCollectionViewCursor;
	import mx.collections.ICollectionView;
	import mx.collections.IHierarchicalData;
	import mx.collections.errors.CursorError;
	import mx.events.CollectionEvent;

	/**
	 * This class is a workaround for http://bug.f-project.net/view.php?id=48 (FLEX-32249) 
	 * 
	 * @see http://stackoverflow.com/questions/4320678/advanced-data-grid-error-bookmark-no-longer-valid
	 * @see https://issues.apache.org/jira/browse/FLEX-32249
	 * 
	 */
	public class HierarchicalCollectionViewCursor extends mx.collections.HierarchicalCollectionViewCursor
	{
		public function HierarchicalCollectionViewCursor(collection:mx.collections.HierarchicalCollectionView, model:ICollectionView, hierarchicalData:IHierarchicalData)
		{
			super(collection, model, hierarchicalData);
		}
		
		override public function get current() : Object
		{
			// original HierarchicalCollectionViewCursor class fails to catch the "bookmark no
			// longer valid" Error, which is thrown as a CollectionViewError instance in ListCollectionView,
			// but transformed to a CursorError within the same class
			try {
				var result:Object = super.current;
			}
			catch (e:CursorError) {
				result = null;
			}
			
			// done
			return result;
		}
		
		override public function collectionChangeHandler(event:CollectionEvent):void
		{
			// original HierarchicalCollectionViewCursor class fails to catch the "bookmark no
			// longer valid" Error, which is thrown as a CollectionViewError instance in ListCollectionView,
			// but transformed to a CursorError within the same class
			try {
				super.collectionChangeHandler(event);
			}
			catch (e:CursorError) {
			}
		}
	}
}