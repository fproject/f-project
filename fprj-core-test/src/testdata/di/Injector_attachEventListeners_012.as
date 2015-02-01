package testdata.di
{
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import spark.components.Label;

	[EventHandling(dispatcher="label",event="click", handler="mouseClick")]
	[EventHandling(dispatcher="myObject.label",event="doubleClick", handler="mouseDoubleClick")]
	public class Injector_attachEventListeners_012 extends EventDispatcher
	{
		public var label:Label = new Label();
		
		public function mouseClick(e:MouseEvent):void
		{
			
		}
		
		public function mouseDoubleClick(e:MouseEvent):void
		{
			
		}
		
		[EventHandling(dispatcher="label",event="click", handler="mouseClick")]
		public var myObject:Object = {label:new Label()};
	}
}