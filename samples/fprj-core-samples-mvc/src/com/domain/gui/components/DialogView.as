package com.domain.gui.components
{
	import com.domain.model.User;
	import com.domain.service.UserService;
	
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import spark.components.TextArea;
	
	[EventHandling(event="initialize",handler="view_initialize")]//Event handling of class instance
	[EventHandling(event="close", handler="view_close")]
	public class DialogView extends DialogViewBase
	{
		[SkinPart(required="true")]
		public var theTextArea:TextArea;
		
		public function view_initialize(e:Event):void
		{
			UserService.instance.find(
				{condition:"username LIKE :name",params:{":name":"%Batch%"}},
				2, 5, "-name", userFindCompleteHandler);
		}
		
		public function view_close(e:Event):void
		{
			PopUpManager.removePopUp(this);
		}
		
		private function userFindCompleteHandler(users:Array):void
		{
			theTextArea.text = "User searching result:\n\n"
			for each(var user:User in users)
			{
				theTextArea.appendText(StringUtil.substitute("ID: {0}, Name: {1}\n",user.id, user.username));
			}
		}
	}
}