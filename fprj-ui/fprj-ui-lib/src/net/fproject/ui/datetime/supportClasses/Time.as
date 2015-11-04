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
package net.fproject.ui.datetime.supportClasses
{
	import net.fproject.core.Time;
	
	public class Time extends net.fproject.core.Time
	{
		[Bindable]
		public var enabled:Boolean;
		
		public var label:String;
		
		[Bindable]
		public var isHinted:Boolean;
		
		public function Time(minutes:Number=0, label:String = "", isHinted:Boolean = false)
		{
			super(minutes * 60000);
			this.label = label;
			this.isHinted = isHinted;
			this.enabled = true;
		}
		
		public function get minutes():Number
		{
			return _millisecondsFromMidnight / 60000;
		}
	}
}