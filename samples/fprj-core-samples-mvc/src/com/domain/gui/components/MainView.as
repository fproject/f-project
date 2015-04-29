package com.domain.gui.components
{
	import com.domain.service.UserService;
	
	import flash.events.Event;
	
	import mx.controls.AdvancedDataGrid;
	
	import net.fproject.active.ActiveDataProvider;

	[EventHandling(event="creationComplete",handler="view_creationComplete")]
	public class MainView extends SkinnableViewBase
	{
		[Bindable]
		public var userDataProvider:ActiveDataProvider;
		
		[SkinPart(required="true")]
		public var firstSubView:FirstSubView;
		
		[SkinPart(required="true")]
		public var secondSubView:SecondSubView;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="userDataProvider@")]
		public var userDataGrid:AdvancedDataGrid;
		
		public function view_creationComplete(e:Event):void
		{
			userDataProvider = new ActiveDataProvider({});
			UserService.instance.fetchData(userDataProvider);
		}
	}
}