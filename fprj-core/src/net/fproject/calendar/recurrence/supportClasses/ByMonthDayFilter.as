package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.fproject_internal;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.core.TimeUnit;

	internal class ByMonthDayFilter implements IDateFilter
    {
        private var _calendar:GregorianCalendar;
        private var _sDates:Array;
        private var _dates:Array;
        private var _year:Number;
        private var _month:Number;
        private var _dtStart:Date;

        function ByMonthDayFilter(calendar:GregorianCalendar, startDate:Date, dates:Array)
        {
            this._sDates = dates.concat();
            this._sDates = RecurrenceUtil.sortAndUniquifyInts(this._sDates);
            this._calendar = calendar;
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this.computeDates(this._dtStart);
        }

        private function computeDates(start:Date) : void
        {
            this._month = start.month;
            this._year = start.fullYear;
            var d:Date = this._calendar.fproject_internal::floor(start, TimeUnit.MONTH, 1);
            d = this._calendar.dateAddByTimeUnit(d, TimeUnit.MONTH, 1);
            d = this._calendar.dateAddByTimeUnit(d, TimeUnit.DAY, -1);
            var n:Number = d.date;
            var a:Array = this._sDates.concat();
            this._dates = [];
			
            for (var i:int = 0; i < a.length; i++)
            {                
                if (a[i] < 0)
                {
                    a[i] = n + a[i] + 1;
                }
                if (a[i] >= 1 && a[i] <= n)
                {
                    this._dates.push(a[i]);
                }
            }
            this._dates = RecurrenceUtil.sortAndUniquifyInts(this._dates);
        }

        public function apply(date:Date) : Boolean
        {
            if (date.fullYear != this._year || date.month != this._month)
            {
                this.computeDates(date);
            }
            return this._dates.indexOf(date.date) != -1;
        }

    }
}
