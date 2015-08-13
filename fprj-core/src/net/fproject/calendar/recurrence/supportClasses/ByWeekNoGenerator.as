package net.fproject.calendar.recurrence.supportClasses
{
    import mx.resources.*;
    
    import net.fproject.calendar.recurrence.supportClasses.*;
    import net.fproject.fproject_internal;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.utils.ResourceUtil;
    import net.fproject.core.TimeUnit;

	internal class ByWeekNoGenerator implements IGenerator
    {
        private var _calendar:GregorianCalendar;
        private var _weeks:Array;
        private var _dates:Array;
        private var _month:int;
        private var _year:int;
        private var _index:int;
        private var _dtStart:Date;

        function ByWeekNoGenerator(calendar:GregorianCalendar, startDate:Date, weeks:Array)
        {
            this._calendar = calendar;
            this._dtStart = startDate;
            this._weeks = weeks.concat();
            this._weeks = RecurrenceUtil.sortAndUniquifyInts(this._weeks);
            this.reset();
            return;
        }

        public function reset() : void
        {
            this.generateDatesInMonth(this._dtStart.fullYear, this._dtStart.month);
        }

        private function generateDatesInMonth(y:int, m:int) : void
        {
            this._year = y;
            this._month = m;
            var ymFirst:Date = new Date(this._year, this._month, 1);
            var ymLast:Date = this._calendar.dateAddByTimeUnit(ymFirst, TimeUnit.MONTH, 1);
            ymLast = this._calendar.dateAddByTimeUnit(ymLast, TimeUnit.DAY, -1, true);
            var lastWeek:Number = Math.max(this._calendar.getWeek(new Date(y, 11, 31)), this._calendar.getWeek(new Date(y, 11, 24)));
            var yFirst:Date = new Date(this._year, 0, 1);
            var yFirstFloor:Date = this._calendar.fproject_internal::floor(yFirst, TimeUnit.WEEK, 1);
            if (this._calendar.getWeek(yFirstFloor) != 1)
            {
                yFirstFloor = this._calendar.dateAddByTimeUnit(yFirstFloor, TimeUnit.WEEK, 1, true);
            }
            var mFirstWeek:Number = this._calendar.getWeek(ymFirst);
            var mLastWeek:Number = this._calendar.getWeek(ymLast);
            if (mFirstWeek > mLastWeek)
            {
                mLastWeek = lastWeek;
            }
            this._dates = [];
            for each (var i:int in this._weeks)
            {                
                if (i < 0)
                {
                    i = i + (lastWeek + 1);
                }
                if (i >= mFirstWeek && i <= mLastWeek)
                {
					var tmpDate:Date = this._calendar.dateAddByTimeUnit(yFirstFloor, TimeUnit.WEEK, (i - 1));
					
                    for (var j:int = 0; j < 7; j++)
                    {                        
						var d:Date = this._calendar.dateAddByTimeUnit(tmpDate, TimeUnit.DAY, j);
                        if (this._calendar.getWeek(d) != i)
                        {
                            throw new Error(ResourceUtil.getError(ResourceUtil.FPRJ_CALENDAR, 2, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, "illegal.week.number"));
                        }
                        if (d.month == this._month)
                        {
                            this._dates.push(d.date);
                        }
                    }
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
