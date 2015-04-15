///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.db
{
	/**
	 * DbCriteria represents a DB query criteria, such as conditions, ordering by, limit/offset.
	 *
	 * criteria=new DbCriteria();
	 * criteria.compare('status', Post.STATUS_ACTIVE);
	 * criteria.addInCondition('id',[1,2,3,4,5,6]);
	 *
	 * posts = PostService.getInstance().findAll(criteria);
	 *
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class DbCriteria
	{
		public function DbCriteria(source:Object=null)
		{
			if(source != null)
			{
				for(var s:String in source)
				{
					this[s] = source[s];
				}
			}			
		}
		
		/**
		 * the columns being selected. This refers to the SELECT clause in an SQL
		 * statement. The property can be either a string (column names separated by commas)
		 * or an array of column names. Defaults to '*', meaning all columns.
		 */
		public var select:String='*';
		/**
		 * whether to select distinct rows of data only. If this is set true,
		 * the SELECT clause would be changed to SELECT DISTINCT.
		 */
		public var distinct:Boolean=false;
		/**
		 * query condition. This refers to the WHERE clause in an SQL statement.
		 * For example, <code>age>31 AND team=1</code>.
		 */
		public var condition:String='';
		/**
		 * list of query parameter values indexed by parameter placeholders.
		 * For example, <code>{':name'=>'Dan', ':age'=>31}</code>.
		 */
		public var params:Object={};
		/**
		 * maximum number of records to be returned. If less than 0, it means no limit.
		 */
		public var limit:Number=-1;
		/**
		 * zero-based offset from where the records are to be returned. If less than 0, it means starting from the beginning.
		 */
		public var offset:Number=-1;
		/**
		 * how to sort the query results. This refers to the ORDER BY clause in an SQL statement.
		 */
		public var order:String='';
		/**
		 * how to group the query results. This refers to the GROUP BY clause in an SQL statement.
		 * For example, <code>'projectID, teamID'</code>.
		 */
		public var group:String='';
		/**
		 * how to join with other tables. This refers to the JOIN clause in an SQL statement.
		 * For example, <code>'LEFT JOIN users ON users.id=authorID'</code>.
		 */
		public var join:String='';
		/**
		 * the condition to be applied with GROUP-BY clause.
		 * For example, <code>'SUM(revenue)<50000'</code>.
		 */
		public var having:String='';
		
		/**
		 * the alias name of the table. If not set, it means the alias is 't'.
		 */
		public var alias:String;
	}
}