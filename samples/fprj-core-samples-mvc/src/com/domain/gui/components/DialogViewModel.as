package com.domain.gui.components
{
	import com.domain.model.User;
	import com.domain.service.UserService;
	
	import flash.events.EventDispatcher;
	
	import net.fproject.active.ActiveDataProvider;
	
	public class DialogViewModel extends EventDispatcher
	{
		[Bindable]
		public var user:User;
		
		[Bindable]
		public var userDataProvider:ActiveDataProvider;
		
		public function init():void
		{
			var criteria:Object = {condition:"username LIKE :name",params:{":name":"%demo_no_%"}};
			userDataProvider = UserService.instance.createDataProvider(criteria) as ActiveDataProvider;
			user = new User();
			user.id = '2';
		}
	}
}