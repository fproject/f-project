package net.fproject.active
{
	public interface IActiveDataProvider
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
	}
}