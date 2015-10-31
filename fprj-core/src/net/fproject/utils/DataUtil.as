///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.IList;
	import mx.core.IUID;
	import mx.events.PropertyChangeEvent;
	import mx.utils.ObjectUtil;
	
	import net.fproject.di.Injector;
	
	/**
	 * Data utility static functions.
	 *  
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class DataUtil
	{
		/**
		 * Returns the value of the <code>data</code> object's field.
		 * If the <code>fieldFunction</code> is provided, it is used to compute 
		 * the returned value. The <code>fieldFunction</code> must obey to the 
		 * following signature:<br/><br/>
		 * <pre>fieldFunction(data:Object):Object</pre>
		 * It returns the value.<br/><br/>
		 * If no <code>fieldFunction</code> is provided, the field attribute is 
		 * used to query the value. If the data object is an <code>XML</code> 
		 * element, the field is the name of an attribute of the 
		 * <code>XML</code> element and should start with &#64;. 
		 * Otherwise, field is an attribute of the object.
		 * 
		 * @param data The data object.
		 * @param field The data field object.
		 * @param defaultValue The default value when the object does not 
		 * hold the field. Defaults to <code>null</code>.
		 * @param fieldFunction A function that returns the value of the field.
		 * @return The value of the object field or the <code>defaultValue</code>, 
		 * if the object does not have such a field.
		 * 
		 * */
		public static function getFieldValue(data:Object, field:*, defaultValue:Object = null, fieldFunction:Function = null) : Object
		{
			var fieldValue:Object = null;
			if (fieldFunction != null)
			{
				return fieldFunction(data);
			}
			if (data is XML)
			{
				/*if (String(field).charAt(0) != "@")
				{
				field = "@" + field;
				}*/
				fieldValue = data[field];
				if (fieldValue is XMLList)
				{
					fieldValue = fieldValue.toString();
					if (fieldValue.length == 0)
					{
						fieldValue = defaultValue;
					}
				}
			}
			else if (data.hasOwnProperty(field))
			{
				fieldValue = data[field];
			}
			else
			{
				fieldValue = defaultValue;
			}
			return fieldValue;
		}
		
		/**
		 * Set (insert or replace) a child element to a XML object. 
		 * @param parent the container XML object
		 * @param child the child element to set.
		 * @param nvl the value that will be used if the container is null.
		 * @return the output XML
		 */
		public static function setXmlChild(parent:XML, child:XML, nvl:XML=null):XML
		{
			if(parent != null)
			{
				if(parent.child(child.name()).length() > 0)				
					parent.replace(child.name(), child);
				else
					parent.appendChild(child);
			}
			else if(parent == null && nvl != null)
			{
				parent = nvl;
				parent.appendChild(child);
			}
			return parent;
		}
		
		/**
		 * Insert a child element to a XML object. 
		 * @param parent the container XML object
		 * @param child the child element to set.
		 * @param nvl the value that will be used if the container is null.
		 * @return the output XML
		 */
		public static function addXmlChild(parent:XML, child:XML, nvl:XML=null):XML
		{
			if(parent == null && nvl != null)
				parent = nvl;
			parent.appendChild(child);
			return parent;
		}
		
		/**
		 * Set value for a field of an data object
		 * @param data the data object
		 * @param field the field
		 * @param value the value to set
		 * 
		 */
		public static function setFieldValue(data:Object, field:*, value:*, skipError:Boolean=true) : void
		{
			if (data is XML)
			{
				if (field.charAt(0) != "@")
				{
					field = "@" + field;
				}
				if(skipError)
					setFieldValueSkipError(data, field, value.toString());
				else
					data[field] = value.toString();
			}
			else
			{
				if(skipError)
					setFieldValueSkipError(data, field, value);
				else
					data[field] = value;
			}
		}
		
		private static function setFieldValueSkipError(data:Object, field:*, value:*):void
		{
			try
			{
				data[field] = value;
			}
			catch(e:Error)
			{
				
			}
		}
		
		/**
		 * Make 2-way field binding for the two objects.  
		 * @param obj1 The 1st object.
		 * @param prop1 The field to bind for 1st object.
		 * @param obj2 The 2nd object.
		 * @param prop2 The field object to bind for 2nd object.
		 * 
		 */
		public static function wrapProperty(obj1:Object, prop1:String, obj2:Object, prop2:String = null) : void
		{
			if (prop2 == null)
			{
				prop2 = prop1;
			}
			if (obj1[prop1] != null)
			{
				obj2[prop2] = obj1[prop1];
			}
			BindingUtils.bindProperty(obj1, prop1, obj2, prop2);
			BindingUtils.bindProperty(obj2, prop2, obj1, prop1);
		}
		
		/**
		 * Coerce to Boolean. 
		 * @param value The source object, it may be a string "0", "1", "true"
		 * 				"false", "yes", "no" or another type of data.
		 * @return The coerced value
		 * 
		 */
		public static function toBoolean(value:Object):Boolean
		{
			if (value is String)
			{
				switch((value as String).toLowerCase()) {     
					case "1":     
					case "true":     
					case "yes":         
						return true;     
					case "0":     
					case "false":     
					case "no":         
					default:         
						return false;   
				}
			}
			else
			{
				return Boolean(value);
			}
		}
		
		/**
		 * Copy an object by a list of attributes 
		 * @param src the source object
		 * @param dest the destination object
		 * @param attributes attributes to be cloned
		 * @param options An Object containing one or more properties 
		 *  that control the information returned by this method. 
		 *  The properties include the following:
		 *
		 *  <ul>
		 * 	  <li><code>attributes</code> Array of Strings specifying the property names that should be 
		 *  	included to the returned result. For example: <code>["id", "name"]</code>
		 * 		By default, all attributes will be considered.</li>
		 * 	  <li><code>excludeAttributes</code> Array of Strings specifying the property names that should be 
		 *  	excluded from the returned result. For example, you could specify 
		 *  	<code>["currentTarget", "target"]</code> for an Event object since these properties 
		 *  	can cause the returned result to become large.</li>
		 *    <li><code>includeReadOnly</code>: If <code>false</code>, 
		 *      exclude Object properties that are read-only. 
		 *      The default value is <code>true</code>.</li>
		 *    <li><code>includeTransient</code>: If <code>false</code>, 
		 *      exclude Object properties and variables that have <code>[Transient]</code> metadata.
		 *      The default value is <code>true</code>.</li>
		 *    <li><code>uris</code>: Array of Strings of all namespaces that should be included in the output.
		 *      It does allow for a wildcard of "~~". 
		 *      By default, it is null, meaning no namespaces should be included. 
		 *      For example, you could specify <code>["mx_internal", "mx_object"]</code> 
		 *      or <code>["~~"]</code>.</li>
		 *  </ul>
		 */
		public static function copyObject(src:Object, dest:Object, options:Object = null):void
		{
			if(options != null && options.hasOwnProperty("attributes"))
			{
				var attributes:Array = options["attributes"];
			}
			else
			{
				if(options != null && options.hasOwnProperty("excludeAttributes"))
					var excludeAttributes:Array = options["excludeAttributes"];
				attributes = ObjectUtil.getClassInfo(src, excludeAttributes, options)['properties'];
			}
			
			for each (var s:String in attributes)
			{
				var srcFieldValue:Object = src[s];
				if(srcFieldValue != null && srcFieldValue.hasOwnProperty('clone'))
					dest[s] = srcFieldValue.clone();
				else
					dest[s] = srcFieldValue;
			}
		}
		
		
		/**
		 * Evaluate value of a field of a host object by name 
		 * @param host the host object
		 * @param mermberName the field name
		 * 
		 */
		public static function evaluateHostMember(host:Object, mermberName:String):*
		{
			if(mermberName.charAt(mermberName.length - 2) == '(' && mermberName.charAt(mermberName.length - 1) == ')')
			{
				mermberName = mermberName.substr(0, mermberName.length - 2);
				return host[mermberName]();
			}
			if((mermberName.charAt(0) == '{' && mermberName.charAt(mermberName.length - 1) == '}') ||
				(mermberName.charAt(0) == '"' && mermberName.charAt(mermberName.length - 1) == '"') ||
				(mermberName.charAt(0) == "'" && mermberName.charAt(mermberName.length - 1) == "'"))
			{
				return mermberName.substring(1, mermberName.length - 1);
			}
			else
				return host[mermberName];
		}
		
		/**
		 * 
		 * Evaluate value of a chain
		 * @param chain a string that specify the value path.<br/>
		 * 	Eg:<pre>
		 * 	mx.events.FlexEvent.INITIALIZE
		 * or:
		 * 	this.field.childField.grandChildField
		 * </pre>
		 * @param host the host object
		 * 
		 */
		public static function evaluateChainValue(chain:String, host:Object=null, expectedType:String=null):*
		{
			if(chain == Injector.THIS)
				return host;
			else
				chain = StringUtil.trim(chain," \t");
			
			var o:Object = parseLiteralValue(chain, expectedType);
			if(o != null)
			{
				return o.value;
			}
			
			if(chain.indexOf(Injector.THIS_DOT) == 0 || host is Class)
			{
				var s:String = chain.indexOf(Injector.THIS_DOT) == 0 ? chain.substr(5) : chain;
				var a:Array = s.split(".");
				var x:* = host;
				for each (s in a)
				{
					if(x == null)
						return undefined;
					x = evaluateHostMember(x, s);
				}
				return x;
			}
			
			var i:int = chain.lastIndexOf(".");
			if(i > 0)
			{
				var j:int = chain.indexOf("::");
				if(j == -1)
				{
					j = i;
					i = 0;
				}
				else
				{
					i = j == 0 ? 2 : 0;
					j = chain.indexOf(".", j + 2);
				}
				var className:String = chain.substring(i, j);
				if(ApplicationDomain.currentDomain.hasDefinition(className))
					var c:Class = ApplicationDomain.currentDomain.getDefinition(className) as Class;
				else
					c = getDefinitionByName(className) as Class;
				
				return evaluateChainValue(chain.substr(j + 1), c);
			}
			else
				return host == null? chain : evaluateHostMember(host, chain);
		}
		
		public static function parseLiteralValue(s:String, expectedType:String=null):Object
		{
			if((s.charAt(0) == "'" && s.charAt(s.length - 1) == "'")
				|| (s.charAt(0) == '"' && s.charAt(s.length - 1) == '"')
				|| (s.charAt(0) == '{' && s.charAt(s.length - 1) == '}'))
			{
				s = s.substring(1, s.length - 1);
				var quoted:Boolean = true;
			}
			
			if(quoted)
			{
				if(expectedType == null)
					return {value:s};
				
				var v:*;
				switch(expectedType.toLowerCase())
				{
					case "int":
						v = int(s);
						break;
					case "uint":
						v = uint(s);
						break;
					case "number":
						v = Number(s);
						break;
					case "boolean":
						v = toBoolean(s);
						break;
					case 'array':
						s = StringUtil.trim(s);
						if(s.charAt(0) == '[')
							s = s.substr(1);
						if(s.charAt(s.length - 1) == ']')
							s = s.substr(0, s.length - 1);
						v = s.split(',');
						break;
					case "string":
					default:
						v = s;
				}
				
				return {value:v};
			}
			else if(s == 'true')
			{
				return {value:true};;
			}
			else if(s == 'false')
			{
				return {value:false};;
			}
			else if(s == 'null')
			{
				return {value:null};
			}
			else if(s.match(/^(\d+\.)?\d+$/))
			{
				return {value:Number(s)};
			}
			
			return null;
		}
		
		/**
		 * Evaluate a simple expression 
		 * @param host
		 * @param simpleExpressionInfo
		 * @param expectedType
		 * @return 
		 * 
		 */
		public static function evaluateSimpleExpression(host:Object, simpleExpressionInfo:Object, expectedType:String=null):*
		{
			var chain:String = simpleExpressionInfo.chain;
			var methodChain:String = simpleExpressionInfo.methodChain;
			if(methodChain != null)
			{
				var f:Function = getPredefinedMethod(methodChain);
				if(f != null)
				{
					return evaluatePredefinedMethod(host, f, chain);
				}
				else
				{
					f = evaluateChainValue(methodChain, host) as Function;
					if(f != null)
					{
						
						if(chain == "")
						{
							var retVal:* = f();
						}
						else
						{
							if(thisDotCheck(chain, host))
								chain = Injector.THIS_DOT + chain;
							
							retVal = evaluateChainValue(chain, host);
							retVal = f(retVal);
						}						
					}
					else
					{
						throw new Error("Cannot evaluate expression. Invalid method name: " + methodChain);
					}
				}
			}
			else
			{
				if(chain != "" && thisDotCheck(chain, host))
					chain = Injector.THIS_DOT + chain;
				retVal = evaluateChainValue(chain, host, expectedType);
			}
			
			if(simpleExpressionInfo.negation)
				retVal = !Boolean(retVal);
			
			return retVal;
		}
		
		private static function getPredefinedMethod(methodName:String):Function
		{
			if(methodName == "$RB")
				return method_RB;
			return null;
		}
		
		private static function evaluatePredefinedMethod(host:Object, method:Function, chain:String):*
		{
			if(chain == "")
			{
				var retVal:* = method();
			}
			else
			{
				var sparams:Array = chain.split(",");
				var argArray:Array = [];
				for each(var p:String in sparams)
				{
					if(thisDotCheck(p, host))
						p = Injector.THIS_DOT + p;
					
					var pVal:* = evaluateChainValue(p, host);
					argArray.push(pVal);
				}
				retVal = method.apply(host, argArray);
			}
			
			return retVal;
		}
		
		private static function method_RB(bundle:String, key:String):String
		{
			return ResourceUtil.getString(key, bundle);
		}
		
		private static function thisDotCheck(chain:String, host:Object):Boolean
		{
			if(chain.indexOf(Injector.THIS_DOT) != 0 && host != null)
			{
				var i:int = chain.indexOf(".");
				if(i != -1)
					var s:String = StringUtil.trim(chain.substring(0, i), " \t");
				else
					s = chain
				return host.hasOwnProperty(s);
			}
			return false;
		}
		
		/**
		 * Check if two objects are equal.
		 * If the first object has own an <code>equals</code> method, it will be used in comparison. 
		 * @param a the first object to compare
		 * @param b the second object to compare
		 * @return true if the two objects are equal.
		 * 
		 */
		public static function equals(a:Object, b:Object):Boolean
		{
			if(a != null && a.hasOwnProperty("equals") && a["equals"] is Function)
				return a.equals(b);
			return a === b;
		}
		
		/**
		 * Check if two objects are equal by comparing the <code>id</code> property.
		 * If the first object has own an <code>equals</code> method, it will be used in comparison.
		 * If the two objects have <code>id</code> property, it will be used in comparison.
		 * @param a the first object to compare
		 * @param b the second object to compare
		 * @return true if the two objects are equal, or the <code>id</code> property
		 * 
		 */
		public static function equalsByUid(a:Object, b:Object):Boolean
		{
			if(a != null && a.hasOwnProperty("equals") && a["equals"] is Function)
				return a.equals(b);
			else if(a is IUID && b is IUID)
				return IUID(a).uid == IUID(b).uid;	
			return a === b;
		}
		
		/**
		 * Get value from a fields chain of a source object.
		 * @param sourceObject The source object
		 * @param fieldChain The field chain, this is a chain of fields separated by the spot ".".
		 * @param valueIfNull The value returned if there's one field value in the chain is null.
		 * @return Value from the fields chain of source object.
		 * 
		 */
		public static function getFieldChainValue(sourceObject:Object, fieldChain:String, valueIfNull:*=undefined):*
		{
			var fields:Array = fieldChain.split(".");
			
			var obj:Object = sourceObject;
			
			for (var i:int = 0; i < fields.length; i++)
			{
				if(obj == null)
					return valueIfNull;
				obj = obj[fields[i]];
			}
			
			return obj;
		}
		
		/**
		 * Set value for a fields chain of a source object.
		 * @param sourceObject The source object
		 * @param fieldChain The field chain, this is a chain of fields separated by the spot ".".
		 * @param value The value to set
		 * @param propertyChangeDispatcher the parent object implemented IEventDispatcher that will dispatch
		 * PropertyChangeEvent when field value is set.
		 * @return the source object it self. If the source object is <code>null</code>, a
		 * dynamic untyped object that has the field chain set will be returned.
		 * 
		 */
		public static function setFieldChainValue(sourceObject:Object, fieldChain:String,
												  value:*, propertyChangeDispatcher:IEventDispatcher=null):*
		{
			var fields:Array = fieldChain.split(".");
			
			if(sourceObject == null)
			{
				sourceObject = {};
				propertyChangeDispatcher = null;
			}
			var obj:Object = sourceObject;
			for (var i:int = 0; i < fields.length - 1; i++)
			{
				if(obj[fields[i]] == null)
					obj[fields[i]] = {};
				obj = obj[fields[i]];
			}
			
			obj[fields[fields.length - 1]] = value;
			
			if(propertyChangeDispatcher != null)
				propertyChangeDispatcher.dispatchEvent(
					PropertyChangeEvent.createUpdateEvent(propertyChangeDispatcher, fields[0], null, sourceObject));
			return sourceObject;
		}
		
		public static function getFieldValues(collection:Object, fieldName:String):Array
		{
			if(collection == null)
				return null;
			var a:Array = [];
			var push:Function = function(o:Object):void
			{
				if(o != null && o.hasOwnProperty(fieldName))
				{
					a.push(o[fieldName]);
				}
			};
			if(collection is IList)
			{
				var l:IList = collection as IList;
				for(var i:int=0; i<l.length; i++)
				{
					push(l.getItemAt(i));					
				}
			}
			else if(collection is Array)
			{
				for each (var o:Object in collection)
				{
					push(o);
				}
			}
			else
				return null;
			
			return a;
		}
		
		public static function characterEscape(o:*):*
		{
			if(o is String)
				return escape(o as String).replace(/\./g, "%2E").replace(/\:/g, "%3A").replace(/\//g, "%2F");
			else
				return o;
		}
	}
}
