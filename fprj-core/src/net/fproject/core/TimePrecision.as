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
	/**
	 * 
	 * A TimePrecision object represents the precision of a time measurement.<br/>
	 * A time precision is defined by a time unit and a number of steps. 
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class TimePrecision
	{
		/**
		 * A millisecond.
		 */		
		public static var MILLISECOND:TimePrecision = new TimePrecision(TimeUnit.MILLISECOND);
		
		/**
		 * A second.
		 */
		public static var SECOND:TimePrecision = new TimePrecision(TimeUnit.SECOND);
		
		/**
		 * A minute.
		 */
		
		public static var MINUTE:TimePrecision = new TimePrecision(TimeUnit.MINUTE);
		
		/**
		 * A calendar hour.
		 */
		public static var CALENDAR_HOUR:TimePrecision = new TimePrecision(TimeUnit.CALENDAR_HOUR);
		/**
		 * An hour as elapsed time.
		 */
		public static var HOUR:TimePrecision = new TimePrecision(TimeUnit.HOUR);
		
		/**
		 * A calendar hour.  
		 */
		public static var HOUR_CALENDAR:TimePrecision = new TimePrecision(TimeUnit.HOUR_CALENDAR);
		
		/**
		 * A day.
		 */
		public static var DAY:TimePrecision = new TimePrecision(TimeUnit.DAY);
		
		/**
		 * A week.
		 */
		public static var WEEK:TimePrecision = new TimePrecision(TimeUnit.WEEK);
		
		/**
		 * A month.
		 */
		public static var MONTH:TimePrecision = new TimePrecision(TimeUnit.MONTH);
		
		/**
		 * A quarter. The first quarter of year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2010-3-31 23:59:59.999.
		 */
		public static var QUARTER:TimePrecision = new TimePrecision(TimeUnit.QUARTER);
		
		/**
		 * A half-year or semester. The first half of year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2010-7-31 23:59:59.999.
		 */
		public static var HALF_YEAR:TimePrecision = new TimePrecision(TimeUnit.HALF_YEAR);
		
		/**
		 * A year. The year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2010-12-31 23:59:59.999.
		 */
		public static var YEAR:TimePrecision = new TimePrecision(TimeUnit.YEAR);
		
		/**
		 * A decade. The decade for the year 2010 starts on
		 * 2010-01-01 00:00:00.000 and ends on 2019-12-31 23:59:59.999.
		 */
		public static var DECADE:TimePrecision = new TimePrecision(TimeUnit.DECADE);
		
		protected var _unit:TimeUnit;
		protected var _steps:Number;
		protected var _referenceDate:Date;

		/**
		 * Constructor 
		 * @param unit
		 * @param steps
		 * @param referenceDate
		 * 
		 */
		public function TimePrecision(unit:TimeUnit, steps:Number = 1, referenceDate:Date = null)
		{
			this._unit = unit;
			this._steps = steps;
			this._referenceDate = referenceDate;
		}

		/**
		 * 
		 * A number associated with <code>unit</code> that 
		 * defines the time precision. For example, to set the
		 * time precision to 4 hours, <code>unit</code> should
		 * be set to <code>TimeUnit.HOUR</code>, and
		 * <code>steps</code> to <code>4</code>. 
		 * 
		 */
		public function get steps():Number
		{
			return _steps;
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function set steps(value:Number):void
		{
			_steps = value;
		}

		/**
		 * 
		 * The time unit of the time precision. 
		 * 
		 */
		public function get unit():TimeUnit
		{
			return _unit;
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function set unit(value:TimeUnit):void
		{
			_unit = value;
		}
		
		/**
		 * 
		 * The date of reference for the definition of the scale.
		 * Defaults to null, which is handled as <code>2000-01-01 00:00:00</code>.
		 * 
		 */		
		public function get referenceDate():Date
		{
			return _referenceDate;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set referenceDate(value:Date):void
		{
			_referenceDate = value;
		}
		
		/**
		 * 
		 * Returns the time value of the precision in milliseconds
		 * 
		 */
		public function toMilliseconds():Number
		{
			return unit.milliseconds * steps;
		}
		
		/**
		 * <p>Parse a precision from a string.</p>
		 * @param s the value to parse. This string has two parts that 
		 * are TimeUnit name and unit steps, separated by ":"<br/><br/>
		 * For example:
		 * <pre>var snappingTimePrecision:TimePrecision = TimePrecision.parsePrecision("DAY:1");</pre>
		 * @param referenceDate the date of reference for the definition of the scale.
		 * Defaults to null, which is handled as <code>2000-01-01 00:00:00</code>.
		 * @return the parsed TimePrecision instance if succeed, an Error is thrown if otherwise.
		 * */
		public static function parsePrecision(s:String, referenceDate:Date = null):TimePrecision
		{
			var arr:Array = s.split(":");
			return new TimePrecision(TimeUnit.parseTimeUnit(arr[0]), Number(arr[1]), referenceDate);
		}
	}
}