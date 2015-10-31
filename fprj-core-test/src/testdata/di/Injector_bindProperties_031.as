package testdata.di
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	[ResourceBundle("test")]
	public class Injector_bindProperties_031 extends SkinnableContainer
	{
		[SkinPart(required="true")]
		[PropertyBinding(text="$RB('test','bind.properties.031.key')")]
		public var textInput:TextInput;
		
		public function Injector_bindProperties_031()
		{
			this.setStyle("skinClass", Injector_bindProperties_031Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}