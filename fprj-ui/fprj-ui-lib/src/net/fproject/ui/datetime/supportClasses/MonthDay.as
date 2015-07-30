package net.fproject.ui.datetime.supportClasses
{
	import net.fproject.model.LocalUID;
	
	/**
	 *  Data object that will be element type for MonthDayList
	 */
	public class MonthDay extends LocalUID
	{
		// the date to display
		[Bindable]
		public var date:Date;
		
		[Bindable]
		public var isInCurrentMonth:Boolean;
		
		
		override public function get uid():String
		{
			return date.fullYear.toString() + date.month.toString() + date.date.toString();
		}
		
		[Bindable("_none_")]
		public function get dateLabel():String
		{
			return date.date.toString();
		}
	}
	
}
