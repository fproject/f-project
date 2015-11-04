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
	import net.fproject.fproject_internal;
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.MessageUtil;
	
	use namespace fproject_internal;
	
	/**
	 * 
	 * Represents a time period of a <code>WorkCalendar</code>.<br/><br/>
	 * This class is used for internal purpose.
	 * 
	 * @see PeriodInternalBase
	 * @see WeekDayInternal
	 */
	internal class PeriodInternal extends WorkInfo
	{
		private var _endDate:Date;
		private var _startDate:Date;
		
		private var _endOfEndDate:Date;
		
		/**
		 * Constructor 
		 * @param calendar The work calendar that owns this period.
		 * @param working Indicates whether this period is working period or not.
		 * @param start The start date-time of this period.
		 * @param start The finish date-time of this period.
		 * @param workShifts The start work shifts collection of this period.
		 */
		function PeriodInternal(calendar:WorkCalendar, working:Boolean, 
								start:Date, end:Date, workShifts:Vector.<WorkShift> = null)
		{
			super(calendar, working);
			
			if (end < start)
			{
				var d:Date = start;
				start = end;
				end = d;
			}
			
			this.startDate = start;
			this.endDate = end;
			
			if (working && workShifts != null)
			{
				this._workShifts = WorkShift.copy(workShifts);
			}
			
		}
		
		/**
		 * 
		 * Get total work of the period. 
		 * 
		 */
		internal function getTotalWork() : Number
		{
			return isWorking ? numberOfDays * totalWorkInOneDay : 0;
		}
		
		/**
		 * 
		 * Number of days belong to this period. 
		 * 
		 */
		internal function get numberOfDays() : int
		{
			return DateTimeUtil.millisecondToDay(endDate.time - startDate.time) + 1;
		}
		
		/**
		 * 
		 * The start date-time of this period. 
		 * 
		 */
		internal function get startDate() : Date
		{
			return new Date(_startDate.time);
		}
		
		/**
		 * 
		 * @private
		 * 
		 */		
		internal function set startDate(value:Date) : void
		{
			_startDate = gregorianCalendar.fproject_internal::floor(value, TimeUnit.DAY, 1);
		}
		
		/**
		 * 
		 * The finish date-time of this period. 
		 * 
		 */
		internal function get endDate() : Date
		{
			return new Date(_endDate.time);
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		internal function set endDate(value:Date) : void
		{
			_endDate = gregorianCalendar.fproject_internal::floor(value, TimeUnit.DAY, 1);			
		}
		
		/**
		 * 
		 * The end time of the <code>endDate</code> of this period. 
		 * 
		 */
		internal function get endOfEndDate() : Date
		{
			if (this._endOfEndDate == null && this._endDate != null)
			{
				this._endOfEndDate = 
					gregorianCalendar.dateAddByTimeUnit(this._endDate, TimeUnit.DAY, 1, false);
				this._endOfEndDate = 
					gregorianCalendar.fproject_internal::floor(this._endOfEndDate, TimeUnit.DAY, 1);
			}
			return _endOfEndDate;
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		internal override function getTotalWorkBetween(start:Date, end:Date) : Number
		{            
			if (start > end)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.totalWorkBetween", "start > end");
			}
			if (start < _startDate)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.totalWorkBetween", "start < startDate");
			}
			if (end.time > _endDate.time + TimeUnit.DAY.milliseconds)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.totalWorkBetween", "end > endDate");
			}
			if (start.time == end.time || !isWorking)
			{
				return 0;
			}
			var totalWork:Number;			
			if (DateTimeUtil.areOnSameDay(start, end))
			{
				totalWork = getTotalWorkBetweenHours(start, end);
			}
			else
			{
				var startBegin:Date = gregorianCalendar.fproject_internal::floor(start, TimeUnit.DAY, 1);
				var endBegin:Date = gregorianCalendar.fproject_internal::floor(end, TimeUnit.DAY, 1);
				var start1:Date = gregorianCalendar.dateAddByTimeUnit(startBegin, TimeUnit.DAY, 1);
				totalWork = getTotalWorkBetweenHours(start, start1);
				var days:Number = DateTimeUtil.fproject_internal::millisecondToDay(endBegin.time - startBegin.time) - 1;
				if (days > 0) 
				{
					totalWork = totalWork + days * totalWorkInOneDay;
				}
				totalWork = totalWork + getTotalWorkBetweenHours(endBegin, end);
			}
			return totalWork;
		}
		
		/**
		 * 
		 * @inheritDoc 
		 * 
		 */
		internal override function addWork(time:Date, duration:Number) : Number
		{
			var wrkInOneDay:Number = NaN;
			var workingDaysCount:int = 0;
			var minDuration:int = 0;
			if (time < _startDate)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.add", "time < startDate");
			}
			if (time.time > _endDate.time + TimeUnit.DAY.milliseconds)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.add", "time > endDate");
			}
			if (duration == 0)
			{
				return 0;
			}
			if (!isWorking)
			{
				time.time = _endDate.time;
				gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.DAY, 1, true);
				return duration;
			}

			duration = super.addWork(time, duration);
			if (duration == 0)
			{
				return 0;
			}
			var days:int = DateTimeUtil.millisecondToDay(_endDate.time - 
				gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1).time);
			if (days > 0)
			{
				wrkInOneDay = totalWorkInOneDay;
				workingDaysCount = int(duration / wrkInOneDay);
				
				minDuration = Math.min(workingDaysCount, days);
				if (minDuration != 0)
				{
					time.date = time.date + minDuration;
					duration = duration - wrkInOneDay * minDuration;
					days = days - minDuration;
				}
				
				if (duration != 0 && days != 0)
				{
					duration = super.addWork(time, duration);
				}
			}
			return duration;
		}
		
		/**
		 * 
		 * @inheritDoc 
		 * 
		 */
		internal override function removeWork(time:Date, duration:Number) : Number
		{            
			if (time.time > _endDate.time + TimeUnit.DAY.milliseconds)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.remove", "time > endDate");
			}
			if (time < _startDate)
			{
				throw MessageUtil.wrongArgument(PeriodInternal, "PeriodInternal.remove", "time < startDate");
			}
			if (duration == 0)
			{
				return 0;
			}
			if (!isWorking)
			{
				return duration;
			}

			duration = super.removeWork(time, duration);
			if (duration == 0)
			{
				return 0;
			}
			
			var days:int = DateTimeUtil.millisecondToDay(
				gregorianCalendar.fproject_internal::floor(time, TimeUnit.DAY, 1).time - _startDate.time);
			if (days != 0)
			{
				var workOneDay:Number = totalWorkInOneDay;
				var minDuration:int = Math.min(Math.floor(duration / workOneDay), days);
				if (minDuration != 0)
				{
					gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.DAY, -minDuration, true);
					
					duration = duration - workOneDay * minDuration;
					days = days - minDuration;
				}
				if (duration != 0 && days != 0)
				{
					duration = super.removeWork(time, duration);
				}
			}
			return duration;
		}
		
		/**
		 * Check whether a period is intersected with this period. 
		 * @param start The startDate of checking period
		 * @param end The endDate of checking period.
		 * @return 
		 * 
		 */
		internal function intersects(start:Date, end:Date) : Boolean
		{
			return start < this._endOfEndDate && end >= this._startDate;
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		internal override function clone() : WorkInfo
		{
			var period:PeriodInternal = new PeriodInternal(_workCalendar, isWorking, _startDate, _endDate);
			copyPeriodTo(period);
			return period;
		}
		
		/**
		 * Compare to another <code>PeriodInternal</code> object. 
		 * @param p the <code>PeriodInternal</code> object to compare.
		 * @return <code/>true</code> if the two periods have the same
		 * value of <code>startDate</code>, <code>endDate</code>, isWorking and the same
		 * work shifts. 
		 * 
		 */
		internal function equals(p:PeriodInternal) : Boolean
		{
			return p.isWorking == isWorking && p._endDate.time == _endDate.time
				&& p._startDate.time == _startDate.time && p.compareWorkShifts(this);
		}
		
		/**
		 * Create a PeriodInternal object from a Period object 
		 * @param calendar the parent WorkCalendar
		 * @param period
		 * @return The created new Period object
		 * 
		 */
		internal static function fromPeriod(calendar:WorkCalendar, period:Period) : PeriodInternal
		{	
			var p:PeriodInternal = new PeriodInternal(
				calendar, period.isWorking, period.start, period.end);
			p._workShifts = period.workShifts;
			return p;
		}
		
	}
}
