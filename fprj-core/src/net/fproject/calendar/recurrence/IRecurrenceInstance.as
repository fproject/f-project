package net.fproject.calendar.recurrence
{
	
	
	/**
	 * This interface defines an event that is an occurence of a recurring event.
	 * <p>
	 * An <code>IRecurrenceInstance</code> is built from an instance of
	 * <code>IRecurrenceDescriptor</code> set on the <code>Calendar</code> and is
	 * not present in the data provider.
	 * </p>
	 */
	public interface IRecurrenceInstance
	{
		
		/**
		 * <p>
		 * The data provider item used to generate this occurrence.
		 * </p>
		 * <p>
		 * This item can be used to retrieve properties other than the start and end
		 * times.
		 * </p>
		 */
		function get item() : Object;
		
		/**
		 * <p>
		 * The start time of this occurrence.
		 * </p>
		 */
		function get startTime() : Date;
		
		/**
		 * <p>
		 * The end time of this occurrence.
		 * </p>
		 */
		function get endTime() : Date;
	}
}