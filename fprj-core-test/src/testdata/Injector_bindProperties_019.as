package testdata
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	
	import net.fproject.calendar.components.Calendar;
	import net.fproject.calendar.components.supportClasses.CalendarRenderItem;

	public class Injector_bindProperties_019 extends SkinnableContainer
	{
		[SkinPart(required="true",type="static")]
		public var calendar:Calendar;
		
		[PropertyBinding("@calendar.dataDescriptor.dataTipFunction@")]
		[PropertyBinding("@calendar.dataDescriptor.editingTipFunction@")]
		public function calendarTooltipFunction(item:CalendarRenderItem):String 
		{
			return '1234567890';
		}
		
		public function Injector_bindProperties_019()
		{
			this.setStyle("skinClass", Injector_bindProperties_019Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}