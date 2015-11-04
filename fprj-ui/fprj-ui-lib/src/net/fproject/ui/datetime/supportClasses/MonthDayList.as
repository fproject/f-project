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
	import net.fproject.collection.AdvancedArrayList;
	import net.fproject.core.TimeUnit;

	/**
	 *  Given a month and year, generates 42 items that
	 *  correspond to how the month would appear in 
	 *  a calendar if index 0 is the first Sunday
	 *  in a week view
	 */
	public class MonthDayList extends AdvancedArrayList
	{
		/**
		 *  Set the month and year.
		 *  @param month 0-based index of month (0 = January)
		 *  @param year The year to display (2015)
		 */
		public function resetFromMonthAndYear(month:int, year:int):void
		{
			_month = month;
			_year = year;
			// choose noon on the first to try to avoid DST issues
			var d:Date = new Date(year, month, 1, 12);
			// get day of week (0 = Sunday)
			var dofw:Number = d.day;
			
			// back up to Sunday
			var value:Number = d.time;
			while (dofw > 0)
			{
				value -= TimeUnit.DAY.milliseconds;
				dofw--;
			}
			
			var arr:Array = [];
			
			for (var i:int = 0; i < 42; i++)
			{
				var dt:Date = new Date(value);
				var data:MonthDay = new MonthDay();
				data.date = dt;
				data.isInCurrentMonth = dt.month == month;
				arr.push(data);
				value += TimeUnit.DAY.milliseconds;
			}
			source = arr;
		}
		
		private var _month:int;
		
		[Bindable("collectionChange")]
		public function get month():int
		{
			return _month;
		}
		
		private var _year:int;
		
		[Bindable("collectionChange")]
		public function get year():int
		{
			return _year;
		}
		
	}
	
}
