package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.fproject_internal;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.core.TimeUnit;

	internal class WeekIntervalFilter implements IDateFilter
    {
        private var _calendar:GregorianCalendar;
        private var _date:Date;
        private var _interval:uint;

        function WeekIntervalFilter(calendar:GregorianCalendar, date:Date, interval:uint = 1)
        {
            this._calendar = calendar;
            this._date = calendar.fproject_internal::floor(date, TimeUnit.WEEK, 1);
            this._interval = interval;
        }

        public function reset() : void
        {
            return;
        }

        public function apply(date:Date) : Boolean
        {
            var days:Number = this._calendar.getDays(date, this._date);
            var n:Number = days / 7 % this._interval;
            return n == 0;
        }

    }
}
