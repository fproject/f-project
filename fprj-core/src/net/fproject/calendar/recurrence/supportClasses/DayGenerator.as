package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.fproject_internal;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.core.TimeUnit;

	internal class DayGenerator implements IGenerator
    {
        private var _interval:uint;
        private var _dtStart:Date;
        private var _currentDate:int;
        private var _maxDate:int;
        private var _month:Number;
        private var _year:Number;
        private var _calendar:GregorianCalendar;

        function DayGenerator(calendar:GregorianCalendar, startDate:Date, interval:uint = 1)
        {
            this._interval = interval;
            this._dtStart = startDate;
            this._calendar = calendar;
            this.reset();
        }

        public function reset() : void
        {
            this.computeMaxDate(this._dtStart);
            this._currentDate = this._dtStart.date - this._interval;
        }

        private function computeMaxDate(start:Date) : void
        {
            this._month = start.month;
            this._year = start.fullYear;
            var d:Date = this._calendar.fproject_internal::floor(start, TimeUnit.MONTH, 1);
            d = this._calendar.dateAddByTimeUnit(d, TimeUnit.MONTH, 1);
            d = this._calendar.dateAddByTimeUnit(d, TimeUnit.DAY, -1);
            this._maxDate = d.date;
        }

        public function generate(date:Date) : Boolean
        {
            if (this._month == date.month && this._year == date.fullYear)
            {
				var n:int = this._currentDate + this._interval;
                if (n > this._maxDate)
                {
                    return false;
                }
            }
            else
            {
                if (this._interval != 1)
                {
					var d:Date = new Date(this._year, this._month, this._currentDate);
                    d.date = d.date + this._interval;
                    if (d.month == date.month && d.fullYear == date.fullYear)
                    {
                        n = d.date;
                        this._month = date.month;
                        this._year = date.fullYear;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    n = 1;
                }
                this.computeMaxDate(date);
            }
			date.date = this._currentDate = n;
            return true;
        }

    }
}
