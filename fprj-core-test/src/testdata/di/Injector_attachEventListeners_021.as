package testdata.di
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.ComboBox;
	import spark.components.SkinnableContainer;

	[EventHandling(event="creationComplete",handler="onCreationComplete1",priority="1000")]
	[EventHandling(event="creationComplete",handler="onCreationComplete2",priority="1000")]
	public class Injector_attachEventListeners_021 extends SkinnableContainer
	{
		public function Injector_attachEventListeners_021()
		{
			this.setStyle("skinClass", Injector_attachEventListeners_021Skin);
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
		
		[SkinPart(required="true")]
		[EventHandling(dispatcher="textInput",event="myEvent",handler="comboBoxTextInput_myEvent",priority="1000",useCapture="true",useWeakReference="true")]
		public var comboBox:ComboBox;
		
		public var textInput_myEventCalled:Boolean;
		
		public function comboBoxTextInput_myEvent(event:Event):void
		{
			textInput_myEventCalled = true;
		}
		
		public var onCreationComplete1Called:Boolean;
		
		public function onCreationComplete1(e:Event):void
		{
			onCreationComplete1Called = true;
		}
		
		public var onCreationComplete2Called:Boolean;
		
		public function onCreationComplete2(e:Event):void
		{
			onCreationComplete2Called = true;
		}
	}
}