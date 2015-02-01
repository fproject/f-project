package testdata.di
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.ComboBox;
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;

	[PropertyBinding(textInput="comboBox.textInput@")]
	public class Injector_attachEventListeners_018 extends SkinnableContainer
	{
		public function Injector_attachEventListeners_018()
		{
			this.setStyle("skinClass", Injector_attachEventListeners_018Skin);
		}
		
		public var textInput_changeRunned:Boolean;
		public function textInput_change(event:TextOperationEvent):void
		{
			textInput_changeRunned = true;
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
		
		[SkinPart(required="true")]
		public var comboBox:ComboBox;
		
		[Bindable]
		[EventHandling(event="change",handler="textInput_change")]
		public var textInput:TextInput;
	}
}