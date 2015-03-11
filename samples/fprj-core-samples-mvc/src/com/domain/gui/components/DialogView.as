package com.domain.gui.components
{
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	
	import spark.components.TextArea;
	
	[EventHandling(event="close", handler="view_close")]
	public class DialogView extends DialogViewBase
	{
		public const CONSTANT_TEXT:String = "ABCXYS\nDDSDSD\nfdfdfsdfdfs\n\n\nffdsafds afsdafsdaf";
		
		[SkinPart(required="true")]
		[PropertyBinding(text="CONSTANT_TEXT")]
		public var theTextArea:TextArea;
		
		public function view_close(e:Event):void
		{
			PopUpManager.removePopUp(this);
		}
	}
}