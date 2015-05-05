package net.fproject.active
{
	import flash.events.IEventDispatcher;

	public interface IActiveDataProvider extends IEventDispatcher
	{
		/**
		 * 
		 * The current querying criteria
		 * 
		 */
		function get criteria():DbCriteria;
		
		/**
		 * 
		 * Set the active service used to retreive remote data
		 * 
		 */
		function setService(value:ActiveService):void;
		
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