package net.fproject.ui.datetime
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ISort;
	import mx.collections.ISortField;
	import mx.core.IVisualElementContainer;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	
	import spark.collections.Sort;
	import spark.collections.SortField;
	import spark.components.ComboBox;
	import spark.core.NavigationUnit;
	import spark.events.DropDownEvent;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	import spark.layouts.VerticalLayout;
	
	import net.fproject.ui.datetime.supportClasses.Time;
	
	use namespace mx_internal;
	
	public class TimeField extends ComboBox
	{
		protected var dataGroupDirty:Boolean;
		
		protected var textInputDirty:Boolean;
		
		protected var collection:ArrayCollection;
		
		protected var userSelectedMinutes:int = -1;
		
		protected var hintedIndex:int = -1;
		
		protected var textInputHasFocus:Boolean;
		
		protected var invalid:Boolean;
		
		private var _requireSelection:Boolean = false;
		
		private var _defaultDropDownTime:Number = 480;
		
		public var openOnFocus:Boolean = true;
		
		public var validationErrorMessage:String = "Not a recognized time. Examples: 7p, 7pm, 7:00pm, 700p, 19:00p, 19PM etc.";
		
		protected var selectedMinutesDirty:Boolean;
		
		private var _selectedMinutes:int = -1;
		
		protected var snapIntervalDirty:Boolean;
		
		private var _snapInterval:int = 30;
		
		override public function get requireSelection() : Boolean
		{
			return this._requireSelection;
		}
		
		override public function set requireSelection(value:Boolean) : void
		{
			if(this._requireSelection == value)
			{
				return;
			}
			this._requireSelection = value;
			this.selectedMinutesDirty = true;
			invalidateProperties();
		}
		
		public function get defaultDropDownTime() : Number
		{
			return this._defaultDropDownTime;
		}
		
		public function set defaultDropDownTime(value:Number) : void
		{
			this._defaultDropDownTime = value;
		}
		
		[Bindable(event="valueCommit")]
		public function get selectedMinutes() : int
		{
			return this._selectedMinutes;
		}
		
		public function set selectedMinutes(value:int) : void
		{
			if(value == this._selectedMinutes || isNaN(value))
			{
				return;
			}
			this._selectedMinutes = value;
			this.selectedMinutesDirty = true;
			invalidateProperties();
			this._selectedMinutes = Math.min(1439,Math.max(-1,this._selectedMinutes));
			dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
		}
		
		public function get snapInterval() : int
		{
			return this._snapInterval;
		}
		
		public function set snapInterval(value:int) : void
		{
			if(value == this._snapInterval)
			{
				return;
			}
			this._snapInterval = value;
			this.snapIntervalDirty = true;
			invalidateProperties();
		}
		
		override protected function commitProperties() : void
		{
			super.commitProperties();
			if(this.selectedMinutesDirty)
			{
				this.selectedMinutesDirty = false;
				if(isDropDownOpen)
				{
					closeDropDown(false);
				}
				this.setCustomSelectedItem(this._selectedMinutes);
			}
			if(this.snapIntervalDirty)
			{
				this.snapIntervalDirty = false;
				this.buildCollection();
				if(!this._requireSelection)
				{
					this.setText("");
					this.setSelectedMinutes(-1);
					setSelectedIndex(NO_SELECTION,true);
				}
				else
				{
					this.setSelectedMinutes(0);
					setSelectedIndex(0,true);
				}
			}
		}
		
		override protected function commitSelection(value:Boolean = true) : Boolean
		{
			var s:String = textInput.text;
			if(selectedIndex == ComboBox.CUSTOM_SELECTED_ITEM)
			{
				this.setCustomSelectedItem(selectedItem.minutes);
				errorString = null;
				validateProperties();
				return false;
			}
			if(this._requireSelection && this._selectedMinutes == NO_SELECTION)
			{
				_selectedIndex = 0;
				this._selectedMinutes = 0;
			}
			var b:Boolean = super.commitSelection(false);
			if(selectedItem && selectedItem is Time)
			{
				this.setSelectedMinutes(selectedItem.minutes);
			}
			this.validate();
			if(selectedIndex == NO_SELECTION)
			{
				callLater(this.setText,[s]);
			}
			callLater(textInput.selectRange,[textInput.text.length,textInput.text.length]);
			if(this._selectedMinutes > NO_SELECTION)
			{
				this.invalid = false;
				errorString = null;
				validateProperties();
			}
			return b;
		}
		
		override protected function createChildren() : void
		{
			super.createChildren();
			maxChars = 11;
			restrict = "0-9.aApPmM:";
			labelFunction = this.timePickerLabelFunction;
			itemMatchingFunction = this.timePickerItemMatchingFunction;
			labelToItemFunction = this.timePickerLabelToItemFunction;
			openOnInput = true;
			this.collection = new ArrayCollection();
			var sort:ISort = new Sort();
			var sortField:ISortField = new SortField("minutes",false,true);
			sort.fields = [sortField];
			this.collection.sort = sort;
			this.buildCollection();
			this.collection.refresh();
			dataProvider = this.collection;
			addEventListener(DropDownEvent.OPEN,this.eventHandler);
			addEventListener(DropDownEvent.CLOSE,this.eventHandler);
		}
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName,instance);
			if(instance == dataGroup)
			{
				this.dataGroupDirty = true;
				invalidateProperties();
			}
			if(instance == textInput)
			{
				textInput.addEventListener(FocusEvent.FOCUS_IN,this.textInputHandler,true);
				textInput.addEventListener(FocusEvent.FOCUS_OUT,this.textInputHandler,true);
				this.textInputDirty = true;
				invalidateProperties();
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName,instance);
			if(instance == textInput)
			{
				textInput.removeEventListener(FocusEvent.FOCUS_IN,this.textInputHandler,true);
				textInput.removeEventListener(FocusEvent.FOCUS_OUT,this.textInputHandler,true);
			}
		}
		
		public function dispose() : void
		{
			if(parent)
			{
				if(parent is IVisualElementContainer)
				{
					IVisualElementContainer(parent).removeElement(this);
				}
				else if(parent is DisplayObjectContainer)
				{
					DisplayObjectContainer(parent).removeChild(this);
				}
			}
			textInput = null;
			dataGroup = null;
			removeEventListener(DropDownEvent.OPEN,this.eventHandler);
		}
		
		public function setText(value:String) : void
		{
			if(textInput)
			{
				textInput.text = value;
			}
		}
		
		public function validate() : Boolean
		{
			if(!this._requireSelection && textInput && textInput.text == null || textInput.text == "")
			{
				this.setSelectedMinutes(-1);
				errorString = null;
				validateProperties();
				return false;
			}
			if(this._requireSelection || !this.invalid)
			{
				errorString = null;
				validateProperties();
				return true;
			}
			return false;
		}
		
		protected function setHintedIndex(index:int) : void
		{
			if(this.hintedIndex > -1)
			{
				if(this.collection && this.collection[this.hintedIndex])
				{
					this.collection[this.hintedIndex].isHinted = false;
				}
				if(dataGroup && dataGroup.getVirtualElementAt(this.hintedIndex))
				{
					(dataGroup.getVirtualElementAt(this.hintedIndex) as Object).isHinted = false;
				}
			}
			if(index > -1 && this.collection && this.collection[index])
			{
				this.collection[index].isHinted = true;
			}
			if(dataGroup && dataGroup.getVirtualElementAt(index))
			{
				(dataGroup.getVirtualElementAt(index) as Object).isHinted = true;
			}
			this.hintedIndex = index;
		}
		
		protected function setDefaultDropDownIndex() : void
		{
			var i:int = this.getClosestIndex(this._defaultDropDownTime);
			this.setCenteredVerticalScrollPosition(i);
			this.setHintedIndex(i);
		}
		
		protected function setSelectedValueIndex(index:int) : void
		{
			this.hintedIndex = selectedIndex = index;
		}
		
		protected function setCustomSelectedItem(minutes:int) : void
		{
			if(minutes == -1)
			{
				if(!this._requireSelection)
				{
					this.setSelectedMinutes(-1);
				}
				if(this._requireSelection)
				{
					callLater(this.setSelectedValueIndex,[0]);
					callLater(this.setSelectedMinutes,[0]);
					errorString = null;
					validateProperties();
				}
				return;
			}
			var idx:int = this.getMinutesIndex(minutes);
			if(idx > -1)
			{
				callLater(this.setSelectedValueIndex,[idx]);
				return;
			}
			var time:Time = new Time(minutes,this.convertMinutesToString(minutes));
			if(this.userSelectedMinutes > 0)
			{
				idx = this.getMinutesIndex(this.userSelectedMinutes);
				if(idx > -1)
				{
					this.collection.removeItemAt(idx);
				}
			}
			this.userSelectedMinutes = minutes;
			this.collection.addItem(time);
			callLater(this.setSelectedValueIndex,[this.getMinutesIndex(this.userSelectedMinutes)]);
		}
		
		protected function handleKeyboardNavigation(event:KeyboardEvent) : void
		{
			var unit:uint = 0;
			var b:Boolean = false;
			var curIdx:int = 0;
			var destIndex:* = 0;
			var code:uint = event.keyCode;
			switch(code)
			{
				case Keyboard.UP:
					unit = NavigationUnit.UP;
					b = true;
					break;
				case Keyboard.DOWN:
					unit = NavigationUnit.DOWN;
					b = true;
					break;
				case Keyboard.PAGE_UP:
					unit = NavigationUnit.PAGE_UP;
					b = true;
					break;
				case Keyboard.PAGE_DOWN:
					unit = NavigationUnit.PAGE_DOWN;
					b = true;
					break;
			}
			if(b)
			{
				curIdx = this.hintedIndex < NO_SELECTION?NO_SELECTION:this.hintedIndex;
				destIndex = layout.getNavigationDestinationIndex(curIdx,unit,arrowKeysWrapFocus);
				if(destIndex != NO_SELECTION)
				{
					changeHighlightedSelection(destIndex);
					this.setHintedIndex(destIndex);
					event.preventDefault();
				}
			}
		}
		
		protected function setCenteredVerticalScrollPosition(pos:int) : void
		{
			var r:Rectangle = null;
			if(pos > -1 && dataGroup && dataGroup.layout is VerticalLayout)
			{
				this.setHintedIndex(pos);
				r = (dataGroup.layout as VerticalLayout).getElementBounds(pos);
				dataGroup.verticalScrollPosition = r.y - dataGroup.getLayoutBoundsHeight() / 2 + r.height / 2;
			}
		}
		
		protected function getClosestIndex(minutes:Number) : int
		{
			for (var i:int=0; i<this.collection.length; i++)
			{
				var time:Time = this.collection[i] as Time;
				if(time.minutes == minutes)
				{
					return i;
				}
				if(time.minutes > minutes)
				{
					return i - 1;
				}
			}
			
			return -1;
		}
		
		protected function getMinutesIndex(minutes:Number) : int
		{
			for (var i:int=0; i<this.collection.length; i++)
			{
				var time:Time = this.collection[i] as Time;
				if(time.minutes == minutes)
				{
					return i;
				}
			}
			
			return -1;
		}
		
		protected function setSelectedMinutes(value:Number) : void
		{
			if(this._selectedMinutes != value)
			{
				this._selectedMinutes = value;
				dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
			}
			dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
		}
		
		protected function timePickerLabelFunction(data:Object) : String
		{
			if(data && data.hasOwnProperty("label"))
			{
				return data.label;
			}
			return null;
		}
		
		protected function timePickerLabelToItemFunction(s:String) : Object
		{
			var sMinutes:String = null;
			var time:Time = null;
			var convertedMinutes:Number = this.convertStringToMinutes(s);
			if(!isNaN(convertedMinutes))
			{
				this.invalid = false;
				errorString = null;
				validateProperties();
				sMinutes = this.convertMinutesToString(convertedMinutes);
				time = new Time(convertedMinutes,sMinutes);
				return time;
			}
			if(this._requireSelection)
			{
				time = new Time(0,this.convertMinutesToString(0));
				return time;
			}
			this.invalid = true;
			this.setSelectedMinutes(-1);
			errorString = this.validationErrorMessage;
			validateProperties();
			callLater(this.setText,[s]);
			callLater(textInput.selectRange,[s.length,s.length]);
			return null;
		}
		
		protected function timePickerItemMatchingFunction(combo:ComboBox, input:String) : Vector.<int>
		{
			var l:int = 0;
			var i:int = 0;
			var time:Time;
			var matchedItems:Vector.<int> = new Vector.<int>();
			var index:int = -1;
			var m:Number = this.convertStringToMinutes(input);
			if(!isNaN(m))
			{
				l = this.collection.length;
				i = 0;
				while(i < l)
				{
					time = this.collection[i];
					if(time.minutes == m)
					{
						index = i;
						break;
					}
					if(time.minutes > m)
					{
						index = i - 1;
						break;
					}
					i++;
				}
				if(index > -1)
				{
					this.setCenteredVerticalScrollPosition(index);
				}
			}
			this.setHintedIndex(index);
			return matchedItems;
		}
		
		protected function buildCollection() : void
		{
			this.collection.removeAll();
			var i:int = 0;
			while(i < 1440)
			{
				var s:String = this.convertMinutesToString(i);
				this.collection.addItem(new Time(i,s));
				i = i + this._snapInterval;
			}
		}
		
		protected function convertMinutesToString(minutes:Number) : String
		{
			var h:Number = Math.floor(minutes / 60);
			var m:String = String(minutes % 60);
			if(h > 11)
			{
				h = h - 12;
			}
			if(h == 0)
			{
				h = 12;
			}
			if(m.length < 2)
			{
				m = "0" + m;
			}
			return String(h) + ":" + String(m) + "am";
		}
		
		protected function convertStringToMinutes(s:String) : Number
		{
			var a:Array = null;
			var ss:String = "";
			for(var i:int=0; i<s.length; i++)
			{
				if(s.charAt(i) != " ")
				{
					ss = ss + s.charAt(i);
				}
			}
			ss = ss.toLowerCase();
			var regex:RegExp = new RegExp("^\\D*(\\d*)[:.]?([0-5]*\\d)?([ap]?).*$");
			var matches:Array = regex.exec(ss);
			var h:Number = matches[1] && matches[1].length > 0?Number(matches[1]):NaN;
			if(String(matches[2]).length == 1)
			{
				matches[2] = matches[2] + "0";
			}
			var n:Number = matches[2] && matches[2].length > 0?Number(matches[2]):NaN;
			if(h > 24)
			{
				a = String(h).split("");
				if(a.length > 3)
				{
					h = Number(a[0] + a[1]);
					n = Number(a[2] + a[3]);
				}
				else if(a.length == 3)
				{
					h = Number(a[0]);
					n = Number(a[1] + a[2]);
				}
				else if(a.length == 2)
				{
					h = Number(a[0]);
					n = Number(a[1]);
				}
			}
			if(matches[3])
			{
				var ampm:String = String(matches[3]);
			}
			else if(h == 12 || h > 0 && h < 7)
			{
				ampm = "p";
			}
			else
			{
				ampm = "a";
			}
			if(h < 12 && ampm == "p")
			{
				h = h + 12;
			}
			else if(h == 12 && ampm == "a")
			{
				h = 0;
			}
			var minutes:Number = h * 60;
			if(!isNaN(n))
				minutes += n;
			if(isNaN(minutes) || minutes < 0 || minutes > 1440)
			{
				return NaN;
			}
			return minutes;
		}
		
		override protected function focusInHandler(e:FocusEvent) : void
		{
			super.focusInHandler(e);
			if(this.openOnFocus)
			{
				callLater(openDropDown);
			}
		}
		
		override protected function focusOutHandler(e:FocusEvent) : void
		{
			super.focusOutHandler(e);
			this.validate();
		}
		
		override protected function keyDownHandler(e:KeyboardEvent) : void
		{
			if(e.keyCode == Keyboard.ENTER)
			{
				if(selectedIndex == ComboBox.CUSTOM_SELECTED_ITEM)
				{
					this._selectedMinutes = selectedItem.minutes;
				}
			}
			if(!this.textInputHasFocus && isDropDownOpen)
			{
				this.handleKeyboardNavigation(e);
			}
			super.keyDownHandler(e);
		}
		
		override protected function capture_keyDownHandler(e:KeyboardEvent) : void
		{
			if(this.textInputHasFocus && isDropDownOpen)
			{
				this.handleKeyboardNavigation(e);
			}
			super.capture_keyDownHandler(e);
		}
		
		override protected function textInput_changeHandler(e:TextOperationEvent) : void
		{
			super.textInput_changeHandler(e);
			if(textInput.text == null || textInput.text == "")
			{
				this.setDefaultDropDownIndex();
			}
		}
		
		protected function textInputHandler(e:Event) : void
		{
			switch(e.type)
			{
				case FocusEvent.FOCUS_IN:
					this.textInputHasFocus = true;
					break;
				case FocusEvent.FOCUS_OUT:
					this.textInputHasFocus = false;
					break;
			}
		}
		
		protected function eventHandler(e:Event) : void
		{
			switch(e.type)
			{
				case DropDownEvent.CLOSE:
					if(this.collection)
					{
						for each(var time:Time in this.collection)
						{
							time.isHinted = false;
						}
						break;
					}
					break;
				case DropDownEvent.OPEN:
					if(selectedIndex == NO_SELECTION)
					{
						this.setDefaultDropDownIndex();
						break;
					}
					this.setCenteredVerticalScrollPosition(selectedIndex);
					break;
			}
		}
	}
}
