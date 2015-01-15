package testdata
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;

	public class Injector_bindProperties_010 extends SkinnableContainer
	{
		[SkinPart]
		[PropertyBinding(text="myText")]
		public var label:Label;
		
		public var myText:String = "AAABBBCCC";
		
		public function Injector_bindProperties_010()
		{
			this.setStyle("skinClass", Injector_bindProperties_010Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}