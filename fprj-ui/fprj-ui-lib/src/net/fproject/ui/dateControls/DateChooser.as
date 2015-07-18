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
	import net.fproject.utils.ResourceUtil;
	
	[SkinState("yearButtonDisplayed")]
	[ResourceBundle("fprjui")]
	/**
	 * Spark only component for displaying and selecting dates.
	 * @author Bui Sy Nguyen
	 * This component is based on idea of Alex Harui:
	 * http://blogs.adobe.com/aharui/2010/01/spark_datefield_and_colorpicke.html
	 * 
	 * */
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
			super.dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE, collectionChangeHandler);
			addEventListener(IndexChangeEvent.CHANGE,onSelectionChange);
			var d:Date = new Date();
			dayList.setMonthAndYear(d.month, d.fullYear);
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
				weekDayHeaderDataGroup.dataProvider = dayNames;
			
			if(instance === prevMonthButton)
				prevMonthButton.addEventListener(MouseEvent.CLICK, onPrevMonth);
			if(instance === nextMonthButton)
				nextMonthButton.addEventListener(MouseEvent.CLICK, onNextMonth);
			if(instance === prevYearButton)
				prevYearButton.addEventListener(MouseEvent.CLICK, onPrevYear);
			if(instance === nextYearButton)
				nextYearButton.addEventListener(MouseEvent.CLICK, onNextYear);
		}
		
		protected function onPrevMonth(e:MouseEvent):void
		{
			// updates its dataprovider
			var dayList:MonthDayList = dataGroup.dataProvider as MonthDayList;
			if (dayList.month == 0)
				dayList.setMonthAndYear(11, dayList.year - 1);
			else 
				dayList.setMonthAndYear(dayList.month - 1, dayList.year);
			dispatchEvent(new DateControlEvent(DateControlEvent.MONTH_CHANGE));
		}
		
		private function onNextMonth(e:MouseEvent):void
		{
			var dayList:MonthDayList = dataGroup.dataProvider as MonthDayList;
			if (dayList.month == 11)
				dayList.setMonthAndYear(0, dayList.year+1);
			else 
				dayList.setMonthAndYear(dayList.month+1, dayList.year);
			dispatchEvent(new DateControlEvent(DateControlEvent.MONTH_CHANGE));
		}
		
		protected function onPrevYear(e:MouseEvent):void
		{
			// updates its dataprovider
			var dayList:MonthDayList = dataGroup.dataProvider as MonthDayList;
			dayList.setMonthAndYear(dayList.month, dayList.year - 1);
			dispatchEvent(new DateControlEvent(DateControlEvent.YEAR_CHANGE));
		}
		
		protected function onNextYear(e:MouseEvent):void
		{
			// updates its dataprovider
			var dayList:MonthDayList = dataGroup.dataProvider as MonthDayList;
			dayList.setMonthAndYear(dayList.month, dayList.year + 1);
			dispatchEvent(new DateControlEvent(DateControlEvent.YEAR_CHANGE));
		}
		
		// user changes the selection in the datechooser
		protected function onSelectionChange(e:IndexChangeEvent):void
		{
			_selectedDate = MonthDay(selectedItem).date;
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
					dayList.setMonthAndYear(d.month, d.fullYear);
				}
				else
				{
					dayList.setMonthAndYear(value.month, value.fullYear);
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
		private function collectionChangeHandler(e:CollectionEvent):void{
			selectedItem = null;
			if (_selectedDate) {// if there is a selected date, try to find it on the display
				var n:int = dataProvider.length;
				for (var i:int = 0; i<n; i++)
				{
					if (MonthDay(dataProvider.getItemAt(i)).date.date == _selectedDate.date && 
						MonthDay(dataProvider.getItemAt(i)).date.month == _selectedDate.month &&
						MonthDay(dataProvider.getItemAt(i)).date.fullYear == _selectedDate.fullYear ) 
					{
						selectedItem = dataProvider.getItemAt(i);
					}
				}
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
		
		private function get monthNames():Array
		{
			if(_monthNames == null)
				_monthNames = ResourceUtil.getStringArray('month.long.names', 'fprjui');
			return _monthNames;
		}
		
		private var _dayNames:ArrayList;
		
		private function get dayNames():ArrayList
		{
			if(_dayNames == null)
				_dayNames = new ArrayList(ResourceUtil.getStringArray('weekday.short.names', 'fprjui'));
			return _dayNames;
		}
	}
	
}
