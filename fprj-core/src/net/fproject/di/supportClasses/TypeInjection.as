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

	/**
	 * TypeInjection is used to inject property of a class.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class TypeInjection
	{
		private var _constructorFields:Array = [];
		private var _fields:Object = {};
		private var _methods:Object = {};

		/**
		 * Add fields used for parameters of constructor of injecting class
		 * @param injectionDetails
		 * 
		 */
		public function addConstructorField(injectionDetails:FieldInjection):void
		{
			_constructorFields.push(injectionDetails);
		}

		/**
		 * 
		 * Get fields used for parameters of constructor of injecting class
		 * 
		 */
		public function getConstructorFields():Array
		{
			return _constructorFields;
		}

		/**
		 * 
		 * Add a field.
		 * 
		 * @param fieldName
		 * @param fieldInjection
		 * 
		 */
		public function addField(fieldName:String, fieldInjection:FieldInjection):void
		{
			_fields[fieldName] = fieldInjection;
		}
		
		/**
		 * 
		 * Add a method.
		 * 
		 * @param methodName
		 * @param fieldInjection
		 * 
		 */
		public function addMethod(methodName:String, fieldInjection:FieldInjection):void
		{
			_methods[methodName] ||= [];
			(_methods[methodName] as Array).push(fieldInjection);
		}		
		
		/**
		 * 
		 * Inject fields
		 * 
		 * @param source
		 * @param target
		 * @param fieldInjectionToValueFunction
		 * 
		 */
		public function injectFields(source:Object, target:*, fieldInjectionToValueFunction:Function):void
		{
			for (var fieldName:String in _fields)
			{
				target[fieldName] = fieldInjectionToValueFunction(source, _fields[fieldName]);
			}
		}

		/**
		 * 
		 * Inject methods.
		 * 
		 * @param source
		 * @param target
		 * @param fieldInjectionToValueFunction
		 * 
		 */
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
				target[methodName](values);
			}
		}
		
		/**
		 * 
		 * Fetch constructor arguments.
		 * 
		 * @param source
		 * @param fieldInjectionToValueFunction
		 * 
		 * @return an array of constructor arguments
		 * 
		 */
		public function fetchConstructorArgs(source:Object, fieldInjectionToValueFunction:Function):Array
		{
			const result:Array = [];
			for (var i:uint = 0; i < _constructorFields.length; i++)
			{
				result.push(fieldInjectionToValueFunction(source, _constructorFields[i]));
			}
			return result;
		}
		
		/**
		 * Instantiate a class 
		 * @param source
		 * @param targetType
		 * @param fieldInjectionToValueFunction
		 * @return 
		 * 
		 */
		public function instantiate(source:Object, targetType:Class, fieldInjectionToValueFunction:Function):*
		{
			return ClassUtils.newInstance(targetType, this.fetchConstructorArgs(source, fieldInjectionToValueFunction));
		}
	}
}
