package net.fproject.ui.events
{
	import flash.events.Event;

	public class AutoCompleteEvent extends Event
	{
		/**
		 * Dispatched when the selected items are changed by the user.
		 * @eventType change
		 */
		public static const CHANGE:String = "change";
		
		/**
		 * Dispatched when user double-clicks to a selected item in a AutoComplete
		 * @eventType selectedItemDoubleClick
		 */
		public static const SELECTED_ITEM_DOUBLE_CLICK:String = "selectedItemDoubleClick";
		
		/**
		 * Dispatched when user clicks to inline button in a AutoComplete
		 * @eventType inlineButtonClick
		 */
		public static const INLINE_BUTTON_CLICK:String = "inlineButtonClick";
		
		/**
		 * Dispatched when the text in the search field is changed.
		 * @eventType searchChange
		 */
		public static const SEARCH_CHANGE:String = "searchChange";
		
		//public static const REMOVE_SELECTED_ITEM:String = "removeSelectedItem";
		
		private var _data:Object;

		public function get data():Object
		{
			return _data;
		}

		public function AutoCompleteEvent(type:String, data:Object=null)
		{
			super(type);
			_data = data;
		}
	}
}