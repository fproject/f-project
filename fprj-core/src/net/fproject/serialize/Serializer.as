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