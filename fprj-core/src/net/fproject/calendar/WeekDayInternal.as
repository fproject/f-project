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
package net.fproject.calendar
{

	/**
	 *
	 * Represents a time period of a <code>WeekDay</code>.<br/><br/>
	 * This class is used for internal purpose.
	 *
	 * @see PeriodInternalBase
	 * @see PeriodInternal
	 */
	internal class WeekDayInternal extends WorkInfo
	{
		/**
		 * @copy #dayOfWeek
		 */
		private var _dayOfWeek:int;

		/**
		 * Constructor
		 * @param calendar The work calendar that owns this period.
		 * @param working Indicates whether this period is working period or not.
		 * @param dow The day of week, 0 for Sunday, 6 for Saturday.
		 */
		function WeekDayInternal(calendar:WorkCalendar, working:Boolean, dow:int)
		{
			super(calendar, working);
			this._dayOfWeek = dow;
			if (calendar.isRootCalendar)
			{
				isInherited = true;
			}
		}

		/**
		 *
		 * The day of week, 0 for Sunday, 6 for Saturday.
		 *
		 */
		internal function get dayOfWeek():int
		{
			return this._dayOfWeek;
		}

		/**
		 *
		 * @inheritDoc
		 *
		 */
		internal override function clone():WorkInfo
		{
			var period:WeekDayInternal =
				new WeekDayInternal(_workCalendar, isWorking, this._dayOfWeek);
			copyPeriodTo(period);
			return period;
		}

		/**
		 * Compare to another <code>WeekDayInternal</code> object.
		 * @param dayPeriod the <code>WeekDayInternal</code> object to compare.
		 * @return <code/>true</code> if the two periods have the same
		 * value of <code>isWorking</code>, <code>dayOfWeek</code> and the same
		 * work shifts.
		 *
		 */
		internal function equals(weekDay:WeekDayInternal):Boolean
		{
			return weekDay.isWorking == isWorking &&
				weekDay._dayOfWeek == this._dayOfWeek && compareWorkShifts(weekDay);
		}

		/**
		 *
		 * @inheritDoc
		 *
		 */
		internal override function getTotalWorkBetween(start:Date, end:Date):Number
		{
			return getTotalWorkBetweenHours(start, end);
		}

		/**
		 * Create an instance of WeekDayInternal from a WeekDay object
		 * @param calendar The WorkCalendar that this period belongs to.
		 * @param wd The WeekDay object that associates with this period.
		 * @return An instance of WeekDayInternal from the specified WeekDay object.
		 * 
		 */
		internal static function fromCalendarWeekDay(calendar:WorkCalendar, wd:WeekDay):WeekDayInternal
		{
			var wt:WorkShift = null;
			var dayPeriod:WeekDayInternal =
				new WeekDayInternal(calendar, wd.isWorking, wd.dayOfWeek);
			dayPeriod._workShifts = wd.workShifts;
			return dayPeriod;
		}

	}
}
