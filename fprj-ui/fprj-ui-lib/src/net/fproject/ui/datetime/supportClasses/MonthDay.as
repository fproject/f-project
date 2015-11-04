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
	import net.fproject.model.LocalUID;
	
	/**
	 *  Data object that will be element type for MonthDayList
	 */
	public class MonthDay extends LocalUID
	{
		// the date to display
		[Bindable]
		public var date:Date;
		
		[Bindable]
		public var isInCurrentMonth:Boolean;
		
		
		override public function get uid():String
		{
			return date.fullYear.toString() + date.month.toString() + date.date.toString();
		}
		
		[Bindable("_none_")]
		public function get dateLabel():String
		{
			return date.date.toString();
		}
	}
	
}
