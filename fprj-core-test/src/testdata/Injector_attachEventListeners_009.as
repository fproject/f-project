package testdata
{
	import flash.events.MouseEvent;
	
	import spark.components.Label;

	[EventHandling(event="click", handler="mouseClick")]
	[EventHandling(event="flash.events.MouseEvent.DOUBLE_CLICK", handler="mouseDoubleClick")]
	public class Injector_attachEventListeners_009 extends Label
	{
		public function mouseClick(e:MouseEvent):void
		{
			
		}
		
		public function mouseDoubleClick(e:MouseEvent):void
		{
			
		}
	}
}