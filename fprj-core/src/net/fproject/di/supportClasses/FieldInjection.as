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
package net.fproject.di.supportClasses
{
	/**
	 * 
	 * FieldInjection represents injection information for a field of an object.
	 * 
	 * @author Bui Sy Nguyen.
	 * 
	 */
	public class FieldInjection
	{
		private var _fieldName : String;
		private var _type : Class;
		private var _required : Boolean;
		private var _arrayTypeHint : Class;
		
		/**
		 * Constructor 
		 * @param fieldName
		 * @param type
		 * @param required
		 * @param arrayTypeHint
		 * 
		 */
		public function FieldInjection(fieldName : String, type : Class, required : Boolean, arrayTypeHint : Class)
		{
			_fieldName = fieldName;
			_type = type;
			_required = required;
			_arrayTypeHint = arrayTypeHint;
		}
		
		/**
		 * 
		 * The field name
		 * 
		 */
		public function get name() : String
		{
			return _fieldName;
		}

		/**
		 * 
		 * The field type
		 * 
		 */
		public function get type() : Class
		{
			return _type;
		}
		
		/**
		 * 
		 * Indicates that the field input is mandatory when constructing object
		 * 
		 */
		public function get isRequired() : Boolean
		{
			return _required;
		}

		/**
		 * 
		 * Returns a string representation of the field information. 
		 * 
		 */
		public function toString() : String
		{
			var result : String = _fieldName + "<" + type + ">";
			if (arrayTypeHint) {
				result += "->" + arrayTypeHint;
			}
			return result;
		}

		/**
		 * 
		 * The array type hint
		 * 
		 */
		public function get arrayTypeHint() : Class
		{
			return _arrayTypeHint;
		}
	}
}
