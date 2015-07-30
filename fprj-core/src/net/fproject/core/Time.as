///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{

	/**
	 * Represents a time in a day.<br/><br/>
	 * The time is based on milliseconds from midnight.<br/>
	 * A <code>Time</code> object is composed of four values:
	 * <ul>
	 * <li><code>hour</code>: The hour value, which has value from 0 to 23</li>
	 * <li><code>minute</code>: The minute value, which has value from 0 to 59</li>
	 * <li><code>second</code>: The second value, which has value from 0 to 59</li>
	 * <li><code>millisecond</code>: The millisecond value, which has value from 0 to 999</li>
	 * </ul>
	 * @author Bui Sy Nguyen
	 *
	 */
	public class Time
	{
		/**
		 * The milliseconds from midnight.
		 */
		protected var _millisecondsFromMidnight:Number;

		/**
		 *  The millisecond value, which has value from 0 to 999
		 *
		 */
		public function get millisecond():Number
		{
			return (_millisecondsFromMidnight % 1000);
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set millisecond(value:Number):void
		{
			_millisecondsFromMidnight =
				_millisecondsFromMidnight - (_millisecondsFromMidnight % 1000) +
				value % 1000;
		}

		/**
		 *
		 *  The second value, which has value from 0 to 59
		 *
		 */
		public function get second():Number
		{
			return int((_millisecondsFromMidnight % 60000) / 1000);
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set second(value:Number):void
		{
			_millisecondsFromMidnight =
				_millisecondsFromMidnight - (_millisecondsFromMidnight % 60000) +
				(value % 60) * 1000 + _millisecondsFromMidnight % 1000;
		}

		/**
		 *
		 *  The minute value, which has value from 0 to 59
		 *
		 */
		public function get minute():Number
		{
			return int((_millisecondsFromMidnight % 3600000) / 60000);
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set minute(value:Number):void
		{
			_millisecondsFromMidnight =
				this.hour * 3600000 + (value % 60) * 60000 +
				_millisecondsFromMidnight % 60000;
		}

		/**
		 * The hour value, which has value from 0 to 23.
		 *
		 */
		public function get hour():Number
		{
			return int(_millisecondsFromMidnight / 3600000);
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set hour(value:Number):void
		{
			_millisecondsFromMidnight =
				_millisecondsFromMidnight % 3600000 + (value % 24) * 3600000;
		}

		public function get millisecondsFromMidnight():Number
		{
			return millisecond + second * 1000 + minute * 60000 + hour * 3600000;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set millisecondsFromMidnight(value:Number):void
		{
			_millisecondsFromMidnight = value;
		}

		/**
		 * Constructor
		 *
		 * @param hourOrMilliseconds This parameter is used to set the raw-value in
		 * milliseconds from midnight if none of other parameters
		 * (minute, second, millisecond) are passed.<br/>
		 * In case of there be one of parameters minute, second, millisecond is
		 * passed, this parameter is the hour (from 0 to 23). In this case, if the
		 * value is not less than 24, the modulo for 24 will be used.
		 * @param minute The minute (from 0 to 59). If the
		 * value is not less than 60, the modulo for 60 will be used.
		 * @param second The second (from 0 to 59). If the
		 * value is not less than 60, the modulo for 60 will be used.
		 * @param millisecond The millisecond (from 0 to 999). If the
		 * value is not less than 1000, the modulo for 1000 will be used.
		 *
		 */
		public function Time(hourOrMilliseconds:Number = NaN, minute:Number = NaN,
			second:Number = NaN, millisecond:Number = NaN)
		{
			if (isNaN(hourOrMilliseconds))
				hourOrMilliseconds = 0;
			if (isNaN(minute) && isNaN(second) && isNaN(millisecond))
			{
				_millisecondsFromMidnight = hourOrMilliseconds;
			}
			else
			{
				if (isNaN(minute))
					minute = 0;
				if (isNaN(second))
					second = 0;
				if (isNaN(millisecond))
					millisecond = 0;

				_millisecondsFromMidnight =
					(millisecond % 1000) + (second % 60) * 1000 + (minute % 60) * 60000 +
					(hourOrMilliseconds % 24) * 3600000;
			}
		}

		/**
		 * Parse a <code>String</code> value to <code>Time</code> object.
		 * @param s a <code>String</code> represents a <code>Time</code> object.<br/>
		 * It must be matched this regular expression:<br/>
		 * <pre>/^[0-9]{1,2}:[0-9]{1,2}(|:[0-9]{1,2}(|(:|\.){1}[0-9]{1,3})) &#42;(AM|PM){0,1}$/
		 * </pre>
		 * @return the <code>Time</code> object if succeed.<br/>
		 * <code>null</code> if failed.
		 *
		 */
		public static function parseTime(s:String):Time
		{
			if (s == null)
				return null;
			var strTime:String = s.toLowerCase(); // use the input parameter as read-only
			if (strTime.
				search("^[0-9]{1,2}:[0-9]{1,2}(|:[0-9]{1,2}(|(:|\.){1}[0-9]{1,3})) *(am|pm){0,1}$") !=
				-1)
			{
				if (strTime.substring(strTime.length - 2) == "am" ||
					strTime.substring(strTime.length - 2) == "pm")
				{
					strTime = strTime.substr(0, strTime.length - 2);
				}
				var pieces:Array = strTime.split(/:|\./)
				var hour:Number = pieces.length > 0 ? int(pieces[0]) % 24 : 0;
				if (s.substring(s.length - 2).toLowerCase() == "pm" && hour < 12)
					hour += 12; // AM
				else if (s.substring(s.length - 2).toLowerCase() == "am" && hour == 12)
					hour = 0;

				var minute:Number = pieces.length > 1 ? int(pieces[1]) % 60 : 0;
				var second:Number =
					pieces.length > 2 ?
					int((pieces[2] as String).replace(" *(am|pm)", "")) % 60 : 0;
				var millisecond:Number =
					pieces.length > 3 ?
					int((pieces[3] as String).replace(" *(am|pm)*", "")) % 1000 : 0;

				return new Time(hour, minute, second, millisecond);
			}
			return null;
		}

		/**
		 * Convert time in milliseconds to time-serial value.
		 *
		 * @return The time-serial value in one of these formats:<br/>
		 * <code>HH:MM:SS.mmm</code><br/>
		 * <code>HH:MM:SS</code><br/>
		 * <code>HH:MM</code><br/>
		 * <code>HH</code><br/>
		 */
		public function toString():String
		{
			var time:Number = _millisecondsFromMidnight;
			var hours:int = this.hour;
			time = time - hours * 3600000;
			if (time == 0)
			{
				return formatNumber(hours) + ":00";
			}
			var minutes:int = int(time / 60000);
			time = time - minutes * 60000;
			if (time == 0)
			{
				return formatNumber(hours) + ":" + formatNumber(minutes);
			}
			var seconds:int = int(time / 1000);
			time = time - seconds * 1000;
			return time == 0 ?
				(formatNumber(hours) + ":" + formatNumber(minutes) + ":" +
				formatNumber(seconds)) :
				(formatNumber(hours) + ":" + formatNumber(minutes) + ":" +
				formatNumber(seconds) + ":" + formatNumber(time));
		} // end function

		/**
		 * Format a number with a zero-padding.
		 * @param n The interest number
		 * @return A string with a zero-padding.
		 *
		 */
		private static function formatNumber(n:Number):String
		{
			if (n < 10)
			{
				return "0" + n.toString();
			}
			return n.toString();
		} // end function
		
		/**
		 * Equal comparision. 
		 * @param o The target object to compare to this Time object.
		 * @return <code>true</code> if this Time object equals the target object.
		 * <code>false</code> if otherwise.
		 * 
		 */
		public function equals(o:Object):Boolean
		{
			if (o is Time)
			{
				return Time(o).millisecondsFromMidnight == _millisecondsFromMidnight;
			}
			else
			{
				var t:Time = Time.parseTime(o.toString());
				return (t != null && t.millisecondsFromMidnight == _millisecondsFromMidnight);
			}
		}
		
		/**
		 * Order comparision this time to another time object. 
		 * @param o The target object to compare to this Time object.
		 * @return <code>true</code> if this Time object is before the target object.
		 * <code>false</code> if otherwise.
		 * 
		 */
		public function isBefore(o:Time):Boolean
		{
			if(o != null)
			{
				return this.millisecondsFromMidnight < o.millisecondsFromMidnight;
			}
			return false;
		}
	}
}