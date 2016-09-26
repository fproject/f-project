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
package net.fproject.ui.autoComplete
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.containers.Grid;
	import mx.containers.GridItem;
	import mx.containers.GridRow;
	import mx.controls.LinkButton;
	import mx.controls.dataGridClasses.DataGridListData;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.ClassFactory;
	import mx.core.FlexGlobals;
	import mx.core.IFactory;
	import mx.core.UIComponent;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.FlexEvent;
	import mx.events.MoveEvent;
	import mx.managers.IFocusManagerComponent;
	import mx.managers.PopUpManager;
	
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.ui.autoComplete.supportClasses.AutocompleteDropdown;
	import net.fproject.ui.autoComplete.supportClasses.DefaultInlineButton;
	import net.fproject.ui.autoComplete.supportClasses.EditableItem;
	import net.fproject.ui.autoComplete.supportClasses.FlowBox;
	import net.fproject.ui.autoComplete.supportClasses.IFlowBoxItem;
	import net.fproject.ui.autoComplete.supportClasses.PromptTextInput;
	import net.fproject.ui.autoComplete.supportClasses.SelectedItem;
	import net.fproject.ui.autoComplete.supportClasses.SelectedItemButton;
	import net.fproject.ui.events.AutoCompleteEvent;
	import net.fproject.utils.StringUtil;
	
	/**
	 * Dispatched when the selected items are changed by the user.
	 * @eventType net.fproject.ui.events.AutoCompleteEvent.CHANGE
	 */
	[Event(name="change", type="net.fproject.ui.events.AutoCompleteEvent")]
	
	/**
	 * Dispatched when the text in the search field is changed.
	 * @eventType net.fproject.ui.events.AutoCompleteEvent.SEARCH_CHANGE
	 */
	[Event(name="searchChange", type="net.fproject.ui.events.AutoCompleteEvent")]
	
	/**
	 * Dispatched when user clicks to inline button in a AutoComplete
	 * @eventType net.fproject.ui.events.AutoCompleteEvent.INLINE_BUTTON_CLICK
	 */
	[Event(name="inlineButtonClick", type="net.fproject.ui.events.AutoCompleteEvent")]
	
	/**
	 * Dispatched when user double-clicks to a selected item in a AutoComplete
	 * @eventType net.fproject.ui.events.AutoCompleteEvent.SELECTED_ITEM_DOUBLE_CLICK
	 */
	[Event(name="selectedItemDoubleClick", type="net.fproject.ui.events.AutoCompleteEvent")]
	
	/**
	 * Dispatched when the selected items are changed either by the user or programmitcally.
	 * @eventType mx.events.FlexEvent.VALUE_COMMIT
	 */
	[Event(name="valueCommit", type="mx.events.FlexEvent")]
	
	/**
	 * The color for the prompt shown when no value is set.
	 */
	[Style(name="promptColor", type="uint", format="Color", inherit="yes")]
	
	/**
	 * The text color for disabled state
	 */
	[Style(name="disabledTextColor", type="uint", format="Color", inherit="yes")]
	
	/**
	 * This is an input component to allow users to select multiple items from a predefined list,
	 * using autocompletion as they type to find each item.
	 * You may have seen a similar type of text entry when filling in the recipients
	 * field sending messages on Facebook, MAC mail,...
	 * 
	 * @includeExample ColorAutoCompletePanel.mxml
	 * @includeExample DataGridAutoCompletePanel.mxml
	 * @includeExample DynamicLoadAutoCompletePanel.mxml
	 * @includeExample EmailAutoCompletePanel.mxml
	 * @includeExample OtherAutoCompletePanel.mxml
	 * @includeExample ColorAutoCompletePanelEvent.as
	 * @includeExample ColorItemRenderer.mxml
	 * @includeExample Dialog.mxml
	 * 
	 */
	
	[ResourceBundle("fprjui")]
	public class AutoComplete extends SkinnableComponent
		implements IListItemRenderer, IDropInListItemRenderer, IFocusManagerComponent
	{
		public function AutoComplete()
		{
			addEventListener(FlexEvent.INITIALIZE, initializeHandler);
		}
		
		public static const STYLE_UNDERLINE:String 	= "underline";
		public static const STYLE_MAC_MAIL:String 	= "macMail";
		public static const STYLE_FACEBOOK:String 	= "facebook";
		
		public static const ACTION_FOCUS:String 	= "focus";
		public static const ACTION_REMOVE:String = "remove";
		
		public static const MATCH_BEGINNING:String 	= "beginning";
		public static const MATCH_WORD:String		= "word";
		public static const MATCH_ANY_PART:String	= "anyPart";
		
		[Inspectable(enumeration="facebook,macMail,underline")]
		[Bindable]
		public var selectedItemStyle:String;
		
		private function initializeHandler(e:FlexEvent):void
		{
			_selectedItems = new ArrayCollection();
			_selectedItems.addEventListener(CollectionEvent.COLLECTION_CHANGE, selectedItems_collectionChange);
			dropDownContainer.addEventListener(IndexChangeEvent.CHANGE, dropDownChangeHandler);
			dropDownContainer.addEventListener(AutoCompleteEvent.CREATE_NEW_BUTTON_CLICK, onCreateNewButtonClickHandler);
			dropDownContainer.addEventListener(AutoCompleteEvent.PERFECT_MATCH, onPerfectMatchHandler);
			
			systemManager.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			
			if (!_disabledItems)
			{
				_disabledItems = new ArrayCollection();
			}
			
			if (_labelFunction == null)
			{
				labelFunction = defaultLabelFunction;
			}
			
			if (_createNewValueFunction == null)
			{
				createNewValueFunction = defaultCreateNewValue;
			}	
			
			if (!width && !percentWidth)
			{
				width = DEFAULT_MEASURED_WIDTH;
			}
			
			tabFocusEnabled = true;
			hasFocusableChildren = true;
			
			/* 
			* Remember that the super class UIComponent already added the 'keyDownHandler', 'focusInHandler',
			* and 'focusOutHandler' to listen KEY_DOWN, FOCUS_IN, FOCUS_OUT events
			*/
			addEventListener(MoveEvent.MOVE, moveHandler);
		}
		
		private function get defaultInlineButtonFactory():IFactory
		{
			return new ClassFactory(DefaultInlineButton);
		}
		
		protected function moveHandler(event:MoveEvent):void
		{
			calculateDropDownPosition();
		}
		
		protected function flowBox_resize(event:Event):void
		{
			calculateDropDownPosition();
		}			
		
		override protected function focusOutHandler(event:FocusEvent):void
		{
			super.focusOutHandler(event);
			
			var commitEvent:FlexEvent = new FlexEvent(FlexEvent.VALUE_COMMIT);
			dispatchEvent(commitEvent);				
			
			if (event.relatedObject && contains(event.relatedObject))
			{
				return;
			}
			
			if (searchTextInternal.length > 0)
			{
				if (dropDownContainer.allowNewValues)
				{
					/*_selectedItems.addItem(searchTextInternal);
					dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));*/
				}
				else if (_clearSearchOnFocusOut)
				{	
					searchText = null;
				}
			}	
		}
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			super.focusInHandler(event);
			
			if (event.relatedObject && contains(event.relatedObject))
				return;
			
			if (focusManager != null && focusManager.getFocus() == _inlineButton)
				setFocus();
		}
		
		protected var _initialSelectedItems:ArrayCollection;
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if (flowBox == null)
				return;
			
			var item:Object;
			var i:int;
			
			if (_textChanged)
			{
				_textChanged = false;
				
				addItem(null);
				textInput.text = _text;
			}
			
			if (_allowMultipleSelectionChanged)
			{
				_allowMultipleSelectionChanged = false;
				
				_selectedItems.removeAll();
				flowBox.enableMultiRow = _allowMultipleSelection;
				setClearIconEnabled();					
				searchText = null;					
			}				
			
			if (_showClearButtonChanged)
			{
				_showClearButtonChanged = false;
				setClearIconEnabled();
			}
			
			if (_promptChanged)
			{
				_promptChanged = false;
				textInput.prompt = _prompt;
			}
			
			if (_inlineButtonChanged)
			{
				_inlineButtonChanged = false;
				_inlineButtonFactoryChanged = false;
				if(_showInlineButton)
					flowBox.inlineButton = _showInlineButton ? _inlineButton : null;
			}
			
			if (_inlineButtonFactoryChanged)
			{
				if(_inlineButtonFactory)
				{
					_inlineButtonFactoryChanged = false;
					_inlineButton = _showInlineButton ? _inlineButtonFactory.newInstance() : null;
					flowBox.inlineButton = _inlineButton;	
				}
				else
					flowBox.inlineButton = null;
			}
			
			if(_showInlineButtonChanged)
			{
				if(_showInlineButton)
				{
					_showInlineButtonChanged = false;
					_inlineButtonChanged = false;
					_inlineButtonFactoryChanged = false;
					if(_inlineButton)
						var btn:UIComponent = _inlineButton;
					else if(_inlineButtonFactory)
						btn = _inlineButton;
					
					if(btn == null)
						btn = defaultInlineButtonFactory.newInstance();
					flowBox.inlineButton = btn;
				}
				else
				{
					flowBox.inlineButton = null;
				}
			}
			
			if (_showRemoveIconChanged)
			{
				_showRemoveIconChanged = false;
				flowBox.showRemoveIcon = _showRemoveIcon;
			}		
			
			/*if (_selectedItemChanged && _filteredCollection)
			{
			_selectedItemChanged = false;
			clear();
			
			if (_selectedItem)
			{
			_selectedItems.addItem(_selectedItem);
			}
			
			_selectedItem = null;
			}
			
			if (_selectedItemIdChanged && _filteredCollection)
			{
			_selectedItemIdChanged = false;
			_selectedItems.removeAll();
			
			for (i=0; i<_filteredCollection.list.length; i++)
			{
			item = _filteredCollection.list.getItemAt(i);
			
			if (item.hasOwnProperty(_keyField) && item[_keyField] == _selectedItemId)
			{
			_selectedItems.addItem(item);
			_selectedItemId = 0;
			break;
			}
			}
			}
			
			if (_selectedItemsChanged && _filteredCollection)
			{
			_selectedItemsChanged = false;
			_selectedItems.removeAll();
			
			for each (var selectedItem:Object in _initialSelectedItems)
			{
			var foundItem:Object = null;
			
			for (i=0; i<_filteredCollection.list.length; i++)
			{
			item = _filteredCollection.list.getItemAt(i);
			
			if (item == selectedItem)
			{
			foundItem = item;
			}
			else if (item.hasOwnProperty(_keyField) 
			&& selectedItem.hasOwnProperty(_keyField)
			&& item[_keyField] == selectedItem[_keyField])
			{
			foundItem = item;
			}
			
			if (foundItem)
			{
			_selectedItems.addItem(foundItem);
			foundItem = true;
			break;
			}
			}
			
			if (foundItem == null)
			{
			_selectedItems.addItem(selectedItem);																		
			}
			}
			
			_initialSelectedItems = null;
			}*/
			
			if (_tabIndexChanged)
			{
				_tabIndexChanged = false;
				flowBox.tabIndex = _tabIndex;
			}
			
			if (_errorStrChanged)
			{
				_errorStrChanged = false;
				flowBox.errorString = _errorStr;
				
				var focused:DisplayObject = focusManager.getFocus() as DisplayObject;
				var drawFocus:Boolean = focused && flowBox.contains(focused);
				flowBox.drawFocus(drawFocus);					
			}				
		}			
		
		protected function filteredCollection_collectionChange(event:CollectionEvent):void
		{
			if (event.kind == CollectionEventKind.REMOVE)
			{
				for each (var item:Object in event.items)
				{
					var index:int = _selectedItems.getItemIndex(item);
					
					if (index >= 0)
					{
						_selectedItems.removeItemAt(index);
					}
				}
			}
			updateDropdown();
		}
		
		protected function selectedItems_collectionChange(event:CollectionEvent):void
		{
			var item:Object;
			
			if (event.kind == CollectionEventKind.REMOVE)
			{
				removeItemAt(event.location);					
			}
			else if (event.kind == CollectionEventKind.RESET)
			{
				removeAll();
			}	
			else if (event.kind == CollectionEventKind.ADD)
			{
				hideDropDown();
				
				for each (item in event.items)
				{
					if (!item)
					{
						silentlyRemove(item);
					}
					
					if (checkIfDuplicate(item))
					{
						continue;
					}
					
					if (checkIfUnavailable(item))
					{
						continue;
					}
					
					addItem(item);											
				}
				
				if(textInput)
				{
					textInput.text = null;
					textInput.validateNow();	
				}
			}
			
			/*
			This caused the component to lose the key typed when there
			was already a value selected. The purpose was to show the prompt
			if there are no selected items
			if (_selectedItems.length == 0)
			{
			searchText = null;
			}
			*/
			
			var commitEvent:FlexEvent = new FlexEvent(FlexEvent.VALUE_COMMIT);
			callLater(dispatchEvent, [commitEvent]);				
		}
		
		protected function checkIfDuplicate(searchFor:Object):Boolean
		{
			if (_allowDuplicates)
			{
				return false;
			}
			
			var count:int;
			
			for each (var item:Object in _selectedItems.source)
			{
				if (item == searchFor || 
					(item.hasOwnProperty(_keyField)
						&& searchFor.hasOwnProperty(_keyField)
						&& item[_keyField] == searchFor[_keyField]))
				{
					count++;
				}
			} 
			
			if (count > 1)
			{
				silentlyRemove(item);
				return true;
			}
			
			return false;
		}
		
		protected function checkIfUnavailable(item:Object):Boolean
		{
			var index:int = _disabledItems.getItemIndex(item);
			
			if (index >= 0)
			{
				silentlyRemove(item);
				return true;
			}
			
			return false;
		}
		
		protected function silentlyRemove(item:Object):void
		{
			_selectedItems.removeEventListener(CollectionEvent.COLLECTION_CHANGE, selectedItems_collectionChange);
			
			var index:int = _selectedItems.getItemIndex(item);
			_selectedItems.removeItemAt(index);
			
			_selectedItems.addEventListener(CollectionEvent.COLLECTION_CHANGE, selectedItems_collectionChange);				
		}
		
		/**
		 * This will cause the component to research the dataProvider and display the popUp if 
		 * there are any matches. This is useful when using a dynamic dataProvider. Simply call
		 * this function once the data has been returned from the server
		 */
		public function search():void
		{
			validateNow();
			flowBox_change(null);
		}			
		
		protected var _listData:BaseListData;
		
		public function get listData():BaseListData
		{
			return _listData;
		}
		
		public function set listData(value:BaseListData):void
		{
			showClearButton = false;
			
			_listData = value;            	
		} 
		
		private var _data:Object;
		
		[Bindable("dataChange")]
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			if(_data != value)
			{
				_data = value;
				
				if (!_data || ((_listData is DataGridListData) && !_data[DataGridListData(_listData).dataField]))
				{
					return;
				}
				
				callLater(callLater, [applyData]);	
			}
		}
		
		protected function applyData():void
		{
			if(_listData is DataGridListData)
				var value:Object = _data[DataGridListData(_listData).dataField];
			else
				value = _data;
			
			
			if (value is Array)
			{
				selectedItems = new ArrayCollection(value as Array);            			
			}
			else if (value is ArrayCollection)
			{
				selectedItems = value as ArrayCollection;
			}
			else
			{
				selectedItem = value;
			}       
			dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
		}			
		
		public function defaultLabelFunction(item:Object):String
		{
			if (_labelField && item.hasOwnProperty(_labelField))
			{
				return item[_labelField];
			}
			else
			{
				return item.toString();
			}
		}
		
		public function itemToLabel(item:Object):String
		{
			return _labelFunction != null ? _labelFunction(item) : defaultLabelFunction(item);
		}
		
		public function itemToDropDownLabel(item:Object):String
		{
			return dropDownContainer.labelFunction(item);
		}
		
		protected function setClearIconEnabled():void
		{
			textInput.showClearButton = _showClearButton && !_allowMultipleSelection;
		}
		
		protected function defaultCreateNewValue():void
		{
			if (_selectedItems && searchTextInternal)
				_selectedItems.addItem(searchTextInternal);
		}
		
		/**
		 * If the list is visible and we click somewhere else we're going to close it
		 */
		protected function mouseDownHandler(event:MouseEvent):void
		{
			if (!isDropDownVisible())
			{
				return;
			}
			
			var p:Point = dropDownContainer.localToGlobal(new Point(0, 0));
			var rect:Rectangle = new Rectangle(p.x, p.y, dropDownContainer.width, dropDownContainer.height);
			
			if (!rect.contains(event.stageX, event.stageY))
			{
				hideDropDown();
			}
		}			
		
		public var preventDefaultEnterKey:Boolean;
		
		override protected function keyDownHandler(event:KeyboardEvent):void
		{
			super.keyDownHandler(event);
			if (isDropDownVisible())
			{
				dropDownContainer.dispatchEvent(event);
				
				if (event.keyCode == Keyboard.ESCAPE)
				{
					hideDropDown();
				}
			}
			else
			{
				if (!focusManager)
				{
					return;
				}
				
				var target:IFlowBoxItem = determineFocus();
				
				if (!target)
				{
					return;
				}
				
				var focused:DisplayObject = focusManager.getFocus() as DisplayObject;
				var comboItem:IFlowBoxItem;
				var item:Object;
				
				var index:int = flowBox.getItemIndex(target);
				if(index == -1)
					return;
				
				var pos:Point;
				
				if (event.keyCode == Keyboard.BACKSPACE)
				{
					if (_selectedItems.length == 0)
					{
						return;
					}
					
					if (!target.isCursorAtBeginning())
					{
						return;
					}
					
					/*Because searchText be remove before "keyDownHandler" so There are 2 case when cursorrAtBeginning:
					1. SearchText is null before. In this case, "isBackspaceText" == false
					2. SearchText != null but it be null after remove function. 
					In this case, "isBackspaceText" == true, we have to set "isBackspaceText" == false and exit
					*/
					if (isBackspaceText){
						isBackspaceText = false;
						return;
					}
					
					if (target is EditableItem)
					{
						if (EditableItem(target).isTextSelected())
						{
							return;
						}
					}
					
					if (focused is SelectedItemButton)
					{							
						_selectedItems.removeItemAt(index);
						flowBox.getItemAt(index).setTextFocus();
						dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));																														
					}
					else
					{
						if (index == 0)
						{
							return;
						}
						
						if (_allowEditingSelectedValues)
						{
							item = _selectedItems.getItemAt(index - 1);
							
							_selectedItems.removeItemAt(index - 1);
							dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));
							
							var label:String = itemToDropDownLabel(item); 
							searchText = label.substr(0, label.length - 1);
							
							textInput.setFocus();
							textInput.setTextSelected(false);
						}
						else if (_backspaceAction == AutoComplete.ACTION_REMOVE)
						{
							_selectedItems.removeItemAt(index - 1);
							dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));																														
							flowBox.getItemAt(index - 1).setTextFocus();
						}
						else
						{
							var editingItem:IFlowBoxItem = flowBox.getItemAt(index - 1);
							editingItem.setFocus();
							
							if (editingItem is SelectedItem)
							{
								SelectedItem(editingItem).selected = true;
							}
							else if (editingItem is EditableItem)
							{
								EditableItem(editingItem).setSelectionEnd();
							}
						}
					}												
				}
				else if (event.keyCode == Keyboard.DELETE)
				{
					if (_selectedItems.length == 0)
					{
						return;
					}
					
					if (!target.isCursorAtEnd())
					{
						return;
					}
					
					if (target is EditableItem)
					{
						if (EditableItem(target).isTextSelected())
						{
							return;
						}
					}
					
					if (focused is SelectedItemButton)
					{							
						_selectedItems.removeItemAt(index);
						flowBox.getItemAt(index).setTextFocus();
						dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));																														
					}
					else
					{
						if (index >= _selectedItems.length)
						{
							return;
						}
						
						if (_allowEditingSelectedValues)
						{
							item = _selectedItems.getItemAt(index);
							
							_selectedItems.removeItemAt(index);
							dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));
							
							label = itemToDropDownLabel(item); 
							searchText = label.substr(0, label.length - 1);
							
							textInput.setFocus();
							textInput.setTextSelected(false);
						}
						else if (_deleteAction == AutoComplete.ACTION_REMOVE)
						{
							_selectedItems.removeItemAt(index);
							dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));																														
							flowBox.getItemAt(index).setTextFocus();
						}
						else
						{
							editingItem = flowBox.getItemAt(index);
							editingItem.setFocus();
							
							if (editingItem is SelectedItem)
							{
								SelectedItem(editingItem).selected = true;
							}
							else if (editingItem is EditableItem)
							{
								EditableItem(editingItem).setSelectionEnd();
							}
						}
					}												
				}
				else if (event.keyCode == Keyboard.UP)
				{
					pos = flowBox.getItemPosition(target);
					pos.y--;
					
					comboItem = flowBox.getItemByPosition(pos);
					
					if (comboItem)
					{
						comboItem.setTextFocus();
					}
				}
				else if (event.keyCode == Keyboard.DOWN)
				{
					pos = flowBox.getItemPosition(target);
					pos.y++;
					
					comboItem = flowBox.getItemByPosition(pos);
					
					if (comboItem)
					{
						comboItem.setTextFocus();
					}
				}
				else if (event.keyCode == Keyboard.LEFT)
				{
					if (target is EditableItem)
					{
						if (EditableItem(target).isTextSelected())
						{
							EditableItem(target).setSelectionBeginning();
							return;
						}
					}
					
					if (index > 0)
					{
						if (!target.isCursorAtBeginning())
						{
							return;
						}
						
						// if you press left when a SelectedItem is focused then we'll move the
						// cursor to the left of the focused item (rather than one item back)
						if (focused is SelectedItemButton)
						{
							comboItem = flowBox.getItemAt(index);
						}
						else
						{				
							comboItem = flowBox.getItemAt(index - 1);
						}
						
						comboItem.setTextFocus();
						
						if (comboItem is EditableItem)
						{
							EditableItem(comboItem).setSelectionEnd();
						}
					}
					else if (index == 0 && focused is SelectedItemButton)
					{
						SelectedItem(flowBox.getItemAt(0)).setTextFocus();
					}		
				}
				else if (event.keyCode == Keyboard.RIGHT)
				{
					if (index < flowBox.numItems - 1)
					{
						if (!target.isCursorAtEnd())
						{
							return;
						}							
						
						comboItem = flowBox.getItemAt(index + 1);
						comboItem.setTextFocus();
						
						if (comboItem is EditableItem)
						{
							EditableItem(comboItem).setSelectionBeginning();
						}
					}
				}
				else if (event.keyCode == Keyboard.ENTER 
					|| (String.fromCharCode(event.charCode) == _delimiter && _allowMultipleSelection))
				{
					if (target is EditableItem)
					{
						// we're going to remove and then re-add it so that we
						// can run the unqiue check against it
						_selectedItems.removeItemAt(index);
						_selectedItems.addItemAt(EditableItem(target).item, index);
						
						textInput.setFocus();
					}
					else if (target.text && dropDownContainer.allowNewValues && target.isEditable())
					{
						_selectedItems.addItem(target.text);
						dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));																														
					}
					else if (event.keyCode == Keyboard.ENTER)
					{
						textInput.setFocus();
					}
					
					if(event.keyCode == Keyboard.ENTER  && preventDefaultEnterKey)
					{
						textInput.text = null;
						event.stopPropagation();
						event.preventDefault();
					}
				}
			}
		}
		
		protected function determineFocus():IFlowBoxItem
		{
			var comp:UIComponent = focusManager.getFocus() as UIComponent;
			
			if (comp is IFlowBoxItem)
			{
				return comp as IFlowBoxItem;
			}
			
			for (var i:int=0; i<flowBox.numItems; i++)
			{
				var item:IFlowBoxItem = flowBox.getItemAt(i);
				if (item.contains(comp))
				{
					return item;
				}	
			}
			
			return null;
		}
		
		public function clear():void
		{
			textInput.enablePrompt = true;
			searchText = null;
			selectedItems.removeAll();				
		}
		
		protected var _showSelectedItems:Boolean = true;
		
		public function removeItemAt(index:int):void
		{
			if (!_showSelectedItems)
			{
				return;
			}
			
			flowBox.removeItemAt(index);
			
			textInput.enablePrompt = flowBox.numItems == 1;			
		}
		
		public function removeAll():void
		{
			if (!_showSelectedItems)
			{
				return;
			}
			
			while (flowBox.numItems > 1)
			{
				flowBox.removeItemAt(0);	
			}
			
			textInput.enablePrompt = flowBox.numItems == 1;
		}
		
		protected function addItem(item:Object):void
		{
			if (!_showSelectedItems)
			{
				return;
			}
			
			if (flowBox.numItems == 2 && !_allowMultipleSelection)
			{
				selectedItems.removeItemAt(0);				
			}
			
			var isNew:Boolean = item is String && (!dropDownContainer.dataProvider || dropDownContainer.dataProvider.getItemIndex(item) == -1);
			
			if (isNew)
			{
				item = StringUtil.trim(item as String, ',');
			}
			
			if (item)
			{
				flowBox.addItemAt(createFlowBoxItem(isNew, item), flowBox.numItems - 1);
			}
			
			textInput.enablePrompt = flowBox.numItems == 1;
		}
		
		protected function createFlowBoxItem(isNew:Boolean, item:Object):IFlowBoxItem
		{
			var newItem:IFlowBoxItem;
			if (isNew && _allowEditingNewValues)
			{
				var editableItem:EditableItem = new EditableItem();
				editableItem.text = item + (_allowMultipleSelection ? _delimiter : "");
				editableItem.width = measureText(item as String).width + 10;
				editableItem.addEventListener(Event.CHANGE, editableItemChangeHandler, false, 0, true);
				editableItem.item = item;
				editableItem.allowMultipleSelection = _allowMultipleSelection;
				newItem = editableItem;
			}
			else
			{
				var selectedItem:SelectedItem = new SelectedItem();
				selectedItem.text = itemToLabel(item);
				selectedItem.showRemoveIcon = _showRemoveIcon;
				selectedItem.addEventListener('removeSelectedItem', itemRemoveHandler, false, 0, true);
				selectedItem.addEventListener('selectedItemDoubleClick', itemDoubleClickHandler, false, 0, true);
				selectedItem.addEventListener(TextEvent.TEXT_INPUT, itemTextInputHandler);
				selectedItem.selectedItemStyle = this.selectedItemStyle;				
				selectedItem.item = item;
				selectedItem.allowMultipleSelection = _allowMultipleSelection;
				newItem = selectedItem;	
			}
			
			newItem.height = textInput.height;
			
			return newItem;
		}
		
		protected function itemRemoveHandler(event:Event):void
		{
			var index:int;
			
			for (var i:int=0; i<flowBox.numItems; i++)
			{
				var child:IFlowBoxItem = flowBox.getItemAt(i);
				if (child == event.currentTarget)
				{
					break;
				}
				
				index++;
			} 
			
			_selectedItems.removeItemAt(index);
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));
		}
		
		protected function itemDoubleClickHandler(e:Event):void
		{
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SELECTED_ITEM_DOUBLE_CLICK,e.target['item']));
		}
		
		protected function itemTextInputHandler(event:TextEvent):void
		{
			if (event.text != _delimiter)
			{
				textInput.text = event.text;
				textInput.validateNow();
			}
			
			textInput.setFocus();
			textInput.setTextSelected(false);
			flowBox_change(null); 
		}
		
		protected function editableItemChangeHandler(event:Event):void
		{
			var editableItem:EditableItem = event.currentTarget as EditableItem;
			var index:int = flowBox.getItemIndex(editableItem);
			
			var text:String = editableItem.text;
			text = StringUtil.trim(text, ',');
			
			if (text.length > 0)
			{
				_selectedItems.setItemAt(text, index);
				editableItem.item = text;				
			}
			else
			{
				_selectedItems.removeItemAt(index);
				if(flowBox.numItems > index)
				{
					var comboItem:IFlowBoxItem = flowBox.getItemAt(index);
					comboItem.setTextFocus();
				}				
			}
		}
		
		protected function dropDownChangeHandler(event:Event):void
		{
			_selectedItems.addItem(dropDownContainer.selectedItem);
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));
		}
		
		protected function onPerfectMatchHandler(event:AutoCompleteEvent):void
		{
			if (_autoSelectEnabled && !allowNewValues)
			{
				var item:Object = event.data;
				_selectedItems.addItem(item);
				hideDropDown();
				searchText = "";
				dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));
				return;
			}
		}
		
		protected function onCreateNewButtonClickHandler(event:AutoCompleteEvent):void
		{
			createNewValueFunction();
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.CHANGE));
		}
		
		private var isBackspaceText:Boolean;
		
		public function flowBox_change(event:Event):void
		{
			searchText = StringUtil.trim(searchTextInternal, ',');
			if (searchText != "")
				isBackspaceText = true;
			flowBox.invalidateDisplayList();
			
			if (selectedItem && !_allowMultipleSelection && searchText)
			{
				_selectedItems.removeAll();							
			}
			
			if (event)
			{
				if(hasEventListener(AutoCompleteEvent.SEARCH_CHANGE))
					dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SEARCH_CHANGE, searchText));
			}
			updateDropdown();
		}
		
		//filter localColection follow match type and keyword
		protected function updateDropdown():void
		{
			dropDownContainer.searchText = searchText;
			dropDownContainer.updateDropdown();
			if (searchText.length > 0)
				showDropDown();
		}
		
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
				
				if (textInput != null)
				{
					textInput.text = value;
					textInput.validateNow();
				}
				
				if(hasEventListener(AutoCompleteEvent.SEARCH_CHANGE))
					dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SEARCH_CHANGE, _searchText));	
			}
		}
		
		private function get searchTextInternal():String
		{
			return textInput && textInput.text ? textInput.text : "";
		}
		
		public function showDropDown():void
		{
			/*
			* Because of Changing ItemRenderer betwen 2 times of showing dropdown may cause bug 
			* so we have to set ItemRenderer for Dropdown on showDropdown function because 
			*/
			dropDownContainer.dropdownWidth = flowBox.width;
			//updateDropdown();
			
			if (!isDropDownVisible())
			{
				PopUpManager.addPopUp(dropDownContainer, this);
				callLater(callLater, [calculateDropDownPosition]);
			}
			
			if (focusManager)
			{
				focusManager.defaultButtonEnabled = false;
			}
		}
		
		public function calculateDropDownPosition():void
		{
			if (!isDropDownVisible())
			{
				return;
			}
			
			var localPoint:Point = new Point(0, mainGridRow.y);
			var globalPoint:Point = localToGlobal(localPoint);
			
			dropDownContainer.x = globalPoint.x;
			
			var fitsBelow:Boolean = FlexGlobals.topLevelApplication.height - globalPoint.y - mainGridRow.height > dropDownContainer.height;
			var fitsAbove:Boolean = globalPoint.y > dropDownContainer.height;
			
			// check if it will fit below the textInput 
			if (fitsBelow || !fitsAbove)	
			{
				dropDownContainer.y = globalPoint.y + grid.height;
			}
			else
			{
				dropDownContainer.y = globalPoint.y - dropDownContainer.height;
			}			
		}
		
		public function hideDropDown():void
		{
			PopUpManager.removePopUp(dropDownContainer);
			callLater(enableDefaultButton);
		}
		
		protected function enableDefaultButton():void
		{
			if (focusManager)
			{
				focusManager.defaultButtonEnabled = true;
			}												
		}
		
		protected var _createNewValueLinkButton:LinkButton;
		
		public function get createNewValueLinkButton():LinkButton
		{
			return _createNewValueLinkButton;	
		}
		
		protected var dropDownContainer:AutocompleteDropdown = new AutocompleteDropdown;
		
		protected var _labelField:String;
		/**
		 * The name of the field in the data provider items to display as the label.
		 */
		public function set labelField(value:String):void
		{
			_labelField = value;
			dropDownContainer.labelField = value;
		}
		
		public function set matchType(value:String):void
		{
			dropDownContainer.matchType = value;
		}
		
		protected var _labelFunction:Function;
		/**
		 * A user-supplied function to run on each item to determine its label.
		 */
		public function set labelFunction(value:Function):void
		{
			_labelFunction = value;
			dropDownContainer.defaultLabelFunction = value;
		}
		
		protected var _dropDownLabelFunction:Function;
		public function set dropDownLabelFunction(value:Function):void
		{
			dropDownContainer.labelFunction = value;
		}
		
		protected var _keyField:String = "id";
		/**
		 * This field is used in conjuction with the selectedItems or selectedItemId property to 
		 * determine if the item matches.
		 * @default id
		 */
		public function set keyField(value:String):void
		{
			_keyField = value;
		}
		
		/**
		 * A function which controls whether or not to automatically select the item if it's the
		 * only match. Note, this functionality is disabled if autoSelect is set to false. 
		 */
		public function set autoSelectFunction(value:Function):void
		{
			dropDownContainer.checkMatchingFunction = value;
		}
		
		protected var _autoSelectEnabled:Boolean = true;
		
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag which indicates whether or not we'll automatically select the value if
		 * either (a) there's only one match and it's equal to the text or (b) matches
		 * the custom autoSelectEnabled
		 */
		public function set autoSelectEnabled(value:Boolean):void
		{
			_autoSelectEnabled = value;
		}			
		
		/**
		 * The custom item renderer for the dropdown displayed when searching.
		 */			
		public function set dropDownItemRenderer(value:IFactory):void
		{
			dropDownContainer.itemRenderer = value;
		}
		
		/**
		 * The custom item renderer for the create new button on dropdown displayed when searching.
		 */			
		public function set createNewButtonItemRenderer(value:IFactory):void
		{
			dropDownContainer.buttonItemRenderer = value;
		}
		
		public function set enableFilter(value:Boolean):void
		{
			dropDownContainer.enableFilter = value;
		}
		
		public function get enableFilter():Boolean
		{
			return dropDownContainer.enableFilter;
		}
		
		/**
		 * A function that the view will use to eliminate items that do not match the function's criteria.
		 */ 			
		public function set filterFunction(value:Function):void
		{
			dropDownContainer.filterFunction = value;
		}
		
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag that indicates whether or not you can select values which aren't in the dataProvider
		 * @default true
		 */			
		public function set allowNewValues(value:Boolean):void
		{
			dropDownContainer.allowNewValues = value;
		}
		
		public function get allowNewValues():Boolean
		{
			return dropDownContainer.allowNewValues;
		}
		
		protected var _createNewValueFunction:Function;
		/**
		 * A function that the view will use to create and add new value for autocomplete dataprovider.
		 */ 			
		public function set createNewValueFunction(value:Function):void
		{
			_createNewValueFunction = value;
		}
		
		public function get createNewValueFunction():Function
		{
			return _createNewValueFunction;
		}
		
		protected var _allowMultipleSelectionChanged:Boolean;
		protected var _allowMultipleSelection:Boolean;
		
		[Inspectable(enumeration="false,true")]			
		/**
		 * Flag which sets whether or not we allow the user to 
		 * select more than one item
		 */
		public function set allowMultipleSelection(value:Boolean):void
		{
			if (value != _allowMultipleSelection)
			{
				_allowMultipleSelection = value;
				dropDownContainer.allowMultipleSelection = value;
				_allowMultipleSelectionChanged = true;
				
				invalidateProperties();
			}
		}
		
		public function get textInput():PromptTextInput
		{
			return flowBox != null  ? flowBox.prompt : null;
		}
		
		public function get dataProvider():IList
		{
			return dropDownContainer.dataProvider;
		}
		
		public function set dataProvider(value:IList):void
		{
			dropDownContainer.dataProvider = value;
		}
		
		protected var _selectedItemIdChanged:Boolean;
		protected var _selectedItemId:Number;
		
		public function get selectedItemId():Number
		{
			if (selectedItem && selectedItem.hasOwnProperty(_keyField))
			{
				return selectedItem[_keyField];
			}	
			
			return NaN;
		}
		
		/**
		 * The id of the initially selected item.
		 */
		public function set selectedItemId(value:Number):void
		{
			_selectedItemId = value;
			_selectedItemIdChanged = true;
			
			invalidateProperties();
		}
		
		protected var _disabledItems:ArrayCollection;
		
		/**
		 * An items in this list will be considered unavailable for selection. This
		 * allows you to apply unqiue logic across multiple AutoCompletes
		 */
		public function set disabledItems(value:ArrayCollection):void
		{
			_disabledItems = value;
			dropDownContainer.disabledItems = value;
		}
		
		/**
		 * Checks if the component is in the process of resolving the selecteItemId to it's respective object.
		 */
		public function isSettingValue():Boolean
		{
			return _selectedItemId > 0;
		}
		
		protected var _selectedItemsChanged:Boolean;
		protected var _selectedItems:ArrayCollection;
		
		[Bindable(event="change")]
		[Bindable(event="valueCommit")]
		/**
		 * An array of references to the selected items in the data provider.
		 */
		public function get selectedItems():ArrayCollection
		{
			return _selectedItems;
		}
		
		public function set selectedItems(value:ArrayCollection):void
		{
			_initialSelectedItems = value;
			_selectedItemsChanged = true;
			
			invalidateProperties();
		}
		
		protected var _selectedItem:Object;
		protected var _selectedItemChanged:Boolean;
		
		[Bindable(event="change")]
		[Bindable(event="valueCommit")]
		public function get selectedItem():Object
		{
			if (_selectedItems.length > 0)
			{
				return _selectedItems.getItemAt(_selectedItems.length - 1);					
			}
			else
			{
				return null;
			}
		}
		
		/**
		 * A reference to the selected item in the data provider.
		 */
		public function set selectedItem(value:Object):void
		{
			if (_selectedItem != value)
			{
				_selectedItem = value;
				_selectedItemChanged = true;
				
				invalidateProperties();
			}
		}
		
		public function get dropDown():List
		{
			return dropDownContainer.dropDown;
		}
		
		protected var _text:String;
		protected var _textChanged:Boolean;
		
		[Bindable(event="change")]
		[Bindable(event="valueCommit")]
		public function get text():String
		{
			var str:String = "";
			
			for each (var item:Object in _selectedItems)
			{
				str += _labelFunction(item) + ", ";
			}
			
			str = str.substring(0, str.length - 2);
			
			return str; 
		}
		
		/**
		 * The value of the text in the search field
		 */			
		public function set text(value:String):void
		{
			if (value != _text)
			{
				_text = value;
				_textChanged = true;
				
				invalidateProperties();
			}
		}
		
		public function isDropDownVisible():Boolean
		{
			return dropDownContainer && dropDownContainer.parent;
		}
		
		protected var _prompt:String;
		protected var _promptChanged:Boolean;
		
		/**
		 * The prompt to display before the component receives focus
		 */			
		public function set prompt(value:String):void
		{
			if (value != _prompt)
			{
				_prompt = value;
				_promptChanged = true;
				
				invalidateProperties();
			}
		}
		
		protected var _showClearButton:Boolean;
		protected var _showClearButtonChanged:Boolean;
		
		/**
		 * A flag that indicates whether or not endable the clear icon.
		 */	
		public function set showClearButton(value:Boolean):void
		{
			if (value != _showClearButton)
			{
				_showClearButton = value;
				_showClearButtonChanged = true;
				
				invalidateProperties();
			}
		}
		
		protected var _showRemoveIcon:Boolean;
		protected var _showRemoveIconChanged:Boolean;
		
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag that indicates whether or not to display the remove icon in the selected items.
		 * @default false
		 */			
		public function set showRemoveIcon(value:Boolean):void
		{
			if (value != _showRemoveIcon)
			{
				_showRemoveIcon = value;
				_showRemoveIconChanged = true;
				
				invalidateProperties();
			}
		}
		
		protected var _showInlineButton:Boolean;
		protected var _showInlineButtonChanged:Boolean = true;
		
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag that indicates whether or not to display the remove icon in the selected items.
		 * @default false
		 */			
		public function set showInlineButton(value:Boolean):void
		{
			if (value != _showInlineButton)
			{
				_showInlineButton = value;
				_showInlineButtonChanged = true;
				
				invalidateProperties();
			}
		}
		
		
		override public function setFocus():void
		{
			if(textInput != null)
				textInput.setFocus();
		}
		
		override public function drawFocus(isFocused:Boolean):void
		{
			if(flowBox != null)
				flowBox.drawFocus(isFocused);
		}
		
		override public function styleChanged(styleProp:String):void
		{
			super.styleChanged(styleProp);
			
			if (flowBox != null && styleProp == "borderColor")
			{
				flowBox.setStyle(styleProp, getStyle(styleProp));
			}
		}			
		
		protected var _errorStr:String;
		protected var _errorStrChanged:Boolean;
		
		override public function set errorString(value:String):void
		{
			_errorStr = value;
			_errorStrChanged = true;
			
			invalidateProperties();
		}
		
		override public function get errorString():String
		{
			return flowBox ? flowBox.errorString : null;
		}
		
		protected var _backspaceAction:String;
		[Inspectable(enumeration="focus,remove")]
		/**
		 * The action to take when pressing BACKSPACE key when the cursor is in front of a selected item.
		 * @default focus 
		 */			
		public function set backspaceAction(value:String):void
		{
			_backspaceAction = value;
		}
		
		protected var _deleteAction:String;
		[Inspectable(enumeration="focus,remove")]
		/**
		 * The action to take when pressing DELETE key when the cursor is in front of a selected item.
		 * @default focus 
		 */			
		public function set deleteAction(value:String):void
		{
			_deleteAction = value;
		}
		
		protected var _allowDuplicates:Boolean;
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag that indicates whether or not you can select duplicate items when multiselect mode is enabled
		 * @default false
		 */			
		public function set allowDuplicates(value:Boolean):void
		{
			_allowDuplicates = value;
		}
		
		protected var _allowEditingNewValues:Boolean;
		
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag that indicates whether or not you can edit a new item which has been added. This only affects
		 * the component when allowNewValues is set to false
		 */			
		public function set allowEditingNewValues(value:Boolean):void
		{
			_allowEditingNewValues = value;
		}
		
		protected var _allowEditingSelectedValues:Boolean;
		
		[Inspectable(enumeration="true,false")]
		/**
		 * A flag that indicates whether or not you can edit an item after it's been selected.
		 */			
		public function set allowEditingSelectedValues(value:Boolean):void
		{
			_allowEditingSelectedValues = value;
		}
		
		protected var _inlineButtonFactory:IFactory;
		protected var _inlineButtonFactoryChanged:Boolean;
		
		public function get inlineButtonFactory():IFactory
		{
			return _inlineButtonFactory;
		}
		
		public function set inlineButtonFactory(value:IFactory):void
		{
			if(_inlineButtonFactory != value)
			{
				_inlineButtonFactory = value;
				_inlineButtonFactoryChanged = true;
				invalidateProperties();
			}
		}
		
		protected var _inlineButton:UIComponent;
		protected var _inlineButtonChanged:Boolean;
		
		public function get inlineButton():UIComponent
		{
			return _inlineButton;
		}
		
		public function set inlineButton(value:UIComponent):void
		{
			if (_inlineButton != value)
			{
				_inlineButton = value;
				_inlineButtonChanged = true;
				
				invalidateProperties();
			}
		}
		
		public function isItemSelected(item:Object):Boolean
		{
			return _selectedItems.getItemIndex(item) >= 0;
		}
		
		/**
		 * The number of rows to show in the dropDown which
		 * appears when searching
		 */
		public function set dropDownRowCount(value:uint):void
		{
			dropDownContainer.dropDownRowCount = value;
		}
		
		public function get dropDownRowCount():uint
		{
			return dropDownContainer.dropDownRowCount;
		}
		
		protected var _tabIndex:int;
		protected var _tabIndexChanged:Boolean;
		
		override public function set tabIndex(value:int):void
		{
			_tabIndex = value;
			_tabIndexChanged = true;
			
			invalidateProperties();
		}
		
		override public function get tabIndex():int
		{
			return flowBox.prompt.textInput.tabIndex;
		}
		
		protected var _delimiter:String = ",";
		
		/**
		 * The value used to separate items when allowMultipleSelection
		 * is enabled. The values can also be used to select an item. The
		 * default value is ","
		 */
		public function set delimiter(value:String):void
		{
			_delimiter = value;
			dropDownContainer.delimiter = value;
		}
		
		protected var _clearSearchOnFocusOut:Boolean = true;
		
		[Inspectable(enumeration="true,false")]
		/**
		 * This controls whether or not the component will clear the
		 * search term when the component loses focus (when allowNewValues
		 * is set to false). The default value is true.
		 */
		public function set clearSearchOnFocusOut(value:Boolean):void
		{
			_clearSearchOnFocusOut = value;
		}	
		
		protected function flowBox_buttonClick(event:Event):void
		{
			hideDropDown();
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.INLINE_BUTTON_CLICK, this.searchTextInternal));
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			if(instance === flowBox)
			{
				flowBox.addEventListener(Event.CHANGE, flowBox_change);
				flowBox.addEventListener(Event.RESIZE, flowBox_resize);
				flowBox.addEventListener("buttonClick", flowBox_buttonClick);
			}
			super.partAdded(partName, instance);
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
			if(instance === flowBox)
			{
				flowBox.removeEventListener(Event.CHANGE, flowBox_change);
				flowBox.removeEventListener(Event.RESIZE, flowBox_resize);
				flowBox.removeEventListener("buttonClick", flowBox_buttonClick);
			}
		}
		
		[SkinPart(required="true", type="static")]
		public var grid:Grid;
		
		[SkinPart(required="true", type="static")]
		public var flowBox:FlowBox;
		
		[SkinPart(required="true", type="static")]
		public var mainGridRow:GridRow;		
		
		[SkinPart(required="true", type="static")]
		public var mainGridItem:GridItem;	
	}
}