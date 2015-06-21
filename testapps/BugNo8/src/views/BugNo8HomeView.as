package views
{
	import mx.events.FlexEvent;
	
	import spark.components.View;
	
	import net.fproject.di.Injector;
	
	[EventHandling(event="initialize",handler="view_initialize")]
	public class BugNo8HomeView extends View
	{
		[Bindable]
		public var someText:String;
		
		public function BugNo8HomeView()
		{
			Injector.inject(this);
		}
		
		public function view_initialize(e:FlexEvent):void
		{
			someText = "ABC";
		}
	}
}