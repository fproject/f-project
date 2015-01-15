package testdata
{
	import spark.components.Label;
	[PropertyBinding(label="this.myObject.label")]
	public class Injector_bindProperties_007
	{
		public var label:Label;
		
		public var myObject:Object = {label:new Label()};
	}
}