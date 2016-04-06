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
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;

	/**
	 * Defines the time units used to measure time.<br/><br/>
	 * Dates and times are documented following the ISO 8601:2000 standard.
	 * */
	public class TimeUnit
	{
		private var _milliseconds:Number;
		private var _name:String;

		/**
		 * A millisecond.
		 */		
		public static var MILLISECOND:TimeUnit = new TimeUnit("millisecond", 1);

		/**
		 * A second.
		 */
		public static var SECOND:TimeUnit = new TimeUnit("second", 1000);

		/**
		 * A minute.
		 */
		
		public static var MINUTE:TimeUnit = new TimeUnit("minute", 60 * 1000);

		/**
		 * A calendar hour.
		 */
		public static var CALENDAR_HOUR:TimeUnit = new TimeUnit("calendar.hour", 60 * MINUTE.milliseconds);

		/**
		 * An hour as elapsed time.
		 */
		public static var HOUR:TimeUnit = new TimeUnit("hour", 60 * MINUTE.milliseconds);

		/**
		 * A day.
		 */
		public static var DAY:TimeUnit = new TimeUnit("day", 24 * HOUR.milliseconds);

		/**
		 * A standard working day.
		 */
		public static var STANDARD_WORKING_DAY:TimeUnit = new TimeUnit("day", 8 * HOUR.milliseconds);
		
		/**
		 * A week.
		 */
		public static var WEEK:TimeUnit = new TimeUnit("week", 7 * DAY.milliseconds);

		/**
		 * A month.
		 */
		public static var MONTH:TimeUnit = new TimeUnit("month", 31 * DAY.milliseconds);

		/**
		 * A quarter. The first quarter of year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2010-3-31 23:59:59.999.
		 */
		public static var QUARTER:TimeUnit = new TimeUnit("quarter", (2 * 31 + 30) * DAY.milliseconds);

		/**
		 * A half-year or semester. The first half of year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2010-7-31 23:59:59.999.
		 */
		public static var HALF_YEAR:TimeUnit = new TimeUnit("half-year", (4 * 31 + 2 * 30) * DAY.milliseconds);

		/**
		 * A year. The year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2010-12-31 23:59:59.999.
		 */
		public static var YEAR:TimeUnit = new TimeUnit("year", 366 * DAY.milliseconds);

		/**
		 * A decade. The decade for the year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2019-12-31 23:59:59.999.
		 */
		public static var DECADE:TimeUnit = new TimeUnit("decade", (8 * 366 + 2 * 365) * DAY.milliseconds);

		/**
		 * <p>Initializes a new instance of the <code>TimeUnit</code> class.</p>
		 * @param name The value set for <code>name</code> property.
		 * @param milliseconds The value set for <code>milliseconds</code> property.
		 */
		public function TimeUnit(name:String, milliseconds:Number)
		{
			this._name = name;
			this._milliseconds = milliseconds;
		}

		/**
		 * The duration of a time unit in milliseconds. This value is at best
		 * indicative since the duration of most time units is variable.
		 *
		 */
		public function get milliseconds():Number
		{
			return this._milliseconds;
		}

		/**
		 * The name of the time unit.
		 *
		 */
		public function get name():String
		{
			return this._name;
		}

		/**
		 * Returns a string representing this time unit.
		 * @return The name of time unit.
		 *
		 */
		public function toString():String
		{
			return this.getLabel();
		}
		
		private static var labels:Object;
		
		public function getLabel(plural:Boolean=false):String
		{
			if(labels == null)
			{
				labels = {};
				var names:Array = [HOUR.name, DAY.name, WEEK.name, MONTH.name];
				for each (var s:String in names)
				{
					var key:String = "common.caption." + s;
					labels[s] = ResourceUtil.getString(key);
					labels[s + "s"] = ResourceUtil.getString(key + "s");
				}
			}
			
			key = this.name;
			if(plural)
				key += "s";
			
			if(labels.hasOwnProperty(key))
				return labels[key];
			else
				return this.name;
		}

		/**
		 *
		 * Parse a time unit by it name.
		 * @param unit The string contain name of time unit.<br/>
		 * 			This name can be one of these value: 
		 * 			"MILLISECOND", "SECOND", "MINUTE",
		 * 			"HOUR", "DAY", "WEEK", "MONTH", "QUARTER", "HALF_YEAR",
		 * 			"YEAR", "DECADE"
		 * @return The result <code>TimeUnit</code> object.
		 *
		 */
		public static function parseTimeUnit(unit:String):TimeUnit
		{
			var timeUnit:TimeUnit = null;
			switch (unit.toUpperCase())
			{
				case "MILLISECOND":
					timeUnit = MILLISECOND;
					break;
				case "SECOND":
					timeUnit = SECOND;
					break;
				case "MINUTE":
					timeUnit = MINUTE;
					break;
				case "HOUR":
					timeUnit = HOUR;
					break;
				case "DAY":
					timeUnit = DAY;
					break;
				case "WEEK":
					timeUnit = WEEK;
					break;
				case "MONTH":
					timeUnit = MONTH;
					break;
				case "QUARTER":
					timeUnit = QUARTER;
					break;
				case "HALF_YEAR":
					timeUnit = HALF_YEAR;
					break;
				case "YEAR":
					timeUnit = YEAR;
					break;
				case "DECADE":
					timeUnit = DECADE;
					break;
				default:
				{
					LoggingUtil.logAndThrowError(TimeUnit, ResourceUtil.FPRJ_CORE, 13, null,
						ResourceUtil.FPRJ_CORE_BUNDLE, 'invalid.time.unit', [unit]);
				}
			}
			return timeUnit;
		}
	}
}
