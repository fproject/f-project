package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.core.TimeUnit;

	internal class ByYearDayGenerator implements IGenerator
    {
        private var _calendar:GregorianCalendar;
        private var _month:Number;
        private var _year:Number;
        private var _days:Array;
        private var _dates:Array;
        private var _index:int;
        private var _dtStart:Date;

        function ByYearDayGenerator(calendar:GregorianCalendar, startDate:Date, days:Array)
        {
            this._calendar = calendar;
            this._days = days.concat();
            this._days = RecurrenceUtil.sortAndUniquifyInts(this._days);
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this.generateDatesInMonth(this._dtStart.fullYear, this._dtStart.month);
        }

        private function generateDatesInMonth(y:int, m:int) : void
        {
            this._month = m;
            this._year = y;
            this._dates = [];
            var ymFirst:Date = new Date(y, m, 1);
            var ymLast:Date = this._calendar.dateAddByTimeUnit(ymFirst, TimeUnit.MONTH, 1);
            ymLast = this._calendar.dateAddByTimeUnit(ymLast, TimeUnit.DAY, -1);
            var doyFirst:Number = this._calendar.getDayOfYear(ymFirst);
            var doyLast:Number = this._calendar.getDayOfYear(ymLast);
            var n:Number = this._calendar.getDaysInYear(y);
            for each (var i:int in this._days)
            {                
                if (i < 0)
                {
                    i = i + (n + 1);
                }
                if (i >= doyFirst && i <= doyLast)
                {
                    this._dates.push(i - doyFirst + 1);
                }
            }
            this._dates = RecurrenceUtil.sortAndUniquifyInts(this._dates);
        }

		public function generate(date:Date):Boolean
		{
			if (!(date.fullYear == this._year) || !(date.month == this._month)) 
			{
				this.generateDatesInMonth(date.fullYear, date.month);
				this._index = 0;
			}
			if (this._index >= this._dates.length) 
			{
				return false;
			}
			date.date = this._dates[this._index++];

			return true;
		}

    }
}
