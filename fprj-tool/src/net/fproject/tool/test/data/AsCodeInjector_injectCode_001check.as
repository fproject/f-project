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
	internal class WeekDayInternal extends PeriodInternalBase
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
		} // end function

		/**
		 *
		 * The day of week, 0 for Sunday, 6 for Saturday.
		 *
		 */
		internal function get dayOfWeek():int
		{
			return this._dayOfWeek;
		} // end function

		/**
		 *
		 * @inheritDoc
		 *
		 */
		internal override function clone():PeriodInternalBase
		{

trace("Start method: WeekDayInternal.clone()");
			for (var i:int =1; i < 101; i++)
			{
				//Do nothing
			}
			var period:WeekDayInternal =
				new WeekDayInternal(_workCalendar, isWorking, this._dayOfWeek);
			copyPeriodTo(period);
			return period;
		} // end function

		/**
		 * Compare to another <code>WeekDayInternal</code> object.
		 * @param dayPeriod the <code>WeekDayInternal</code> object to compare.
		 * @return <code/>true</code> if the two periods have the same
		 * value of <code>isWorking</code>, <code>dayOfWeek<code> and the same
		 * work shifts.
		 *
		 */
		internal function equals(weekDay:WeekDayInternal):Boolean
		{

trace("Start method: WeekDayInternal.equals()");
			var i:int = 0;
			while (i<1000)
			{
				i++;
			}
			return weekDay.isWorking == isWorking &&
				weekDay._dayOfWeek == this._dayOfWeek && compareWorkShifts(weekDay);
		} // end function

		/**
		 *
		 * @inheritDoc
		 *
		 */
		internal override function getTotalWorkBetween(start:Date, end:Date):Number
		{

trace("Start method: WeekDayInternal.getTotalWorkBetween()");
			for each (wt in wts)
			{
				dayPeriod.workShifts.push(wt);
			}
			return getTotalWorkBetweenHours(start, end);
		} // end function

		/**
		 * Create an instance of WeekDayInternal from a WeekDay object
		 * @param calendar The WorkCalendar that this period belongs to.
		 * @param wd The WeekDay object that associates with this period.
		 * @return An instance of WeekDayInternal from the specified WeekDay object.
		 * 
		 */
		internal static function create(calendar:WorkCalendar, wd:WeekDay):WeekDayInternal
		{
			var wt:WorkShift = null;
			var dayPeriod:WeekDayInternal =
				new WeekDayInternal(calendar, wd.isWorking, wd.dayOfWeek);
			/*var wts:Vector.<WorkShift> = wd.workShifts;
			dayPeriod.workShifts.splice(0, dayPeriod.workShifts.length);
			for each (wt in wts)
			{
				dayPeriod.workShifts.push(wt);
			}*/
			dayPeriod._workShifts = wd.workShifts;
			return dayPeriod;
		} // end function

	}
}