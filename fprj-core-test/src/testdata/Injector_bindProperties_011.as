package testdata
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;

	[PropertyBinding(hostChain="label",left="labelLeft")]
	public class Injector_bindProperties_011 extends SkinnableContainer
	{
		[SkinPart]
		[PropertyBinding(text="myText")]
		public var label:Label;
		
		public var myText:String = "AAABBBCCC";
		
		public var labelLeft:Number = 100;
		
		public function Injector_bindProperties_011()
		{
			this.setStyle("skinClass", Injector_bindProperties_011Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}