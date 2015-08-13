package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.*;
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.fproject_internal;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.core.TimeUnit;

	/**
	 * 
	 * Instances of ByDayFilter are used to filter values in BYDAY recurrence rule parts
	 * 
	 */
    internal class ByDayFilter implements IDateFilter
    {
        private var _days:Array;
        private var _dates:Array;
        private var _calendar:GregorianCalendar;
        private var _weeksInYear:Boolean;
        private var _month:int;
        private var _year:int;
        private var _dtStart:Date;

        function ByDayFilter(calendar:GregorianCalendar, startDate:Date, days:Array, weeksInYear:Boolean)
        {
            this._days = days.concat();
            this._calendar = calendar;
            this._weeksInYear = weeksInYear;
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this.generateDatesInMonth(this._dtStart.fullYear, this._dtStart.month);
        }

        private function generateDatesInMonth(y:int, m:int) : void
        {
            this._year = y;
            this._month = m;
            var ymFirst:Date = new Date(y, m, 1);
            var ymLast:Date = this._calendar.dateAddByTimeUnit(ymFirst, TimeUnit.MONTH, 1);
            ymLast = this._calendar.dateAddByTimeUnit(ymLast, TimeUnit.DAY, -1, true);
            var dd:Number = ymLast.date;
            var doyFirst:Number = this._calendar.getDayOfYear(ymFirst);
            var doyLast:Number = this._calendar.getDayOfYear(ymLast);
            if (this._weeksInYear)
            {
				var days:int = this._calendar.getDaysInYear(y);
				var floorFirst:Date = this._calendar.fproject_internal::floor(ymFirst, TimeUnit.YEAR, 1);
				var floorFirstNext:Date = this._calendar.dateAddByTimeUnit(floorFirst, TimeUnit.DAY, days);
            }
            else
            {
                days = dd;
            }
            this._dates = [];
            for each (var wd:RecurrenceWeekDay in this._days)
            {
                
                if (wd.modifier == 0)
                {
					var tmpDate:Date = ymFirst;
					var count:int = wd.day >= tmpDate.day ? (wd.day - tmpDate.day) : (7 - tmpDate.day + wd.day);
					var d:Date = count == 0 ? (new Date(tmpDate.time)) : (this._calendar.dateAddByTimeUnit(tmpDate, TimeUnit.DAY, count));
                    while (d.month == m)
                    {                        
                        this._dates.push(d.date);
                        d = this._calendar.dateAddByTimeUnit(d, TimeUnit.WEEK, 1, true);
                    }
                    continue;
                }
                if (wd.modifier > 0)
                {
                    tmpDate = this._weeksInYear ? (floorFirst) : (ymFirst);
                    count = wd.day >= tmpDate.day ? (wd.day - tmpDate.day) : (7 - tmpDate.day + wd.day);
                }
                else
                {
                    tmpDate = this._weeksInYear ? (floorFirstNext) : (ymLast);
                    count = wd.day > tmpDate.day ? (-7 + wd.day - tmpDate.day) : (wd.day - tmpDate.day);
                }
                d = count == 0 ? tmpDate : this._calendar.dateAddByTimeUnit(tmpDate, TimeUnit.DAY, count);
				var addition:int = wd.modifier > 0 ? -1 : 1;
                if (wd.modifier != 1 && wd.modifier != -1)
                {
                    d = this._calendar.dateAddByTimeUnit(d, TimeUnit.WEEK, wd.modifier + addition, true);
                }
				var doy:int = this._calendar.getDayOfYear(d);
                if (doy >= doyFirst && doy <= doyLast)
                {
                    this._dates.push(d.date);
                }
            }
            this._dates = RecurrenceUtil.sortAndUniquifyInts(this._dates);
        }

        public function apply(date:Date) : Boolean
        {
            if (date.fullYear != this._year || date.month != this._month)
            {
                this.generateDatesInMonth(date.fullYear, date.month);
            }
            return this._dates.indexOf(date.date) != -1;
        }

    }
}
