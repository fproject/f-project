package net.fproject.ui.events
{
	import flash.events.Event;
	
	/**
	 * Data event for the DateChooser/DateField class.
	 */
	public class DateControlEvent extends Event
	{
		/**
		 *  Dispatched when a user click the DateField button to open the DateField control's drop-down list.
		 *
		 */
		public static const OPEN:String = "open";
		
		/**
		 * Dispatched when the currently displayed year on a DateChooser or DateField control is changed.
		 */
		public static const YEAR_CHANGE:String = "yearChange";
		
		/**
		 * Dispatched when the currently month year on a DateChooser or DateField control is changed.
		 */
		public static const MONTH_CHANGE:String = "monthChange";
		
		/**
		 * Dispatched when the selected date of DateChooser or DateField control is changed.
		 */
		public static const SELECTED_DATE_CHANGE:String = "selectedDateChange";
		
		/**
		 * Constructor
		 */
		public function DateControlEvent(type:String)
		{
			super(type);
		}
		
		override public function clone() : Event
		{
			return new DateControlEvent(type);
		}
	}
}