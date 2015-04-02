package net.fproject.model
{
	import net.fproject.serialize.Deserializer;

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
		
		public static function fromJSON(json:Object, modelClass:*):Pagination
		{
			if(json.hasOwnProperty("items") && json.hasOwnProperty("_links") && json.hasOwnProperty("_meta"))
			{
				var pagination:Pagination = new Pagination;
				pagination.items = Deserializer.getInstance().fromJSON(json.items, modelClass) as Array;
				pagination.links = json._links;
				pagination.meta = json._meta;
				var decodedResult:Object = pagination;
			}
			return pagination;
		}
	}
}