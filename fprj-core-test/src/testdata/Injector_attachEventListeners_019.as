package testdata
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.ComboBox;
	import spark.components.SkinnableContainer;

	public class Injector_attachEventListeners_019 extends SkinnableContainer
	{
		public function Injector_attachEventListeners_019()
		{
			this.setStyle("skinClass", Injector_attachEventListeners_019Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
		
		[SkinPart(required="true")]
		[EventHandling(dispatcher="textInput",event="myEvent",handler="comboBoxTextInput_myEvent")]
		public var comboBox:ComboBox;
		
		public var textInput_myEventRunned:Boolean;
		
		public function comboBoxTextInput_myEvent(event:Event):void
		{
			textInput_myEventRunned = true;
		}
	}
}