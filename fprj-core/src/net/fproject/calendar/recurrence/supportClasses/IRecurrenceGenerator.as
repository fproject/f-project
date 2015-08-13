package net.fproject.calendar.recurrence.supportClasses
{

    public interface IRecurrenceGenerator
    {

        //public function IRecurrenceGenerator();

        function getRecurrenceInstances(start:Date, end:Date) : Vector.<Date>;

        function reset() : void;

    }
}
