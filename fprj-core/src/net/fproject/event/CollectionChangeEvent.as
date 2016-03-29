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
package net.fproject.event
{
	import flash.events.Event;
	
	public class CollectionChangeEvent extends Event
	{
		public static const SAVE_COMPLETE:String = "saveComplete";
		public static const SAVE_FAULT:String = "saveFault";
		public static const DELETE_COMPLETE:String = "deleteComplete";
		public static const DELETE_FAULT:String = "deleteFault";
		
		protected var _result:Object;
		
		public function get result():Object
		{
			return _result;
		}
		
		protected var _items:Array;
		
		public function get items():Array
		{
			return _items;
		}
		
		public function CollectionChangeEvent(type:String, result:Object, items:Array)
		{
			super(type);
			_result = result;
			_items = items;
		}
	}
}