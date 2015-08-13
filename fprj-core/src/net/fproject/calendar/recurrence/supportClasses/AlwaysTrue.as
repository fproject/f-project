package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

    internal class AlwaysTrue implements IDateFilter, IRecurrenceCondition
    {
        function AlwaysTrue()
        {
        }

        public function apply(date:Date) : Boolean
        {
            return true;
        }

        public function reset() : void
        {
        }

    }
}
