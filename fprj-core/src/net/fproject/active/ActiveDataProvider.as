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
package net.fproject.active
{
	import mx.collections.IViewCursor;
	
	import net.fproject.active.supportClasses.ActiveDataProviderHandler;
	import net.fproject.collection.AdvancedArrayCollection;
	
	/**
	 * Dispatched when the paginationResult has changed.
	 *
	 * @eventType flash.events.Event.CHANGE
	 * 
	 */
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 * ActiveDataProvider class extends <code>AdvancedArrayCollection</code> class
	 * and implements a data provider based on ActiveService.
	 *
	 * ActiveDataProvider provides data in terms of model objects which are
	 * of class <code>modelClass</code> from a ActiveService.
	 * It uses the ActiveService <code>find</code> method to retrieve remote data
	 * with automatic pagination.
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
		private var _handler:ActiveDataProviderHandler;
		
		/**
		 * 
		 * The handler instance.
		 * 
		 */
		public function get handler():ActiveDataProviderHandler
		{
			return _handler;
		}

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
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setCriteria(value:DbCriteria):void
		{
			_criteria = value;
		}
		
		private var _paginationResult:PaginationResult;

		[Bindable('propertyChange')]
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function get paginationResult():PaginationResult
		{
			return _paginationResult;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setPaginationResult(value:PaginationResult):void
		{
			_paginationResult = value;
		}

		private var _service:ActiveService;

		/**
		 * 
		 * @inheritDoc
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

		private var _queryTrigger:Function;

		/**
		 * A function that return a Boolean indicates whether we need to query next page.
		 * This function is called every time the IViewCursor of this collection is updated.
		 * It must have only one parameter that is the IViewCursor itself,
		 * <pre>function myQueryTrigger(cursor:IViewCursor):Boolean</pre>
		 * 
		 * By default, the <code>ActiveDataProviderHandler.defaultQueryTrigger</code> method will be used.
		 * 
		 * @see ActiveDataProviderHandler.defaultQueryTrigger()
		 */
		public function get queryTrigger():Function
		{
			return _queryTrigger;
		}

		/**
		 * @private
		 */
		public function set queryTrigger(value:Function):void
		{
			_queryTrigger = value;
		}

		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override public function createCursor():IViewCursor
		{
			return handler.attachViewCursor(super.createCursor());
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override public function getItemAt(index:int, prefetch:int = 0):Object
		{
			var o:Object = super.getItemAt(index, prefetch);
			handler.checkCursorByIndex(index, this.length);
			return o;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function fetchNextPage():ActiveCallResponder
		{
			return handler.fetchNextPage();
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function fetchFirstPage():ActiveCallResponder
		{
			return handler.fetchFirstPage();
		}
		
		private var _paginationResultHandler:Function;

		/**
		 * The call back function that called when new page is received after last 
		 * service method invocation.
		 * This must have following signature:
		 * <pre>function myPaginationResultHandler(p:PaginationResult):void</pre>
		 * 
		 * By default, the <code>ActiveDataProviderHandler.defaultPaginationResultHandler</code> method will be used.
		 * 
		 * @see ActiveDataProviderHandler.defaultPaginationResultHandler()
		 */
		public function get paginationResultHandler():Function
		{
			return _paginationResultHandler;
		}

		/**
		 * @private
		 */
		public function set paginationResultHandler(value:Function):void
		{
			_paginationResultHandler = value;
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		public function result(data:Object):void
		{
			handler.result(data);
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		public function fault(data:Object):void
		{
			handler.fault(data);
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		public function setSource(value:Object):void
		{
			this.source = value as Array;
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
			super();
			_service = service;
			
			_handler = new ActiveDataProviderHandler(this);
			
			_criteria = handler.parseCriteria(criteria);			
		}
	}
}