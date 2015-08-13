package net.fproject.calendar.recurrence.supportClasses
{

    public interface IGenerator
    {

        public function IGenerator();

        function generate(date:Date) : Boolean;

        function reset() : void;

    }
}
