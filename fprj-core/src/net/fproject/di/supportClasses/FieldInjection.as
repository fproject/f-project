///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di.supportClasses
{
	/**
	 * 
	 * FieldInjection represents injection information for a field of an object.
	 * 
	 * @author Bui Sy Nguyen.
	 * 
	 */
	public class FieldInjection
	{
		private var _fieldName : String;
		private var _type : Class;
		private var _required : Boolean;
		private var _arrayTypeHint : Class;
		
		/**
		 * Constructor 
		 * @param fieldName
		 * @param type
		 * @param required
		 * @param arrayTypeHint
		 * 
		 */
		public function FieldInjection(fieldName : String, type : Class, required : Boolean, arrayTypeHint : Class)
		{
			_fieldName = fieldName;
			_type = type;
			_required = required;
			_arrayTypeHint = arrayTypeHint;
		}
		
		/**
		 * 
		 * The field name
		 * 
		 */
		public function get name() : String
		{
			return _fieldName;
		}

		/**
		 * 
		 * The field type
		 * 
		 */
		public function get type() : Class
		{
			return _type;
		}
		
		/**
		 * 
		 * Indicates that the field input is mandatory when constructing object
		 * 
		 */
		public function get isRequired() : Boolean
		{
			return _required;
		}

		/**
		 * 
		 * Returns a string representation of the field information. 
		 * 
		 */
		public function toString() : String
		{
			var result : String = _fieldName + "<" + type + ">";
			if (arrayTypeHint) {
				result += "->" + arrayTypeHint;
			}
			return result;
		}

		/**
		 * 
		 * The array type hint
		 * 
		 */
		public function get arrayTypeHint() : Class
		{
			return _arrayTypeHint;
		}
	}
}
