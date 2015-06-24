///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.active.supportClasses
{
	import flash.events.Event;
	
	import mx.collections.CursorBookmark;
	import mx.collections.IViewCursor;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.active.ActiveCallResponder;
	import net.fproject.active.DbCriteria;
	import net.fproject.active.IActiveDataProvider;
	import net.fproject.active.PaginationResult;
	import net.fproject.collection.CollectionChangeManager;

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
		 * @param index the current view index
		 * @param index the current view length
		 * @return a Boolean indicates whether we need to query next page.
		 * 
		 * @see net.fproject.active.IActiveDataProvider.queryTrigger
		 * 
		 */
		public function defaultQueryTrigger(index:int, length:int):Boolean
		{
			if(length > 0)
			{
				if(length < 5)
					return length - index == 1;
				else if(length < 20)
					return length - index == 2;
				else
					return length - index == 3;
			}
			return false;
		}
		
		private var lastCheckCursorIndex:Array = [-1, -1];
		
		public function checkCursorByIndex(index:int, length:int):void
		{
			if(!viewCursorAttached &&
				(index != lastCheckCursorIndex[0] || length != lastCheckCursorIndex[1]))
			{
				triggerQuery(index, length);
				lastCheckCursorIndex = [index, length];
			}
		}
		
		private var viewCursorAttached:Boolean;
		
		public function attachViewCursor(cursor:IViewCursor):IViewCursor
		{
			cursor.addEventListener(FlexEvent.CURSOR_UPDATE, onCursorUpdate, false, 0, true);
			viewCursorAttached = true;
			return cursor;
		}
		
		/**
		 * 
		 * Event handler for FlexEvent.CURSOR_UPDATE event of parent active data provider
		 * 
		 */
		private function onCursorUpdate(e:FlexEvent):void
		{
			var cursor:IViewCursor = e.target as IViewCursor;
			var bookmark:CursorBookmark = cursor.bookmark;
			var l:int = cursor.view.length;
			if(bookmark != null && l > 0)
			{
				var i:int = bookmark.getViewIndex();
				triggerQuery(i, l);
			}
		}
		
		/**
		 * Trigger the next-page query by checking the current view index reached the view length.
		 * @param index
		 * @param length
		 * 
		 */
		private function triggerQuery(index:int, length:int):void
		{
			var b:Boolean = parent.queryTrigger != null ? 
				parent.queryTrigger(index, length) : defaultQueryTrigger(index, length);
			if(b && !_fetchPending)
				fetchNextPage();
		}
		
		private var _fetchPending:Boolean;
		
		/**
		 * 
		 * @copy net.fproject.active.IActiveDataProvider.fetchNextPage()
		 * 
		 */
		public function fetchNextPage():ActiveCallResponder
		{
			if(parent.criteria == null)
				parent.setCriteria(new DbCriteria);
			if(parent.paginationResult != null)
			{
				parent.criteria.pagination = { perPage: parent.paginationResult.perPage };
				parent.criteria.pagination['page'] = parent.paginationResult.currentPage >= parent.paginationResult.pageCount ?
					parent.paginationResult.pageCount : parent.paginationResult.currentPage + 1;
			}
			
			_fetchPending = true;
			
			return parent.service.fetchData(parent);
		}
		
		/**
		 * 
		 * @copy net.fproject.active.IActiveDataProvider.fetchFirstPage()
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
			
			parent.setSource(null);
			
			return parent.service.fetchData(parent);
		}
		
		/**
		 * This method is used as default value of <code>paginationResultHandler</code>
		 * @param p the pagination result of last service call
		 * @return a Boolean indicates whether we need to query next page.
		 * 
		 * @see net.fproject.active.IActiveDataProvider.paginationResultHandler
		 * 
		 */
		public function defaultPaginationResultHandler(p:PaginationResult):void
		{
			for each(var o:Object in p.items)
			{
				if(!parent.contains(o))
					parent.addItem(o);
			}
			parent.setPaginationResult(p);
		}
		
		/**
		 * 
		 * @copy net.fproject.active.IActiveDataProvider.result()
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
					CollectionChangeManager.getInstance().pause(parent);
					
					if(parent.paginationResultHandler != null)
						parent.paginationResultHandler(pr);
					else
						defaultPaginationResultHandler(pr);
					
					if(parent.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
						parent.dispatchEvent(PropertyChangeEvent.createUpdateEvent(
							parent,'paginationResult', parent.paginationResult, pr));
					if(parent.hasEventListener(Event.CHANGE))
						parent.dispatchEvent(new Event(Event.CHANGE));
					
					CollectionChangeManager.getInstance().resume(parent);
				}
			}
		}
		
		/**
		 * 
		 * @copy net.fproject.active.IActiveDataProvider.fault()
		 * 
		 */
		public function fault(data:Object):void
		{
			_fetchPending = false;
		}
		
		/**
		 * Create an instance of DbCriteria from an input object.
		 * @param criteria the input object.
		 * @return an instance of DbCriteria from an input object.
		 * If the value of <code>criteria</code> is DbCriteria already, this method
		 * returns the <code>criteria</code> itself, else, it returns a new instance
		 * 
		 */
		public function parseCriteria(criteria:Object):DbCriteria
		{
			if(criteria is DbCriteria)
			{
				var c:DbCriteria = DbCriteria(criteria);
			}
			else if(criteria != null)
			{
				if(criteria.hasOwnProperty('criteria'))
				{
					c = new DbCriteria(criteria['criteria']);
					if(criteria.hasOwnProperty('pagination'))
						c.pagination = criteria['pagination'];
					if(criteria.hasOwnProperty('sort'))
						c.sort = criteria['sort'];
				}
				else
				{
					c = new DbCriteria(criteria);
				}
			}
			return c;
		}
		
		/**
		 * Constructor 
		 * @param parent the IActiveDataProvider that owns this handler.
		 * 
		 */
		public function ActiveDataProviderHandler(parent:IActiveDataProvider)
		{
			this.parent = parent;
		}
	}
}