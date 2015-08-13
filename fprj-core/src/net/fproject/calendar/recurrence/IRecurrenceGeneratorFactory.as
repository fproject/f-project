package net.fproject.calendar.recurrence
{
	import net.fproject.utils.GregorianCalendar;

	[Implementation('net.fproject.calendar.recurrence.supportClasses.RecurrenceGeneratorFactory')]
    public interface IRecurrenceGeneratorFactory
    {
        function createRecurrenceGenerator(calendar:GregorianCalendar, item:Object, 
														 startDate:Date, endDate:Date, inclusionRule:Vector.<RRule>, 
														 exclusionRule:Vector.<RRule> = null,
														 inclusionDates:Vector.<Date> = null, 
														 exclusionDates:Vector.<Date> = null) : IRecurrenceGenerator;
    }
}
