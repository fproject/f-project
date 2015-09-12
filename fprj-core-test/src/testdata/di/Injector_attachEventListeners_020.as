package testdata.di
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.ComboBox;
	import spark.components.SkinnableContainer;

	public class Injector_attachEventListeners_020 extends SkinnableContainer
	{
		public function Injector_attachEventListeners_020()
		{
			this.setStyle("skinClass", Injector_attachEventListeners_019Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
		
		[SkinPart(required="true")]
		[EventHandling(event="myEvent",handler="comboBoxTextInput_myEvent",useCapture='true')]
		public var comboBox:ComboBox;
		
		public var myEventRunned:Boolean;
		
		public function comboBoxTextInput_myEvent(event:Event):void
		{
			myEventRunned = true;
		}
	}
}