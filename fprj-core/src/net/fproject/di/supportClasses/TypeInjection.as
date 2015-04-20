///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di.supportClasses
{
	import org.as3commons.lang.ClassUtils;

	public class TypeInjection
	{
		private var _constructorFields:Array = [];
		private var _fields:Object = {};
		private var _methods:Object = {};

		public function addConstructorField(injectionDetails:FieldInjection):void
		{
			_constructorFields.push(injectionDetails);
		}

		public function getConstructorFields():Array
		{
			return _constructorFields;
		}

		public function addField(fieldName:String, injectionDetails:FieldInjection):void
		{
			_fields[fieldName] = injectionDetails;
		}
		
		public function getFieldNames():Array
		{
			const result:Array = [];
			for (var fieldName:String in _fields)
			{
				result.push(fieldName);
			}
			return result;
		}
		
		public function getField(fieldName:String):FieldInjection
		{
			return _fields[fieldName];
		}

		public function addMethod(methodName:String, injectionDetails:FieldInjection):void
		{
			_methods[methodName] ||= [];
			(_methods[methodName] as Array).push(injectionDetails);
		}		
		
		public function getMethodsNames():Array
		{
			const result:Array = [];
			for (var methodName:String in _methods)
			{
				result.push(methodName);
			}
			return result;
		}
		
		public function getMethod(methodName:String):Array
		{
			return _methods[methodName];
		}
		
		public function injectFields(source:Object, target:*, fieldInjectionToValueFunction:Function):void
		{
			for (var fieldName:String in _fields)
			{
				target[fieldName] = fieldInjectionToValueFunction(source, _fields[fieldName]);
			}
		}

		public function injectMethods(source:Object, target:*, fieldInjectionToValueFunction:Function):void
		{
			for (var methodName:String in _methods)
			{
				const values:Array = [];
				var methodInjections:Array = _methods[methodName];
				for each (var injection:FieldInjection in methodInjections)
				{
					values.push(fieldInjectionToValueFunction(source, injection));
				}
				(target[methodName] as Function).apply(null, values);
			}
		}
		
		public function fetchConstructorArgs(source:Object, fieldInjectionToValueFunction:Function):Array
		{
			const result:Array = [];
			for (var i:uint = 0; i < _constructorFields.length; i++)
			{
				result.push(fieldInjectionToValueFunction(source, _constructorFields[i]));
			}
			return result;
		}
		
		public function instantiate(source:Object, targetType:Class, fieldInjectionToValueFunction:Function):*
		{
			return ClassUtils.newInstance(targetType, this.fetchConstructorArgs(source, fieldInjectionToValueFunction));
		}
	}
}
