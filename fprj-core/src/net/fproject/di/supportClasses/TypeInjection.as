///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di.supportClasses
{
	public class TypeInjection
	{
		private var _constructorFields : Array = [];
		private var _fields : Object = {};
		private var _methods : Object = {};

		public function addConstructorField(injectionDetails : FieldInjection) : void
		{
			_constructorFields.push(injectionDetails);
		}

		public function getConstructorFields() : Array
		{
			return _constructorFields;
		}

		public function addField(fieldName : String, injectionDetails : FieldInjection) : void
		{
			_fields[fieldName] = injectionDetails;
		}
		
		public function getFieldNames() : Array
		{
			const result : Array = [];
			for (var fieldName : String in _fields)
			{
				result.push(fieldName);
			}
			return result;
		}
		
		public function getField(fieldName : String) : FieldInjection
		{
			return _fields[fieldName];
		}

		public function addMethod(methodName : String, injectionDetails : FieldInjection) : void
		{
			_methods[methodName] ||= [];
			(_methods[methodName] as Array).push(injectionDetails);
		}		
		
		public function getMethodsNames() : Array
		{
			const result : Array = [];
			for (var methodName : String in _methods)
			{
				result.push(methodName);
			}
			return result;
		}
		
		public function getMethod(methodName : String) : Array
		{
			return _methods[methodName];
		}
	}
}
