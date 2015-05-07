///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.active.supportClasses
{
	import mx.collections.CursorBookmark;
	import mx.collections.IList;
	import mx.collections.IViewCursor;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.active.ActiveCallResponder;
	import net.fproject.active.DbCriteria;
	import net.fproject.active.IActiveDataProvider;
	import net.fproject.active.PaginationResult;

	/**
	 * Helper class for IActiveDataProvider's implementations
	 *  
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class ActiveDataProviderHandler
	{
		private var parent:IActiveDataProvider;
		
		/**
		 * This method is used as default value of <code>queryTrigger</code>
		 * @param cursor the IViewCursor contains current view cursor information
		 * @return a Boolean indicates whether we need to query next page.
		 * 
		 * @see #queryTrigger
		 * 
		 */
		public function defaultQueryTrigger(cursor:IViewCursor):Boolean
		{
			var bookmark:CursorBookmark = cursor.bookmark;
			var l:int = cursor.view.length;
			if(bookmark != null && l > 0)
			{
				var i:int = bookmark.getViewIndex();
				if(l < 20)
					return l - i < 2;
				else
					return l - i < 3;
			}
			return false;
		}
		
		/**
		 * 
		 * Event handler for FlexEvent.CURSOR_UPDATE event of parent active data provider
		 * 
		 */
		public function onCursorUpdate(e:FlexEvent):void
		{
			var cursor:IViewCursor = e.target as IViewCursor;
			var b:Boolean = parent.queryTrigger != null ? 
				parent.queryTrigger(cursor) : defaultQueryTrigger(cursor);
			if(b && !_fetchPending)
				fetchNextPage();
		}
		
		private var _fetchPending:Boolean;
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function fetchNextPage():ActiveCallResponder
		{
			if(parent.criteria == null)
				parent.setCriteria(new DbCriteria);
			if(parent.paginationResult != null)
			{
				parent.criteria.pagination = {
					page: parent.paginationResult.currentPage + 1, perPage: parent.paginationResult.perPage
				};
			}
			
			_fetchPending = true;
			
			return parent.service.fetchData(parent);
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function fetchFirstPage():ActiveCallResponder
		{
			if(parent.criteria == null)
				parent.setCriteria(new DbCriteria);
			if(parent.criteria.pagination == null)
				parent.criteria.pagination = {page:1};
			else
				parent.criteria.pagination["page"] = 1;
			
			_fetchPending = true;
			
			parent.source = null;
			
			return parent.service.fetchData(parent);
		}
		
		/**
		 * This method is used as default value of <code>paginationResultHandler</code>
		 * @param p the pagination result of last service call
		 * @return a Boolean indicates whether we need to query next page.
		 * 
		 * @see #paginationResultHandler
		 * 
		 */
		public function defaultPaginationResultHandler(p:PaginationResult):void
		{
			for each(var o:Object in p.items)
			{
				IList(parent).addItem(o);
			}
			
			var oldValue:PaginationResult = parent.paginationResult;
			parent.setPaginationResult(p);
			
			if(parent.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
				parent.dispatchEvent(PropertyChangeEvent.createUpdateEvent(parent,'paginationResult', oldValue, p));
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		public function result(data:Object):void
		{
			_fetchPending = false;
			
			if(data is ResultEvent)
			{
				var pr:PaginationResult = ResultEvent(data).result as PaginationResult;
				if(parent.paginationResult == null || 
					parent.paginationResult.currentPage != pr.currentPage)
				{
					if(parent.paginationResultHandler != null)
						parent.paginationResultHandler(pr);
					else
						defaultPaginationResultHandler(pr);
				}
			}
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		public function fault(data:Object):void
		{
			_fetchPending = false;
		}
		
		public function parseCriteria(criteria:Object):DbCriteria
		{
			if(criteria is DbCriteria)
			{
				var _criteria:DbCriteria = DbCriteria(criteria);
			}
			else if(criteria != null)
			{
				if(criteria.hasOwnProperty('criteria'))
					_criteria = new DbCriteria(criteria['criteria']);
				else
					_criteria = new DbCriteria(criteria);
				if(criteria.hasOwnProperty('pagination'))
					_criteria.pagination = criteria['pagination'];
			}
			return _criteria;
		}
		
		public function ActiveDataProviderHandler(parent:IActiveDataProvider)
		{
			this.parent = parent;
		}
	}
}