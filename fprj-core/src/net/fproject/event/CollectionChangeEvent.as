package net.fproject.event
{
	import flash.events.Event;
	
	public class CollectionChangeEvent extends Event
	{
		public static const SAVE_COMPLETE:String = "saveComplete";
		public static const SAVE_FAULT:String = "saveFault";
		public static const DELETE_COMPLETE:String = "deleteComplete";
		public static const DELETE_FAULT:String = "deleteFault";
		
		protected var _result:Object;
		
		public function get result():Object
		{
			return _result;
		}
		
		protected var _items:Array;
		
		public function get items():Array
		{
			return _items;
		}
		
		public function CollectionChangeEvent(type:String, result:Object, items:Array)
		{
			super(type);
			_result = result;
			_items = items;
		}
	}
}