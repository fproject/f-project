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
package net.fproject.ui.events
{
	import flash.events.Event;
	
	/**
	 * Data event for the DateChooser/DateField class.
	 */
	public class DateControlEvent extends Event
	{
		/**
		 *  Dispatched when a user click the DateField button to open the DateField control's drop-down list.
		 *
		 */
		public static const OPEN:String = "open";
		
		/**
		 *  Dispatched when a user close the DateChooser popup of a DateField.
		 *
		 */
		public static const CLOSE:String = "close";
		
		/**
		 * Dispatched when the currently displayed year on a DateChooser or DateField control is changed.
		 */
		public static const YEAR_CHANGE:String = "yearChange";
		
		/**
		 * Dispatched when the currently month year on a DateChooser or DateField control is changed.
		 */
		public static const MONTH_CHANGE:String = "monthChange";
		
		/**
		 * Dispatched when the selected date of DateChooser or DateField control is changed.
		 */
		public static const SELECTED_DATE_CHANGE:String = "selectedDateChange";
		
		/**
		 * Constructor
		 */
		public function DateControlEvent(type:String)
		{
			super(type);
		}
		
		override public function clone() : Event
		{
			return new DateControlEvent(type);
		}
	}
}