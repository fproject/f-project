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
	import net.fproject.fproject_internal;
	import net.fproject.core.AppContext;
	import net.fproject.event.AppContextEvent;

	/**
	 * Represents an user.
	 */
	public class User extends LocalUID
	{
		private var _id:String;

		[Bindable(event="propertyChange")]
		/**
		 * An unique number identity of user 
		 */
		public function get id():String
		{
			return _id;
		}

		/**
		 * @private
		 */
		public function set id(value:String):void
		{
			if( _id !== value)
			{
				var oldValue:String = _id;
				_id = value;
				dispatchChangeEvent('id', oldValue, value);
			}
		}


		private var _username:String;

		[Bindable(event="propertyChange")]
		/**
		 * The user account name 
		 */
		public function get username():String
		{
			return _username;
		}

		/**
		 * @private
		 */
		public function set username(value:String):void
		{
			if( _username !== value)
			{
				var oldValue:String = _username;
				_username = value;
				dispatchChangeEvent('username', oldValue, value);
			}
		}

		
		private var _token:String;
		
		[Transient]
		/**
		 * The authentication token 
		 */
		public function get token():String
		{
			return _token;
		}
		
		/**
		 * Set the authentication token 
		 */
		fproject_internal function setToken(value:String):void
		{
			if(_token != value)
			{
				_token = value;
				AppContext.instance.dispatchEvent(new AppContextEvent(AppContextEvent.ACCESS_TOKEN_CHANGE, value));
			}			
		}
	}
}