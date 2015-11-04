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
package net.fproject.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.PropertyChangeEvent;
	
	/**
	 * 
	 * The base class for all components of F-Project that can fire PropertyChangeEvent event
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class PropertyChangeDispatcher extends EventDispatcher
	{
		public function dispatchChangeEvent(prop:String, oldValue:*, newValue:*):void
		{
			if(!changeEventDisabled && this.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(target, prop, oldValue, newValue));
		}
		
		private var changeEventDisabled:Boolean;
		
		public function disableChangeEvent():void
		{
			changeEventDisabled = true;
		}
		
		public function enableChangeEvent():void
		{
			changeEventDisabled = false;
		}
		
		private var target:Object;
		
		public function PropertyChangeDispatcher(target:IEventDispatcher=null)
		{
			super(target);
			this.target = target == null ? this : target;
		}
	}
}