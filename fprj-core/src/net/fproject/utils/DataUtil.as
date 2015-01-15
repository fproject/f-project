///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import mx.binding.utils.BindingUtils;
	
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
		}// end function
		
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
		}// end function
		
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
		}// end function
		
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
						return false;     
					default:         
						return Boolean(value); 
				}
			}
			else
			{
				return Boolean(value);
			}
		}
		
		/**
		 * Clone an object by a list of attributes 
		 * @param src the source object
		 * @param dest the destination object
		 * @param attributes attributes to be cloned
		 * 
		 */
		public static function cloneObject(src:Object, dest:Object, attributes:Array):void
		{
			for each (var s:String in attributes)
			{
				var srcFieldValue:Object = src[s];
				if(srcFieldValue != null && srcFieldValue.hasOwnProperty('clone'))
					dest[s] = srcFieldValue.clone();
				else
					dest[s] = srcFieldValue;
			}
		}
	}
}
