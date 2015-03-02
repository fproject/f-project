///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.serialize
{
	import net.fproject.utils.DateTimeUtil;

	/**
	 * 
	 * The Serializer class is used to serialize AS3 objects to JSON string and other data formats
	 * 
	 */
	public class Serializer
	{
		private static var _instance:Serializer;
		
		/**
		 * 
		 * Singleton method
		 * 
		 */
		public static function getInstance():Serializer
		{
			if(_instance == null)
			{
				_instance = new Serializer;
				
				Date.prototype.toJSON = function(k:*):* {
					//Use DateTimeUtil.formatIsoDate as the default JSON serializer for AS3 Date
					if(_instance.dateSerializeFunction == null)
						return DateTimeUtil.formatIsoDate(this, true, true);
					
					return _instance.dateSerializeFunction(this);
				};
				
				XML.prototype.toJSON = function(k:*):* {
					//Use defaultXmlSerializeFunction as the default JSON serializer for AS3 XML
					if(_instance.xmlSerializeFunction == null)
						return _instance.defaultXmlSerializeFunction(this);
					
					return _instance.xmlSerializeFunction(this);
				};
			}
			return _instance;
		}
		
		/**
		 * The callback function to serialize date-time object to string
		 * This function must have one parameter in type of Date and return String:
		 * <pre>function myDateSerialize(s:Date):String</pre>.
		 * 
		 * @default net.fproject.utils.DateTimeUtil.formatIsoDate
		 */
		public var dateSerializeFunction:Function;
		
		/**
		 * The callback function to serialize date-time object to string
		 * This function must have one parameter in type of Date and return String:
		 * <pre>function xmlSerializeFunction(s:XML):String</pre>. 
		 * 
		 * By default, the XML.toXMLString() is used to serialize XML object.
		 */
		public var xmlSerializeFunction:Function;
		
		private function defaultXmlSerializeFunction(xml:XML):String
		{
			return xml == null ? null : xml.toXMLString();
		}
		
		/**
		 * Serialize an AS3 object to JSON string.
		 * 
		 * @param object the object to encode
		 * 
		 * @return the JSON string
		 * 
		 */
		public function toJSON(object:Object):String
		{
			return JSON.stringify(object);
		}
	}
}