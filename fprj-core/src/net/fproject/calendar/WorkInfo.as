///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.calendar
{
	import net.fproject.fproject_internal;
	import net.fproject.core.Time;
	import net.fproject.core.TimeRange;
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.GregorianCalendar;
	import net.fproject.utils.MessageUtil;
	
	use namespace fproject_internal;
	
	/**
	 *
	 * Base class represents a time period of a <code>WorkCalendar</code>.<br/><br/>
	 * This class is used for internal purpose.
	 *
	 * @see PeriodInternal
	 * @see WeekDayInternal
	 */
	internal class WorkInfo
	{
		protected var _workCalendar:WorkCalendar;
		protected var _workShifts:Vector.<WorkShift>;
		/**
		 * Indicates whether this period is working period or not.
		 */
		internal var isWorking:Boolean;
		
		/**
		 * Indicates wheher this period is inherited period or not.<br/>
		 * <br/>
		 * A period is standard if it is inherited from base calendar.
		 */
		internal var isInherited:Boolean;
		
		/**
		 * Constructor
		 * @param calendar The work calendar that owns this period.
		 * @param createDefaultShifts If <code>true</code>, the default workshifts
		 * will be created.
		 *
		 */
		function WorkInfo(calendar:WorkCalendar, working:Boolean)
		{
			this._workCalendar = calendar;
			this.isWorking = working;
			this._workShifts = new Vector.<WorkShift>();
			if (working)
			{
				this._workShifts = WorkShift.copy(calendar.defaultWorkShifts);
			}
		}
		
		/**
		 * The Gregorian Calendar of associated with the work calendar
		 * that owns this period.
		 *
		 */
		internal function get gregorianCalendar():GregorianCalendar
		{
			return this._workCalendar._gregorianCalendar;
		}
		
		/**
		 *
		 * The work calendar that owns this period.
		 */
		internal function get workCalendar():WorkCalendar
		{
			return this._workCalendar;
		}
		
		/**
		 * The work shifts of this period.
		 *
		 */
		internal function get workShifts():Vector.<WorkShift>
		{
			return this._workShifts;
		}
		
		/**
		 *
		 * Return the work shifts array cloned from this period's work shifts.
		 */
		internal function getClonedWorkShifts():Vector.<WorkShift>
		{
			return WorkShift.copy(this._workShifts);
		}
		
		/**
		 *
		 * Check whether this period is all-day working period.
		 *
		 */
		internal function is24HoursWork():Boolean
		{
			if (this.isWorking && this._workShifts.length == 1)
			{
				var wt:WorkShift = this._workShifts[0];
				return wt.startTime == 0 && wt.endTime == TimeUnit.DAY.milliseconds;
			}
			return false;
			
		}
		
		/**
		 *
		 * Get total working time in one day, in milliseconds
		 *
		 */
		internal function get totalWorkInOneDay():Number
		{
			if (!this.isWorking)
			{
				return 0;
			}
			var wrkInOneDay:Number = 0;
			var len:uint = this._workShifts.length;
			for (var i:uint = 0; i < len; i++)
			{
				wrkInOneDay = wrkInOneDay + this._workShifts[i].duration;
			}
			return wrkInOneDay;
		}
		
		/**
		 * Get total work at a day.
		 * @param d The day (date-time) interest.
		 * @return Total work at a day.
		 *
		 */
		internal function getTotalWorkAtDay(d:Date):Number
		{
			if (!isWorking)
				return 0;
			
			var len:uint = this._workShifts.length;
			var totalWork:Number = 0;
			for (var i:uint = 0; i < len; i++)
			{
				var wt:WorkShift = this._workShifts[i];
				totalWork += wt.endTime - wt.startTime;
			}
			
			return totalWork;
		}
		
		/**
		 * Get total work between two hours.
		 * @param t1 The first time represents the first hour to count.
		 * @param t2 The second time represents the second hour to count.
		 * @return Total work between the two hours.
		 *
		 */
		internal function getTotalWorkBetweenHours(t1:Date, t2:Date):Number
		{
			if (!this.isWorking || t1.time == t2.time)
			{
				return 0;
			}
			if (t1 > t2)
			{
				throw MessageUtil.wrongArgument(WorkInfo,
					"PeriodInternalBase.getTotalWorkBetweenHours", "t1 > t2");
			}
			var todStart:Number = DateTimeUtil.fproject_internal::getTimeOfDayInMillis(t1);
			var todEnd:Number = DateTimeUtil.fproject_internal::getTimeOfDayInMillis(t2);
			if (DateTimeUtil.fproject_internal::getTimeOfDayInMillis(t2) == 0)
			{
				todEnd = TimeUnit.DAY.milliseconds;
			}
			var n:Number = 0;
			var len:uint = this._workShifts.length;
			for (var i:uint = 0; i < len; i++)
			{				
				var shift:WorkShift = this._workShifts[i];
				var shiftStart:Number = shift.startTime;
				var shiftEnd:Number = shift.endTime;
				if (todStart < shiftEnd)
				{
					if (todStart < shiftStart)
					{
						todStart = shiftStart;
					}
					if (todEnd < shiftStart)
					{
						todEnd = shiftStart;
					}
					if (todEnd <= shiftEnd)
					{
						n+= todEnd - todStart;
						break;
					}
					n+= shiftEnd - todStart;
					todStart = shiftEnd;
				}
			}
			return n;
		}
		
		/**
		 * Add a work duration begin from a given time to this period.
		 * @param time The time interest.
		 * @param duration The work duration in milliseconds.
		 * @return The actual duration added to this period.
		 *
		 */
		internal function addWork(time:Date, duration:Number):Number
		{
			if (duration == 0)
			{
				return 0;
			}
			//var startTimeOfDay:Date = DateTimeUtil.getStartOfDay(time);
			var dayStart:Date = this.gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1);
			if (!this.isWorking)
			{
				time.time = dayStart.time;
				this.gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.DAY, 1, true);
				return duration;
			}
			var t1:Number = time.time - dayStart.time;
			var t2:Number = TimeUnit.DAY.milliseconds;
			var inShift:Boolean = true;
			var end:Number = NaN;
			var len:uint = this._workShifts.length;
			for (var i:uint = 0; i < len; i++)
			{
				var shift:WorkShift = this._workShifts[i];
				var start:Number = shift.startTime;
				
				if (inShift)
				{
					if (t1 <= shift.endTime)
					{
						inShift = false;
						if (t1 < start)
						{
							t1 = start;
						}
						if (duration != 0)
						{
							end = shift.endTime - t1;
							if (duration < end)
							{
								end = duration;
							}
							duration = duration - end;
							t2 = t1 + end;
						}
						if (duration == 0)
						{
							break;
						}
					}
				}
				else
				{
					t1 = start;
					if (duration != 0)
					{
						end = shift.endTime - t1;
						if (duration < end)
						{
							end = duration;
						}
						duration = duration - end;
						t2 = t1 + end;
					}
					if (duration == 0)
					{
						break;
					}
				}
			}
			//time.time = startTimeOfDay.time + t2;
			DateTimeUtil.setTimeOfDayInMillis(time, t2);
			return duration
		}
		
		/**
		 * Remove a work duration value from a time belongs to this period.
		 * @param time The time interest.
		 * @param duration The work duration value.
		 * @return The actual duration removed from the this period begin at the
		 * specified time.
		 *
		 */
		internal function removeWork(time:Date, duration:Number):Number
		{
			if (duration == 0)
			{
				return 0;
			}
			//var dayStart:Date = DateTimeUtil.getStartOfDay(time);
			var dayStart:Date = this.gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1);
			if (!this.isWorking)
			{
				time.time = dayStart.time;
				return duration;
			}
			//var timeInMilis:Number = time.time - dayStart.time;
			var timeInMilis:Number = DateTimeUtil.getTimeOfDayInMillis(time);
			
			if (timeInMilis == 0)
			{
				timeInMilis = TimeUnit.DAY.milliseconds;
				this.gregorianCalendar.dateAddByTimeUnit(dayStart,
					TimeUnit.DAY, -1, true);
				//20130503 Added
				dayStart = this.gregorianCalendar.fproject_internal::floor(dayStart, TimeUnit.DAY, 1);
			}
			var dt:Number = 0;
			var b:Boolean = true;
			for (var i:int = this._workShifts.length - 1; i >= 0; i--)
			{
				var d:Number = NaN;
				var ws:WorkShift = this._workShifts[i];
				if (b)
				{
					if (timeInMilis > ws.startTime)
					{
						b = false;
						if (timeInMilis > ws.endTime)
						{
							timeInMilis = ws.endTime;
						}
						if (duration != 0)
						{
							d = timeInMilis - ws.startTime;
							if (duration < d)
							{
								d = duration;
							}
							duration = duration - d;
							dt = timeInMilis - d;
						}
						if (duration == 0)
						{
							break;
						}
					}
				}
				else
				{
					timeInMilis = ws.endTime;
					if (duration != 0)
					{
						d = timeInMilis - ws.startTime;
						if (duration < d)
						{
							d = duration;
						}
						duration = duration - d;
						dt = timeInMilis - d;
					}
					if (duration == 0)
					{
						break;
					}
				}
			}
			//time.time = dayStart.time + dt;
			DateTimeUtil.setTimeOfDayInMillis(time, dt);
			return duration;
		}
		
		/**
		 * Get total working time between two specified dates.
		 * @param start the start date
		 * @param end the end date
		 * @return The total working time between two specified dates in
		 * milliseconds.
		 *
		 */
		// Must inherit
		internal function getTotalWorkBetween(start:Date, end:Date):Number
		{
			throw new Error();
		}
		
		/**
		 * Compute next WT and fill in to the time that input as from time
		 * @param time the in/output time.
		 * @return true if there's a next WT follows <code>time</code>.
		 * the next WT from <code>time</code> will be filled in to
		 * <code>time</code> itself.<br/><br/>
		 * Return false if there's no WT follows <code>time</code>.
		 */
		internal function computeNextWorkingTime(time:Date):Boolean
		{
			var d:Date = this.gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1);
			var millis:Number = DateTimeUtil.fproject_internal::getTimeOfDayInMillis(time);
			var len:uint = this._workShifts.length;
			for (var i:uint = 0; i < len; i++)
			{				
				var shift:WorkShift = this._workShifts[i];
				if (millis < shift.endTime)
				{
					if (millis < shift.startTime)
					{
						time.time = DateTimeUtil.fproject_internal::setTimeOfDayInMillis(d, shift.startTime).time;
					}
					return true;
				}
			}
			time.time = this.gregorianCalendar.dateAddByTimeUnit(d, TimeUnit.DAY, 1, true).time;
			return false;
		}
		
		/**
		 * Compute next non-working time and fill in to the time that input as from time
		 * @param time the in/output time.
		 * @return <code>true</code> if there's a next non-working time follows <code>time</code>.
		 * The next working time from <code>time</code> will be filled in to
		 * <code>time</code> itself.<br/><br/>
		 * Return <code>false</code> and reset <code>time</code> to start of day if there's no
		 * non-working time follows <code>time</code>.
		 */
		internal function computeNextNonWorkingTime(time:Date):Boolean
		{
			var d:Date = this.gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1);
			var millis:Number = DateTimeUtil.fproject_internal::getTimeOfDayInMillis(time);
			var len:uint = this._workShifts.length;
			for (var i:uint = 0; i < len; i++)
			{				
				var shift:WorkShift = this._workShifts[i];
				if (millis < shift.endTime)
				{
					if (millis >= shift.startTime)
					{
						if (shift.endTime != TimeUnit.DAY.milliseconds)
						{
							time.time = DateTimeUtil.fproject_internal::setTimeOfDayInMillis(d, shift.endTime).time;
							return true;
						}
						time.time = this.gregorianCalendar.dateAddByTimeUnit(d, TimeUnit.DAY, 1, true).time;
						return false;
					}
					return true;
				}
			}
			if (this._workShifts[len - 1].endTime != TimeUnit.DAY.milliseconds)
			{
				return true;
			}
			time.time = this.gregorianCalendar.dateAddByTimeUnit(d, TimeUnit.DAY, 1, true).time;
			return false;
		}
		
		/**
		 * Fill previuos working time in to the time that input as from time
		 * @param d the in/output time.
		 * @return true if there's a working time before <code>d</code>.
		 * the previous working time from <code>d</code> will be filled in to
		 * <code>d</code> itself.<br/><br/>
		 * Return false if there's no working time before <code>d</code>.
		 */
		internal function computePreviousWorkingTime(time:Date):Boolean
		{
			var len:uint = this._workShifts.length;
			if (len == 0)
			{
				return true;
			}
			var d:Date = this.gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1);
			var millis:Number = DateTimeUtil.fproject_internal::getTimeOfDayInMillis(time);
			if (DateTimeUtil.fproject_internal::getTimeOfDayInMillis(time) == 0)
			{
				millis = TimeUnit.DAY.milliseconds;
				this.gregorianCalendar.dateAddByTimeUnit(d, TimeUnit.DAY, -1, true);
			}
			for (var i:int = len - 1; i >= 0; i--)
			{				
				var shift:WorkShift = this._workShifts[i];
				if (millis > shift.startTime)
				{
					if (millis >= shift.endTime)
					{
						time.time = DateTimeUtil.fproject_internal::setTimeOfDayInMillis(d, shift.endTime).time;
					}
					return true;
				}
			}
			time.time = d.time;
			return false;
		}
		
		/**
		 * Check whether the specified period has the same work shifts with this period or not.
		 * @param p The comparing period
		 * @return <code>true</code> if the specified period has the same work
		 * shifts with this period, <code>false</code> if otherwise
		 *
		 */
		internal function compareWorkShifts(p:WorkInfo):Boolean
		{
			return WorkShift.vectorCompare(this._workShifts, p._workShifts);
		}
		
		/**
		 * Copy this period to a destination period.
		 * @param copy The output destination period.
		 *
		 */
		internal function copyPeriodTo(copy:WorkInfo):void
		{
			copy._workShifts = WorkShift.copy(this._workShifts);
			copy.isInherited = this.isInherited;
			copy.isWorking = this.isWorking;
		}
		
		/**
		 *
		 * Clone this period
		 * @return The cloned period
		 *
		 */
		// Must inherit
		internal function clone():WorkInfo
		{
			throw new Error();
		}
		
		/**
		 * Copy a vector of work shifts to another.
		 * @param shifts The vector of input work shifts
		 * @return The copied vector.
		 *
		 */
		//20130503 Removed (Start) : This method is deprecated, should use WorkShift.copyWorkShifts()
		/*internal static function copyWorkShifts(shifts:Vector.<WorkShift>):Vector.<WorkShift>
		{
		if (shifts == null)
		{
		return new Vector.<WorkShift>;
		}
		var newShifts:Vector.<WorkShift> = shifts.slice(0);
		for (var i:int = 0; i < newShifts.length; i++)
		{
		newShifts[i] = newShifts[i].clone();
		}
		return newShifts;
		}*/ // end function
		//20130503 Removed (End)
		
		/**
		 * Get all non-working time ranges based on workshifts of this period.
		 * @return The vector of non-working time ranges at <code>d</code>.
		 */
		internal function getNonWorkingTimes():Vector.<TimeRange>
		{
			var v:Vector.<TimeRange> = new Vector.<TimeRange>();
			var t:Number = 0;
			for each (var shift:WorkShift in this._workShifts)
			{
				if (t < shift.startTime)
				{
					v.push(new TimeRange(new Time(t), new Time(shift.startTime - 1)));
				}
				t = shift.endTime + 1;
			}
			if (t < TimeUnit.DAY.milliseconds)
			{
				v.push(new TimeRange(new Time(t),
					new Time(TimeUnit.DAY.milliseconds - 1)));
			}
			
			return v;
		}
	}
}
