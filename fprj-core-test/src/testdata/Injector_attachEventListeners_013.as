package testdata
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.controls.AdvancedDataGrid;
	import mx.core.FlexGlobals;
	import mx.events.ListEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;

	[EventHandling(dispatcher="label",event="click", handler="mouseClick")]
	public class Injector_attachEventListeners_013 extends SkinnableContainer
	{
		public function mouseClick(e:MouseEvent):void
		{
		}
		
		[SkinPart(required="true")]
		public var label:Label;
		
		public function Injector_attachEventListeners_013()
		{
			this.setStyle("skinClass", Injector_attachEventListeners_013Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
		
		[SkinPart(required="true")]
		[EventHandling(event="mx.events.ListEvent.CHANGE",handler="dataGrid_change")]
		public var dataGrid:AdvancedDataGrid;
		
		public function dataGrid_change(event:ListEvent):void
		{
		}
	}
}