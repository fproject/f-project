///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.calendar
{
	import net.fproject.fproject_internal;
	import net.fproject.utils.*;
	
	use namespace fproject_internal;
	
	/**
	 * Represents a single calendar exception in a <code>WorkCalendar</code>.
	 * <p>A Calendar exception is a period of time in which we define special
	 * <code>Period</code> objects for this own <code>WorkCalendar</code>.</p>
	 * Note that using <code>WorkCalendarException</code> is just another (but more power)
	 * way to define value for <code>periods</code> property of <code>WorkCalendar</code>.
	 * 
	 * @mxml 
	 * <p>The <code>&lt;WorkCalendarException&gt;</code> tag inherits all the tag attributes
	 * of <code>Period</code> class and adds the following tag attributes:</p>
	 * </p>
	 * <pre>
	 * &lt;calendar:<i>WorkCalendarException</i>
	 * &lt;!--<b>Properties</b>--&gt;
	 * daysOfWeek="0"
	 * description="<i>null</i>"
	 * monthDay="1"
	 * monthIndex="0"
	 * monthItem="<i>Default is WorkCalendarException.ITEM_SUNDAY</i>"
	 * monthPosition="<i>Default is WorkCalendarException.POS_FIRST</i>"
	 * type="<i>Default is WorkCalendarException.DAILY</i>"
	 * /&gt;
	 * </pre>
	 * 
	 * @includeExample GanttChartDefiningCalendarException.mxml
	 * 
	 * @author Bui Sy Nguyen
	 */
	public class WorkCalendarException extends Period
	{		
		private var _daysOfWeek:uint;
		/**
		 * Description of the exception 
		 */
		public var description:String;
		private var _type:int;
		private var _monthIndex:uint;
		private var _monthDay:uint;
		private var _monthItem:uint;
		private var _monthPosition:uint;		
		private var _periods:Vector.<PeriodInternal>;
		
		/**
		 * Constructor 
		 * @param startDate The start date-time of exception period
		 * @param endDate The end date-time of exception period
		 * @param working The period is working period or not.
		 * @param type The type of exception.
		 * @param daysOfWeek Bit mask used for Weekly exceptions.
		 * @param monthDay The day of the month, used only for <code>YEARLY_MONTH_DAY</code> 
		 * or <code>MONTHLY_MONTH_DAY</code> type exceptions.
		 * @param monthIndex The month index in a year, used for <code>YEARLY_MONTH_DAY</code>
		 * or <code>YEARLY_POSITIONAL</code> type exceptions.
		 * @param monthItem The <code>monthItem</code> value of Saturday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @param monthPosition The positional of the week in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.<br/><br/>
		 * Note: Each time you make any change to one of the properties: <code>type</code>,
		 * <code>daysOfWeek</code>, <code>monthIndex</code>, <code>monthDay</code>, 
		 * <code>monthItem</code> or <code>monthPosition</code> you should re-invoke 
		 * <code>createException()</code> method to re-calculate the <code>periods</code> property.
		 */
		public function WorkCalendarException(startDate:Date = null, endDate:Date = null,
										  working:Boolean = true, workShifts:Vector.<WorkShift> = null,
										  type:int = DAILY, daysOfWeek:uint = 0, 
										  monthDay:uint = 1, monthIndex:uint = 0, 
										  monthItem:uint = ITEM_SUNDAY, monthPosition:uint = POS_FIRST,
										  description:String = null)
		{
			super();
			if (startDate != null) 
				super.start = startDate;
			if (endDate != null) 
				super.end = endDate;
			super.isWorking = working;
			if (workShifts != null)
				super.workShifts = workShifts;
			
			_dayOfWeekToMonthItem = null;
			_daysOfWeekBitTable = null;
			_type = type;
			_daysOfWeek = daysOfWeek;
			_monthDay = monthDay;
			_monthIndex = monthIndex;
			_monthItem = monthItem;
			_monthPosition = monthPosition;		
			this.description = description;
		}
		
		
		/**
		 * The <code>WorkCalendar</code> periods created from the <code>WorkCalendarException</code> 
		 * 
		 */
		public function get periods():Vector.<PeriodInternal>
		{
			return _periods;
		}
		
		/**
		 * Create <code>WorkCalendar</code> periods from the <code>WorkCalendarException</code>. 
		 * @param calendar The <code>WorkCalendar</code> that this exception belongs to.
		 */
		public function createPeriods(calendar:WorkCalendar):void
		{
			if (this.start == null || this.end == null)
				LoggingUtil.logAndThrowError(WorkCalendarException, ResourceUtil.FPRJ_UTILITIES,
					9, null, ResourceUtil.FPRJ_UTILS_BUNDLE, "illegal.calendar.exception.date.range", 
					[this.start, this.end]);
			switch(_type)
			{
				case DAILY:
					_periods = new Vector.<PeriodInternal>();
					_periods.push(PeriodInternal.create(calendar,this));
					break;
				case WEEKLY:
					createWeeklyPeriods(calendar);
					break;
				case MONTHLY_MONTH_DAY:
					createMonthlyMonthDayPeriods(calendar);
					break;
				case MONTHLY_POSITIONAL:
					createMonthlyPositionalPeriods(calendar);
					break;
				case YEARLY_MONTH_DAY:
					createYearlyMonthDayPeriods(calendar);
					break;
				case YEARLY_POSITIONAL:
					createYearlyPositionalPeriods(calendar);
					break
				default:
					/*throw new Error(MessageUtil.log(WorkCalendarException, LogEventLevel.ERROR, 
						ResourceUtil.FPRJ_GANTT_BUNDLE, 
						"illegal.calendar.exception.type", [_type]));*/
					LoggingUtil.logAndThrowError(WorkCalendarException, ResourceUtil.FPRJ_UTILITIES,
						1, null, ResourceUtil.FPRJ_UTILS_BUNDLE, "illegal.calendar.exception.type", [_type]);
					break;
			}
		}
		
		/**
		 * Create weekly periods 
		 * @param calendar
		 * 
		 */
		private function createWeeklyPeriods(calendar:WorkCalendar):void
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			_periods = new Vector.<PeriodInternal>();			
			var occurenceDays:Array = getWeeklyOccurrenceDays();
			for each (var day:int in occurenceDays)
			{
				var d:Date = new Date(fromDate.time);
				while (d <= toDate)
				{
					if (d.day == day)
					{
						while (d <= toDate)
						{
							var period:PeriodInternal = 
								new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
							_periods.push(period);
							d.date = d.date + 7;
						}
					}
					else
					{
						d.date++;
					}
				}
			}
		}
		
		/**
		 * Create monthly month-day periods 
		 * @param calendar
		 * 
		 */
		private function createMonthlyMonthDayPeriods(calendar:WorkCalendar):void
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			_periods = new Vector.<PeriodInternal>();
			var month:Number = fromDate.month;
			var year:Number = fromDate.fullYear;			
			while (true)
			{
				if (_monthDay <= calendar.gregorianCalendar.getDaysInMonth(month,year))
				{
					var d:Date = new Date(year, month, _monthDay);
					if (fromDate <= d && d <= toDate)
					{
						var period:PeriodInternal = 
							new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
						_periods.push(period);
					}
					if (d > toDate)
						break;					
				}
				
				month++;
				
				if (month == 12)
				{
					month = 0;
					year++;
				}
				
				if(year >= toDate.fullYear && month > toDate.month)
					break;
			}
		}
		
		/**
		 * Create yearly month-day periods 
		 * @param calendar
		 * 
		 */
		private function createYearlyMonthDayPeriods(calendar:WorkCalendar):void
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			_periods = new Vector.<PeriodInternal>();
			var year:Number = fromDate.fullYear;	
			while (true)
			{
				if (_monthDay <= calendar.gregorianCalendar.getDaysInMonth(_monthIndex, year))
				{
					var d:Date = new Date(year, _monthIndex, _monthDay);
					if (fromDate <= d && d <= toDate)
					{
						var period:PeriodInternal = 
							new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
						_periods.push(period);
					}
					if (d > toDate)
						break;					
				}
				
				year++;
				
				if(year > toDate.fullYear)
					break;
			}
		}
		
		/**
		 * Create monthly positional periods 
		 * @param calendar
		 * 
		 */
		private function createMonthlyPositionalPeriods(calendar:WorkCalendar):void
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			_periods = new Vector.<PeriodInternal>();
			
			var period:PeriodInternal;			
			var d:Date = positionalItemToDate(calendar.gregorianCalendar, fromDate.fullYear, fromDate.month)
			
			if (d != null)
			{
				period = new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
				_periods.push(period);
				if (DateTimeUtil.compareDatePart(d, toDate) >= 0)
					return;
			}
			
			var year:Number = fromDate.fullYear;			
			var month:uint = fromDate.month;
			
			while (true)
			{
				month++;
				if (month == 12)
				{
					month = 0;
					year++;
				}
				if (year > toDate.fullYear || 
					(year == toDate.fullYear && month > toDate.month))
					break;
				
				d = positionalItemToDate(calendar.gregorianCalendar, year, month);
				
				if (d != null)
				{
					period = new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
					_periods.push(period);
				}
			}			
		}
		
		/**
		 * Create yearly positional periods 
		 * @param calendar
		 * 
		 */
		private function createYearlyPositionalPeriods(calendar:WorkCalendar):void
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			_periods = new Vector.<PeriodInternal>();
			
			var period:PeriodInternal;			
			var d:Date = positionalItemToDate(calendar.gregorianCalendar, fromDate.fullYear)
			
			if (d != null)
			{
				period = new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
				_periods.push(period);
				if (d.fullYear >= toDate.fullYear)
					return;
			}
			
			var year:Number = fromDate.fullYear;			
			
			while (true)
			{
				year++;
				
				if (year > toDate.fullYear)
					break;
				
				d = positionalItemToDate(calendar.gregorianCalendar, year);
				
				if (d != null)
				{
					period = new PeriodInternal(calendar, this.isWorking, d, d, this.workShifts);
					_periods.push(period);
				}
			}
		}
		
		/**
		 * The first week position in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>. 
		 * @see #monthPosition
		 */
		public static const POS_FIRST:uint = 0;
		/**
		 * The second week position in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>. 
		 * @see #monthPosition
		 */
		public static const POS_SECOND:uint = 1;
		/**
		 * The third week position in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthPosition 
		 */
		public static const POS_THIRD:uint = 2;
		/**
		 * The fourth week position in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>. 
		 * @see #monthPosition
		 */
		public static const POS_FOURTH:uint = 3;
		/**
		 * The last week position in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>. 
		 * @see #monthPosition
		 */
		public static const POS_LAST:uint = 4;
		
		/**
		 * The position of the week in month that specified for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>. While the <code>monthItem</code> define the 
		 * day of week, the <code>monthPosition</code> define the week position of month:<br/><br/>
		 * <li>0: first</li> 
		 * <li>1: second</li>
		 * <li>2: third</li>
		 * <li>3: fourth</li>
		 * <li>4: last</li><br/><br/>
		 * For example, if <code>type = MONTHLY_POSITIONAL</code>, <code>monthItem = 3</code> (Sunday) and <code>monthPosition = 1</code>
		 * (second), then the exception reccurs monthly on every second Sunday.<br/><br/>
		 * Default value is <code>POS_FIRST</code>
		 */
		public function get monthPosition():uint
		{
			return _monthPosition;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set monthPosition(value:uint):void
		{
			_monthPosition = value;
		}
		
		/**
		 * The <code>monthItem</code> value of Sunday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_SUNDAY:uint = 3;
		
		/**
		 * The <code>monthItem</code> value of Monday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_MONDAY:uint = 4;
		
		/**
		 * The <code>monthItem</code> value of Tuesday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_TUESDAY:uint = 5;
		
		/**
		 * The <code>monthItem</code> value of Wednesday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_WEDNESDAY:uint = 6;
		
		/**
		 * The <code>monthItem</code> value of Thursday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_THURSDAY:uint = 7;
		
		/**
		 * The <code>monthItem</code> value of Friday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_FRIDAY:uint = 8;
		
		/**
		 * The <code>monthItem</code> value of Saturday, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * @see #monthItem
		 */
		public static const ITEM_SATURDAY:uint = 9;
		
		/**
		 * The predefined value for a day of week, used only for the 
		 * exception type of <code>MONTHLY_POSITIONAL</code> or
		 * <code>YEARLY_POSITIONAL</code>.
		 * The value of monthItem is specified below:<br/><br/> 
		 * <li>3: ITEM_SUNDAY</li> 
		 * <li>4: ITEM_MONDAY</li>
		 * <li>5: ITEM_TUESDAY</li>
		 * <li>6: ITEM_WEDNESDAY</li>
		 * <li>7: ITEM_THURSDAY</li>
		 * <li>8: ITEM_FRIDAY</li>
		 * <li>9: ITEM_SATURDAY</li><br/><br/> 
		 * Default value is <code>ITEM_SUNDAY</code>
		 */
		public function get monthItem():uint
		{
			return _monthItem;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set monthItem(value:uint):void
		{
			_monthItem = value;
		}
		
		/**
		 * The day of the month, used only for <code>YEARLY_MONTH_DAY</code> 
		 * or <code>MONTHLY_MONTH_DAY</code> type exceptions.<br/>
		 * Value of <code>monthDay</code> can be an integer from 1 to 31.<br/><br/>
		 * Default is 1		 
		 * 
		 */
		public function get monthDay():uint
		{
			return _monthDay;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set monthDay(value:uint):void
		{
			_monthDay = value;
		}
		
		/**
		 * The month index in a year, used for <code>YEARLY_MONTH_DAY</code>
		 * or <code>YEARLY_POSITIONAL</code> type exceptions. 
		 * The value of this property can be a number from 0 to 11.<br/>
		 * Default is 0. 
		 * 
		 */
		public function get monthIndex():uint
		{
			return _monthIndex;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set monthIndex(value:uint):void
		{
			_monthIndex = value;
		}
		
		/**
		 * Defines the type of Calendar exception that reccurs daily.
		 * @see #type
		 */
		public static const DAILY:int = 1;
		/**
		 * Defines the type of Calendar exception that reccurs yealy at a 
		 * specified day and month.
		 * @see #type
		 */
		public static const YEARLY_MONTH_DAY:int = 2;
		/**
		 * Defines the type of Calendar exception that reccurs yealy at
		 * a specified day of week and a specified week position in a month.
		 * @see #type
		 */
		public static const YEARLY_POSITIONAL:int = 3;
		/**
		 * Defines the type of Calendar exception that reccurs monthly at a 
		 * specified day of month.
		 * @see #type
		 */
		public static const MONTHLY_MONTH_DAY:int = 4;
		/**
		 * Defines the type of Calendar exception that reccurs monthly at
		 * a specified day of week at a specified position in a month.
		 * @see #type
		 */
		public static const MONTHLY_POSITIONAL:int = 5;
		/**
		 * Defines the type of Calendar exception that reccurs weekly.
		 * @see #type
		 */
		public static const WEEKLY:int = 6;
		
		/**
		 * <p>The type of exception, can be one of these:</p>
		 * 
		 * <li>1: <code>DAILY</code> - Reccur daily.</li>
		 * <li>2: <code>YEARLY_MONTH_DAY</code> - Reccur yealy at a 
		 * specified day and month.</li>
		 * <li>3: <code>YEARLY_POSITIONAL</code> - Reccur yealy at
		 * a specified day of week and a specified week position in a month.</li>
		 * <li>4: <code>MONTHLY_MONTH_DAY</code> - Reccur monthly at a 
		 * specified day of month.</li>
		 * <li>5: <code>MONTHLY_POSITIONAL</code> - Reccur monthly at
		 * a specified day of week at a specified position in a month.</li>
		 * <li>6: <code>WEEKLY</code> - Reccur weekly.</li>
		 * <br/><br/>
		 * Default value is <code>DAILY</code>
		 */
		public function get type():int
		{
			return _type;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set type(value:int):void
		{
			_type = value;
		}
		
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Sunday.
		 * @see #daysOfWeek
		 */
		public static const BIT_SUNDAY:uint = 1;
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Sunday.
		 * @see #daysOfWeek
		 */
		public static const BIT_MONDAY:uint = 2;
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Tuesday.
		 * @see #daysOfWeek
		 */
		public static const BIT_TUESDAY:uint = 4;
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Wednesday.
		 * @see #daysOfWeek
		 */
		public static const BIT_WEDNESDAY:uint = 8;
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Thursday.
		 * @see #daysOfWeek
		 */
		public static const BIT_THURSDAY:uint = 16;
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Friday.
		 * @see #daysOfWeek
		 */
		public static const BIT_FRIDAY:uint = 32;
		/**
		 * Bit value used for Weekly exceptions. If value of the <code>daysOfWeek</code>
		 * property contains this bit then the exception will occur weekly at Saturday.
		 * @see #daysOfWeek
		 */
		public static const BIT_SATURDAY:uint = 64;
		
		private var _daysOfWeekBitTable:Array;
		/**
		 * Days of week bits table 
		 */
		private function get daysOfWeekBitTable():Array
		{
			if (_daysOfWeekBitTable == null)
				_daysOfWeekBitTable = new Array(BIT_SUNDAY, BIT_MONDAY, BIT_TUESDAY,
					BIT_WEDNESDAY, BIT_THURSDAY, BIT_FRIDAY, BIT_SATURDAY);
			return _daysOfWeekBitTable;
		}
		
		/**
		 * <p>Bit mask used for Weekly exceptions.</p>
		 * Only use this field when the exception type is WEEKLY.
		 * The bit value of <code>daysOfWeek</code> is specified as below:<br/>
		 * <pre>
		 * BIT_SUNDAY = 1
		 * BIT_MONDAY = 2
		 * BIT_TUESDAY = 4
		 * BIT_WEDNESDAY = 8
		 * BIT_THURSDAY = 16
		 * BIT_FRIDAY = 32
		 * BIT_SATURDAY = 64
		 * </pre>
		 * Default value is 0.
		 * @see #BIT_SUNDAY
		 * @see #BIT_MONDAY
		 * @see #BIT_TUESDAY
		 * @see #BIT_WEDNESDAY
		 * @see #BIT_THURSDAY
		 * @see #BIT_FRIDAY
		 * @see #BIT_SATURDAY
		 */
		public function get daysOfWeek():uint
		{
			return _daysOfWeek;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function set daysOfWeek(value:uint):void
		{
			_daysOfWeek = value;
		}
		
		/**
		 * Return total number of occurences of this exception from its start date 
		 * to its end date. 
		 * @param calendar the <code>WorkCalendar</code> that contains this exception
		 * @return The total number of occurences of this exception from its start date 
		 * to its end date.
		 * 
		 */
		public function getOccurrences(calendar:WorkCalendar = null):Number
		{
			var occurrences:Number;
			var gregorianCalendar:GregorianCalendar = calendar != null?
				calendar.gregorianCalendar : new GregorianCalendar();
			switch(_type)
			{
				case DAILY:					
					occurrences = gregorianCalendar.getDays(this.start, this.end);
					break;
				
				case WEEKLY:					
					occurrences = getWeeklyOccurrences(gregorianCalendar);
					break;
				
				case MONTHLY_MONTH_DAY:
					occurrences = getMonthlyMonthDayOccurrences(gregorianCalendar);
					break;
				
				case YEARLY_MONTH_DAY:
					occurrences = getYearlyMonthDayOccurrences(gregorianCalendar);
					break;
				
				case MONTHLY_POSITIONAL:
					occurrences = getMonthlyPositionalOccurrences(gregorianCalendar);
					break;
				
				case YEARLY_POSITIONAL:
					occurrences = getYearlyPositionalOccurrences(gregorianCalendar);
					break;
				
				default:
					/*throw new Error(MessageUtil.log(WorkCalendarException, LogEventLevel.ERROR, 
						ResourceUtil.FPRJ_GANTT_BUNDLE, 
						"illegal.calendar.exception.type", [_type]));*/
					LoggingUtil.logAndThrowError(WorkCalendarException, ResourceUtil.FPRJ_UTILITIES,
						1, null, ResourceUtil.FPRJ_UTILS_BUNDLE, "illegal.calendar.exception.type", [_type]);
					break;
			}
			
			return occurrences;
		}
		
		/**
		 * Returns the number of occurences for this exception for the case 
		 * type = <code>WEEKLY</code>.
		 * @param gregorianCalendar An instance of <code>GregorianCalendar</code>.
		 * @return The number of weekly occurences
		 */
		private function getWeeklyOccurrences(gregorianCalendar:GregorianCalendar):Number
		{
			var occurrences:Number;
			var dayCount:Number = 
				gregorianCalendar.getDays(this.start, this.end);
			occurrences = int(dayCount / 7) * getWeeklyOccurrencesForOneWeek();
			var remainder:int = dayCount % 7;
			var day:Date = new Date(this.end.time);
			for (var i:int = remainder; i > 0; i--)
			{
				if (isWeeklyOccurrenceAtDate(day)) 
					occurrences++;
				day.date--;
			}
			
			return occurrences;
		}
		
		/**
		 * Returns the number of occurences for this exception for the case 
		 * type = <code>MONTHLY_MONTH_DAY</code>.
		 * @param gregorianCalendar An instance of <code>GregorianCalendar</code>.
		 * @return The number of monthly-month-day occurences
		 */
		private function getMonthlyMonthDayOccurrences(gregorianCalendar:GregorianCalendar):Number
		{			
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			
			var occurrences:Number = 12 * (toDate.fullYear - fromDate.fullYear);
			occurrences = occurrences + (toDate.month - fromDate.month) - 1;
			
			if(_monthDay >= fromDate.date 
				&& _monthDay <= gregorianCalendar.getDaysInMonth(fromDate.month, fromDate.fullYear))
			{
				occurrences++;
			}
			
			if(_monthDay <= toDate.date)
				occurrences++;
			
			return occurrences;
		}
		
		/**
		 * Returns the number of occurences for this exception for the case 
		 * type = <code>YEARLY_MONTH_DAY</code>.
		 * @param gregorianCalendar An instance of <code>GregorianCalendar</code>.
		 * @return The number of yearly-month-day occurences.<br/>
		 * 
		 */
		private function getYearlyMonthDayOccurrences(gregorianCalendar:GregorianCalendar):Number
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			
			var occurrences:Number = toDate.fullYear - fromDate.fullYear - 1;
			var exceptionDate:Date;
			if(_monthDay <= gregorianCalendar.getDaysInMonth(_monthIndex, fromDate.fullYear))
			{
				exceptionDate = new Date(fromDate.fullYear, _monthIndex, _monthDay);
				if (gregorianCalendar.getDayOfYear(fromDate) <= 
					gregorianCalendar.getDayOfYear(exceptionDate))
				{
					occurrences++;
				}
			}
			
			if(_monthDay <= gregorianCalendar.getDaysInMonth(_monthIndex, toDate.fullYear))
			{
				exceptionDate = new Date(toDate.fullYear, _monthIndex, _monthDay);
				if (gregorianCalendar.getDayOfYear(toDate) >= 
					gregorianCalendar.getDayOfYear(exceptionDate))
				{
					occurrences++;
				}
			}
			
			return occurrences < 0? 0 : occurrences;
		}
		
		/**
		 * Returns the number of occurences for this exception for the case 
		 * type = <code>MONTHLY_POSITIONAL</code>.
		 * @param gregorianCalendar An instance of <code>GregorianCalendar</code>.
		 * @return The number of monthly-positional occurences
		 */
		private function getMonthlyPositionalOccurrences(gregorianCalendar:GregorianCalendar):Number
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			
			var occurrences:Number = 12 * (toDate.fullYear - fromDate.fullYear);
			occurrences = occurrences + (toDate.month - fromDate.month) - 1;
			
			if(positionalItemToDate(gregorianCalendar, fromDate.fullYear, fromDate.month) != null)
				occurrences++;
			
			if(positionalItemToDate(gregorianCalendar, toDate.fullYear, toDate.month) != null)
				occurrences++;
			
			return occurrences < 0? 0: occurrences;
		}
		
		private var _dayOfWeekToMonthItem:Array;
		private function get dayOfWeekToMonthItem():Array
		{
			if (_dayOfWeekToMonthItem == null)
			{
				_dayOfWeekToMonthItem = 
					new Array(ITEM_SUNDAY, ITEM_MONDAY, ITEM_TUESDAY,
						ITEM_WEDNESDAY, ITEM_THURSDAY, ITEM_FRIDAY,
						ITEM_SATURDAY);
			}
			return _dayOfWeekToMonthItem;
		}
		
		/**
		 * Convert from a monthly or yearly positional item to date. 
		 * @param gregorianCalendar An instance of <code>GregorianCalendar</code>.
		 * @param year The full-year number of item
		 * @param month (optional) The month index of item (0 to 11). If this parameter is skipped,
		 * the <code>monthIndex</code> property will be used instead.
		 * @return The date converted from the monthly or yearly positional item.
		 * Returns <code>null</code> if the specified positional item does not 
		 * exist in exception's time period.
		 */
		private function positionalItemToDate(gregorianCalendar:GregorianCalendar, year:Number, month:int = -1):Date
		{
			if(month == -1)
				month = _monthIndex;
			var fromDate:Date;
			var toDate:Date;
			var itemDate:Date = null;
			
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			
			var d:Date = new Date(year, month, 1);
			var maxDate:uint = gregorianCalendar.getDaysInMonth(month, year);
			var position:int = -1;
			var dowToMonthItem:Array = dayOfWeekToMonthItem;
			while (d.date <= maxDate)
			{
				if(dowToMonthItem[d.day] == _monthItem)
				{
					itemDate = new Date(d.time);					
					position++;
					if(position == _monthPosition)
					{						
						break;
					}
					d.date = d.date + 7;
				}
				else
				{
					d.date++;
				}
			}
			
			if(_monthPosition != POS_LAST && position != _monthPosition)
			{
				itemDate = null;
			}
			
			if (itemDate != null && 
				(DateTimeUtil.compareDatePart(itemDate, fromDate) < 0 || 
					DateTimeUtil.compareDatePart(itemDate, toDate) > 0))
			{
				itemDate = null;
			}
			return itemDate;
		}
		
		/**
		 * Returns the number of occurences for this exception for the case 
		 * type = <code>YEARLY_POSITIONAL</code>.
		 * @param gregorianCalendar An instance of <code>GregorianCalendar</code>.
		 * @return The number of yearly-positional occurences
		 */
		private function getYearlyPositionalOccurrences(gregorianCalendar:GregorianCalendar):Number
		{
			var fromDate:Date;
			var toDate:Date;
			if (this.start > this.end)
			{	
				fromDate = this.end;
				toDate = this.start;
			}
			else
			{
				fromDate = this.start;
				toDate = this.end;
			}
			
			var occurrences:Number = toDate.fullYear - fromDate.fullYear -1;
			
			if(positionalItemToDate(gregorianCalendar, fromDate.fullYear) != null)
				occurrences++;
			
			if(positionalItemToDate(gregorianCalendar, toDate.fullYear) != null)
				occurrences++;
			
			return occurrences < 0? 0: occurrences;
		}
		
		/**
		 * Return number of occurrences for one week, in case of this exception
		 * has type of <code>WEEKLY</code>. 
		 * @return The number of occurrences for one week.
		 * 
		 */
		private function getWeeklyOccurrencesForOneWeek():Number
		{			
			var occurrences:Number = 0;
			var bitTable:Array = daysOfWeekBitTable;
			for each (var bit:uint in bitTable)
			{
				if ((_daysOfWeek & bit) == bit) occurrences++;
			}
			return occurrences;
		}
		
		/**
		 * Return days of week on which the weekly occurrence occurs, in case of this exception
		 * has type of <code>WEEKLY</code>. 
		 * @return The days of week on which the weekly occurrence occurs.
		 * 
		 */
		private function getWeeklyOccurrenceDays():Array
		{
			var occurrenceDays:Array = [];
			var bitTable:Array = daysOfWeekBitTable;
			for (var i:int = 0; i < bitTable.length; i++)
			{
				if ((_daysOfWeek & bitTable[i]) == bitTable[i]) 
					occurrenceDays.push(i);
			}
			return occurrenceDays;
		}
		
		/**
		 * Check if this exception may occur at a specified date. 
		 * @param date The date interest.
		 * @return <code>true</code> if this exception occurs at a specified date.
		 * <code>false</code> if otherwise. 
		 * 
		 */
		private function isWeeklyOccurrenceAtDate(date:Date):Boolean
		{
			var bitTable:Array = daysOfWeekBitTable;
			return (bitTable[date.day] & _daysOfWeek) == bitTable[date.day];
		}
	}
}