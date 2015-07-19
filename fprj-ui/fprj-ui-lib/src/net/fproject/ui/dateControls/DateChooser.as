package net.fproject.ui.dateControls
{
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.events.CollectionEvent;
	
	import spark.components.DataGroup;
	import spark.components.Label;
	import spark.components.List;
	import spark.components.supportClasses.ButtonBase;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.ui.dateControls.supportClasses.MonthDay;
	import net.fproject.ui.dateControls.supportClasses.MonthDayList;
	import net.fproject.ui.events.DateControlEvent;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.ResourceUtil;
	
	/**
	 * Dispatched when a date is selected or changed.
	 * 
	 * @eventType net.fproject.ui.events.DateControlEvent.SELECTED_DATE_CHANGE
	 * 
	 */	
	[Event(name="selectedDateChange", type="net.fproject.ui.events.DateControlEvent")]
	
	/**
	 * Dispatched when a currently displayed month is changed.
	 * 
	 * @eventType net.fproject.ui.events.DateControlEvent.MONTH_CHANGE
	 * 
	 */	
	[Event(name="monthChange", type="net.fproject.ui.events.DateControlEvent")]
	
	/**
	 * Dispatched when a currently displayed year is changed.
	 * 
	 * @eventType net.fproject.ui.events.DateControlEvent.YEAR_CHANGE
	 * 
	 */	
	[Event(name="yearChange", type="net.fproject.ui.events.DateControlEvent")]
	
	/**
	 * 
	 * The text color for today's cell in the displayed date chooser.
	 * 
	 */	
	[Style(name="todayColor", inherit="yes", type="uint", format="Color")]
	
	/**
	 * 
	 * The text color for the cells in the displayed date chooser that not in current month.
	 * 
	 */	
	[Style(name="otherMonthDayColor", inherit="yes", type="uint", format="Color")]
	
	[SkinState("yearButtonDisplayed")]
	[ResourceBundle("fprjui")]
	/**
	 *  The DateChooser control displays the name of a month, the year,
	 *  and a grid of the days of the month, with columns labeled
	 *  for the day of the week.
	 *  The user can select a date, a range of dates, or multiple dates.
	 *  The control contains forward and back arrow buttons
	 *  for changing the month and year.
	 *  You can let users select multiple dates, disable the selection
	 *  of certain dates, and limit the display to a range of dates.
	 *
	 *  @mxml
	 *
	 *  <p>The <code>&lt;ui:DateChooser&gt;</code> tag inherits all of the tag attributes
	 *  of its superclass, and adds the following tag attributes:</p>
	 *
	 *  <pre>
	 *  &lt;ui:DateChooser
	 *    <strong>Properties</strong>
	 *    dayNames="["S", "M", "T", "W", "T", "F", "S"]"
	 *    displayedYear="<i>Current year</i>"
	 * 	  displayedMonth="<i>Current month</i>"
	 *    labelFunction="<i>Internal formatter</i>"
	 *    monthNames="["January", "February", "March", "April", "May",
	 *    "June", "July", "August", "September", "October", "November",
	 *    "December"]"
	 *    selectedDate="<i>No default</i>"
	 *    yearNavigationEnabled="false|true"
	 *  
	 *   <strong>Styles</strong>
	 *    color="0"
	 *    otherMonthDayColor="0x808080"
	 *    todayColor="0"
	 * 
	 *    <strong>Events</strong>
	 *    selectedDateChange="<i>No default</i>"
	 * 	  monthChange="<i>No default</i>"
	 *    yearChange="<i>No default</i>"
	 *  /&gt;
	 *  </pre>
	 *
	 *  @see net.fproject.ui.dateControls.DateField
	 *
	 *  @includeExample examples/DateChooserExample.mxml
	 *  
	 *  @author Bui Sy Nguyen
	 *  This component is based on idea of Alex Harui:
	 *  http://blogs.adobe.com/aharui/2010/01/spark_datefield_and_colorpicke.html
	 */
	public class DateChooser extends List
	{
		[SkinPart(required="false",type="static")] 
		public var yearLabel:Label;
		
		[SkinPart(required="false",type="static")] 
		public var monthLabel:Label;
		
		[SkinPart(required="false",type="static")] 
		public var prevMonthButton:ButtonBase;
		
		[SkinPart(required="false",type="static")] 
		public var nextMonthButton:ButtonBase;
		
		[SkinPart(required="false",type="static")] 
		public var prevYearButton:ButtonBase;
		
		[SkinPart(required="false",type="static")] 
		public var nextYearButton:ButtonBase;
		
		[SkinPart(required="false",type="static")] 
		public var weekDayHeaderDataGroup:DataGroup;
		
		private var dayList:MonthDayList;
		
		public function DateChooser()
		{
			super();
			dayList = new MonthDayList();
			super.dataProvider = dayList;
			dayList.addEventListener(CollectionEvent.COLLECTION_CHANGE, onDataCollectionChange);
			addEventListener(IndexChangeEvent.CHANGE,onSelectionChange);
			var d:Date = new Date();
			dayList.resetFromMonthAndYear(d.month, d.fullYear);
		}
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			// prevent the border from beeing drawn
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			if(instance === prevMonthButton)
				prevMonthButton.removeEventListener(MouseEvent.CLICK, onPrevMonth);
			if(instance === nextMonthButton)
				nextMonthButton.removeEventListener(MouseEvent.CLICK, onNextMonth);
			if(instance === prevYearButton)
				prevYearButton.removeEventListener(MouseEvent.CLICK, onPrevYear);
			if(instance === nextYearButton)
				nextYearButton.removeEventListener(MouseEvent.CLICK, onNextYear);
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance === monthLabel) 
				monthLabel.text = monthNames[dayList.month]; 
			
			if (instance === yearLabel) 
				yearLabel.text = dayList.year.toString(); 
			
			if(instance === weekDayHeaderDataGroup)
				weekDayHeaderDataGroup.dataProvider = new ArrayList(dayNames);
			
			if(instance === prevMonthButton)
				prevMonthButton.addEventListener(MouseEvent.CLICK, onPrevMonth);
			if(instance === nextMonthButton)
				nextMonthButton.addEventListener(MouseEvent.CLICK, onNextMonth);
			if(instance === prevYearButton)
				prevYearButton.addEventListener(MouseEvent.CLICK, onPrevYear);
			if(instance === nextYearButton)
				nextYearButton.addEventListener(MouseEvent.CLICK, onNextYear);
		}
		
		private function onPrevMonth(e:MouseEvent):void
		{
			goPrevMonth();
		}
		
		protected function goPrevMonth():void
		{
			// updates its dataprovider
			if (dayList.month == 0)
			{
				dayList.resetFromMonthAndYear(11, dayList.year - 1);
				dispatchEvent(new DateControlEvent(DateControlEvent.YEAR_CHANGE));
			}
			else 
				dayList.resetFromMonthAndYear(dayList.month - 1, dayList.year);
			dispatchEvent(new DateControlEvent(DateControlEvent.MONTH_CHANGE));
		}
		
		private function onNextMonth(e:MouseEvent):void
		{
			goNextMonth();
		}
		
		protected function goNextMonth():void
		{
			if (dayList.month == 11)
			{
				dayList.resetFromMonthAndYear(0, dayList.year + 1);
				dispatchEvent(new DateControlEvent(DateControlEvent.YEAR_CHANGE));
			}
			else 
				dayList.resetFromMonthAndYear(dayList.month + 1, dayList.year);
			dispatchEvent(new DateControlEvent(DateControlEvent.MONTH_CHANGE));
		}
		
		protected function onPrevYear(e:MouseEvent):void
		{
			// updates its dataprovider
			dayList.resetFromMonthAndYear(dayList.month, dayList.year - 1);
			dispatchEvent(new DateControlEvent(DateControlEvent.YEAR_CHANGE));
		}
		
		protected function onNextYear(e:MouseEvent):void
		{
			// updates its dataprovider
			dayList.resetFromMonthAndYear(dayList.month, dayList.year + 1);
			dispatchEvent(new DateControlEvent(DateControlEvent.YEAR_CHANGE));
		}
		
		// user changes the selection in the datechooser
		protected function onSelectionChange(e:IndexChangeEvent):void
		{
			var md:MonthDay = e.newIndex > -1 ? dayList.getItemAt(e.newIndex) as MonthDay : null;
			_selectedDate = md.date;
			if(!md.isInCurrentMonth)
			{
				if(_selectedDate.month < dayList.month)
					callLater(goPrevMonth);
				else
					callLater(goNextMonth);
				callLater(invalidateSkinState);
			}
			dispatchEvent(new DateControlEvent(DateControlEvent.SELECTED_DATE_CHANGE));
		}
		
		private var _yearNavigationEnabled:Boolean;

		[Bindable(event="propertyChange")]
		public function get yearNavigationEnabled():Boolean
		{
			return _yearNavigationEnabled;
		}

		public function set yearNavigationEnabled(value:Boolean):void
		{
			if( _yearNavigationEnabled !== value)
			{
				var oldValue:Boolean = _yearNavigationEnabled;
				_yearNavigationEnabled = value;
				dispatchPropertyChangeEvent('yearNavigationEnabled', oldValue, value);
				invalidateSkinState();
			}
		}

		private var _selectedDate:Date;
		
		[Bindable(event="selectedDateChange")]
		public function get selectedDate():Date
		{
			return _selectedDate;
		}
		
		// selectedDate changes externally
		public function set selectedDate(value:Date):void
		{
			if(_selectedDate != value)
			{
				_selectedDate = value;
				
				if (value == null) 
				{
					var d:Date = new Date();
					dayList.resetFromMonthAndYear(d.month, d.fullYear);
				}
				else
				{
					dayList.resetFromMonthAndYear(value.month, value.fullYear);
					// select the date
					var n:int = dataProvider.length;
					for (var i:int = 0; i<n; i++) 
					{
						if (MonthDay(dataProvider.getItemAt(i)).date.date == value.date) 
						{
							selectedItem = dataProvider.getItemAt(i);
						}
					}
				}
				
				dispatchEvent(new DateControlEvent(DateControlEvent.SELECTED_DATE_CHANGE));
			}
		}
		
		// called, if the selected month changes
		private function onDataCollectionChange(e:CollectionEvent):void
		{
			var found:Boolean = false;
			if (_selectedDate)
			{
				// if there is a selected date, try to find it on the display
				var n:int = dayList.length;
				
				for (var i:int = 0; i<n; i++)
				{
					if (DateTimeUtil.compareDatePart(MonthDay(dayList.getItemAt(i)).date,_selectedDate) == 0) 
					{
						selectedItem = dayList.getItemAt(i);
						found = true;
					}
				}
			}
			
			if(!found)
			{
				selectedItem = null;
			}
			
			if (monthLabel) 
				monthLabel.text = monthNames[dayList.month]; 
			
			if (yearLabel) 
				yearLabel.text = dayList.year.toString(); 
		}
		
		override protected function getCurrentSkinState():String
		{
			if(yearNavigationEnabled)
				return 'yearButtonDisplayed';
			else
				return super.getCurrentSkinState();
		}
		
		// don't allow anyone to set our custom DP
		override public function set dataProvider(value:IList):void
		{
		}
		
		private var _monthNames:Array;
		
		public function get monthNames():Array
		{
			if(_monthNames == null)
				_monthNames = ResourceUtil.getStringArray('month.long.names', 'fprjui');
			return _monthNames;
		}
		
		public function set monthNames(value:Array):void
		{
			if(_monthNames != value)
			{
				var oldValue:Array = _monthNames;
				_monthNames = value;
				dispatchPropertyChangeEvent('monthNames', oldValue, value);
				invalidateSkinState();
			}
		}
		
		private var _dayNames:Array;
		
		public function get dayNames():Array
		{
			if(_dayNames == null)
				_dayNames = ResourceUtil.getStringArray('weekday.short.names', 'fprjui');
			return _dayNames;
		}
		
		public function set dayNames(value:Array):void
		{
			if(_dayNames != value)
			{
				var oldValue:Array = _dayNames;
				_dayNames = value;
				dispatchPropertyChangeEvent('dayNames', oldValue, value);
				invalidateSkinState();
			}
		}
	}
	
}
