///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
///////////////////////////////////////////////////////////////////////////////
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
		 * Dispatched when user clicks on the create new button
		 * @eventType createNewButtonClick
		 */
		public static const CREATE_NEW_BUTTON_CLICK:String = "createNewButtonClick";
		
		/**
		 * Dispatched when autocomplete search result have only one result and perfect match whith user searching text
		 * @eventType perfectMatch
		 */
		public static const PERFECT_MATCH:String = "perfectMatch";
		
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