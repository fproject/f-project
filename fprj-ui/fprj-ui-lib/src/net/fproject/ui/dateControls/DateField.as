package net.fproject.ui.dateControls
{
	import flash.events.MouseEvent;
	
	import mx.events.FlexMouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.PopUpAnchor;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.utils.DateTimeUtil;

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
	 *    change="<i>No default</i>"
	 *    close="<i>No default</i>"
	 *    dataChange="<i>No default</i>"
	 *    open="<i>No default</i>"
	 *    scroll="<i>No default</i>"
	 *  /&gt;
	 *  </pre>
	 *
	 *  @see mx.controls.DateChooser
	 *  @includeExample examples/DateFieldExample.mxml
	 *
	 *  @helpid 3617
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */
	public class DateField extends DateChooser
	{
		[SkinPart(required="false",type="static")] 
		public var popUpAnchor:PopUpAnchor;
		
		[SkinPart(required="false",type="static")] 
		public var dropDown:PopUpAnchor;
		
		[SkinPart(required="false",type="static")] 
		public var dropDownGroup:Group;
		
		[SkinPart(required="false",type="static")] 
		public var openButton:Button;
		
		[SkinPart(required="false",type="static")] 
		public var labelDisplay:Label; // only used by DateField
		
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
			if (labelDisplay)
				labelDisplay.text = DateTimeUtil.formatDate(selectedDate, 'MM/dd/yyyy');
		}
		
		// selectedDate changes externally
		override public function set selectedDate(value:Date):void
		{
			super.selectedDate = value;
			if(labelDisplay)
			{
				if (value == null) 
				{
					labelDisplay.text = "";
				}
				else
				{
					labelDisplay.text = (selectedDate.month+1) + "/" + 
						selectedDate.date+"/" + selectedDate.fullYear;
				}
			}			
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			if(instance === dropDownGroup)
				dropDownGroup.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, onDropDownMouseDownOutside);
			if(instance === openButton)
				openButton.removeEventListener(MouseEvent.MOUSE_DOWN, onOpenButtonMouseDown);
			
			if(instance === dataGroup)
				dataGroup.removeEventListener(MouseEvent.CLICK, onDataGroupClick);
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if(instance === dropDownGroup)
				dropDownGroup.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, onDropDownMouseDownOutside);
			if(instance === openButton)
				openButton.addEventListener(MouseEvent.MOUSE_DOWN, onOpenButtonMouseDown);
			
			if(instance === dataGroup)
				dataGroup.addEventListener(MouseEvent.CLICK, onDataGroupClick);
			
			if(instance === dropDownGroup || instance === nextYearButton || instance === prevYearButton)
				checkToAddYearButtons();
			
			if(instance === yearLabel && yearNavigationEnabled)
				yearLabel.right = 45;
			
		}
		
		protected function checkToAddYearButtons():void
		{
			if(yearNavigationEnabled)
			{
				if(dropDownGroup)
				{
					if(nextYearButton && !dropDownGroup.containsElement(nextYearButton))
						dropDownGroup.addElement(nextYearButton);
					if(prevYearButton && !dropDownGroup.containsElement(prevYearButton))
						dropDownGroup.addElement(prevYearButton);
				}
			}
		}
		
		protected function onDropDownMouseDownOutside(e:FlexMouseEvent):void
		{
			this.skin.setCurrentState('normal');
		}
		
		protected function onOpenButtonMouseDown(e:MouseEvent):void
		{
			this.skin.setCurrentState('open');
		}
		
		protected function onDataGroupClick(e:MouseEvent):void
		{
			this.skin.setCurrentState('normal');
		}
	}
}