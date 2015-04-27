package net.fproject.active
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.collections.CursorBookmark;
	import mx.collections.IViewCursor;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
	 * ActiveDataProvider implements a data provider based on ActiveService.
	 *
	 * ActiveDataProvider provides data in terms of model objects which are
	 * of class <code>modelClass</code> from a ActiveService.
	 * It uses the ActiveService <code>find</code> method to retrieve the remote data.
	 * The <code>criteria</code> property can be used to specify remote service query options.
	 * The <code>pagination</code> property can be used to specify query result pagination.
	 * ActiveDataProvider may be used in the following way:
	 * <pre>
	 * userDataProvider=new ActiveDataProvider(UserService, {
	 *     criteria : {
	 * 		condition : '&#64;findSomeUsers',
	 * 		sort : 'name,-createTime',
	 * 		expand : '&#64;userProfile',
	 *     },
	 *     pagination : {
	 * 		perPage : 20,
	 *     },
	 * });
	 * userDataGrid.dataProvider = userDataProvider;
	 * </pre>
	 *
	 * @author Bui Sy Nguyen
	 */
	public class ActiveDataProvider extends ArrayCollection
	{
		private var _criteria:DbCriteria;

		public function get criteria():DbCriteria
		{
			return _criteria;
		}
		
		private var _pagination:Object;

		public function get pagination():Object
		{
			return _pagination;
		}
		
		private var _service:ActiveService;

		public function get service():ActiveService
		{
			return _service;
		}

		/**
		 * A function that return a Boolean indicates whether we need to query next page.
		 * This function is called every time the IViewCursor of this collection is updated.
		 * It must have only one parameter that is the IViewCursor itself,
		 * <pre>function myQueryTrigger(cursor:IViewCursor):Boolean</pre>
		 */
		public var queryTrigger:Function;
		
		private function defaultQueryTrigger(cursor:IViewCursor):Boolean
		{
			var bookmark:CursorBookmark = cursor.bookmark;
			if(bookmark != null && this.length > 0)
			{
				var i:int = bookmark.getViewIndex();
				if(0.9 < i/this.length)
					return true;
			}
			return false;
		}
		
		override public function createCursor():IViewCursor
		{
			var cursor:IEventDispatcher = IEventDispatcher(super.createCursor());
			cursor.addEventListener(FlexEvent.CURSOR_UPDATE, onCursorUpdate, false, 0, true);
			return IViewCursor(cursor);
		}
		
		private function onCursorUpdate(e:FlexEvent):void
		{
			var cursor:IViewCursor = e.target as IViewCursor;
			var b:Boolean = queryTrigger != null? 
				queryTrigger(cursor) : defaultQueryTrigger(cursor);
			if(b)
				queryNextPage();
		}
		
		public function queryNextPage():void
		{
			if(_criteria == null)
				_criteria = new DbCriteria;
			if(_pagination != null)
			{
				_criteria.pagination = {};
				if(_pagination.hasOwnProperty('perPage'))
					_criteria.pagination['perPage'] = _pagination['perPage'];
				if(_pagination.hasOwnProperty('currentPage'))
					_criteria.pagination['page'] = int(_pagination['currentPage']) + 1;
			}
			service.activeQuery(this);
		}
		
		public function result(data:Object):void
		{
			if(data is ResultEvent)
			{
				var r:Object = ResultEvent(data).result;
				var pr:PaginationResult = data as PaginationResult;
				for each(var o:Object in pr.items)
				{
					this.addItem(o);
				}
				_pagination = pr.meta;
			}
		}
		
		/**
		 * Constructor 
		 * @param service
		 * 
		 */
		public function ActiveDataProvider(service:ActiveService,
										   criteria:Object)
		{
			super(source);
			_service = service;
			if(criteria != null)
			{
				if(criteria.hasOwnProperty('pagination'))
					_pagination = criteria['pagination'];
				if(criteria.hasOwnProperty('criteria'))
					_criteria = new DbCriteria(criteria['criteria']);
				else
					_criteria = new DbCriteria(criteria);
			}
		}
	}
}