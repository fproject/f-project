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
	import mx.collections.IHierarchicalData;
	import mx.collections.IViewCursor;
	import mx.core.mx_internal;
	
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
		public function HierarchicalCollectionView(hierarchicalData:IHierarchicalData=null, argOpenNodes:Object=null)
		{
			super(hierarchicalData, argOpenNodes);
		}
		
		/**
		 *  @inheritDoc
		 */
		override public function createCursor() : IViewCursor
		{
			return new HierarchicalCollectionViewCursor(this, treeData, this.source);
		}
	}
}