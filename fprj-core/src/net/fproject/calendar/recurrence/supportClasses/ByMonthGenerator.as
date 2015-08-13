package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.utils.GregorianCalendar;

	internal class ByMonthGenerator implements IGenerator
    {
        private var _months:Array;
        private var _year:Number;
        private var _index:int = 0;
        private var _dtStart:Date;

        function ByMonthGenerator(calendar:GregorianCalendar, startDate:Date, months:Array)
        {
            this._months = months.concat();
            this._months = RecurrenceUtil.sortAndUniquifyInts(this._months);
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this._year = this._dtStart.fullYear;
            this._index = this._months.indexOf(this._dtStart.month);
            if (this._index == -1)
            {
                this._index = 0;
            }
        }

		public function generate(date:Date):Boolean
		{
			if (date.fullYear != this._year) 
			{
				this._year = date.fullYear;
				this._index = 0;
			}
			if (this._index >= this._months.length) 
			{
				return false;
			}
			
			//20131110 Modified (Start) : Bug #76 fixing
			/*
			this._index++;
			date.month = this._months[this._index];
			*/
			date.month = this._months[this._index++];
			//20131110 Modified (End)
	
			return true;
		}

    }
}
