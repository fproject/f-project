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
	import net.fproject.serialize.Deserializer;

	[RemoteClass(alias="FPaginationResult")]
	/**
	 * 
	 * The Pagination class represents the model for receiving RPC result with pagination.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class PaginationResult
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
		
		[Transient]
		/**
		 * Total number of items.
		 */
		public function get totalCount():Number
		{
			return getPagingResult('totalCount');
		}
		
		[Transient]
		/**
		 * The current page index.
		 */
		public function get currentPage():Number
		{
			return getPagingResult('currentPage');
		}
		
		[Transient]
		
		/**
		 * The number of pages 
		 */
		public function get pageCount():Number
		{
			return getPagingResult('pageCount');
		}
		
		[Transient]
		/**
		 * The number of items per page. The returned value of this field is less than 1,
		 * it means the page size is infinite, and thus a single page contains all items.
		 */
		public function get perPage():Number
		{
			return getPagingResult('perPage');
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function getPagingResult(key:String):Number
		{
			return meta != null && meta.hasOwnProperty(key) ? meta[key] : NaN;
		}
		
		/**
		 * Instantiate from JSON data of remote call result.
		 * @param json the JSON data of remote call result.
		 * @param modelClass the model class for strong typed deserialization
		 * @return a new instance of PaginationResult from JSON remote result
		 * 
		 */
		public static function fromJSON(json:Object, modelClass:*):PaginationResult
		{
			if(json.hasOwnProperty("items") && json.hasOwnProperty("_links") && json.hasOwnProperty("_meta"))
			{
				var pagination:PaginationResult = new PaginationResult;
				pagination.items = Deserializer.getInstance().fromJSON(json.items, modelClass) as Array;
				pagination.links = json._links;
				pagination.meta = json._meta;
				var decodedResult:Object = pagination;
			}
			return pagination;
		}
	}
}