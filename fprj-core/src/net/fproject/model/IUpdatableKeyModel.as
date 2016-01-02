package net.fproject.model
{
	public interface IUpdatableKeyModel
	{
		/**
		 * 
		 * The composite key 
		 * 
		 */
		function get key():Object;
		
		/**
		 * Returns the old primary key value.
		 * This refers to the primary key value that is populated from the active record
		 * after executing a find method (e.g. find(), findOne()).
		 * The value remains unchanged even if the primary key attribute is manually assigned with a different value.
		 * @return mixed the old primary key value. This is a standard object in the form
		 * {columnName:columnValue,...) is returned if the primary key is composite.
		 * If primary key is not defined, null will be returned.
		 */
		function get oldKey():Object;
		/**
		 * 
		 * @private
		 * 
		 */
		function set oldKey(value:Object):void;
	}
}