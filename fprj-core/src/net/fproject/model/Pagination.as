package net.fproject.model
{
	/**
	 * 
	 * The Pagination class represents the model for receiving RPC result with pagination.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class Pagination
	{
		/**
		 * Current page items
		 */
		public var items:Array;
		
		/**
		 * The <code>links</code> object contains URL to current page, next page and last page,
		 * which is in a format like following example:
		 * <pre>
		 *	{
		 *		self : {"href":"http://rest.f-project.net/projects?page=2&per-page=5"},
		 * 		next : {"href":"http://rest.f-project.net/projects?page=3&per-page=5"},
		 * 		last : {"href":"http://rest.f-project.net/projects?page=6&per-page=5"}
		 *	}<pre>
		 */
		public var links:Object;
		
		/**
		 * The <code>meta</code> object contains totalCount, pageCount, currentPage and perPage information,
		 * which is in a format like following example:
		 * <pre>
		 *	{
		 *		totalCount:29, pageCount:6, currentPage:2, perPage:5
		 *	}<pre>
		 */
		public var meta:Object;
	}
}