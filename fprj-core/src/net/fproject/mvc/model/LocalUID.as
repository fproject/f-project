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
package net.fproject.mvc.model
{
	import mx.core.IUID;
	
	import net.fproject.core.PropertyChangeDispatcher;
	
	/**
	 * 
	 * LocalUID class is abstract class for all model classes that have 'uid' field.
	 * By default, if the model has an 'id' field, then the 'uid' value always the same as 'id'.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class LocalUID extends PropertyChangeDispatcher implements IUID
	{
		private var _uid:String;
		
		[Transient]
		[Bindable(event="propertyChange")]
		public function get uid():String
		{
			if(this.hasOwnProperty('id'))
				return this['id'];
			else
				return _uid;
		}
		
		public function set uid(value:String):void
		{
			if(this.uid != value)
			{
				if(this.hasOwnProperty('id'))
				{
					var oldValue:String = this['id'];
					try {
						this['id'] = value;
					}
					catch (e:Error)
					{
						_uid = value;
					}
				}
				else 
				{
					oldValue = _uid;
					_uid = value;
				}
				dispatchChangeEvent('uid', oldValue, value);
			}
		}		
	}
}