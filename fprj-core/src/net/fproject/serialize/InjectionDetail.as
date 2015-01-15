///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.serialize
{
	internal class InjectionDetail
	{
		private var _fieldName : String;
		private var _type : Class;
		private var _required : Boolean;
		private var _arrayTypeHint : Class;
		
		public function InjectionDetail(fieldName : String, type : Class, required : Boolean, arrayTypeHint : Class) {
			_fieldName = fieldName;
			_type = type;
			_required = required;
			_arrayTypeHint = arrayTypeHint;
		}
		
		public function get name() : String {
			return _fieldName;
		}

		public function get type() : Class
		{
			return _type;
		}
		
		public function get isRequired() : Boolean
		{
			return _required;
		}

		public function toString() : String
		{
			var result : String = _fieldName + "<" + type + ">";
			if (arrayTypeHint) {
				result += "->" + arrayTypeHint;
			}
			return result;
		}

		public function get arrayTypeHint() : Class
		{
			return _arrayTypeHint;
		}
	}
}
