package testdata.di
{
	import spark.components.Label;

	public class Injector_bindProperties_015
	{
		[PropertyBinding(text="'myText()'")]
		public var label:Label = new Label();
		
		public function myText():String 
		{ 
			return "AAABBBCCC";
		};
	}
}