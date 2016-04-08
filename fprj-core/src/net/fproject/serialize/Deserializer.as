///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.serialize
{
	import flash.net.getClassByAlias;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.utils.Base64Decoder;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.supportClasses.FieldInjection;
	import net.fproject.di.supportClasses.TypeInjection;
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
		
		private var typeInjectionCache:Dictionary = new Dictionary(true);
		
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
				typeInjection = typeInjectionCache[targetType] = 
					createTypeInjection(targetType, Type.forClass(targetType));
			}
			
			// Create a new isntance of the targetType; and then inject the values from the source object into it
			const target:* = typeInjection.instantiate(source, targetType, extractValue);
			typeInjection.injectFields(source, target, extractValue);
			typeInjection.injectMethods(source, target, extractValue);
			
			return target;
		}

		private function isBasicType(object:Object):Boolean
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
		
		/**
		 * Extract value of a field with injection information specified 
		 * @param source the source object
		 * @param fieldInjection field injection information
		 * @return the extracted value
		 * 
		 */
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
				if (!isBasicType(value))
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

		/**
		 * Extract a typed array. The source array will be modified and returned.
		 * @param source
		 * @param targetClassType
		 * @return the source array itself
		 * 
		 */
		private function extractTypedArray(source:Array, targetClassType:Class):Array
		{
			const result:Array = new Array(source.length);
			for (var i:uint = 0; i < source.length; i++)
			{
				result[i] = extract(source[i], targetClassType);
			}
			return result;
		}

		/**
		 * Extract a vector
		 * @param source
		 * @param targetVectorClass
		 * @param targetClassType
		 * @return 
		 * 
		 */
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
		
		/**
		 * Create type injection information 
		 * @param targetType
		 * @param type
		 * @return 
		 * 
		 */
		private function createTypeInjection(targetType:Class, type:Type):TypeInjection
		{
			var ti:TypeInjection = new TypeInjection;
			addConstructorInjectionInfo(ti, type);
			addFieldInjectionInfo(ti, type.fields);
			addSetterInjectionInfo(ti, type.methods);
			return ti;
		}

		/**
		 * Add injection information for constructor 
		 * @param typeInjection
		 * @param type
		 * 
		 */
		private function addConstructorInjectionInfo(typeInjection:TypeInjection, type:Type):void
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

		/**
		 * Add injection information for fields 
		 * @param typeInjection
		 * @param fields
		 * 
		 */
		private function addFieldInjectionInfo(typeInjection:TypeInjection, fields:Array):void
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

		/**
		 * Add setter injection information 
		 * @param typeInjection
		 * @param methods
		 * 
		 */
		private function addSetterInjectionInfo(typeInjection:TypeInjection, methods:Array):void
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
		
		private function getVectorElementType(vector:Class):Class 
		{
			var s:String = getQualifiedClassName(vector);
			var end:int = s.lastIndexOf(">");
			var start:int = s.lastIndexOf("<", end - 1);
			return getDefinitionByName(s.substring(start + 1, end)) as Class;
		}
		
		private var returningToClass:Object = {};
		
		/**
		 * Deserialize a JSON string to an AS3 object with strong typing.
		 * 
		 * @param json the JSON string to decode or a generic Object instance
		 * that need to be converted to the specific type.
		 * @param returning the ouput type specification, using alias of a model class.
		 * This can be a single type such as <code>"com.mycompany.Employee"</code>,
		 * or an array type such as <code>"com.mycompany.Employee[]"</code>.
		 * You can also directly pass an AS3 Class object such as <code>com.mycompany.Employee</code>
		 * or <code>Vector.&lt;com.mycompany.Employee&gt;</code>.
		 * 
		 * @return the output data in strong-typing format that specified by <code>returning</code>
		 * 
		 */
		public function fromJSON(json:*, returning:*=undefined):*
		{
			if(json == null)
				return json;
			
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
				else
				{
					c = returningToClass[returning];
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
				if(isVector(clazz))
				{
					var a:* = new clazz();
					var eltType:Class = getVectorElementType(clazz);
				}
				else
				{
					a = [];
					eltType = clazz;
				}
				
				for each (var elt:Object in obj)
				{
					a.push(extract(elt, eltType));
				}
				return a;
			}
			else
			{
				return extract(obj, clazz);
			}
		}
		
		private var _base64Decoder:Base64Decoder;
		public function get base64Decoder():Base64Decoder
		{
			if(_base64Decoder == null)
				_base64Decoder = new Base64Decoder;
			return _base64Decoder;
		}
		
		public function fromBase64AMF(value:String):*
		{
			if(StringUtil.isBlank(value))
				return value;
			
			this.base64Decoder.decode(value);
			var ba:ByteArray = this.base64Decoder.toByteArray();
			return ba.readObject();
		}
	}
}
