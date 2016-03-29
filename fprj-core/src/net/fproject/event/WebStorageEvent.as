package net.fproject.event
{
	import flash.events.Event;

	public class WebStorageEvent extends Event
	{
		public var key:String;
		
		public var oldValue:*;
		
		public var newValue:*;
		
		public var uri:String;
		
		public var storageArea:String;
		
		public function WebStorageEvent(type:String, src:Object=null)
		{
			super(type);
			if(src != null)
			{
				for (var s:String in src)
				{
					if(this.hasOwnProperty(s))
						this[s] = src[s];
				}
			}
		}
		
		public static const STORAGE:String = "storage";
	}
}