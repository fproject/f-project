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
	import net.fproject.utils.MessageUtil;
	import net.fproject.utils.Time;
	import net.fproject.utils.TimeUnit;
	
	use namespace fproject_internal;
	/**
	 * A work shift is a working interval of time in a day on a <code>WorkCalendar</code>.
	 * 
	 * <p>To specify the start of the working period, use the <code>startTime</code> property.
	 * To specify the end of the working period, use the <code>endTime</code> property.</p>
	 * 
	 * <p>
	 * The following example creates a <code>WorkCalendar</code>, and uses the <code>WorkShift</code> class to
	 * set the working times for Monday to 10AM-12AM and 3PM-8PM:
	 * </p>
	 * 
	 * <pre>
	 * &lt;gantt:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
	 *	&lt;gantt:weekDays&gt;
	 * 	&lt;gantt:WeekDay dayOfWeek="6" isWorking="false" /&gt;
	 * 	&lt;gantt:WeekDay dayOfWeek="1"&gt;
	 * 		&lt;gantt:workShifts&gt;
	 * 			&lt;gantt:WorkShift start="10:00" end="12:00" /&gt;	 
	 * 			&lt;gantt:WorkShift start="15:00" end="20:00" /&gt;
	 * 		&lt;/gantt:workShifts&gt;
	 * 	&lt;/gantt:WeekDay&gt;
	 *	&lt;/gantt:weekDays&gt;
	 * &lt;/gantt:WorkCalendar&gt;
	 * </pre>
	 */
	public class WorkShift
	{
		protected var _start:Time;
		protected var _end:Time;
		
		/**
		 * <p>Initializes a new instance of the <code>WorkShift</code> class.</p>
		 * The <code>startTime</code> property is set to <code>0</code>, 
		 * and the <code>endTime</code> properties is set
		 * to <code>TimeUnit.Day.milliseconds</code>.
		 */
		public function WorkShift()
		{
			this.startTime = 0;
			this.endTime = TimeUnit.DAY.milliseconds;			
		}// end function
		
		/**
		 * <p>Gets or sets the end time in raw-data of the period.</p>
		 * This property is expressed in milliseconds from midnight.<br/>
		 * <br/> 
		 * In normal case, its value must be greater than the <code>startTime</code> 
		 * property value.<br/>
		 * <br/>
		 * In the case you set <code>endTime = 0</code> and <code>startTime</code>
		 * has a correct time value, the  <code>endTime</code> will be automatically
		 * set to 86400000 (this value is <code>TimeUnit.DAY.milliseconds</code> 
		 * which means end time of a day)
		 */
		public function get endTime():Number
		{
			return _end.millisecondsFromMidnight;
		}

		/**
		 * @private
		 */
		public function set endTime(value:Number):void
		{
			_end = new Time(value);
		}

		/**
		 * <p>Gets or sets the start time in raw-data of the period.</p>
		 * This property is expressed in milliseconds from midnight. 
		 * Its value must not be negative, and must be smaller than the 
		 * <code>endTime</code> property value.
		 * 
		 */
		public function get startTime():Number
		{
			return _start.millisecondsFromMidnight;
		}

		/**
		 * @private
		 */
		public function set startTime(value:Number):void
		{
			_start = new Time(value);
		}

		/**
		 * Validate the working time of this work shift.<br/><br/>
		 * Throw exception in case of in valid date-time values were
		 * assigned to <code>startTime</code> and <code>endTime</code> 
		 * 
		 */
		fproject_internal function validate() : void
		{			
			if (this.startTime > TimeUnit.DAY.milliseconds)
			{
				throw MessageUtil.wrongArgument(
					WorkShift, "WorkShift.checkWorkingTime", "startTime > TimeUnit.DAY.milliseconds");
			}
			if (this.endTime > TimeUnit.DAY.milliseconds)
			{
				throw MessageUtil.wrongArgument(
					WorkShift, "WorkShift.checkWorkingTime", "endTime > TimeUnit.DAY.milliseconds");
			}
			if (this.startTime > 0 && this.endTime == 0)
			{
				this.endTime = TimeUnit.DAY.milliseconds;
			}
			if (this.startTime >= this.endTime)
			{
				throw MessageUtil.wrongArgument(
					WorkShift, "WorkShift.checkWorkingTime", "startTime >= endTime");
			}
		}// end function
		
		/**
		 *  
		 * The duration of this working time in milliseconds. 
		 * 
		 */
		fproject_internal function get duration() : Number
		{
			return this.endTime - this.startTime;
		}// end function
		
		/**
		 * 
		 * Gets or sets a string representation of the start time of the period.
		 * 
		 * <p>
		 * The date is formatted using the <code>HH:MM:SS.mmm AM/PM</code> pattern.
		 * </p>
		 * 
		 */
		public function get start() : String
		{
			return _start.toString();
		}// end function
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set start(value:String) : void
		{
			var time:Time = Time.parseTime(value);	
			if(time == null)
				throw MessageUtil.wrongArgument(WorkShift, "WorkShift.start", "value");
			_start = time;
		}// end function
		
		/**
		 * Gets or sets a string representation of the end time of the period.
		 * 
		 * <p>
		 * The date is formatted using the <code>HH:MM:SS.mmm AM/PM</code> pattern.
		 * </p>
		 * 
		 */
		public function get end() : String
		{
			return (new Time(this.endTime)).toString();
		}// end function
		
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set end(value:String) : void
		{
			var time:Time = Time.parseTime(value);	
			if(time == null)
				throw MessageUtil.wrongArgument(WorkShift, "WorkShift.end", "value");
			this.endTime = Time.parseTime(value).millisecondsFromMidnight;			
		}// end function
		
		/**
		 * Clone the object
		 * 
		 */
		fproject_internal function clone() : WorkShift
		{
			return create(this.startTime, this.endTime);
		}// end function
		
		
		/**
		 *  Creates and initializes an instance of the <code>WorkShift</code> class.
		 * 
		 * @param start The start time of the working period, 
		 * in milliseconds from midnight.
		 * @param end The end time of the working period, in milliseconds from midnight.
		 * @return A new instance of the <code>WorkShift</code> class.
		 */
		public static function create(start:Number, end:Number) : WorkShift
		{
			var shift:WorkShift = new WorkShift;
			shift.startTime = start;
			shift.endTime = end == 0 ? TimeUnit.DAY.milliseconds : end;
			shift.validate();
			return shift;
		}// end function	
		
		public static function createFromTimeSerials(start:String, end:String):WorkShift
		{
			var shift:WorkShift = new WorkShift;
			shift.start = start;
			shift.end = end;
			shift.validate();
			return shift;
		}
		
		/**
		 * Equal comparision. 
		 * @param shift The target work shift to compare to this work shift.
		 * @return <code>true</code> if this work shift equals the target work shift.
		 * <code>false</code> if otherwise.
		 * 
		 */
		public function equals(shift:WorkShift) : Boolean
		{
			return shift != null && this._start.equals(shift._start) &&
				this._end.equals(shift._end);
		}
		
		/**
		 * Copy a vector of work shifts to another.
		 * @param shifts The vector of input work shifts
		 * @return The copied vector. If the input parameter <code>shifts</code>
		 * is <code>null</code>, an empty vector is returned.
		 *
		 */
		public static function copyWorkShifts(shifts:Vector.<WorkShift>) : Vector.<WorkShift>
		{					
			var len:uint = shifts == null? 0 : shifts.length;
			
			var clonedShifts:Vector.<WorkShift> = new Vector.<WorkShift>(len);			
			
			for (var i:uint = 0; i < len; i++)
			{				
				clonedShifts[i] = shifts[i].clone();
			}
			return clonedShifts;
		}
		
		/**
		 * Check whether the the two workshifts are equal or not.
		 * @param shifts1 The first comparing workshift
		 * @param shifts1 The second comparing workshift
		 * @return <code>true</code> if the two workshifts are equal,
		 * <code>false</code> if otherwise.
		 *
		 */
		public static function compareWorkShifts(shifts1:Vector.<WorkShift>, shifts2:Vector.<WorkShift>):Boolean
		{
			if (shifts1 == shifts2)
				return true;
			if (shifts1 == null || shifts2 == null)
				return false;
			
			var len:uint = shifts1.length;
			
			if (shifts2.length != len)
				return false;
			
			for (var i:uint = 0; i < len; i++)
			{
				if (shifts1[i] == shifts2[i])
					continue;				
				if (shifts1[i] == null || !shifts1[i].equals(shifts2[i]))
					return false;
			}
			
			return true;
		}
	}
}
