///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.active
{
	/**
	 * DbCriteria represents a DB query criteria, such as conditions, ordering by, limit/offset.
	 *
	 * <pre>
	 * criteria=new DbCriteria();
	 * criteria.condition = '&#64;findActiveUsersByProjects';
	 * criteria.params[':status'] = Post.STATUS_ACTIVE;
	 * criteria.params[':projectIds'] = [1,2,3,4,5,6];
	 *
	 * posts = UserService.getInstance().find(criteria);
	 * </pre>
	 *
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class DbCriteria
	{
		/**
		 * 
		 * Constructor.
		 * 
		 * @param source the source object that contains values to construct the new DbCriteria object
		 * 
		 */
		public function DbCriteria(source:Object=null)
		{
			if(source != null)
			{
				for(var s:String in source)
				{
					if(this.hasOwnProperty(s))
						this[s] = source[s];
				}
			}			
		}
		
		/**
		 * Whether to select distinct rows of data only. If this is set true,
		 * the SELECT clause would be changed to SELECT DISTINCT.
		 */
		public var distinct:Boolean=false;
		
		/**
		 * The key to get query condition.
		 * At server side, this key is used to retrieve the WHERE clause in an SQL statement.
		 * For example, '&#64;findByUserExpand'.
		 */
		public var condition:String='';
		
		/**
		 * List of query parameter values indexed by parameter placeholders.
		 * For example, <code>{':name' : 'Dan', ':age' : 31}</code>.
		 */
		public var params:Object={};
		
		/**
		 * The pagination information, for example: <code>{page : 3, perPage : 10}</code>.
		 */
		public var pagination:Object = null;
		
		/**
		 * How to sort the query results. This field is used to generate the ORDER BY clause in an SQL statement.
		 * For example, 'userName,-birthDay' will sort by userName ASC and then birthDay DESC
		 */
		public var sort:String='';
		
		/**
		 * List of relations that neet to load together with result.
		 * This can be an array or a string of relations separated by ','
		 * For example, <code>['userProfile','tasks']</code> or <code>'userProfile,tasks'</code>.
		 */
		public var expand:Object;
	}
}