package testdata
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;

	public class Injector_bindProperties_016 extends SkinnableContainer
	{
		[SkinPart(required="true")]
		public var myProp:Injector_bindProperties_016_prop;
		
		public function Injector_bindProperties_016()
		{
			this.setStyle("skinClass", Injector_bindProperties_016Skin);
		}
		
		[PropertyBinding("@myProp.functionProp@")]
		public function myFunction():String 
		{ 
			return "AAABBBCCC";
		};
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}