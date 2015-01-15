package testdata
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;

	[PropertyBinding(hostChain="label1",text="myText")]
	public class Injector_bindProperties_009 extends SkinnableContainer
	{
		[SkinPart]
		[PropertyBinding(text="myText")]
		public var label:Label;
		
		[SkinPart]
		public var label1:Label;
		
		public var myText:String = "AAABBBCCC";
		
		public function Injector_bindProperties_009()
		{
			this.setStyle("skinClass", Injector_bindProperties_009Skin);
		}
		
		public function show(callback:Function):void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
			this.addEventListener("showDlg", function(e:Event):void{callback();});
			dispatchEvent(new Event("showDlg"));
		}
	}
}