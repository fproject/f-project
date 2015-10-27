package
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	
	import net.fproject.active.ActiveDataProvider;
	import net.fproject.active.IActiveDataProvider;
	import net.fproject.active.PaginationResult;
	import net.fproject.di.Injector;
	import net.fproject.di.InstanceFactory;
	import net.fproject.ui.autoComplete.AutoComplete;
	import net.fproject.ui.events.AutoCompleteEvent;
	
	import service.UserService;
	
	//[PropertyBinding(dataProvider='activeData@')]
	[EventHandling(event="searchChange", handler="onSearchChange")]
	/**
	 * The <code>ActiveAutoComplete</code> provides an auto-complete box for searching using an <code>IActiveDataProvider</code>
	 * 
	 * @author Do Van Tu
	 */
	public class ActiveAutoComplete extends AutoComplete
	{
		[Bindable]
		/**
		 * The ActiveDataProvider used as <code>dataProvider</code> for this auto-complete
		 */
		public var activeData:IActiveDataProvider;
		
		[Bindable]
		/**
		 * The parameter name of the searching criteria that binds to the <code>searchText</code> property for auto-seaching.
		 */
		public var parameterName:String;
		
		private var userService:UserService = UserService(InstanceFactory.getInstance(UserService));
		private var timer:Timer;
		private var searchingText:String;
		
		public function ActiveAutoComplete()
		{
			super();
			Injector.inject(this);
			//enableFilter = false;
		}
		
		public function onSearchChange(event:AutoCompleteEvent):void
		{
			if (timer == null)
				timer = new Timer(1000);
			else
				timer.reset();
			
			searchingText = String(event.data);
			timer.addEventListener(TimerEvent.TIMER, onTimerComplete);
			timer.start();
		}
		
		private function onTimerComplete(event:TimerEvent):void
		{
			event.stopImmediatePropagation();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			timer.stop();
			timer = null;
			
			if (searchingText != "") 
				userService.find({condition:"username like :searchText","params": {":searchText":"%" + searchingText + "%"}},NaN,10,null,userCompleteHandler,null);
		}
		
		public function userCompleteHandler(users:PaginationResult):void{
			/*if (dataProvider == null)
				dataProvider = new ArrayCollection;
			dataProvider.removeAll();
			for each (var item:Object in users.items)
			{
				dataProvider.addItem(item);
			}*/
			/*dataProvider = new ArrayCollection(users.items);
			trace(String(users.items.length));*/
			if (dataProvider == null)
				dataProvider = new ArrayCollection;
			dataProvider.removeAll();
			for each (var item:Object in users.items){
				dataProvider.addItem(item);
			}
		}
	}
}