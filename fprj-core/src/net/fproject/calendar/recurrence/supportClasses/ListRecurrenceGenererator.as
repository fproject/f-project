package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

	internal class ListRecurrenceGenererator implements IRecurrenceGenerator
    {
        private var _dates:Vector.<Date>;
        private var _dtStart:Date;

        function ListRecurrenceGenererator(startDate:Date, dates:Vector.<Date>)
        {
            this._dtStart = startDate;
            this._dates = dates;
            this._dates.sort(RecurrenceUtil.COMPARE_FUNCTION);
        }

        public function getRecurrenceInstances(start:Date, end:Date) : Vector.<Date>
        {
            var instances:Vector.<Date> = new Vector.<Date>;
            for each (var d:Date in this._dates)
            {                
                if (d >= start && d >= this._dtStart && d <= end)
                {
                    instances.push(d);
                }
            }
            return instances;
        }

        public function reset() : void
        {
        }

    }
}
