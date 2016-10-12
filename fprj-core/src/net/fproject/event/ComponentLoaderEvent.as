package net.fproject.event
{
	import flash.events.Event;

	public class ComponentLoaderEvent extends Event
	{
		public static const LOADED:String = "loaded";
		
		public function ComponentLoaderEvent(type:String, bubbles:Boolean=false)
		{
			super(type, bubbles);
		}
	}
}