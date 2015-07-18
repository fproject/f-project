package net.fproject.ui.dateControls.supportClasses
{
	import flash.events.EventDispatcher;
	import mx.core.IUID;
	
	/**
	 *  Data object that will be element type for MonthDayList
	 */
	public class MonthDay extends EventDispatcher implements IUID
	{
		// the date to display
		[Bindable("_none_")]
		public var date:Date;
		
		private var _isInCurrentMonth:Boolean;
		
		[Bindable("_none_")]
		// whether that date is in the current month;
		public function get isInCurrentMonth():Boolean
		{
			return _isInCurrentMonth;
		}
		public function set isInCurrentMonth(value:Boolean):void
		{
			_isInCurrentMonth = value;
		}
		
		public function get uid():String
		{
			return date.fullYear.toString() + date.month.toString() + date.date.toString();
		}
		
		public function set uid(value:String):void
		{
			// do nothing
		}
		
		[Bindable("_none_")]
		public function get dateLabel():String
		{
			return date.date.toString();
		}
	}
	
}
