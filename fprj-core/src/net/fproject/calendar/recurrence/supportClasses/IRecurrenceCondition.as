package net.fproject.calendar.recurrence.supportClasses
{

    public interface IRecurrenceCondition
    {

        public function IRecurrenceCondition();

        function apply(date:Date) : Boolean;

        function reset() : void;

    }
}
