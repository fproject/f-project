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

	public class WebStorageEvent extends Event
	{
		public var key:String;
		
		public var oldValue:*;
		
		public var newValue:*;
		
		public var uri:String;
		
		public var storageArea:String;
		
		public function WebStorageEvent(type:String, src:Object=null)
		{
			super(type);
			if(src != null)
			{
				for (var s:String in src)
				{
					if(this.hasOwnProperty(s))
						this[s] = src[s];
				}
			}
		}
		
		public static const STORAGE:String = "storage";
	}
}