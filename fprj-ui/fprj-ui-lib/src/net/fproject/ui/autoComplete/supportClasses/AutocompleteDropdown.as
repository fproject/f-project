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
package net.fproject.ui.autoComplete.supportClasses
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ListCollectionView;
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.FlexEvent;
	
	import spark.components.BorderContainer;
	import spark.components.Label;
	import spark.components.List;
	import spark.layouts.VerticalLayout;
	
	import net.fproject.di.Injector;
	import net.fproject.ui.events.AutoCompleteEvent;
	import net.fproject.utils.StringUtil;
	
	[SkinState("found")]
	[SkinState("nothingFound")]
	[EventHandling(event="mx.events.FlexEvent.INITIALIZE",handler="module_initialize")]
	[EventHandling(event="mx.events.FlexEvent.CREATION_COMPLETE",handler="module_creationComplete")]
	public class AutocompleteDropdown extends BorderContainer
	{
		public function AutocompleteDropdown()
		{
			super();
			Injector.inject(this);
		}
		
		public static const MATCH_BEGINNING:String 	= "beginning";
		public static const MATCH_WORD:String		= "word";
		public static const MATCH_ANY_PART:String	= "anyPart";
		
		public static const createNewButtonData:Object = {type:"createNewButtonData", label:"Not found? Click to create new"};
		
		private var _dropdownWidth:int;
		
		[Bindable]
		public function get dropdownWidth():int
		{
			return _dropdownWidth;
		}
		
		public function set dropdownWidth(value:int):void
		{
			_dropdownWidth = value;
		}
		
		public var delimiter:String = ",";
		
		public var allowMultipleSelection:Boolean;
		
		public var dropDownRowCount:uint = 5;
		
		protected var _searchText:String;
		
		[Bindable(event="searchChange")]
		/**
		 * Returns the search string.
		 */						
		public function get searchText():String
		{
			return _searchText;
		}
		
		public function set searchText(value:String):void
		{
			if(_searchText != value)
			{
				_searchText = value == null ? "":value;
				
				/*if (textInput != null)
				{
				textInput.text = value;
				textInput.validateNow();
				}*/
				
				if(hasEventListener(AutoCompleteEvent.SEARCH_CHANGE))
					dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SEARCH_CHANGE, _searchText));	
			}
		}
		/**
		 * Called at initialization time to load the default data sample.
		 */
		public function module_initialize(event:FlexEvent):void
		{
			if (!disabledItems)
			{
				disabledItems = new ArrayCollection();
			}
			
			if (_itemRenderer == null) 
				_itemRenderer = new ClassFactory(DropDownItemRenderer);
			if (_buttonItemRenderer == null) 
				_buttonItemRenderer = new ClassFactory(CreateNewButtonRenderer);
			
			if (_defaultLabelFunction == null)
			{
				_defaultLabelFunction = function(item:Object):String
				{
					if (labelField && item.hasOwnProperty(labelField))
					{
						return item[labelField];
					}
					else
					{
						return item.toString();
					}
				}
			}
			this.addEventListener(KeyboardEvent.KEY_DOWN, dropDownKeydownEventHandler);
		}
		
		public static function regexEscap(string:String):String
		{
			if (!string)
			{
				return string;
			}
			
			return string.replace(/[.*+?|(){}\[\]\\^$]/g, "\\$&");
		}
		
		/**
		 * Called at initialization time to load the default data sample.
		 */
		public function module_creationComplete(event:FlexEvent):void
		{
			updateDropdown();
		}
		
		protected var _dataProviderChanged:Boolean;
		
		// The dataProvider supplied by the user is stored in
		// the .list property of the _filteredDataProvider
		[Bindable]
		public var filteredCollection:ListCollectionView;
		
		protected var _dataProvider:IList;
		
		public function get dataProvider():IList
		{
			return _dataProvider;
		}
		
		public function set dataProvider(value:IList):void
		{
			if (value != _dataProvider)
			{
				if (_dataProvider != null)
				{
					filteredCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,
						filteredCollection_collectionChange);
				}
				
				_dataProvider = value;
				
				if(value is ListCollectionView)
					filteredCollection = new ListCollectionView(ListCollectionView(value).list);
				else
					filteredCollection = value == null ? null : new ListCollectionView(value);
				filteredCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,filteredCollection_collectionChange);
				updateDropdown();
			}
		}
		
		public var disabledItems:ArrayCollection;
		
		public function get selectedItem():*
		{
			return dropDown.selectedItem; 
		}
		
		public function get selectedIndex():int
		{
			return dropDown.selectedIndex;
		}
		
		public function set selectedIndex(index:int):void
		{
			dropDown.selectedIndex = index;
		}
		
		public function ensureIndexIsVisible(index:int):void
		{
			dropDown.ensureIndexIsVisible(index);
		}
		
		[Bindable]
		/**
		 * The name of the field in the data provider items to display as the label.
		 */
		public var labelField:String;
		
		private var _labelFunction:Function;
		
		public function get labelFunction():Function
		{
			return (_labelFunction != null) ? _labelFunction:_defaultLabelFunction;
		}
		
		public function set labelFunction(value:Function):void
		{
			_labelFunction = value;
		}
		
		
		/**
		 * The default function used to determine the text to display in the dropdown when searching.
		 * It will try to find the part of the item which matched the search string and highlight
		 * it by making bold and underlined
		 */
		protected var _defaultLabelFunction:Function;
		
		public function set defaultLabelFunction(value:Function):void
		{
			if (value != null)
			{
				_defaultLabelFunction = value;
			}
		}
		
		public function highLightMatchLabelFunction(item:Object):String
		{
			return highlightMatch(labelFunction(item));
		}
		
		protected var _matchType:String = MATCH_ANY_PART;
		[Inspectable(enumeration="beginning,word,anyPart")]
		/**
		 * Specifies the how to compare the item to the search string when checking for a match.
		 * Note, setting a value for the filterFunction property will override this property.
		 * @default beginning
		 */
		public function get matchType():String
		{
			return _matchType;
		}
		
		public function set matchType(value:String):void
		{
			_matchType = value;
		}
		
		/**
		 * The default function used to determine the text to display in the dropdown when searching.
		 * It will try to find the part of the item which matched the search string and highlight
		 * it by making bold and underlined
		 */
		public function highlightMatch(sourceText:String):String
		{
			if (sourceText == null)
			{
				return "";
			}
			
			// there are problems using ">"s and "<"s in HTML
			var string:String = sourceText.replace("<", "&lt;").replace(">", "&gt;");				
			
			var returnStr:String = AutoCompleteUtil.highlightMatch(string, searchText);
			
			return returnStr;
		}
		
		public var allowNewValues:Boolean = false;
		
		private var _enableFilter:Boolean = true;
		
		public function set enableFilter(value:Boolean):void
		{
			_enableFilter = value;
		}
		
		public function get enableFilter():Boolean
		{
			return _enableFilter;
		}
		
		protected var _filterFunction:Function;
		
		/**
		 * A function that the view will use to eliminate items that do not match the function's criteria.
		 */ 			
		public function set filterFunction(value:Function):void
		{
			_filterFunction = value;
		}
		
		public function get filterFunction():Function
		{
			return (_filterFunction != null) ? _filterFunction:defaultFilterFunction;
		}
		
		protected function defaultFilterFunction(item:Object, searchStr:String):Boolean
		{
			if (!searchStr || searchStr.length == 0 || labelFunction == null)
				return true;
			
			var str:String = labelFunction(item);
			switch (_matchType)
			{
				case MATCH_ANY_PART:
					return AutoCompleteUtil.contains(str, searchStr);
				case MATCH_BEGINNING:
					return StringUtil.startsWith(str, searchStr);
				case MATCH_WORD:
					return AutoCompleteUtil.anyWordBeginsWith(str, searchStr);
			}
			
			return false;
		}
		
		protected var itemMatchingCount:int = 0; 
		protected function filterFunctionWrapper(item:Object):Boolean
		{
			if (filteredCollection.getItemIndex(item) == 0)
				itemMatchingCount = 0;
			if (item !== createNewButtonData && itemMatchingCount >= dropDownRowCount)
				return false; 
			if (item === createNewButtonData || filterFunction(item, _searchText))
			{
				itemMatchingCount++;
				return true;
			}
			return false;
		}
		
		protected function filteredCollection_collectionChange(event:CollectionEvent):void
		{
			if (event.kind == CollectionEventKind.REMOVE)
			{
				/*for each (var item:Object in event.items)
				{
				var index:int = _selectedItems.getItemIndex(item);
				
				if (index >= 0)
				{
				_selectedItems.removeItemAt(index);
				}
				}*/
			}
			updateDropdown();
		}
		
		//filter localColection follow match type and keyword
		public function updateDropdown():void
		{
			if (!filteredCollection)
			{
				return;
			}
			if (allowNewValues)
			{
				filteredCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,filteredCollection_collectionChange);
				filteredCollection.removeItem(createNewButtonData);
				if (searchText != null && searchText.length > 0)
					filteredCollection.addItem(createNewButtonData);
				filteredCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE, filteredCollection_collectionChange, false, 0, true);
			}
			
			if (enableFilter)
				filterData();
			if (isPerfectMatch())
				dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.PERFECT_MATCH, filteredCollection.getItemAt(0)));
			
			if (dropDown != null)
			{
				//var dropDownLayout:VerticalLayout = (dropDown.layout != null)? VerticalLayout(dropDown.layout): new VerticalLayout;
				var dropDownLayout:VerticalLayout = new VerticalLayout;
				dropDownLayout.gap = 0;
				dropDownLayout.requestedRowCount = filteredCollection.length;
				dropDown.layout = dropDownLayout;
			}
			
			if (skin != null)
				skin.currentState = (isFoundRecentSearchs()) ? "found":"nothingFound";
		}
		
		/**
		 * A function which controls whether or not to automatically select the item if it's the
		 * only match. Note, this functionality is disabled if autoSelect is set to false. 
		 */
		public var checkMatchingFunction:Function;
		
		protected function isPerfectMatch():Boolean
		{
			if (!_searchText)
			{
				return false;
			}
			
			var str:String = StringUtil.trim(_searchText, ',');
			
			if (filteredCollection && (filteredCollection.length == 1 || (filteredCollection.length == 2 && filteredCollection.getItemAt(1) === createNewButtonData)))
			{
				var item:Object = filteredCollection.getItemAt(0);
				
				if (checkMatchingFunction != null)
				{
					return checkMatchingFunction(item, str);
				}
				else
				{
					var label:String = labelFunction(item);
					return (label.toLowerCase() == str.toLowerCase());
				}
			}
			
			return false;
		}
		
		public function filterData():void
		{
			if (filteredCollection == null)
				return;
			filteredCollection.filterFunction = filterFunctionWrapper;
			
			//Call updateDropdown function may cause change on collection so have to remove event colection_change first and add after call funtion
			filteredCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,filteredCollection_collectionChange);
			filteredCollection.refresh();
			filteredCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE, filteredCollection_collectionChange, false, 0, true);
		}
		
		protected var _itemRenderer:IFactory;
		/**
		 * The custom item renderer for the dropdown displayed when searching.
		 */			
		public function set itemRenderer(value:IFactory):void
		{
			_itemRenderer = value;
		}
		
		public function get itemRenderer():IFactory
		{
			return _itemRenderer;
		}
		
		protected var _buttonItemRenderer:IFactory;
		/**
		 * The custom item renderer for the dropdown displayed when searching.
		 */			
		public function set buttonItemRenderer(value:IFactory):void
		{
			_buttonItemRenderer = value;
		}
		
		public function itemRendererFunction(item:Object):IFactory {
			return (item === createNewButtonData) ? _buttonItemRenderer:_itemRenderer;
		}
		protected function dispatchChangeEvent():void
		{
			//only dispatch if it is visitable
			if (!(this.parent))
				return;
			var item:Object = dropDown.selectedItem;
			if (item === createNewButtonData)
				this.dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CREATE_NEW_BUTTON_CLICK, item));
			else
				this.dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE, item));
		}
		
		public function dropDownChangeEventHandler(event:Event):void
		{
			dispatchChangeEvent();
			event.stopImmediatePropagation();
			event.preventDefault();
		}
		
		public function dropDownKeydownEventHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.DOWN)
			{
				if (selectedIndex == filteredCollection.length - 1)
				{
					selectedIndex = 0;
				}
				else
				{
					selectedIndex++;
				}
				ensureIndexIsVisible(selectedIndex);
			}
			else if (event.keyCode == Keyboard.UP)
			{
				if (selectedIndex == 0)
				{
					selectedIndex = filteredCollection.length - 1;
				}
				else
				{
					selectedIndex--;						
				}
				
				ensureIndexIsVisible(selectedIndex);
			}
			
			if (event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.TAB 
				|| (String.fromCharCode(event.charCode) == delimiter && allowMultipleSelection))
			{
				dispatchChangeEvent();
			}
		}
		
		public function isFoundRecentSearchs():Boolean
		{
			return (filteredCollection !=  null && filteredCollection.length > 0 && filteredCollection.getItemAt(0) !== createNewButtonData);
		}
		
		[SkinPart(required="true",type="static")]
		[PropertyBinding(width="dropdownWidth@")]
		public var nothingFoundLabel:Label;
		
		[SkinPart(required="true",type="static")]
		[PropertyBinding(dataProvider="filteredCollection@",itemRendererFunction="itemRendererFunction@")]
		[PropertyBinding(width="dropdownWidth@",labelField="labelField@",labelFunction="highLightMatchLabelFunction@")]
		[PropertyBinding(itemRendererFunction="itemRendererFunction")]
		[EventHandling(event="change",handler="dropDownChangeEventHandler")]
		[EventHandling(event="click",handler="dropDownChangeEventHandler")]
		public var dropDown:List;
	}
}