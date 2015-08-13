package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.utils.GregorianCalendar;

	internal class MonthGenerator implements IGenerator
    {
        private var _interval:int;
        private var _dtStart:Date;
        private var _year:Number;
        private var _currentMonth:Number;

        function MonthGenerator(calendar:GregorianCalendar, startDate:Date, interval:int = 1)
        {
            this._interval = interval;
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this._year = this._dtStart.fullYear;
            this._currentMonth = this._dtStart.month - this._interval;
        }

        public function generate(date:Date) : Boolean
        {
            if (date.fullYear != this._year)
            {
                if (this._interval == 1)
                {
					var m:int = 0;
                    this._year = date.fullYear;
                }
                else
                {
					var d:Date = new Date(this._year, this._currentMonth, 1);
                    d.month = d.month + this._interval;
                    if (d.fullYear == date.fullYear)
                    {
                        m = d.month;
                        this._year = d.fullYear;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            else
            {
                m = this._currentMonth + this._interval;
            }
            if (m > 11)
            {
                return false;
            }
            date.date = 1;
			date.month = this._currentMonth = m;
            return true;
        }

    }
}
