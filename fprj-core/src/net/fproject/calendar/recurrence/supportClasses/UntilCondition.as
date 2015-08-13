package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

	internal class UntilCondition implements IRecurrenceCondition
    {
        private var _date:Date;

        function UntilCondition(date:Date)
        {
            this._date = date;
        }

        public function get untilDate() : Date
        {
            return this._date;
        }

        public function apply(date:Date) : Boolean
        {
            return date <= this._date;
        }

        public function reset() : void
        {
        }

    }
}
