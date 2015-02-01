package testdata.di
{
	import flash.events.MouseEvent;
	
	import spark.components.Label;

	public class Injector_attachEventListeners_001
	{
		[EventHandling(event="click", handler="mouseClick")]
		[EventHandling(event="flash.events.MouseEvent.DOUBLE_CLICK", handler="mouseDoubleClick")]
		public var label:Label = new Label();
		
		public function mouseClick(e:MouseEvent):void
		{
			
		}
		
		public function mouseDoubleClick(e:MouseEvent):void
		{
			
		}
	}
}