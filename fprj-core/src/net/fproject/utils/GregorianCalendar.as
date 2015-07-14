///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.TimePrecision;
	import net.fproject.core.TimeUnit;

	[ResourceBundle("fprjcore")]
	[ResourceBundle("fprjutils")]

	/**
	 * <p>Dispatched when the properties <code>firstDayOfWeek</code> or
	 * <code>minimalDaysInFirstWeek</code> change. Such a change may
	 * occur either when the resource bundle changes or when the user
	 * overrides the property values.</p>
	 * <p>Classes that use <code>GregorianCalendar</code> should listen for this
	 * event and perform the necessary updates.</p>
	 */
	[Event(name="change", type="flash.events.Event")]

	/**
	 * Provides operations for manipulating <code>Date</code> objects.
	 * In particular it implements the computation of the
	 * numbering of the time units which depends on the locale.
	 * @author Bui Sy Nguyen
	 * */
	public class GregorianCalendar extends EventDispatcher
	{
		private var _resourceManager:IResourceManager;
		private var _firstDayOfWeek:Object;
		private var _firstDayOfWeekOverride:Object;
		private var _minimalDaysInFirstWeek:Object;
		private var _minimalDaysInFirstWeekOverride:Object;
		private var _previousStartOfYear:Date;
		private var _previousStartOfYearOffset:Number;
		private static var _defaultReferenceDate:Date;
		private static var _oldDefaultReferenceTimezoneOffset:Number;
		
		private static const DAYS_OF_THE_YEAR_OFFSET:Array =
			[0, 31, 31 + 28, 31 + 28 + 31, 31 + 28 + 31 + 30, 31 + 28 + 31 + 30 + 31,
			31 + 28 + 31 + 30 + 31 + 30, 31 + 28 + 31 + 30 + 31 + 30 + 31,
			31 + 28 + 31 + 30 + 31 + 30 + 31 + 31,
			31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30,
			31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31,
			31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30];
		private static const DAYS_IN_MONTH:Array =
			[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		//public static const DEFAULT_REFERENCE_DATE:Date = new Date(2000, 0, 1, 0, 0, 0, 0);
		public static const DEFAULT_MINIMUM_TIME:Date = new Date(1900, 0);
		public static const DEFAULT_MAXIMUM_TIME:Date = new Date(2100, 0);

		/**
		 * Constructor
		 *
		 */
		public function GregorianCalendar()
		{
			this._resourceManager = ResourceManager.getInstance();
			this._resourceManager.addEventListener(Event.CHANGE,
				this.resourcesChangedHandle, false, 0, true);
			this.resourcesChanged();

		} // end function

		[Bindable("change")]
		/**
		 * <p>Number representing the first day of the week.
		 * The value must be in the range 0 to 6, where 0 corresponds to Sunday.
		 * </p><p>Setting this property changes the definition of weeks.</p>
		 * @default 0
		 * @see #minimalDaysInFirstWeek
		 */
		public function get firstDayOfWeek():Object
		{
			return this._firstDayOfWeek;
		} // end function

		/**
		 *
		 * @private
		 *
		 */
		public function set firstDayOfWeek(value:Object):void
		{
			this._firstDayOfWeekOverride = value;
			this._firstDayOfWeek =
				value != null ? (int(value)) :
				(this._resourceManager.getInt(ResourceUtil.FPRJ_CORE_BUNDLE, "firstDayOfWeek"));
			dispatchEvent(new Event(Event.CHANGE));

		} // end function


		[Bindable("change")]
		/**
		 * <p>Number representing the minimum number of days of a year that must
		 *  be in the first week. The value must be in the range 1 to 7.
		 * In practice the useful values are:
		 * </p><ul>
		 * <li>1 -- The first week of the year is the week that contains Jan 1st.
		 * Used by all countries of the world except those mentioned below.
		 * </li>
		 * <li>4 -- The first week of the year is the week that contains Jan 4th.
		 * This is the recommendation from the ISO 8601:2000 standard. Used by
		 * the following countries (ISO 3166 codes):
		 * AT BE CA CD CH DE DK FI FR IT LI LT LU MC MT NL NO SE SK.
		 * </li>
		 * </ul>
		 * <p>Setting this property changes the definition of weeks.</p>
		 *
		 * @default 1
		 *
		 * @see #firstDayOfWeek
		 *
		 */
		public function get minimalDaysInFirstWeek():Object
		{
			return this._minimalDaysInFirstWeek;
		} // end function

		/**
		 *
		 * @private
		 *
		 */
		public function set minimalDaysInFirstWeek(value:Object):void
		{
			this._minimalDaysInFirstWeekOverride = value;
			this._minimalDaysInFirstWeek =
				value != null ? (int(value)) :
				(this._resourceManager.getInt(ResourceUtil.FPRJ_CORE_BUNDLE,
				"minimal.days.in.first.week"));
			dispatchEvent(new Event(Event.CHANGE));
		} // end function

		/**
		 * Returns the floor of a <code>Date</code> for a time precision.
		 * The floor is the closest <code>Date</code> in the scale defined
		 * by a time precision and a reference date that is less than or
		 * equal to the specified <code>Date</code>. A time precision is
		 * defined by a number of time units which called <code>steps</code>.<br/>
		 * For example:<br/>
		 * <br/>
		 * <code>2010-1-1 07:30:10</code> floored to a precision of <code>1 hour</code>
		 * gives <code>2010-1-1 07:00:00</code>.<br/>
		 * <code>2010-1-1 07:30:10</code> floored to a precision of <code>4 hours</code>
		 * gives <code>2010-1-1 04:00:00</code>.<br/>
		 * <code>2010-1-1 07:30:10</code> floored to a precision of <code>8 hours</code>
		 * gives <code>2010-1-1 00:00:00</code>.<br/>
		 * <br/>
		 * When unit is <code>TimeUnit.WEEK</code>, the result of this method depends on 
		 * the settings of the properties <code>firstDayOfWeek</code> and 
		 * <code>minimalDaysInFirstWeek</code>.<br/>
		 * @param time The time of interest.
		 * @param unit The time unit of the time precision.
		 * @param steps A number associated with unit that defines the time precision.
		 * For example, to set the time precision to <code>4 hours</code>,
		 * unit should be set to <code>TimeUnit.HOUR</code>, and steps to 4.
		 * @param referenceDate The date of reference for the definition of the scale.
		 * Defaults to null, which is handled as <code>2000-01-01 00:00:00</code>.
		 * 
		 * @return The time floored to <code>steps</code> times <code>unit</code>,
		 * in the scale based on the reference date.
		 *
		 * @see #firstDayOfWeek
		 * @see #minimalDaysInFirstWeek
		 * */
		fproject_internal function floor(time:Date, unit:TimeUnit, steps:Number,
							  referenceDate:Date = null):Date
		{			
			switch (unit)
			{
				case TimeUnit.MILLISECOND:
				{
					return this.floorToMillisecond(time, steps, referenceDate);
				}
				case TimeUnit.SECOND:
				{
					return this.floorToSecond(time, steps, referenceDate);
				}
				case TimeUnit.MINUTE:
				{
					return this.floorToMinute(time, steps, referenceDate);
				}
				case TimeUnit.HOUR:
				{
					return this.floorToHour(time, steps, referenceDate);
				}
				case TimeUnit.CALENDAR_HOUR:
				{
					return this.floorToHourCalendar(time, steps, referenceDate);
				}
				case TimeUnit.DAY:
				{
					return this.floorToDay(time, steps, referenceDate);
				}
				case TimeUnit.WEEK:
				{
					return this.floorToWeek(time, steps, referenceDate);
				}
				case TimeUnit.MONTH:
				{
					return this.floorToMonth(time, steps, referenceDate);
				}
				case TimeUnit.QUARTER:
				{
					return this.floorToMonth(time, steps * 3, referenceDate);
				}
				case TimeUnit.HALF_YEAR:
				{
					return this.floorToMonth(time, steps * 6, referenceDate);
				}
				case TimeUnit.YEAR:
				{
					return this.floorToYear(time, steps, referenceDate);
				}
				case TimeUnit.DECADE:
				{
					return this.floorToYear(time, steps * 10, referenceDate);
				}
				default:
				{
					LoggingUtil.logAndThrowError(GregorianCalendar, ResourceUtil.FPRJ_UTILITIES,
						4, null, ResourceUtil.FPRJ_UTILS_BUNDLE, "unkown.timeunit", [unit]);
					break;
				}
			}
			return null;
		}
		
		/**
		 * Returns the floor of a <code>Date</code> for a time precision.
		 * The floor is the closest <code>Date</code> in the scale defined
		 * by a time precision and a reference date that is less than or
		 * equal to the specified <code>Date</code><br/>
		 * For example:<br/>
		 * <br/>
		 * <code>2010-1-1 07:30:10</code> floored to a precision of <code>1 hour</code>
		 * gives <code>2010-1-1 07:00:00</code>.<br/>
		 * <code>2010-1-1 07:30:10</code> floored to a precision of <code>4 hours</code>
		 * gives <code>2010-1-1 04:00:00</code>.<br/>
		 * <code>2010-1-1 07:30:10</code> floored to a precision of <code>8 hours</code>
		 * gives <code>2010-1-1 00:00:00</code>.<br/>
		 * <br/>
		 * The result of this method depends on the settings of the properties
		 * <code>firstDayOfWeek</code> and <code>minimalDaysInFirstWeek</code>
		 * when unit is <code>TimeUnit.WEEK</code>.<br/>
		 * @param time The time of interest.
		 * @param precision The time precision to measure the floor time. It is definied
		 * by an unit and a number of steps.
		 * For example, to set the time precision to <code>4 hours</code>,
		 * unit should be set to <code>TimeUnit.HOUR</code>, and steps to 4.
		 * @param referenceDate The date of reference for the definition of the scale.
		 * Defaults to null, which is handled as <code>2000-01-01 00:00:00</code>.
		 * @return The time floored to <code>steps</code> times <code>unit</code>,
		 * in the scale based on the reference date.
		 *
		 * @see #firstDayOfWeek
		 * @see #minimalDaysInFirstWeek
		 * */
		public function floor(time:Date, precision:TimePrecision, referenceDate:Date=null):Date
		{
			if(precision != null)
			{
				return this.fproject_internal::floor(time, precision.unit, precision.steps, referenceDate);
			}
			else
			{
				throw new Error(ResourceUtil.getString("nullTimePrecision",
					ResourceUtil.FPRJ_CORE_BUNDLE));
			}			 
		} // end function

		/**
		 * <p>Rounds a time to the nearest time on a time precision scale.
		 * When <code>time</code> is equidistant from its two nearest
		 * times in the precision scale the value is rounded up to the
		 * higher time.</p><p>For example:</p>
		 * <ul>
		 * <li><code>2010-1-1 07:30:10</code> rounded to a precision of
		 * <code>1 hour</code> gives <code>2010-1-1 08:00:00</code>.</li>
		 * <li><code>2010-1-1 07:30:10</code> rounded to a precision of
		 * <code>4 hours</code> gives <code>2010-1-1 08:00:00</code>.</li>
		 * <li><code>2010-1-1 07:30:10</code> rounded to a precision of
		 * <code>8 hours</code> gives <code>2010-1-1 08:00:00</code>.</li>
		 * </ul>
		 *
		 * <p>The result of this method depends on the settings of the
		 * properties <code>firstDayOfWeek</code> and
		 * <code>minimalDaysInFirstWeek</code> when <code>unit</code> is
		 * <code>TimeUnit.WEEK</code>.</p>
		 * @param time The time of interest.
		 * @param precision The time precision to round the time. It is definied
		 * by an unit and a number of steps.
		 * For example, to set the time precision to <code>4 hours</code>,
		 * unit should be set to <code>TimeUnit.HOUR</code>, and steps to 4.
		 *
		 * @return The time rounded to the nearest <code>step</code> times <code>unit</code>.
		 *
		 */
		public function round(time:Date, precision:TimePrecision):Date
		{
			return this.floor(new Date(time.time +
				precision.unit.milliseconds * precision.steps / 2), precision,
				precision.referenceDate);
		} // end function

		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of millisecond.
		 *
		 */
		private function floorToMillisecond(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var diff:Number;
			var elapsedMilliseconds:Number =
				this.getElapsedMilliseconds(referenceDate, time);
			if (referenceDate.time < time.time)
			{
				/*diff =
					referenceDate.milliseconds +
					steps * Math.floor(elapsedMilliseconds / steps);*/
				diff = steps * Math.floor(elapsedMilliseconds / steps);
			}
			else if (referenceDate.time == time.time)
			{
				//diff = referenceDate.milliseconds;
				diff = 0;
			}
			else
			{
				/*diff =
					referenceDate.milliseconds -
					steps * (1 + Math.floor((-elapsedMilliseconds) / steps));*/
				diff = (-steps) * (1 + Math.floor((-elapsedMilliseconds) / steps));
			}
			return new Date(referenceDate.time + diff);
		} // end function

		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of second.
		 *
		 */
		private function floorToSecond(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var diff:Number;
			var elapsedSecond:Number = this.getElapsedSeconds(referenceDate, time);
			if (referenceDate.time < time.time)
			{
				/*diff = referenceDate.seconds + steps * Math.floor(elapsedSecond / steps);*/
				diff = steps * Math.floor(elapsedSecond / steps);
			}
			else if (referenceDate.milliseconds == time.milliseconds)
			{
				/*diff = referenceDate.seconds + steps * Math.floor(elapsedSecond / steps);*/
				diff = steps * Math.floor(elapsedSecond / steps);
			}
			else
			{
				/*diff =
					referenceDate.seconds -
					steps * (1 + Math.floor((-elapsedSecond) / steps));*/
				diff = (-steps) * (1 + Math.floor((-elapsedSecond) / steps));
			}
			return new Date(referenceDate.time + diff * TimeUnit.SECOND.milliseconds);
		} // end function

		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of minute.
		 *
		 */
		private function floorToMinute(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var diff:Number;
			var elapsedMinutes:Number = this.getElapsedMinutes(referenceDate, time);
			if (referenceDate.time < time.time)
			{
				/*diff = referenceDate.minutes + steps * Math.floor(elapsedMinutes / steps);*/
				diff = steps * Math.floor(elapsedMinutes / steps);
			}
			else
			{
				if (referenceDate.seconds == time.seconds &&
					referenceDate.milliseconds == time.milliseconds)
				{
					/*diff =
						referenceDate.minutes + steps * Math.floor(elapsedMinutes / steps);*/
					diff = steps * Math.floor(elapsedMinutes / steps);
				}
				else
				{
					/*diff =
						referenceDate.minutes -
						steps * (1 + Math.floor((-elapsedMinutes) / steps));*/
					diff = (-steps) * (1 + Math.floor((-elapsedMinutes) / steps));
				}
			}
			return new Date(referenceDate.time + diff * TimeUnit.MINUTE.milliseconds);
		} // end function

		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of hour.
		 *
		 */
		private function floorToHour(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var diff:Number;
			var elapsedHours:Number = this.getElapsedHours(referenceDate, time);
			if (referenceDate.time < time.time)
			{
				diff = referenceDate.hours + steps * Math.floor(elapsedHours / steps);
			}
			else
			{
				if (referenceDate.minutes == time.minutes &&
					referenceDate.seconds == time.seconds &&
					referenceDate.milliseconds == time.milliseconds)
				{
					diff = referenceDate.hours + steps * Math.floor(elapsedHours / steps);
				}
				else
				{
					diff =
						referenceDate.hours -
						steps * (1 + Math.floor((-elapsedHours) / steps));
				}
			}
			return new Date(referenceDate.time + diff * TimeUnit.HOUR.milliseconds);
		} // end function

		/**
		 *
		 * Return the time rounded to the nearest <code>steps</code> times of
		 * hours containing in a reference date.<br/>
		 *
		 */
		private function floorToHourCalendar(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var expectedHours:Number =
				referenceDate.hours + time.hours - time.hours % steps;
			/*var dateValue:Date =
				new Date(time.fullYear, time.month, time.date, expectedHours,
				referenceDate.minutes, referenceDate.seconds, referenceDate.milliseconds);
			return this.workAroundBugFP1760(dateValue, expectedHours);*/
			return new Date(time.fullYear, time.month, time.date, expectedHours,
					referenceDate.minutes, referenceDate.seconds, referenceDate.milliseconds);
		} // end function

		
		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of day.
		 *
		 */
		private function floorToDay(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (steps == 1 && referenceDate == null)
			{
				return new Date(time.fullYear, time.month, time.date);
			}
			/*var dateValue:Date = null;
			var refDate:Number = NaN;
			if (steps == 1)
			{
				dateValue =
					new Date(time.fullYear, time.month, time.date, referenceDate.hours,
					referenceDate.minutes, referenceDate.seconds,
					referenceDate.milliseconds);
			}
			else
			{
				var elapsedDays:Number = this.getElapsedDays(referenceDate, time);
				if (referenceDate.time < time.time)
				{
					refDate = referenceDate.date + steps * Math.floor(elapsedDays / steps);
				}
				else
				{
					if (referenceDate.hours == time.hours &&
						referenceDate.minutes == time.minutes &&
						referenceDate.seconds == time.seconds &&
						referenceDate.milliseconds == time.milliseconds)
					{
						refDate =
							referenceDate.date + steps * Math.floor(elapsedDays / steps);
					}
					else
					{
						refDate =
							referenceDate.date -
							steps * (1 + Math.floor((-elapsedDays) / steps));
					}
				}
				dateValue =
					new Date(referenceDate.fullYear, referenceDate.month, refDate,
					referenceDate.hours, referenceDate.minutes, referenceDate.seconds,
					referenceDate.milliseconds);
			}
			return this.workAroundBugFP1760(dateValue, referenceDate.hours);*/
			
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			
			var dateValue:Date = null;
			var diff:Number = NaN;
			if (steps == 1)
			{
				return new Date(time.fullYear, time.month, time.date, referenceDate.hours,
						referenceDate.minutes, referenceDate.seconds,
						referenceDate.milliseconds);
			}
			
			var elapsedDays:Number = this.getElapsedDays(referenceDate, time);
			if (referenceDate.time < time.time || 
				(referenceDate.hours == time.hours &&
				referenceDate.minutes == time.minutes &&
				referenceDate.seconds == time.seconds &&
				referenceDate.milliseconds == time.milliseconds))
			{
				diff =
					referenceDate.date + steps * Math.floor(elapsedDays / steps);
			}
			else
			{
				diff =
					referenceDate.date -
					steps * (1 + Math.floor((-elapsedDays) / steps));
			}
			
			return new Date(referenceDate.fullYear, referenceDate.month, diff,
					referenceDate.hours, referenceDate.minutes, referenceDate.seconds,
					referenceDate.milliseconds);
			
		} // end function

		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of week.
		 *
		 */
		private function floorToWeek(time:Date, steps:Number, referenceDate:Date):Date
		{
			var w:Number = this.getWeek(time);
			var wd:Number = w - (w - 1) % steps;
			if (wd < 1)
			{
				wd = 1;
			}
			var n:Number = 7 * (w - wd) + this.getRelativeDayOfWeek(time);
			/*var dateValue:Date =
				new Date(time.fullYear, time.month, time.date - d, referenceDate.hours,
				referenceDate.minutes, referenceDate.seconds, referenceDate.milliseconds);*/
			if (referenceDate == null)
			{
				var d:Date = new Date(time.fullYear, time.month, time.date);
				return this.addDays(d, -n, true);
			}
			
			return new Date(time.fullYear, time.month, time.date - n, referenceDate.hours,
					referenceDate.minutes, referenceDate.seconds, referenceDate.milliseconds);
			//return this.workAroundBugFP1760(dateValue, referenceDate.hours);
		} // end function

		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of month.
		 *
		 */
		private function floorToMonth(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var month:Number;
			var elapsedMonth:Number = this.getElapsedMonths(referenceDate, time);
			if (referenceDate.time < time.time ||
				(referenceDate.date == time.date &&
				referenceDate.hours == time.hours &&
				referenceDate.minutes == time.minutes &&
				referenceDate.seconds == time.seconds &&
				referenceDate.milliseconds == time.milliseconds))
			{
				month = referenceDate.month + steps * Math.floor(elapsedMonth / steps);
			}
			else
			{
				month =
					referenceDate.month -
					steps * (1 + Math.floor((-elapsedMonth) / steps));
			}
			return new Date(referenceDate.fullYear, month, referenceDate.date,
				referenceDate.hours, referenceDate.minutes, referenceDate.seconds,
				referenceDate.milliseconds);
			//return this.workAroundBugFP1760(d, referenceDate.hours);
		} // end function
				
		/**
		 *
		 *  Return the time rounded to the nearest <code>steps</code> times of year.
		 *
		 */
		private function floorToYear(time:Date, steps:Number, referenceDate:Date):Date
		{
			if (steps == 1 && referenceDate == null) 
			{
				return new Date(time.fullYear, 0, 1);
			}
			if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}
			var d:Number = NaN;
			var d1:Number = this.getElapsedYears(referenceDate, time);
			if (referenceDate.time < time.time
				||(referenceDate.month == time.month &&
					referenceDate.date == time.date &&
					referenceDate.hours == time.hours &&
					referenceDate.minutes == time.minutes &&
					referenceDate.seconds == time.seconds &&
					referenceDate.milliseconds == time.milliseconds))
			{
				d = referenceDate.fullYear + steps * Math.floor(d1 / steps);
			}
			else
			{
				d = referenceDate.fullYear - steps * (1 + Math.floor((-d1) / steps));
			}
			return new Date(d, referenceDate.month, referenceDate.date, referenceDate.hours,
				referenceDate.minutes, referenceDate.seconds, referenceDate.milliseconds);
			//return this.workAroundBugFP1760(floorDate, referenceDate.hours);
		} // end function

		/**
		 * Add a time unit to a <code>Date</code> object. Returns the time
		 * increased by a given amount of time.
		 * @param time The initial time.
		 * @param unit   The time unit for <code>count</code>.
		 * @param count The number of <code>unit</code>s to add to <code>time</code>.
		 * @param reuse Whether to reuse the <code>time</code> or return a new <code>Date</code> 
		 * object. By default a new <code>Date</code> is created.
		 * @return A new <code>Date</code> equivalent to <code>time</code> plus
		 * <code>count</code> times <code>unit</code>.
		 *
		 */
		public function dateAddByTimeUnit(time:Date, unit:TimeUnit, count:Number, reuse:Boolean =
			false):Date
		{
			switch (unit)
			{
				case TimeUnit.MILLISECOND:
				case TimeUnit.SECOND:
				case TimeUnit.MINUTE:
				case TimeUnit.HOUR:
				{
					return this.addConstantUnits(time, unit, count, reuse);
				}
				case TimeUnit.CALENDAR_HOUR:
				{
					return this.addHoursCalendar(time, count, reuse);
				}
				case TimeUnit.DAY:
				{
					return this.addDays(time, count, reuse);
				}
				case TimeUnit.WEEK:
				{
					return this.addDays(time, count * 7, reuse);
				}
				case TimeUnit.MONTH:
				{
					return this.addMonths(time, count, reuse);
				}
				case TimeUnit.QUARTER:
				{
					return this.addMonths(time, count * 3, reuse);
				}
				case TimeUnit.HALF_YEAR:
				{
					return this.addMonths(time, count * 6, reuse);
				}
				case TimeUnit.YEAR:
				{
					return this.addYears(time, count, reuse);
				}
				case TimeUnit.DECADE:
				{
					return this.addYears(time, count * 10, reuse);
				}
				default:
				{
					LoggingUtil.logAndThrowError(GregorianCalendar, ResourceUtil.FPRJ_UTILITIES,
						4, null, ResourceUtil.FPRJ_UTILS_BUNDLE, "unkown.timeunit", [unit]);
					break;
				}
			}
			return null;
		} // end function

		/**
		 *
		 * Add a constant time unit to a <code>Date</code> object.<br/><br/>
		 * A constant time unit is a time unit that contains an constant number of
		 * millisecond. For example:<br/><br/>
		 * Millisecond, second, minute, hour are constant time units.
		 * <br/><br/>
		 * A month is not constant time unit since it may have 28, 29, 30 or 31 days.
		 *
		 */
		private function addConstantUnits(time:Date, unit:TimeUnit, count:Number, reuse:Boolean):Date
		{
			/*var d:Date = null;
			var t:Number = time.time;
			if (reuse)
			{
				time.time = time.time + unit.milliseconds * count;
				d = time;
			}
			else
			{
				d = new Date(time.time + unit.milliseconds * count);
			}
			if (count > 0 && d.time < t)
			{
				d.hours = d.hours + 2;
			}
			return d;*/
			if (reuse) 
			{
				time.time = time.time + unit.milliseconds * count;
				return time;
			}
			return new Date(time.time + unit.milliseconds * count);
		} // end function

		/**
		 * Add a times of hour to a <code>Date</code> object.<br/>
		 */
		private function addHoursCalendar(time:Date, count:Number, reuse:Boolean) : Date
		{
			/*var d:Date = null;
			var h:Number = time.hours + count;
			if (reuse)
			{
				time.hours = h;
				d = time;
			}
			else
			{
				d =
					new Date(time.fullYear, time.month, time.date, h, time.minutes,
					time.seconds, time.milliseconds);
			}
			return this.workAroundBugFP1760(d, h);*/
			
			var d:Date = reuse ? time : new Date(time.time);
			d.hours = d.hours + count;
			return d;
		} // end function

		/**
		 * Add a times of day to a <code>Date</code> object.<br/>
		 */
		public function addDays(time:Date, count:Number, reuse:Boolean=false) : Date
		{
		/*	var d:Date = null;
			var h:Number = time.hours;
			if (reuse)
			{
				time.date = time.date + count;
				d = time;
			}
			else
			{
				d =
					new Date(time.fullYear, time.month, time.date + count, h,
					time.minutes, time.seconds, time.milliseconds);
			}
			return this.workAroundBugFP1760(d, h);*/
					
			var d:Date = reuse ? time : new Date(time.time);
			var tz1:Number = d.timezoneOffset;
			d.time = d.time + count * TimeUnit.DAY.milliseconds;
			var tz2:Number = d.timezoneOffset;
			if (tz2 != tz1)
			{				
				d.time = d.time + (tz2 - tz1) * TimeUnit.MINUTE.milliseconds;
			}
			
			return d;
		} // end function

		/**
		 * Add a times of month to a <code>Date</code> object.<br/>
		 */
		public function addMonths(time:Date, count:Number, reuse:Boolean=false) : Date
		{
			/*var d:Date = null;
			var h:Number = time.hours;
			if (reuse)
			{
				time.month = time.month + count;
				d = time;
			}
			else
			{
				d =
					new Date(time.fullYear, time.month + count, time.date, time.hours,
					time.minutes, time.seconds, time.milliseconds);
			}
			return this.workAroundBugFP1760(d, h);*/
			var d:Date = reuse ? time : new Date(time.time);
			d.month = d.month + count;
			return d;
		} // end function

		/**
		 * Add a times of year to a <code>Date</code> object.<br/>
		 */
		//private function addYears(time:Date, count:Number, reuse:Boolean):Date
		public function addYears(time:Date, count:Number, reuse:Boolean=false) : Date
		{
			/*var d:Date = null;
			var h:Number = time.hours;
			if (reuse)
			{
				time.fullYear = time.fullYear + count;
				d = time;
			}
			else
			{
				d =
					new Date(time.fullYear + count, time.month, time.date, h,
					time.minutes, time.seconds, time.milliseconds);
			}
			return this.workAroundBugFP1760(d, h);*/
			var d:Date = reuse ? time : new Date(time.time);
			d.fullYear = d.fullYear + count;
			return d;
		} // end function

		/**
		 * Returns the index number of week in the year for a given date.
		 * @param value The date of interest.
		 * @param referenceDate The date of reference for the definition of the scale.
		 * Defaults to <code>null</code>, which is handled as <code>2000-01-01 00:00:00</code>
		 *
		 * @return The number of the week for <code>date</code>.
		 *
		 * @see #firstDayOfWeek()
		 * @see #minimalDaysInFirstWeek()
		 */
		public function getWeek(value:Date, referenceDate:Date = null):Number
		{
			/*if (referenceDate == null)
			{
				referenceDate = fproject_internal::getDefaultReferenceDate();
			}*/
			var minDayFirstWeek:Number = this.minimalDaysInFirstWeek as Number;
			var lastWeekDay:Date = this.getLastDayOfWeek(value);
			var floorLastWd:Date = this.floorToYear(lastWeekDay, 1, referenceDate);
			if ((this.getDays(floorLastWd, lastWeekDay) + 1) < minDayFirstWeek)
			{
				floorLastWd = this.addYears(floorLastWd, -1, true);
			}
			var dayAdded:Date = this.addDays(floorLastWd, (minDayFirstWeek - 1), false);
			dayAdded = this.getLastDayOfWeek(dayAdded, true);
			return 1 +
				Math.round((lastWeekDay.time - dayAdded.time) /
				TimeUnit.WEEK.milliseconds);
		} // end function

		/**
		 * Returns the number of days in a year.
		 * @param year The year of interest.
		 * @return The number of days in the year.<br/>
		 * In case of normal year, it is 365.<br/>
		 * In case of leap year, it is 366.
		 */
		public function getDaysInYear(year:Number):Number
		{
			return this.isLeapYear(year) ? (366) : (365);
		} // end function

		/**
		 * Returns the day-index of the year for a given date.
		 * January 1st is the first day of the year. The index number is started from 1.
		 * @param value The date of interest.
		 * @return The number of the day in the year.
		 *
		 */
		public function getDayOfYear(value:Date):Number
		{
			var doy:Number = DAYS_OF_THE_YEAR_OFFSET[value.month] + value.date;

			// If the month is behind February and the year is leap year
			if (value.month > 1 && this.isLeapYear(value.fullYear))
			{
				doy = doy + 1;
			}
			return doy;
		} // end function

		/**
		 * Returns the number of hours elapsed since midnight for a given date.
		 * @param value The date of interest.
		 * @return The number of hours elapsed since midnight.
		 *
		 */
		public function getHoursInDay(value:Date):Number
		{
			var floorTime:Date = this.fproject_internal::floor(value, TimeUnit.DAY, 1);
			return Math.floor((value.time - floorTime.time) / TimeUnit.HOUR.milliseconds);
		} // end function

		/**
		 * Returns the quarter for a given date.
		 * @param value The date of interest.
		 * @return The quarter as a number, one of the four values {1,2,3,4}.
		 *
		 */
		public function getQuarter(value:Date):Number
		{
			return (Math.floor(value.month / 3) + 1);
		} // end function

		/**
		 * Returns the halfyear for a given date.
		 * @param value The date of interest.
		 * @return The halfyear as a number, one of the two values {1,2}.
		 *
		 */
		public function getHalfYear(value:Date):Number
		{
			return value.month < 6 ? (1) : (2);
		} // end function

		/**
		 * Returns the decade for a given date.
		 * @param value The date of interest.
		 * @return The decade for the date.
		 *
		 */
		public function getDecade(value:Date):Number
		{
			return Math.floor(value.fullYear / 10);
		} // end function

		/**
		 * Returns true when a year is a leap year.
		 * @param value The year to test.
		 * @return <code>true</code> if the <code>value</code> is a leap year.
		 *
		 */
		public function isLeapYear(value:Number):Boolean
		{
			if (value % 400 == 0)
			{
				return true;
			}
			if (value % 100 == 0)
			{
				return false;
			}
			if (value % 4 == 0)
			{
				return true;
			}
			return false;
		} // end function

		/**
		 * Returns the number of days in a month from a given year.
		 * @param month The number for the month to test. The value uses the same
		 * convention as for the <code>month</code> field of
		 * <code>Date</code>: ranges from <code>0</code> for January
		 * to <code>11</code> for December.
		 * @param year The full year.
		 * @return The number of days in the specified month for the specified year.
		 *
		 */
		public function getDaysInMonth(month:Number, year:Number):Number
		{
			var dim:Number = DAYS_IN_MONTH[month];
			if (this.isLeapYear(year))
			{
				this.isLeapYear(year);
			}
			if (month == 1)
			{
				dim = dim + 1;
			}
			return dim;
		} // end function

		/**
		 * Get days in month by date instance.
		 * @see #getDaysInMonth()
		 *  */
		fproject_internal function getDaysInMonth(d:Date):Number
		{
			return this.getDaysInMonth(d.month, d.fullYear);
		}
		
		/**
		 * Returns the number of days between two dates, not considering the hour components.
		 *
		 * @param fromDate The first date.
		 * @param toDate The second date.
		 * @return The number of days between the two dates.<br/>
		 * If value of <code>toDate</code> is before <code>fromDate</code>,
		 * the two parameters will be swapped.
		 */
		public function getDays(fromDate:Date, toDate:Date):Number
		{
			if (fromDate > toDate)
			{
				var swapper:Date = fromDate;
				fromDate = toDate;
				toDate = swapper;
			}
			var days:Number = this.getDayOfYear(toDate) - this.getDayOfYear(fromDate);
			var toYear:Number = toDate.fullYear;
			var year:Number = fromDate.fullYear;
			while (year < toYear)
			{
				days = days + this.getDaysInYear(year);
				year = year + 1;
			}
			return days;
		} // end function

		/**
		 * Returns the value of a predefined time unit for a given date.
		 * @param time The date of interest.
		 * @param unit The time unit of interest.
		 * @param startOfYear A sample date that defines the start of the year.
		 * When <code>null</code> the year starts on January 1st.
		 *
		 * @return The value of <code>unit</code> for <code>date</code>.
		 *
		 */
		public function getUnitValue(time:Date, unit:TimeUnit, startOfYear:Date =
			null):Number
		{
			if (startOfYear == null)
			{
				return this.getPredefinedUnitValue(time, unit);
			}
			return this.getShiftedUnitValue(time, unit, startOfYear);
		} // end function

		public function getPredefinedUnitValue(time:Date, unit:TimeUnit):Number
		{
			switch (unit)
			{
				case TimeUnit.MILLISECOND:
				{
					return time.milliseconds;
				}
				case TimeUnit.SECOND:
				{
					return time.seconds;
				}
				case TimeUnit.MINUTE:
				{
					return time.minutes;
				}
				case TimeUnit.HOUR:
				{
					return this.getHoursInDay(time);
				}
				case TimeUnit.CALENDAR_HOUR:
				{
					return time.hours;
				}
				case TimeUnit.DAY:
				{
					return time.date;
				}
				case TimeUnit.WEEK:
				{
					return this.getWeek(time);
				}
				case TimeUnit.MONTH:
				{
					return time.month;
				}
				case TimeUnit.QUARTER:
				{
					return this.getQuarter(time);
				}
				case TimeUnit.HALF_YEAR:
				{
					return this.getHalfYear(time);
				}
				case TimeUnit.YEAR:
				{
					return time.fullYear;
				}
				case TimeUnit.DECADE:
				{
					return this.getDecade(time);
				}
				default:
				{
					LoggingUtil.logAndThrowError(GregorianCalendar, ResourceUtil.FPRJ_UTILITIES,
						4, null, ResourceUtil.FPRJ_UTILS_BUNDLE, "unkown.timeunit", [unit]);
					break;
				}
			}
			return NaN;
		} // end function

		/**
		 *
		 * @private
		 *
		 */
		private function getShiftedUnitValue(date:Date, unit:TimeUnit, startOfYear:Date):Number
		{
			if (this._previousStartOfYear == null ||
				this._previousStartOfYear.time != startOfYear.time)
			{
				this._previousStartOfYear = new Date(startOfYear);
				var toDate:Date = new Date(1999, startOfYear.month, startOfYear.date);
				var originDate:Date = new Date(1999, 0, 1);
				this._previousStartOfYearOffset = toDate.time - originDate.time;
			}
			var unitTime:Number = date.time - this._previousStartOfYearOffset;
			if (this.isLeapYear(date.fullYear))
			{
				this.isLeapYear(date.fullYear);
			}
			if (date.month > 1)
			{
				unitTime = unitTime - 24 * 3600 * 1000;
			}
			return this.getPredefinedUnitValue(new Date(unitTime), unit);
		} // end function

		/**
		 * Returns the number of elapsed time units between two dates.
		 * @param fromDate The first date.
		 * @param toDate The second date.
		 * @param unit The time unit of interest.
		 * @return The number of <code>unit</code> elapsed between the two dates.
		 *
		 */
		public function getElapsedUnits(fromDate:Date, toDate:Date, unit:TimeUnit):Number
		{
			switch (unit)
			{
				case TimeUnit.MILLISECOND:
				{
					return this.getElapsedMilliseconds(fromDate, toDate);
				}
				case TimeUnit.SECOND:
				{
					return this.getElapsedSeconds(fromDate, toDate);
				}
				case TimeUnit.MINUTE:
				{
					return this.getElapsedMinutes(fromDate, toDate);
				}
				case TimeUnit.HOUR:
				{
					return this.getElapsedHours(fromDate, toDate);
				}
				case TimeUnit.CALENDAR_HOUR:
				{
					return this.getElapsedCalendarHours(fromDate, toDate);
				}
				case TimeUnit.DAY:
				{
					return this.getElapsedDays(fromDate, toDate);
				}
				case TimeUnit.WEEK:
				{
					return this.getElapsedWeeks(fromDate, toDate);
				}
				case TimeUnit.MONTH:
				{
					return this.getElapsedMonths(fromDate, toDate);
				}
				case TimeUnit.QUARTER:
				{
					return this.getElapsedQuarters(fromDate, toDate);
				}
				case TimeUnit.HALF_YEAR:
				{
					return this.getElapsedHalfYears(fromDate, toDate);
				}
				case TimeUnit.YEAR:
				{
					return this.getElapsedYears(fromDate, toDate);
				}
				case TimeUnit.DECADE:
				{
					return this.getElapsedDecades(fromDate, toDate);
				}
				default:
				{
					throw new Error("Unknown TimeUnit: " + TimeUnit);
					break;
				}
			}
		} // end function

		/**
		 * Get elapsed milliseconds from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed milliseconds.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedMilliseconds(fromDate:Date, toDate:Date):Number
		{
			/*var noSwapped:Boolean = true;
			if (fromDate > toDate)
			{
				var swapper:Date = fromDate;
				fromDate = toDate;
				toDate = swapper;
				noSwapped = false;
			}
			var elapsedMillis:Number = toDate.time - fromDate.time;
			return noSwapped ? (elapsedMillis) : (-elapsedMillis);*/
			return toDate.time - fromDate.time;
		} // end function

		/**
		 * Get elapsed seconds from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed seconds.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedSeconds(fromDate:Date, toDate:Date):Number
		{
			var ellapsedMillis:Number = getElapsedMilliseconds(fromDate, toDate);
			if (ellapsedMillis < 0)
				return -Math.floor((-ellapsedMillis) / TimeUnit.SECOND.milliseconds);
			else
				return Math.floor(ellapsedMillis / TimeUnit.SECOND.milliseconds);
		} // end function

		/**
		 * Get elapsed monutes from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed minutes.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedMinutes(fromDate:Date, toDate:Date):Number
		{
			var ellapsedMillis:Number = getElapsedMilliseconds(fromDate, toDate);
			if (ellapsedMillis < 0)
				return -Math.floor((-ellapsedMillis) / TimeUnit.MINUTE.milliseconds);
			else
				return Math.floor(ellapsedMillis / TimeUnit.MINUTE.milliseconds);
		} // end function

		/**
		 * Get elapsed hours from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed hours.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedHours(fromDate:Date, toDate:Date):Number
		{
			var ellapsedMillis:Number = getElapsedMilliseconds(fromDate, toDate);
			if (ellapsedMillis < 0)
				return -Math.floor((-ellapsedMillis) / TimeUnit.HOUR.milliseconds);
			else
				return Math.floor(ellapsedMillis / TimeUnit.HOUR.milliseconds);
		} // end function

		/**
		 * Get elapsed hours on System's calendar from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed hours.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedCalendarHours(fromDate:Date, toDate:Date):Number
		{
			var elapsedHours:Number = this.getElapsedHours(fromDate, toDate);
			var tzOfs:Number = toDate.timezoneOffset - fromDate.timezoneOffset;
			if (fromDate > toDate)
				elapsedHours = elapsedHours + Math.floor((-tzOfs)/60);
			else
				elapsedHours = elapsedHours - Math.floor(tzOfs/60);
			return elapsedHours;
		} // end function

		/**
		 * Get elapsed days from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed days.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedDays(fromDate:Date, toDate:Date):Number
		{
			var ellapsedMillis:Number = getElapsedMilliseconds(fromDate, toDate);
			if (ellapsedMillis < 0)
				return -Math.floor((-ellapsedMillis) / TimeUnit.DAY.milliseconds);
			else
				return Math.floor(ellapsedMillis / TimeUnit.DAY.milliseconds);
		} // end function

		/**
		 * Get elapsed weeks from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed weeks.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedWeeks(fromDate:Date, toDate:Date):Number
		{
			var ellapsedMillis:Number = getElapsedMilliseconds(fromDate, toDate);
			if (ellapsedMillis < 0)
				return -Math.floor((-ellapsedMillis) / TimeUnit.WEEK.milliseconds);
			else
				return Math.floor(ellapsedMillis / TimeUnit.WEEK.milliseconds);
		} // end function

		/**
		 * Get elapsed months from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed months.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedMonths(fromDate:Date, toDate:Date):Number
		{
			var noSwapped:Boolean = true;
			if (fromDate > toDate)
			{
				var swapper:Date = fromDate;
				fromDate = toDate;
				toDate = swapper;
				noSwapped = false;
			}
			var monthDiff:Number = 12 * (toDate.fullYear - fromDate.fullYear);
			monthDiff = monthDiff + (toDate.month - fromDate.month);
			if ((toDate.date < fromDate.date &&
				toDate.date != this.getDaysInMonth(toDate.month, toDate.fullYear))
				||(toDate.date == fromDate.date &&
				DateTimeUtil.getTimeInMillis(toDate) < DateTimeUtil.getTimeInMillis(fromDate)))
			{
				monthDiff = monthDiff - 1;
			}
			return noSwapped ? monthDiff : (-monthDiff);
		} // end function


		/**
		 * Get elapsed quarters from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed quarters.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedQuarters(fromDate:Date, toDate:Date):Number
		{
			var n:Number = this.getElapsedMonths(fromDate, toDate);
			return n < 0? -Math.floor((-n) / 3) : Math.floor(n / 3);
		} // end function

		/**
		 * Get elapsed half-years from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed half-years.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedHalfYears(fromDate:Date, toDate:Date):Number
		{
			var n:Number = this.getElapsedMonths(fromDate, toDate);
			return n < 0? -Math.floor((-n) / 6) : Math.floor(n / 6);
		} // end function

		/**
		 * Get elapsed years from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed years.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedYears(fromDate:Date, toDate:Date):Number
		{
			var elapsedYears:Number = NaN;
			var noSwapped:Boolean = true;
			if (fromDate > toDate)
			{
				var swapper:Date = fromDate;
				fromDate = toDate;
				toDate = swapper;
				noSwapped = false;
			}
			if (fromDate.fullYear == toDate.fullYear)
			{
				elapsedYears = 0;
			}
			else
			{
				elapsedYears = toDate.fullYear - fromDate.fullYear;
				var toDayOfLeapYear:Number = this.getDayOfLeapYear(toDate);
				var fromDayOfLeapYear:Number = this.getDayOfLeapYear(fromDate);
				if (toDayOfLeapYear < fromDayOfLeapYear)
				{
					elapsedYears = elapsedYears - 1;
				}
				else
				{
					if (toDayOfLeapYear == fromDayOfLeapYear &&
						DateTimeUtil.getTimeInMillis(toDate) <
						DateTimeUtil.getTimeInMillis(fromDate))
					{
						elapsedYears = elapsedYears - 1;
					}
				}
			}
			return noSwapped ? elapsedYears : (-elapsedYears);
		} // end function

		/**
		 * Get index number of a day in leap year
		 * @param value the date interest.
		 * @return index of the day in leap year.
		 *
		 */
		private function getDayOfLeapYear(value:Date):Number
		{
			var dayOfLeapYear:Number = DAYS_OF_THE_YEAR_OFFSET[value.month] + value.date;
			if (value.month > 1)
			{
				dayOfLeapYear = dayOfLeapYear + 1;
			}
			return dayOfLeapYear;
		} // end function

		/**
		 * Get elapsed decades from a date to another date.
		 * @param fromDate the from-date
		 * @param toDate the to-date
		 * @return The elapsed decades.
		 * If the <code>toDate</code> is before <code>fromDate</code>,
		 * the return value is a negative number.
		 *
		 */
		public function getElapsedDecades(fromDate:Date, toDate:Date):Number
		{
			var n:Number = this.getElapsedYears(fromDate, toDate);
			return n < 0? -Math.floor((-n) / 10) : Math.floor(n / 10);
		} // end function

		/**
		 * Returns last day of a week that contains a given day.
		 * @param value The day belongs to the week.
		 * @param reuse Whether to reuse the <code>value</code> or return a new <code>Date</code> object.
		 * By default a new <code>Date</code> is created.
		 *
		 */
		public function getLastDayOfWeek(value:Date, reuse:Boolean = false):Date
		{
			return this.addDays(value, 6 - this.getRelativeDayOfWeek(value), reuse);
		} // end function

		/**
		 * Return the relative day of week for a given day.<br/><br/>
		 * By default, system defines 0 for Sunday, 1 for Monday, and so on. But sometimes
		 * we have needs of re-defining the first day of week, and then need this relative
		 * day of week value.
		 * @param value The original day.
		 * @return The relative day of week for a given day.
		 *
		 */
		public function getRelativeDayOfWeek(value:Date):Number
		{
			var relativeDow:Number = value.day - int(this.firstDayOfWeek);
			if (relativeDow < 0)
			{
				relativeDow = relativeDow + 7;
			}
			return relativeDow;
		} // end function

		/*private function getTimeInMillis(value:Date):Number
		{
			return value.hours * TimeUnit.HOUR.milliseconds +
				value.minutes * TimeUnit.MINUTE.milliseconds +
				value.seconds * TimeUnit.SECOND.milliseconds + value.milliseconds;
		}*/ // end function

		/**
		 * Work around bug FP1760 of Adobe Flash Player
		 * @param value the date
		 * @param expectedHours expected hours
		 * @return  the corrected date value that have bug FP1760
		 *
		 */
		/*private function workAroundBugFP1760(value:Date, expectedHours:Number):Date
		{
			if (expectedHours % 24 == 0 && value.hours != 0)
			{
				value.hours = value.hours + 2;
			}
			return value;
		}*/ // end function

		/**
		 *
		 * @private
		 *
		 */
		private function resourcesChangedHandle(event:Event):void
		{
			this.resourcesChanged();
		} // end function

		/**
		 *
		 * @private
		 *
		 */
		private function resourcesChanged():void
		{
			this.firstDayOfWeek = this._firstDayOfWeekOverride;
			this.minimalDaysInFirstWeek = this._minimalDaysInFirstWeekOverride;
		} // end function

		fproject_internal static function getDefaultReferenceDate() : Date
		{
			if (_defaultReferenceDate == null || 
				(_defaultReferenceDate.timezoneOffset != _oldDefaultReferenceTimezoneOffset)) 
			{
				_defaultReferenceDate = new Date(2000, 0, 1, 0, 0, 0, 0);
				_oldDefaultReferenceTimezoneOffset = _defaultReferenceDate.timezoneOffset;
			}
			return _defaultReferenceDate;
		}// end function
	}
}
