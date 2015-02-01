package testdata.di
{
	import flash.events.EventDispatcher;
	
	import spark.components.Label;

	[PropertyBinding(hostChain="myObject.label",text="myString")]
	public class Injector_bindProperties_008 extends EventDispatcher
	{
		public var label:Label;
		
		public var myObject:Object = {label:new Label()};
		
		public var myString:String = "AAA";
	}
}