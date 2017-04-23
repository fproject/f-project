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
package net.fproject.ui.datetime
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.dataGridClasses.DataGridListData;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.controls.listClasses.ListData;
	import mx.events.FlexEvent;
	import mx.events.SandboxMouseEvent;
	import mx.utils.ObjectUtil;
	
	import spark.components.Group;
	import spark.components.PopUpAnchor;
	import spark.components.TextInput;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.ui.datetime.supportClasses.DateFieldButton;
	import net.fproject.ui.datetime.supportClasses.Time;
	import net.fproject.ui.events.DateControlEvent;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.StringUtil;

	/**
	 * Dispatched when user opens the the DateChooser pop-up
	 * 
	 * @eventType net.fproject.ui.events.DateControlEvent.OPEN
	 * 
	 */	
	[Event(name="open", type="net.fproject.ui.events.DateControlEvent")]
	
	/**
	 * Dispatched when user closes the the DateChooser pop-up
	 * 
	 * @eventType net.fproject.ui.events.DateControlEvent.CLOSE
	 * 
	 */	
	[Event(name="close", type="net.fproject.ui.events.DateControlEvent")]
	
	[SkinState("normalAndOpen")]
	[SkinState("normalWithYearButtonAndOpen")]
	/**
	 *  The DateField control is a control that shows a date
	 *  with a calendar icon on its right side.
	 *  When the user clicks anywhere inside the bounding box
	 *  of the control, a DateChooser control pops up
	 *  and shows the dates in the month of the current date.
	 *  If no date is selected, the label of button is blank
	 *  and the month of the current date is displayed
	 *  in the DateChooser control.
	 *
	 *  <p>When the DateChooser control is open, the user can scroll
	 *  through months and years, and select a date.
	 *  When a date is selected, the DateChooser control closes,
	 *  and the text field shows the selected date.</p>
	 *
	 *  <p>The user can also type the date in the text field if the <code>editable</code>
	 *  property of the DateField control is set to <code>true</code>.</p>
	 *
	 *  <p>The DateField has the same default characteristics as the DateChooser for its expanded date chooser.</p>
	 *
	 *  @mxml
	 *
	 *  <p>The <code>&lt;ui:DateField&gt</code> tag inherits all of the tag attributes
	 *  of its superclass, and adds the following tag attributes:</p>
	 *
	 *  <pre>
	 *  &lt;ui:DateField
	 *    <strong>Properties</strong>
	 *    dayNames="["S", "M", "T", "W", "T", "F", "S"]"
	 *    displayedYear="<i>Current year</i>"
	 * 	  displayedMonth="<i>Current month</i>"
	 *    formatString="MM/dd/yyyy"
	 *    labelFunction="<i>Internal formatter</i>"
	 *    monthNames="["January", "February", "March", "April", "May",
	 *    "June", "July", "August", "September", "October", "November",
	 *    "December"]"
	 *    selectedDate="<i>No default</i>"
	 *    yearNavigationEnabled="false|true"
	 *  
	 *   <strong>Styles</strong>
	 *    color="0x0xB333C"
	 *    rollOverColor="0xE3FFD6"
	 *    textAlign="left|right|center"
	 *    textDecoration="none|underline"
	 *    todayColor="0x2B333C"
	 * 
	 *    <strong>Events</strong>
	 *    selectedDateChange="<i>No default</i>"
	 * 	  monthChange="<i>No default</i>"
	 *    yearChange="<i>No default</i>"
	 *    close="<i>No default</i>"
	 *    open="<i>No default</i>"
	 *  /&gt;
	 *  </pre>
	 *
	 *  @see net.fproject.ui.datetime.DateChooser
	 *  @includeExample examples/DateControlsDemo.mxml
	 *
	 */
	public class DateField extends DateChooser implements IListItemRenderer, IDropInListItemRenderer
	{
		public function DateField()
		{
			_formatString = 'MM/dd/yyyy';
			_editable = true;
			tabEnabled = true;
			tabFocusEnabled = true;
		}
		
		[SkinPart(required="false",type="static")] 
		public var popUpAnchor:PopUpAnchor;
		
		[SkinPart(required="false",type="static")] 
		public var dropDownGroup:Group;
		
		[SkinPart(required="false",type="static")] 
		public var openButton:DateFieldButton;
		
		[SkinPart(required="false",type="static")] 
		public var textInput:TextInput; // only used by DateField
		
		[SkinPart(required="false",type="static")] 
		public var timeField:TimeField; // show time of date
		
		private var _formatString:String;
		
		public function get formatString():String
		{
			return _formatString;
		}
		
		public function set formatString(value:String):void
		{
			if( _formatString !== value)
			{
				var oldValue:String = _formatString;
				_formatString = value;
				if (textInput != null && _formatString != null)
					textInput.text = DateTimeUtil.formatDate(selectedDate, _formatString);
			}
		}
		
		private var _editable:Boolean;

		[Bindable("propertyChanged")]
		[Inspectable(category="General", defaultValue="false")]
		public function get editable():Boolean
		{
			return _editable;
		}

		public function set editable(value:Boolean):void
		{
			var oldVal:Boolean = _editable;
			_editable = value;
			if(textInput != null)
				textInput.editable = _editable;
			dispatchPropertyChangeEvent("editable", oldVal, value);
		}
		
		/**
		 *  @private
		 */
		override public function get baselinePosition():Number
		{
			return getBaselinePositionForPart(openButton);
		}
		
		// user changes the selection in the datechooser
		override protected function onSelectionChange(e:IndexChangeEvent):void
		{
			super.onSelectionChange(e);
			updateTextInput();
		}
		
		// selectedDate changes externally
		override public function set selectedDate(value:Date):void
		{
			super.selectedDate = value;
			if(!textInputChangeHandling)
				updateTextInput();
			if (timeField)
				timeField.selectClosestMinutes(selectedDate.hours * 60 + selectedDate.minutes);
		}
		
		protected function updateTextInput():void
		{
			if (textInput != null)
			{
				if (selectedDate == null) 
					textInput.text = "";
				else
					textInput.text = DateTimeUtil.formatDate(selectedDate, _formatString);
			}
		}
			
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if(instance === dropDownGroup)
			{
				dropDownGroup.addEventListener(Event.ADDED_TO_STAGE, onPopUpAdded);
				dropDownGroup.addEventListener(Event.REMOVED_FROM_STAGE, onPopUpRemoved);
			}
			
			if(instance === openButton)
				openButton.addEventListener(MouseEvent.MOUSE_DOWN, onOpenButtonMouseDown);
			
			if(instance === textInput) 
			{
				textInput.addEventListener(Event.CHANGE, textInput_changeHandler);
				textInput.editable = _editable; 
			}
			
			if(instance === timeField) 
			{
				timeField.addEventListener(Event.CHANGE, timeField_changeHandler);
				if (selectedDate)
				{
					timeField.selectClosestMinutes(selectedDate.hours * 60 + selectedDate.minutes);
				}
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if(instance === openButton)
				openButton.removeEventListener(MouseEvent.MOUSE_DOWN, onOpenButtonMouseDown);
			
			if (instance === textInput) 
				textInput.removeEventListener(Event.CHANGE, textInput_changeHandler);
		}
		
		/**
		 *  @private
		 *  Adds event triggers close the popup.
		 * 
		 *  <p>This is called when the drop down is popped up.</p>
		 */ 
		private function addCloseTriggers():void
		{
			if (systemManager)
			{
				systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_DOWN, systemManager_mouseDownHandler);
				systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, systemManager_mouseDownHandler);
				
				if (openButton && openButton.systemManager)
					openButton.systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_WHEEL, systemManager_mouseWheelHandler);
			}
		}
		
		/**
		 *  @private
		 *  Adds event triggers close the popup.
		 * 
		 *  <p>This is called when the drop down is closed.</p>
		 */ 
		private function removeCloseTriggers():void
		{
			if (systemManager)
			{
				systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_DOWN, systemManager_mouseDownHandler);
				systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, systemManager_mouseDownHandler);
				
				if (openButton && openButton.systemManager)
					openButton.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_WHEEL, systemManager_mouseWheelHandler);
			}
		} 
		
		/**
		 *  @private
		 *  Called when the systemManager receives a mouseDown event. This closes
		 *  the dropDown if the target is outside of the dropDown. 
		 */     
		private function systemManager_mouseDownHandler(event:Event):void
		{
			var target:DisplayObject = event.target as DisplayObject;
			
			if (!popUpAnchor || (popUpAnchor && (event.target == popUpAnchor || (!popUpAnchor.contains(target)))))
			{
				// don't close if it's on the openButton
				
				if (openButton && openButton.contains(target))
					return;
				
				if (textInput && textInput.contains(target))
					return;
				
				if (popUpAnchor && popUpAnchor.owns(target))
					return;
				
				closeDropDown();
			} 
		}
		
		/**
		 *  @private
		 *  Called when the mouseWheel is used
		 */
		private function systemManager_mouseWheelHandler(event:MouseEvent):void
		{
			// Close the dropDown unless we scrolled over the dropdown and the dropdown handled the event
			if (popUpAnchor && !(popUpAnchor.contains(DisplayObject(event.target)) && event.isDefaultPrevented()))
				closeDropDown();
		}
		
		private var closeRequested:Boolean;
		
		/**
		 *  Close the drop down and dispatch a <code>DropDownEvent.CLOSE</code> event.  
		 *   
		 *  @param commit If <code>true</code>, commit the selected
		 *  data item. 
		 *  
		 */
		protected function closeDropDown():void
		{
			removeCloseTriggers();
			closeRequested = true;
			invalidateSkinState();
		}
		
		private var textInputChangeHandling:Boolean;

		protected function textInput_changeHandler(event:Event):void
		{
			var inputDate:Date = stringToDate(textInput.text);
			if (inputDate != null && ObjectUtil.dateCompare(this.selectedDate, inputDate) != 0)
			{
				textInputChangeHandling = true;
				this.selectedDate = inputDate;
				textInputChangeHandling = false;
			}
		}

        protected function timeField_changeHandler(event:Event):void
        {
            if (selectedDate)
            {
				var newSelectedDate:Date = new Date(selectedDate.time);
				newSelectedDate.hours = Time(timeField.selectedItem).hour;
				newSelectedDate.minutes = Time(timeField.selectedItem).minute;
				selectedDate = newSelectedDate; //work-around: mục đích bắn sự kiện selectedChange với oldValue != newValue.
            }
        }
		
		protected function stringToDate(sdate:String):Date
		{
			if(StringUtil.isBlank(sdate))
				return null;
			try {
				return DateTimeUtil.parseDate(sdate, _formatString);
			}
			catch (e:Error)
			{
			}
			return null;
		}
		
		
		private function onPopUpAdded(e:Event):void
		{
			dropDownGroup.removeEventListener(Event.ADDED_TO_STAGE, onPopUpAdded);
			dispatchEvent(new DateControlEvent(DateControlEvent.OPEN));
			openRequested=false;
			addCloseTriggers();
		}
		
		private function onPopUpRemoved(e:Event):void
		{
			dropDownGroup.removeEventListener(Event.REMOVED_FROM_STAGE, onPopUpRemoved);
			dispatchEvent(new DateControlEvent(DateControlEvent.CLOSE));
			closeRequested = false;
		}
		
		
		private var openRequested:Boolean;
		
		protected function onOpenButtonMouseDown(e:MouseEvent):void
		{
			if(_editable)
			{
				openRequested = true;
				this.invalidateSkinState();
			}
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override protected function getCurrentSkinState():String
		{
			var s:String = super.getCurrentSkinState();
			if(openRequested || (popUpAnchor != null && popUpAnchor.isPopUp))
				s +='AndOpen';
			callLater(function():void{openRequested=false;});
			return s;
		}
		
		/**
		 *  @private
		 *  Storage for the data property
		 */
		private var _data:Object;
		
		[Bindable("dataChange")]
		[Inspectable(environment="none")]
		
		/**
		 *  The <code>data</code> property lets you pass a value
		 *  to the component when you use it in an item renderer or item editor.
		 *  You typically use data binding to bind a field of the <code>data</code>
		 *  property to a property of this component.
		 *
		 *  <p>When you use the control as a drop-in item renderer or drop-in
		 *  item editor, Flex automatically writes the current value of the item
		 *  to the <code>selectedDate</code> property of this control.</p>
		 *
		 *  @default null
		 *  @see mx.core.IDataRenderer
		 *  
		 */
		public function get data():Object
		{
			return _data;
		}
		
		/**
		 *  @private
		 */
		public function set data(value:Object):void
		{
			var newDate:Date;
			
			_data = value;
			
			if (_listData && _listData is DataGridListData)
				newDate = _data[DataGridListData(_listData).dataField];
			else if (_listData is ListData && ListData(_listData).labelField in _data)
				newDate = _data[ListData(_listData).labelField];
			else if (_data is String)
			{
				newDate = stringToDate(data as String);
				if(newDate == null)
					newDate = new Date(Date.parse(data as String));
			}
			else
				newDate = _data as Date;
			
			if (ObjectUtil.dateCompare(selectedDate, newDate) != 0)
				selectedDate = newDate;
			
			dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
		}
		
		/**
		 *  @private
		 *  Storage for the listData property
		 */
		private var _listData:BaseListData;
		
		[Bindable("dataChange")]
		[Inspectable(environment="none")]
		
		/**
		 *  When a component is used as a drop-in item renderer or drop-in
		 *  item editor, Flex initializes the <code>listData</code> property
		 *  of the component with the appropriate data from the List control.
		 *  The component can then use the <code>listData</code> property
		 *  to initialize the <code>data</code> property of the drop-in
		 *  item renderer or drop-in item editor.
		 *
		 *  <p>You do not set this property in MXML or ActionScript;
		 *  Flex sets it when the component is used as a drop-in item renderer
		 *  or drop-in item editor.</p>
		 *
		 *  @default null
		 *  @see mx.controls.listClasses.IDropInListItemRenderer
		 *  
		 */
		public function get listData():BaseListData
		{
			return _listData;
		}
		
		/**
		 *  @private
		 */
		public function set listData(value:BaseListData):void
		{
			_listData = value;
		}
		
		/**
		 * @inheritDoc 
		 * 
		 */
		override public function setFocus():void
		{
			if (textInput && _editable)
				textInput.setFocus();
			else
				super.setFocus();
		}
	}
}