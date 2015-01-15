///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.calendar
{    
	
	/**
	 * Represents a working or nonworking day of week in a <code>WorkCalendar</code>.
	 * 
	 * <p>
	 * 
	 * A working day represents a day of the week in which the user can specify what are the working and nonworking times. The day of the week can be 
	 * specified using the <code>dayOfWeek</code> property.
	 * To specify the working times, use the <code>workShifts</code> property. Note that if the day is a nonworking day, the
	 * <code>workShifts</code> property is ignored. To set a day as a nonworking day, use the <code>isWorking</code> property.
	 * </p>
	 * 
	 * <p>
	 * 
	 * Working times in a <code>WeekDay</code> should be ordered, and should not overvap.
	 * </p>
	 * 
	 * <p>
	 * The following example shows how to specify friday as a non working day. It also sets the working times for monday to 10AM-12AM and 3PM-8PM:
	 * </p>
	 * 
	 * <pre>
	 * &lt;cal:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
	 * 	&lt;cal:weekDays&gt;
	 * 		&lt;cal:WeekDay dayOfWeek="6" isWorking="false" /&gt;
	 * 		&lt;cal:WeekDay dayOfWeek="1"&gt;
	 * 			&lt;cal:workShifts&gt;
	 * 				&lt;cal:WorkShift start="10:00" end="12:00" /&gt;
	 * 				&lt;cal:WorkShift start="15:00" end="20:00" /&gt;
	 * 			&lt;/cal:workShifts&gt;
	 * 		&lt;/cal:WeekDay&gt;
	 * 	&lt;/cal:weekDays&gt;
	 * &lt;/cal:WorkCalendar&gt;
	 * </pre>
	 * 
	 * @mxml
	 * 
	 * <p>The <code>&lt;WeekDay&gt;</code> tag inherits all the tag attributes
	 * of its superclass and adds the following tag attributes:</p>
	 * <pre>   &lt;cal:WeekDay
	 * &lt;!--<b>Properties</b>--&gt;
	 * dayOfWeek="-1"
	 * workShifts="<i>A vector of <code>WorkShift</code></i>"
	 * isWorking="true"
	 * /&gt;
	 * </pre>
	 * 
	 * */
	public class WeekDay
	{
		private var _workShifts:Vector.<WorkShift>;
		/**
		 * <p>The day of the week. <code>0</code> represents Sunday, 
		 * and <code>6</code> represents Saturday.</p>
		 * <p>The default value is <code>-1</code>.</p> 
		 */
		public var dayOfWeek:int;
		
		/**
		 * <p>Indicates if the period is a working or nonworking day.
		 * </p><p>
		 * When this property is set to <code>false</code>, the <code>workShifts</code> property is ignored.
		 * </p> 
		 */
		public var isWorking:Boolean;
		
		/**
		 * <p>Initializes a new instance of the <code>WeekDay</code> class.
		 * </p><p>
		 * The constructor intializes this period as a working day.
		 * The <code>dayOfWeek</code> property is not set by this constructor. 
		 * The <code>workShifts</code> property is not set by this constructor.
		 * </p> 
		 * 
		 */
		public function WeekDay()
		{
			this._workShifts = new Vector.<WorkShift>;
			this.isWorking = true;
			this.dayOfWeek = -1;
		}// end function
				
		/**
		 * 
		 * <p>The work shifts of the day.</p>
		 * Working times of these <code>WorkShift</code> objects should be ordered, 
		 * and should not overlap. 
		 * 
		 */
		public function get workShifts() : Vector.<WorkShift>
		{
			return WorkShift.copyWorkShifts(this._workShifts);
		}// end function
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set workShifts(value:Vector.<WorkShift>) : void
		{
			this._workShifts = WorkShift.copyWorkShifts(value);			
		}// end function
		
		internal static function createWeekDay(p:WeekDayInternal) : WeekDay
		{
			var wcdow:WeekDay = new WeekDay;
			wcdow.dayOfWeek = p.dayOfWeek;
			wcdow.isWorking = p.isWorking;
			wcdow.workShifts = p.workShifts;
			return wcdow;
		}// end function		
	}
}
