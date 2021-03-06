package testdata.di
{
	import flash.display.DisplayObject;
	
	import mx.controls.AdvancedDataGrid;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	
	public class Injector_bindProperties_020 extends SkinnableContainer
	{
		[SkinPart(required="true",type="static")]
		public var adg:AdvancedDataGrid;
		
		[PropertyBinding("@adg.dataTipFunction@","@adg.labelFunction@")]
		public function calendarTooltipFunction(item:Object):String 
		{
			return '1234567890';
		}
		
		public function Injector_bindProperties_020()
		{
			this.setStyle("skinClass", Injector_bindProperties_019Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}