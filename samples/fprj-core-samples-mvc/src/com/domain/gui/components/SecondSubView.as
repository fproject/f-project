package com.domain.gui.components
{
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.TextArea;

	public class SecondSubView extends SkinnableViewBase
	{
		public const CONSTANT_TEXT:String = "ABCXYS\nDDSDSD\nfdfdfsdfdfs\n\n\nffdsafds afsdafsdaf";
		
		[SkinPart(required="true")]
		[PropertyBinding(text="CONSTANT_TEXT")]
		public var theTextArea:TextArea;
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="showDialogButton_click")]
		public var showDialogButton:Button;
		
		public function showDialogButton_click(e:Event):void
		{
			var dlg:DialogView = new DialogView;
			PopUpManager.addPopUp(dlg, this);
			PopUpManager.centerPopUp(dlg);
		}
	}
}