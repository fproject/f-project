///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.serialize
{
	import flash.net.getClassByAlias;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import net.fproject.fproject_internal;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.ResourceUtil;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.lang.ClassUtils;
	import org.as3commons.reflect.Accessor;
	import org.as3commons.reflect.Field;
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.MetadataArgument;
	import org.as3commons.reflect.Method;
	import org.as3commons.reflect.Parameter;
	import org.as3commons.reflect.Type;
	import org.as3commons.reflect.Variable;
	import net.fproject.di.supportClasses.TypeInjection;
	import net.fproject.di.supportClasses.FieldInjection;
	
	/**
	 * 
	 * The Deserializer class is used to deserialize AS3 objects from JSON string and other data formats
	 * 
	 */
	public class Deserializer
	{
		private static var _instance:Deserializer;
		
		/**
		 * 
		 * Singleton method
		 * 
		 */
		public static function getInstance():Deserializer
		{
			if(_instance == null)
			{
				_instance = new Deserializer;
				_instance.dateParseFunction = DateTimeUtil.parseIsoDate;
			}
			return _instance;
		}
		
		private static const MARSHALL:String = "Marshall";
		private static const FIELD_KEY:String = "field";
		private static const TYPE_KEY:String = "type";
		
		private var typeInjectionCache:Dictionary = new Dictionary;
		
		/**
		 * The callback function to parse date-time string.
		 * This function must have one parameter in type of String and return Date object:
		 * <pre>function myDateParse(s:String):Date</pre> 
		 * 
		 * @default net.fproject.utils.DateTimeUtil.parseIsoDate
		 */
		public var dateParseFunction:Function;
		
		/**
		 * Attempts to extract properties from the supplied source object into an instance of the supplied targetType.
		 * 
		 * @param source		Object which contains properties that you wish to transfer to a new instance of the 
		 * 						supplied targetType Class.
		 * @param targetType	The target Class of which an instance will be returned.
		 * @return				An instance of the supplied targetType containing all the properties extracted from
		 * 						the supplied source object.
		 */
		private function extract(source:Object, targetType:Class):*
		{
			// Catch the case where we've been asked to extract a value which is already of the intended targetType;
			// this can often happen when Vanilla is recursing, in which case there is nothing to do.
			if (source is targetType)
				return source;
			var typeInjection:TypeInjection;
			
			if (!(typeInjection = typeInjectionCache[targetType]))
			{
				typeInjection = typeInjectionCache[targetType] = new TypeInjection;
				addReflectedRules(typeInjection, targetType, Type.forClass(targetType));
			}
			
			// Create a new isntance of the targetType; and then inject the values from the source object into it
			const target:* = typeInjection.instantiate(source, targetType, extractValue);
			typeInjection.injectFields(source, target, extractValue);
			typeInjection.injectMethods(source, target, extractValue);
			
			return target;
		}

		private function isSimple(object:Object):Boolean
		{
			switch (typeof(object))
			{
				case "number":
				case "string":
				case "boolean":
					return true;
				case "object":
					return (object is Date) || (object is Array);
			}
			
			return false;
		}
		
		private function extractValue(source:Object, fieldInjection:FieldInjection):*
		{
			// Is this a required injection?
			if (fieldInjection.isRequired && !source.hasOwnProperty(fieldInjection.name))
			{
				throw new SerializeError(
					ResourceUtil.fproject_internal::getError(10, "require.value.not.found", [fieldInjection]), 
					SerializeError.MISSING_REQUIRED_FIELD);
			}
			
			var value:* = source[fieldInjection.name];
			
			if (value) 
			{
				// automatically coerce simple types.
				if (!isSimple(value))
				{
					value = extract(value, fieldInjection.type);
				}
				
				// Collections are harder, we need to coerce the contents.
				else if (value is Array)
				{
					if(isVector(fieldInjection.type))
						value = extractVector(value, fieldInjection.type, fieldInjection.arrayTypeHint);
					else if (fieldInjection.arrayTypeHint)
						value = extractTypedArray(value, fieldInjection.arrayTypeHint);
				}
				
				// We need to coerce the contents from miliseconds or date-time serial to Date type.
				else if (fieldInjection.type == Date)
				{
					if(!(value is Number) && dateParseFunction != null)
						value = dateParseFunction(value);
					else
						value = new Date(value);
				}
				
				// We need to coerce the contents from String to XML if possible
				else if (value is String && fieldInjection.type == XML)
				{
					value = new XML(value);
				}
			}
			
			return value;
		}

		private function extractTypedArray(source:Array, targetClassType:Class):Array
		{
			const result:Array = new Array(source.length);
			for (var i:uint = 0; i < source.length; i++)
			{
				result[i] = extract(source[i], targetClassType);
			}
			return result;
		}

		private function extractVector(source:Array, targetVectorClass:Class, targetClassType:Class):*
		{
			const result:* = ClassUtils.newInstance(targetVectorClass);
			for (var i:uint = 0; i < source.length; i++)
			{
				if (isVector(targetClassType))
				{
					const type:Type = Type.forClass(targetClassType);
					result[i] = extractVector(source[i], targetClassType, type.parameters[0]);
				} 
				else
				{
					result[i] = extract(source[i], targetClassType);
				}
			}
			return result;
		}
		
		private function addReflectedRules(injectionMap:TypeInjection, targetType:Class, reflectionMap:Type):void
		{
			addReflectedConstructorRules(injectionMap, reflectionMap);
			addReflectedFieldRules(injectionMap, reflectionMap.fields);
			addReflectedSetterRules(injectionMap, reflectionMap.methods);
		}

		private function addReflectedConstructorRules(typeInjection:TypeInjection, type:Type):void
		{
			const clazzMarshallingMetadata:Array = type.getMetadata(MARSHALL);
			if (!clazzMarshallingMetadata)
				return;
			
			const marshallingMetadata:Metadata = clazzMarshallingMetadata[0];
			const numArgs:uint = marshallingMetadata.arguments.length;
			
			for (var i:uint = 0; i < numArgs; i++)
			{
				var argument:MetadataArgument = marshallingMetadata.arguments[i];
				if (argument.key == FIELD_KEY)
				{
					const param:Parameter = type.constructor.parameters[i];
					const arrayTypeHint:Class = extractArrayTypeHint(param.type);
					typeInjection.addConstructorField(new FieldInjection(argument.value, param.type.clazz, true, arrayTypeHint));
				}
			}
		}

		private function addReflectedFieldRules(typeInjection:TypeInjection, fields:Array):void
		{
			for each (var field:Field in fields)
			{
				if (!field.hasMetadata(Metadata.TRANSIENT) && canAccess(field))
				{
					const fieldMetadataEntries:Array = field.getMetadata(MARSHALL);
					const fieldMetadata:Metadata = (fieldMetadataEntries) ? fieldMetadataEntries[0] : null;
					const arrayTypeHint:Class = extractArrayTypeHint(field.type, fieldMetadata);
					const sourceFieldName:String = extractFieldName(field, fieldMetadata);
					
					typeInjection.addField(field.name, new FieldInjection(sourceFieldName, field.type.clazz, false, arrayTypeHint));
				}
			}
		}

		private function addReflectedSetterRules(typeInjection:TypeInjection, methods:Array):void
		{
			for each (var method:Method in methods)
			{

				const methodMarshallingMetadata:Array = method.getMetadata(MARSHALL);
				if (methodMarshallingMetadata == null)
				{
					continue;
				}
				
				const metadata:Metadata = methodMarshallingMetadata[0];
				const numArgs:uint = metadata.arguments.length;
				
				for (var i:uint = 0; i < numArgs; i++)
				{
					var argument:MetadataArgument = metadata.arguments[i];
					if (argument.key == FIELD_KEY)
					{
						const param:Parameter = method.parameters[i];
						const arrayTypeHint:Class = extractArrayTypeHint(param.type, metadata);
						typeInjection.addMethod(method.name, 
							new FieldInjection(argument.value, param.type.clazz, false, arrayTypeHint));
					}
				}
			}
		}		

		private function extractFieldName(field:Field, metadata:Metadata):String
		{
			// See if a taget fieldName has been defined in the Metadata.
			if (metadata)
			{
				const numArgs:uint = metadata.arguments.length;
				for (var i:uint = 0; i < numArgs; i++)
				{
					var argument:MetadataArgument = metadata.arguments[i];
					if (argument.key == FIELD_KEY)
						return argument.value;
				}
			}
			
			// Assume it's a 1 to 1 mapping.
			return field.name;
		}

		private function extractArrayTypeHint(type:Type, metadata:Metadata = null):Class
		{
			// Vectors carry their own type hint.
			if (type.parameters && type.parameters[0] is Class)
				return type.parameters[0];
			
			// Otherwise we will look for some "type" metadata, if it was defined.
			else if (metadata)
			{
				const numArgs:uint = metadata.arguments.length;
				for (var i:uint = 0; i < numArgs; i++)
				{
					var argument:MetadataArgument = metadata.arguments[i];
					if (argument.key == TYPE_KEY)
					{
						const clazz:Class = ClassUtils.forName(argument.value);
						return clazz;
					}
				}
			}
			
			// No type hint.
			return null;
		}		

		private function canAccess(field:Field):Boolean
		{
			if (field is Variable)
				return true;
			else if (field is Accessor)
				return (field as Accessor).writeable;
			return false;
		}
		
		private function isVector(obj:*):Boolean 
		{
			return (getQualifiedClassName(obj).indexOf('__AS3__.vec::Vector') == 0);
		}
		
		private var returningToClass:Object = {};
		
		/**
		 * Deserialize a JSON string to an AS3 object with strong typing.
		 * 
		 * @param json the JSON string to decode or a generic Object instance
		 * that need to be converted to the specific type.
		 * @param returning the ouput type specification, using alias of a model class.
		 * This can be a single type such as <code>"com.mycompany.Employee[]"</code>,
		 * or an array type such as <code>"com.mycompany.Employee[]"</code>.
		 * You can also directly pass a AS3 Class object such as com.mycompany.Employee.
		 * 
		 * @return the output data in strong-typing format that specified by <code>returning</code>
		 * 
		 */
		public function fromJSON(json:*, returning:*=undefined):Object
		{
			if(returning is String)
			{
				if(returning != null && returning.length > 2 && returning.substr(-2) == "[]")
					returning = returning.substr(0, returning.length - 2);
				
				if(returningToClass[returning] == undefined)
				{
					if(ApplicationDomain.currentDomain.hasDefinition(returning))
						var c:Object = ApplicationDomain.currentDomain.getDefinition(returning);
					if(c == null || !(c is Class))
					{
						try
						{
							c = getClassByAlias(returning);
						}
						catch (e:Error)
						{						
						}						
					}
				}
				if(c != null)
				{
					returningToClass[returning] = c;
					var clazz:Class = c as Class;
				}
			}
			else if(returning is Class)
			{
				clazz = Class(returning) ;
			}
			
			var obj:Object = (json is String && !StringUtil.isBlank(json)) ? JSON.parse(json) : json;
			
			if(clazz == null)
				return obj;
			
			if(obj is Array)
			{
				var a:Array = [];
				for each (var elt:Object in obj)
				{
					a.push(extract(elt, clazz));
				}
				return a;
			}
			else
			{
				return extract(obj, clazz);
			}
		}
	}
}
