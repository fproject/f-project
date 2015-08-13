package net.fproject.calendar.recurrence.supportClasses
{

    public interface IDateFilter
    {

        public function IDateFilter();

        function apply(date:Date) : Boolean;

        function reset() : void;

    }
}
