///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.db
{
	import net.fproject.utils.StringUtil;

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
		
		private static const PARAM_PREFIX:String = ':cp';
		
		/**
		 * the global counter for anonymous binding parameters.
		 * This counter is used for generating the name for the anonymous parameters.
		 */
		public static var paramCount:int=0;
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
		
		/**
		 * Appends a condition to the existing condition.
		 * The new condition and the existing condition will be concatenated via the specified operator
		 * which defaults to 'AND'.
		 * The new condition can also be an array. In this case, all elements in the array
		 * will be concatenated together via the operator.
		 * This method handles the case when the existing condition is empty.
		 * After calling this method, the condition property will be modified.
		 * @param mixed condition the new condition. It can be either a string or an array of strings.
		 * @param string operator the operator to join different conditions. Defaults to 'AND'.
		 * @return static the criteria object itself
		 */
		public function addCondition(condition:String, operator:String='AND'):DbCriteria
		{
			if(StringUtil.isBlank(this.condition))
				this.condition = condition;
			else
				this.condition = '(' + this.condition + ') ' + operator + ' (' + condition + ')';
			return this;
		}
		
		/**
		 * Appends a search condition to the existing condition.
		 * The search condition and the existing condition will be concatenated via the specified operator
		 * which defaults to 'AND'.
		 * The search condition is generated using the SQL LIKE operator with the given column name and
		 * search keyword.
		 * @param string column the column name (or a valid SQL expression)
		 * @param string keyword the search keyword. This interpretation of the keyword is affected by the next parameter.
		 * @param boolean escape whether the keyword should be escaped if it contains characters % or _.
		 * When this parameter is true (default), the special characters % (matches 0 or more characters)
		 * and _ (matches a single character) will be escaped, and the keyword will be surrounded with a %
		 * character on both ends. When this parameter is false, the keyword will be directly used for
		 * matching without any change.
		 * @param string operator the operator used to concatenate the new condition with the existing one.
		 * Defaults to 'AND'.
		 * @param string like the LIKE operator. Defaults to 'LIKE'. You may also set this to be 'NOT LIKE'.
		 * @return static the criteria object itself
		 */
		public function addSearchCondition(column:String, keyword:String,
										   escape:Boolean=true, operator:String='AND', like:String='LIKE'):DbCriteria
		{
			if(StringUtil.isBlank(keyword))
				return this;
			if(escape)
			{
				keyword = keyword.replace('%', '\%');
				keyword = keyword.replace('_', '\_');
				keyword = '%' + keyword.replace('\\', '\\\\') + '%';
			}
			var condition:String = column + " like " + PARAM_PREFIX + paramCount;
			this.params[PARAM_PREFIX + (paramCount++)] = keyword;
			return this.addCondition(condition, operator);
		}
		
		/**
		 * Appends an IN condition to the existing condition.
		 * The IN condition and the existing condition will be concatenated via the specified operator
		 * which defaults to 'AND'.
		 * The IN condition is generated by using the SQL IN operator which requires the specified
		 * column value to be among the given list of values.
		 * @param string column the column name (or a valid SQL expression)
		 * @param array values list of values that the column value should be in
		 * @param string operator the operator used to concatenate the new condition with the existing one.
		 * Defaults to 'AND'.
		 * @return static the criteria object itself
		 */
		public function addInCondition(column:String, values:Array, operator:String='AND'):DbCriteria
		{
			if(values.length < 1)
				return this.addCondition('0=1', operator);
			else
				return addInConditionImpl(column, values, operator, [' IS NULL', '=', ' IN (']);
		}
		
		/**
		 * Appends an NOT IN condition to the existing condition.
		 * The NOT IN condition and the existing condition will be concatenated via the specified operator
		 * which defaults to 'AND'.
		 * The NOT IN condition is generated by using the SQL NOT IN operator which requires the specified
		 * column value to be among the given list of values.
		 * @param string column the column name (or a valid SQL expression)
		 * @param array values list of values that the column value should not be in
		 * @param string operator the operator used to concatenate the new condition with the existing one.
		 * Defaults to 'AND'.
		 * @return static the criteria object itself
		 */
		public function addNotInCondition(column:String, values:Array, operator:String='AND'):DbCriteria
		{
			if(values.length < 1)
				return this;
			else
				return addInConditionImpl(column, values, operator, [' IS NOT NULL', '!=', ' NOT IN (']);
		}
		
		private function addInConditionImpl(column:String, values:Array, operator:String, keys:Array):DbCriteria
		{
			if(values.length == 1)
			{
				if(values[0] == null)
					var condition:String = column + keys[0];
				else
				{
					condition = column + keys[1] + PARAM_PREFIX + paramCount;
					this.params[PARAM_PREFIX + (paramCount++)] = values[0];
				}
			}
			else
			{
				var params:Array = [];
				for each(var value:Object in values)
				{
					params.push(PARAM_PREFIX + paramCount);
					this.params[PARAM_PREFIX + (paramCount)++] = value;
				}
				condition = column + keys[2] + params.join(', ') + ')';
			}
			return this.addCondition(condition, operator);
		}
		
		
		/**
		 * Appends a condition for matching the given list of column values.
		 * The generated condition will be concatenated to the existing condition
		 * via the specified operator which defaults to 'AND'.
		 * The condition is generated by matching each column and the corresponding value.
		 * @param array columns list of column names and values to be matched (name=>value)
		 * @param string columnOperator the operator to concatenate multiple column matching condition. Defaults to 'AND'.
		 * @param string operator the operator used to concatenate the new condition with the existing one.
		 * Defaults to 'AND'.
		 * @return static the criteria object itself
		 */
		public function addColumnCondition(columns:Object, columnOperator:String='AND', operator:String='AND'):DbCriteria
		{
			var params:Array = [];
			for(var name:String in columns)
			{
				var value:Object = columns[name];
				if(value == null)
					params.push(name + ' IS NULL');
				else
				{
					params.push(name + '=' + PARAM_PREFIX + paramCount);
					this.params[PARAM_PREFIX + (paramCount++)] = value;
				}
			}
			return this.addCondition(params.join(" " + columnOperator + " "), operator);
		}
		
		/**
		 * Adds a comparison expression to the condition property.
		 *
		 * This method is a helper that appends to the condition property
		 * with a new comparison expression. The comparison is done by comparing a column
		 * with the given value using some comparison operator.
		 *
		 * The comparison operator is intelligently determined based on the first few
		 * characters in the given value. In particular, it recognizes the following operators
		 * if they appear as the leading characters in the given value:
		 * <ul>
		 * <li><code>&lt;</code>: the column must be less than the given value.</li>
		 * <li><code>&gt;</code>: the column must be greater than the given value.</li>
		 * <li><code>&lt;=</code>: the column must be less than or equal to the given value.</li>
		 * <li><code>&gt;=</code>: the column must be greater than or equal to the given value.</li>
		 * <li><code>&lt;&gt;</code>: the column must not be the same as the given value.
		 * Note that when partialMatch is true, this would mean the value must not be a substring
		 * of the column.</li>
		 * <li><code>=</code>: the column must be equal to the given value.</li>
		 * <li>none of the above: the column must be equal to the given value. Note that when partialMatch
		 * is true, this would mean the value must be the same as the given value or be a substring of it.</li>
		 * </ul>
		 *
		 * Note that any surrounding white spaces will be removed from the value before comparison.
		 * When the value is empty, no comparison expression will be added to the search condition.
		 *
		 * @param string column the name of the column to be searched
		 * @param mixed value the column value to be compared with. If the value is a string, the aforementioned
		 * intelligent comparison will be conducted. If the value is an array, the comparison is done
		 * by exact match of any of the value in the array. If the string or the array is empty,
		 * the existing search condition will not be modified.
		 * @param boolean partialMatch whether the value should consider partial text match (using LIKE and NOT LIKE operators).
		 * Defaults to false, meaning exact comparison.
		 * @param string operator the operator used to concatenate the new condition with the existing one.
		 * Defaults to 'AND'.
		 * @param boolean escape whether the value should be escaped if partialMatch is true and
		 * the value contains characters % or _. When this parameter is true (default),
		 * the special characters % (matches 0 or more characters)
		 * and _ (matches a single character) will be escaped, and the value will be surrounded with a %
		 * character on both ends. When this parameter is false, the value will be directly used for
		 * matching without any change.
		 * @return static the criteria object itself
		 */
		public function compare(column:String, value:*,
								partialMatch:Boolean=false, operator:String='AND', escape:Boolean=true):DbCriteria
		{
			if(value == null)
				return this;
			if(value is Array)
			{
				if(value == [])
					return this;
				return this.addInCondition(column, value, operator);
			}
			else
				var sValue:String = String(value);
			if(StringUtil.isBlank(sValue))
				return this;
			
			var matches:Array = sValue.match(/^(?:\s*(<>|<=|>=|<|>|=))?(.*)/g);
			if(matches.length > 1)
			{
				sValue = matches[1];
				var op:String = matches[0];
			}
			else
				op = '';
			
			if(StringUtil.isBlank(sValue))
				return this;
			
			if(partialMatch)
			{
				if(StringUtil.isBlank(op))
					return this.addSearchCondition(column, sValue, escape, operator);
				if(op == '<>')
					return this.addSearchCondition(column, sValue, escape, operator, 'NOT LIKE');
			}
			else if(StringUtil.isBlank(op))
				op = '=';
			
			this.addCondition(column + op + PARAM_PREFIX + paramCount, operator);
			this.params[PARAM_PREFIX + (paramCount++)] = sValue;
			
			return this;
		}
		
		/**
		 * Adds a between condition to the condition property.
		 *
		 * The new between condition and the existing condition will be concatenated via
		 * the specified operator which defaults to 'AND'.
		 * If one or both values are empty then the condition is not added to the existing condition.
		 * This method handles the case when the existing condition is empty.
		 * After calling this method, the condition property will be modified.
		 * @param string column the name of the column to search between.
		 * @param string valueStart the beginning value to start the between search.
		 * @param string valueEnd the ending value to end the between search.
		 * @param string operator the operator used to concatenate the new condition with the existing one.
		 * Defaults to 'AND'.
		 * @return static the criteria object itself
		 */
		public function addBetweenCondition(column:String, valueStart:String, valueEnd:String, operator:String='AND'):DbCriteria
		{
			if(StringUtil.isBlank(valueStart) || StringUtil.isBlank(valueEnd))
				return this;
			
			var paramStart:String = PARAM_PREFIX + (paramCount++);
			var paramEnd:String = PARAM_PREFIX + (paramCount++);
			this.params[paramStart] = valueStart;
			this.params[paramEnd] = valueEnd;
			
			var condition:String = column + " BETWEEN " + paramStart + " AND " + paramEnd;
			
			return this.addCondition(condition, operator);
		}
	}
}