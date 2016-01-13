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
package net.fproject.model
{
	public interface IUpdatableKeyModel
	{
		/**
		 * Returns the old primary key value.
		 * This refers to the primary key value that is populated from the active record
		 * after executing a find method (e.g. find(), findOne()).
		 * The value remains unchanged even if the primary key attribute is manually assigned with a different value.
		 * @return mixed the old primary key value. This is a standard object in the form
		 * {columnName:columnValue,...) is returned if the primary key is composite.
		 * If primary key is not defined, null will be returned.
		 */
		function get oldKey():Object;
		/**
		 * 
		 * @private
		 * 
		 */
		function set oldKey(value:Object):void;
	}
}