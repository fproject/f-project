package net.fproject.calendar.recurrence
{
	/**
	 * The default implementation of an <code>IRecurrenceInstance</code>.
	 */
	public class RecurrenceInstance implements IRecurrenceInstance
	{
		
		private var _item:Object;
		
		private var _startTime:Date;
		
		private var _endTime:Date;
		
		
		/**
		 * <p>
		 * Constructor
		 * </p>
		 */
		public function RecurrenceInstance(item:Object, startTime:Date, endTime:Date)
		{
			super();
			this._item = item;
			this._startTime = startTime;
			this._endTime = endTime;
		}
		
		/**
		 * <p>
		 * The data provider item used to generate this occurrence.
		 * </p>
		 * <p>
		 * This item can be used to retrieve properties other than the start and end
		 * times.
		 * </p>
		 */
		public function get item() : Object
		{
			return this._item;
		}
		
		public function set startTime(value:Date) : void
		{
			this._startTime = value;
		}
		
		/**
		 * <p>
		 * The start time of this occurrence.
		 * </p>
		 */
		public function get startTime() : Date
		{
			return this._startTime;
		}
		
		public function set endTime(value:Date) : void
		{
			this._endTime = value;
		}
		
		/**
		 * <p>
		 * The end time of this occurrence.
		 * </p>
		 */
		public function get endTime() : Date
		{
			return this._endTime;
		}
	}
}