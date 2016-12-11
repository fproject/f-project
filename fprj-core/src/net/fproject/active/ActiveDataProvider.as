///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.active
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.CursorBookmark;
	import mx.collections.IViewCursor;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.collection.AdvancedArrayCollection;
	
	/**
	 * ActiveDataProvider class extends <code>AdvancedArrayCollection</code> class
	 * and implements a data provider based on ActiveService.
	 *
	 * ActiveDataProvider provides data in terms of model objects which are
	 * of class <code>modelClass</code> from a ActiveService.
	 * It uses the ActiveService <code>find</code> method to retrieve remote data.
	 * The <code>criteria</code> property can be used to specify remote service query options.
	 * The <code>pagination</code> property can be used to specify query result pagination.
	 * ActiveDataProvider may be used in the following ways:
	 * <pre>//Example 1:
	 * 
	 * userDataGrid.dataProvider = UserService.instance.createDataProvider({
	 * 		condition : '&#64;findSomeUsers',
	 * 		sort : 'name,-createTime',
	 * 		expand : '&#64;userProfile'});
	 * 
	 * <br>//Example 2:
	 * 
	 * userDataProvider = new ActiveDataProvider({
	 *     criteria : {
	 * 		condition : '&#64;findSomeUsers',
	 * 		sort : 'name,-createTime',
	 * 		expand : '&#64;userProfile',
	 *     },
	 *     pagination : {
	 * 		perPage : 20, page: 3
	 *     }
	 * });
	 * 
	 * userDataGrid.dataProvider = userDataProvider;
	 * UserService.instance.fetchData(userDataProvider);
	 * </pre>
	 *
	 * @see net.fproject.active.ActiveService.createDataProvider()
	 * @see net.fproject.collection.AdvancedArrayCollection
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class ActiveDataProvider extends AdvancedArrayCollection implements IActiveDataProvider
	{
		private var _criteria:DbCriteria;

		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function get criteria():DbCriteria
		{
			return _criteria;
		}
		
		private var _paginationResult:PaginationResult;

		[Bindable('propertyChange')]
		/**
		 * 
		 * The last pagination result
		 * 
		 */
		public function get paginationResult():PaginationResult
		{
			return _paginationResult;
		}

		private var _service:ActiveService;

		/**
		 * 
		 * The active service used to retreive remote data
		 * 
		 */
		public function get service():ActiveService
		{
			return _service;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setService(value:ActiveService):void
		{
			_service = value;
		}

		/**
		 * A function that return a Boolean indicates whether we need to query next page.
		 * This function is called every time the IViewCursor of this collection is updated.
		 * It must have only one parameter that is the IViewCursor itself,
		 * <pre>function myQueryTrigger(cursor:IViewCursor):Boolean</pre>
		 * 
		 * By default, the <code>defaultQueryTrigger</code> method will be used.
		 * 
		 * @see #defaultQueryTrigger()
		 */
		public var queryTrigger:Function;
		
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
					return i > 0.9*l;
				else
					return l - i < 3;
			}
			return false;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override public function createCursor():IViewCursor
		{
			var cursor:IEventDispatcher = IEventDispatcher(super.createCursor());
			cursor.addEventListener(FlexEvent.CURSOR_UPDATE, onCursorUpdate, false, 0, true);
			return IViewCursor(cursor);
		}
		
		private function onCursorUpdate(e:FlexEvent):void
		{
			var cursor:IViewCursor = e.target as IViewCursor;
			var b:Boolean = queryTrigger != null ? 
				queryTrigger(cursor) : defaultQueryTrigger(cursor);
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
			if(_criteria == null)
				_criteria = new DbCriteria;
			if(_paginationResult != null)
			{
				_criteria.pagination = {
					page: _paginationResult.currentPage + 1, perPage: _paginationResult.perPage
				};
			}
			
			_fetchPending = true;
			
			return service.fetchData(this);
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function fetchFirstPage():ActiveCallResponder
		{
			if(_criteria == null)
				_criteria = new DbCriteria;
			if(_criteria.pagination == null)
				_criteria.pagination = {page:1};
			else
				_criteria.pagination["page"] = 1;
				
			_fetchPending = true;
			
			this.source = null;
			
			return service.fetchData(this);
		}
		
		/**
		 * The call back function that called when new page is received after last 
		 * service method invocation.
		 * This must have following signature:
		 * <pre>function myPaginationResultHandler(p:PaginationResult):void</pre>
		 * 
		 * By default, the <code>defaultPaginationResultHandler</code> method will be used.
		 * 
		 * @see #defaultPaginationResultHandler()
		 */
		public var paginationResultHandler:Function;
		
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
				this.addItem(o);
			}
			
			var oldValue:PaginationResult = _paginationResult;
			_paginationResult = p;
			
			if(this.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,'paginationResult', oldValue, p));
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
				if(_paginationResult == null || 
					_paginationResult.currentPage != pr.currentPage)
				{
					if(paginationResultHandler != null)
						paginationResultHandler(pr);
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
		
		/**
		 * Constructor.
		 * 
		 * @param criteria The criteria that is passed to <code>find</code> method
		 * of ActiveService
		 * @param service the ActiveService instance
		 * 
		 */
		public function ActiveDataProvider(criteria:Object, service:ActiveService=null)
		{
			super(source);
			_service = service;
			if(criteria is DbCriteria)
			{
				_criteria = DbCriteria(criteria);
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
		}
	}
}