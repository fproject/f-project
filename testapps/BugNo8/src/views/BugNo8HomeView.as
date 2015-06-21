package views
{
	import mx.events.FlexEvent;
	
	import spark.components.TextInput;
	import spark.components.View;
	import spark.events.TextOperationEvent;
	
	import net.fproject.di.Injector;
	
	[EventHandling(event="initialize",handler="view_initialize")]
	public class BugNo8HomeView extends View
	{
		[Bindable]
		public var someText:String;
		
		[SkinPart(required="true",type="static")]
		[EventHandling(event="change",handler="someTextInput_change")]
		public var someTextInput:TextInput;
		
		public function BugNo8HomeView()
		{
			Injector.inject(this);
		}
		
		public function someTextInput_change(e:TextOperationEvent):void
		{
			this.title = someTextInput.text;
		}
		
		public function view_initialize(e:FlexEvent):void
		{
			someText = "ABC";
		}
	}
}