package net.fproject.ui.datetime.supportClasses
{
	import net.fproject.core.Time;
	
	public class Time extends net.fproject.core.Time
	{
		public var label:String;
		
		public var isHinted:Boolean;
		
		public function Time(minutes:Number=0, label:String = "", isHinted:Boolean = false)
		{
			super(minutes * 60000);
			this.label = label;
			this.isHinted = isHinted;
		}
		
		public function get minutes():Number
		{
			return _millisecondsFromMidnight / 60000;
		}
	}
}