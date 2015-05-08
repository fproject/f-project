package net.fproject.active
{
	import flash.events.IEventDispatcher;

	/**
	 * IActiveDataProvider interface dedines a common set of methods used for active data providers.
	 *  
	 * @author Bui Sy Nguyen
	 * 
	 * @see net.fproject.active.ActiveDataProvider
	 * @see net.fproject.active.ActiveHierarchicalDataProvider
	 * 
	 */
	public interface IActiveDataProvider extends IEventDispatcher
	{
		/**
		 * Set the source data.
		 * 
		 * The IActiveDataProvider object does not represent any changes that you make
		 * directly to the source object. Always use
		 * the ICollectionView, IHierarchicalCollectionView or IList methods to modify the collection.
		 * 
		 * @see net.fproject.active.IActiveDataProvider.source
		 * @see net.fproject.active.IActiveDataProvider.source
		 */
		function setSource(value:Object):void;
			
		/**
		 * 
		 * The current querying criteria
		 * 
		 */
		function get criteria():DbCriteria;
		
		/**
		 * 
		 * Set the criteria object
		 * 
		 */
		function setCriteria(value:DbCriteria):void;
			
		/**
		 * A function that return a Boolean indicates whether we need to query next page.
		 * This function is called every time the IViewCursor of this collection is updated.
		 * It must have only one parameter that is the IViewCursor itself,
		 * <pre>function myQueryTrigger(cursor:IViewCursor):Boolean</pre>
		 * 
		 */
		function get queryTrigger():Function;
		
		/**
		 * 
		 * The active service used to retreive remote data
		 * 
		 */
		function get service():ActiveService;
			
		/**
		 * 
		 * Set the active service used to retreive remote data
		 * 
		 */
		function setService(value:ActiveService):void;
		
		[Bindable('propertyChange')]
		/**
		 * 
		 * The last pagination result
		 * 
		 */
		function get paginationResult():PaginationResult;
			
		/**
		 * 
		 * Set the last pagination result by remote data
		 * 
		 */
		function setPaginationResult(value:PaginationResult):void;
		
		/**
		 * The call back function that called when new page is received after last 
		 * service method invocation.
		 * This must have following signature:
		 * <pre>function myPaginationResultHandler(p:PaginationResult):void</pre>
		 * 
		 */
		function get paginationResultHandler():Function;
			
		/**
		 * Process success result from remote call 
		 * @param data the result, normally a ResultEvent instance
		 * 
		 */
		function result(data:Object):void;
		
		/**
		 * Process failure return data from remote call 
		 * @param data the result, normally a FaultEvent instance
		 * 
		 */
		function fault(data:Object):void;
		
		/**
		 * 
		 * Fetch data of first page and reset result set to first page data.
		 * 
		 * @return an ActiveCallResponder instance
		 * 
		 */
		function fetchFirstPage():ActiveCallResponder;
			
		/**
		 * 
		 * Fetch data of next page and merge result in to current result set.
		 * 
		 * @return an ActiveCallResponder instance
		 * 
		 */
		function fetchNextPage():ActiveCallResponder;
	}
}