package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    
    import net.fproject.utils.GregorianCalendar;

	internal class YearGenerator implements IGenerator
    {
        private var _interval:uint;
        private var _currentYear:int;
        private var _count:int = 0;
        private var _dtStart:Date;
        private static const MAX_COUNT:int = 100;

        function YearGenerator(calendar:GregorianCalendar, startDate:Date, interval:uint = 1)
        {
            this._interval = interval;
            this._dtStart = startDate;
            this.reset();
        }

        public function reset() : void
        {
            this._currentYear = this._dtStart.fullYear;
            this._count = 0;
        }

		public function generate(date:Date):Boolean
		{
			if (this._count > 99) 
			{
				return false;
			}
			
			this._count++;
			
			date.date = 1;
			date.month = 0;
			date.fullYear = this._currentYear = this._currentYear + this._interval;
			return true;
		}

    }
}
