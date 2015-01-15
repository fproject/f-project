package testdata
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;

	public class Injector_bindProperties_013 extends SkinnableContainer
	{
		[SkinPart]
		[PropertyBinding(text="myText@")]
		public var label:Label;
		
		[SkinPart(required="true")]
		public var myText:String;
		
		public function Injector_bindProperties_013()
		{
			this.setStyle("skinClass", Injector_bindProperties_013Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}