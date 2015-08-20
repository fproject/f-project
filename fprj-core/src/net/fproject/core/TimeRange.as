///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	import net.fproject.utils.MessageUtil;

	/**
	 * 
	 * A <code>TimeRange</code> represents a period of time of a day.
	 * <p>To specify the start of the <code>TimeRange</code>, use the <code>start</code> property.
	 * To specify the end of the <code>TimeRange</code>, use the <code>end</code> property.</p>
	 * 
	 * @see net.fproject.core.Time
	 * 
	 */
	public class TimeRange
	{
		protected var _start:Time;
		protected var _end:Time;
		
		/**
		 * 
		 * Constructor.
		 *  
		 * @param start
		 * @param end
		 * 
		 */
		public function TimeRange(start:Time = null, end:Time = null)
		{
			_start = start;
			_end = end;
		}
		
		[Transient]
		/**
		 * The <code>Time</code> instance of end time 
		 */
		public function get endTimeObject():Time
		{
			return _end;
		}
		
		[Transient]
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
		
		[Transient]
		/**
		 * The <code>Time</code> instance of start time 
		 */
		public function get startTimeObject():Time
		{
			return _start;
		}
		
		[Transient]
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
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set start(value:String) : void
		{
			var time:Time = Time.parseTime(value);	
			if(time == null)
				throw MessageUtil.wrongArgument(TimeRange, "TimeRange.start", "value");
			_start = time;
		}
		
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
			return _end.toString();
		}
		
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set end(value:String) : void
		{
			var time:Time = Time.parseTime(value);	
			if(time == null)
				throw MessageUtil.wrongArgument(TimeRange, "TimeRange.end", "value");
			this.endTime = Time.parseTime(value).millisecondsFromMidnight;			
		}
		
		/**
		 * Equal comparision. 
		 * @param shift The target work shift to compare to this work shift.
		 * @return <code>true</code> if this work shift equals the target work shift.
		 * <code>false</code> if otherwise.
		 * 
		 */
		public function equals(shift:TimeRange) : Boolean
		{
			return shift != null && this._start.equals(shift._start) &&
				this._end.equals(shift._end);
		}
	}
}