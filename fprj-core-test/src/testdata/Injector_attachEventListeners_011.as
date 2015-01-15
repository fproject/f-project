package testdata
{
	import flash.events.MouseEvent;
	
	import spark.components.Label;
	[EventHandling(dispatcher="label",event="click", handler="mouseClick")]
	public class Injector_attachEventListeners_011
	{
		
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