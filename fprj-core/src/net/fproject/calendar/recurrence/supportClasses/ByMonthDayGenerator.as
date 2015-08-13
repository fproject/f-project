package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.fproject_internal;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.core.TimeUnit;

	internal class ByMonthDayGenerator implements IGenerator
    {
        private var _calendar:GregorianCalendar;
        private var _sDates:Array;
        private var _dates:Array;
        private var _index:int;
        private var _year:Number;
        private var _month:Number;
        private var _dtStart:Date;

        function ByMonthDayGenerator(calendar:GregorianCalendar, startDate:Date, dates:Array)
        {
            this._sDates = dates.concat();
            this._calendar = calendar;
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this.computeDates(this._dtStart);
            this._index = this._dates.indexOf(this._dtStart.date);
            if (this._index == -1)
            {
                this._index = 0;
            }
        }

        private function computeDates(start:Date) : void
        {
            this._month = start.month;
            this._year = start.fullYear;
            var floorStart:Date = this._calendar.fproject_internal::floor(start, TimeUnit.MONTH, 1);
            floorStart = this._calendar.dateAddByTimeUnit(floorStart, TimeUnit.MONTH, 1);
            floorStart = this._calendar.dateAddByTimeUnit(floorStart, TimeUnit.DAY, -1);
            var n:Number = floorStart.date;
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

		public function generate(date:Date):Boolean
		{
			if (!(date.fullYear == this._year) || !(date.month == this._month)) 
			{
				this.computeDates(date);
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
