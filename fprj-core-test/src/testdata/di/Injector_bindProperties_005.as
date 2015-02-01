package testdata.di
{
	import spark.components.Label;
	[PropertyBinding(label="label1")]
	public class Injector_bindProperties_005
	{
		public var label:Label;
		
		public var label1:Label = new Label();
	}
}