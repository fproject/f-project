package testdata.di
{
	import spark.components.Label;

	public class Injector_bindProperties_001
	{
		[PropertyBinding(text="myText")]
		public var label:Label = new Label();
		
		[PropertyBinding(text="this.myText")]
		public var label1:Label = new Label();
		
		public var myText:String = "AAABBBCCC";
	}
}