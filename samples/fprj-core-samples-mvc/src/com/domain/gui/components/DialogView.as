package com.domain.gui.components
{
	import com.domain.model.User;
	import com.domain.service.UserService;
	
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import spark.components.DataGrid;
	import spark.components.DropDownList;
	import spark.components.TextArea;
	
	import net.fproject.active.PaginationResult;
	
	[EventHandling(event="initialize",handler="view_initialize")]//Event handling of class instance
	[EventHandling(event="close", handler="view_close")]
	public class DialogView extends DialogViewBase
	{
		[SkinPart(required="true")]
		public var theTextArea:TextArea;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="model.userDataProvider@", labelField="'username'")]
		[PropertyBinding(selectedItem='model.user@')]
		public var theDropDown:DropDownList;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="model.userDataProvider@")]
		public var theSparkDataGrid:DataGrid;
		
		[Bindable]
		public var model:DialogViewModel;
		
		public function view_initialize(e:Event):void
		{
			var criteria:Object = {condition:"username LIKE :name",params:{":name":"%demo_no_%"}};
			UserService.instance.find(criteria, 2, 5, "-name", userFindCompleteHandler);
			model.init();
		}
		
		public function view_close(e:Event):void
		{
			PopUpManager.removePopUp(this);
		}
		
		private function userFindCompleteHandler(result:PaginationResult):void
		{
			theTextArea.text = "User searching result:\n\n"
			for each(var user:User in result.items)
			{
				theTextArea.appendText(StringUtil.substitute("ID: {0}, Name: {1}\n",user.id, user.username));
			}
		}
	}
}