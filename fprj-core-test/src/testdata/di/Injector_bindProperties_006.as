package testdata.di
{
	import spark.components.Label;
	[PropertyBinding(label="myObject.label")]
	public class Injector_bindProperties_006
	{
		public var label:Label;
		
		public var myObject:Object = {label:new Label()};
	}
}