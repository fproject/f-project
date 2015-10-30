package
{
	import flash.events.Event;

	public class ColorAutoCompletePanelEvent extends Event
	{
		public var name:String;
		public var hex:String;
		
		public static const NEW_COLOR:String = "newColor";
		
		public function ColorAutoCompletePanelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}