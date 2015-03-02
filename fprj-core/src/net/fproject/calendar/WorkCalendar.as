///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.calendar
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.events.FlexEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.Time;
	import net.fproject.core.TimeRange;
	import net.fproject.core.TimeUnit;
	import net.fproject.serialize.Deserializer;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.GregorianCalendar;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.LruCache;
	import net.fproject.utils.MessageUtil;
	import net.fproject.utils.ResourceUtil;
	
	use namespace fproject_internal;
	
	/**
	 * <p>Dispatched when the <code>WorkCalendar</code> is changed.</p>
	 * <p>Classes that use <code>WorkCalendar</code> should listen for this
	 * event and perform the necessary updates.</p>
	 * */
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 * <p>Dispatched when the constructor of <code>WorkCalendar</code>
	 * is invoking.</p>
	 * <p>Classes that use <code>WorkCalendar</code> should listen for this
	 * event and perform the necessary initialization. For example you
	 * can load the default work shifts in this event handler.</p>
	 * */
	[Event(name="initialize", type="mx.events.FlexEvent")]
	
	[ResourceBundle("fprjutils")]
	/**
	 * 	Represents a calendar that defines working and nonworking periods as
	 *  well as working times for each day.
	 *
	 *  <p>A work calendar object allows storing working and nonworking times.
	 *  The object also provides methods to navigate in the working and nonworking periods.
	 *  You may for example get the next or previous working date from a date,
	 *  or compute the amount of work between two dates.</p>
	 *
	 *  <p>You can specify the working or nonworking days in a week for the whole
	 *  calendar by using the <code>workingDays</code> property. The <code>workingDays</code>
	 *  property is a collection of <code>WorkingDay</code> objects. The following mxml
	 *  fragment shows how to specify that friday will be a nonworking day,
	 *  and that the working times on monday are <code>7AM-1PM</code> and <code>3PM-8PM</code>.
	 *  The non specified days are inherited from the base calendar,
	 *  which is the <code>STANDARD</code> calendar.</p>
	 *
	 *
	 *  <pre>
	 *  &lt;cal:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
	 *  	&lt;cal:weekDays&gt;
	 *  		&lt;cal:WeekDay dayOfWeek="5" isWorking="false" /&gt;
	 *  		&lt;cal:WeekDay dayOfWeek="1"&gt;
	 *  			&lt;cal:workShifts&gt;
	 *  				&lt;cal:WorkShift start="07:00" end="13:00" /&gt;
	 *  				&lt;cal:WorkShift start="15:00" end="20:00" /&gt;
	 *  			&lt;/cal:workShifts&gt;
	 *  		&lt;/cal:WeekDay&gt;
	 *  	&lt;/cal:weekDays&gt;
	 *  &lt;/cal:WorkCalendar&gt;
	 *  </pre>
	 *
	 *  <p>You can also specify the working times for a particular period by using the
	 *  <code>workingPeriods</code> property. The <code>workingPeriods</code> property
	 *  is a collection of <code>Period</code> objects.<br/><br/>
	 *  The following mxml fragment shows how to specify that the period from January 1
	 *  to January 7 2011 is a nonworking period, and the period from March 1 to
	 *  March 7 2011 has 7AM-1PM and 3PM-8PM as working times.</p>
	 *
	 *  <pre>
	 *  &lt;cal:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
	 *  	&lt;cal:periods&gt;
	 *  		&lt;cal:Period start="2011/1/1" end="2011/1/7" isWorking="false" /&gt;
	 *  		&lt;cal:Period start="2011/3/1" end="2011/3/7" &gt;
	 *  			&lt;cal:workShifts&gt;
	 *  				&lt;cal:WorkShift start="07:00" end="13:00" /&gt;
	 *  				&lt;cal:WorkShift start="15:00" end="20:00" /&gt;
	 *  			&lt;/cal:workShifts&gt;
	 *  		&lt;/cal:Period&gt;
	 *  	&lt;/cal:periods&gt;
	 *  &lt;/cal:WorkCalendar&gt;
	 *  </pre>
	 *
	 *  @mxml
	 *  <p>The <code>&lt;WorkCalendar&gt;</code> tag inherits all the tag attributes
	 *  of its superclass and adds the following tag attributes:</p>
	 *  <pre>
	 *  &lt;cal:WorkCalendar
	 *  &lt;!--<b>Properties</b>--&gt;
	 *  baseCalendar="null"
	 *  gregorianCalendar="<i>Instance of <code>GregorianCalendar</code></i>"
	 *  weekDays="<i>A vector of <code>WeekDay</code></i>"
	 *  periods="<i>A vector of <code>Period</code></i>"
	 *  name="default"
	 *
	 *  &lt;!--<b>Events</b>--&gt;
	 *
	 *  change="<i>No default</i>"
	 *  /&gt;
	 *  </pre>
	 *
	 * @includeExample GanttChartDefiningWorkCalendar.mxml
	 * @includeExample ResourceChartDefiningWorkCalendar.mxml
	 * @includeExample WorkCalendarBaseCalendar.mxml
	 * 	 */
	public class WorkCalendar extends EventDispatcher
	{
		private var _subCalendars:Vector.<WorkCalendar>;
		private var _disableEvents:Boolean;
		private var _nextWorkingTimeCache:LruCache;
		private var _nextNonWorkingTimeCache:LruCache;
		private var _previousWorkingTimeCache:LruCache;
		[Transient]
		fproject_internal var _gregorianCalendar:GregorianCalendar;
		private var _name:String;
		private var _baseCalendar:WorkCalendar;
		private var _periods:Vector.<PeriodInternal>;
		private var _weekDays:Vector.<WeekDayInternal>;
		private var _exceptions:Vector.<WorkCalendarException>;
		
		//20130429 Added
		private var _workBetweenCache:LruCache;
		
		/**
		 * <p>The standard calendar.
		 * </p><p>This calendar is a base calendar that defines the week-end as a non-working period
		 * and working times from 8 AM to 12 AM and from 1PM to 5PM. Note that you cannot change this calendar.
		 * </p>
		 *
		 * @see #TWENTY_FOUR_HOURS
		 * @see #NIGHT_SHIFT
		 */
		public static const STANDARD:WorkCalendar = createStandardCalendar();
		
		/**
		 * <p>The 24 hours work calendar.
		 * </p><p>This calendar is a base calendar with no non-working periods. Note that you cannot change this calendar.
		 * </p>
		 * @see #STANDARD
		 * @see #NIGHT_SHIFT
		 * */
		public static const TWENTY_FOUR_HOURS:WorkCalendar = create24HoursCalendar();
		
		/**
		 * <p>The night shift work calendar.
		 * </p><p>This calendar is a base calendar with the following working and non-working periods:
		 * </p><ul>
		 * <li>Sunday -- Sunday is a nonworking day.</li>
		 * <li>Monday -- Working times are 11PM-12PM.</li>
		 * <li>Saturday -- Working times are 12AM-3AM and 4AM-8AM.</li>
		 * <li>Tuesday, Wednesday, Thursday, Friday -- Working times are 12AM-3AM, 4AM-8AM, and 11PM-12PM.</li>
		 * </ul>
		 *
		 * Note that you cannot change this calendar.
		 *
		 * @see #STANDARD
		 * @see #TWENTY_FOUR_HOURS
		 */
		public static const NIGHT_SHIFT:WorkCalendar = createNightShiftCalendar();
		
		//Private variables and constants
		private static var _resourceManager:IResourceManager;
		private static var _defaultWorkShifts:Vector.<WorkShift>;
		private static var _defaultNonWorkingDays:Vector.<uint>;
		public static const CALRENDAR_NAME_DEFAULT:String = "Work Calendar";
		public static const CALRENDAR_NAME_24HOURS:String = "24 Hours";
		public static const CALRENDAR_NAME_STANDARD:String = "Standard";
		public static const CALRENDAR_NAME_NIGHT_SHIFT:String = "Night Shift";
		
		[ResourceBundle("fprjutils")]
		/**
		 * Initializes a new instance of the <code>WorkCalendar</code> class.
		 *
		 * @param name The name of the calendar. The default value is <code>default</code>.
		 * @param baseCalendar A reference to a base calendar or null to create a base calendar.
		 * Note that this parameter must be a base calendar. The default value is <code>null</code>.
		 * @includeExample GanttChartDefiningWorkCalendar.mxml
		 * @includeExample GanttChartDefiningCalendarException.mxml
		 */
		public function WorkCalendar(name:String = CALRENDAR_NAME_DEFAULT,
									 baseCalendar:WorkCalendar = null)
		{
			// NguyenBS 20101102 removed
			// Any calendar can be a base calendar, so we do
			// not have to check this.
			/*if (baseCalendar != null && !baseCalendar.isRootCalendar)
			{
			throw MessageUtil.wrongArgument(WorkCalendar, "WorkCalendar.WorkCalendar", "baseCalendar");
			}*/
			
			this._gregorianCalendar = new GregorianCalendar();
			this._name = name;
			this._periods = new Vector.<PeriodInternal>();
			this._weekDays = new Vector.<WeekDayInternal>(7);
			this._baseCalendar = baseCalendar;
			if (this._baseCalendar != null)
			{
				this._baseCalendar.addSubcalendar(this);
				createPeriods();
				createWeekdays();
			}
			else
			{
				initDefaultWeekDays();
			}
			dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
		} // end function
		
		[Transient]
		/**
		 * <p>The Gregorian calendar used to do computations on dates.</p>
		 *
		 * @default a new instance of the <code>GregorianCalendar</code> class
		 *
		 * */
		public function get gregorianCalendar():GregorianCalendar
		{
			if (!this._gregorianCalendar)
			{
				this._gregorianCalendar = new GregorianCalendar();
			}
			return this._gregorianCalendar;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		public function set gregorianCalendar(value:GregorianCalendar):void
		{
			//this.assertNotReadOnly();
			if (value != this._gregorianCalendar)
			{
				this._gregorianCalendar = value;
				this.onChanged();
			}
		} // end function
		
		/**
		 *
		 * <p>The name of the calendar.
		 * </p><p> The default value is <code>"default"</code>.</p>
		 *
		 */
		public function get name():String
		{
			return this._name == null ? ("") : (this._name);
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		public function set name(value:String):void
		{
			this.assertNotReadOnly();
			if (this._name != value)
			{
				this._name = value;
				this.onChanged();
			}
		} // end function
		
		/**
		 *
		 * <p>The base calendar of this calendar.
		 *
		 * </p><p>
		 * A base calendar is a calendar that can be used as a base for other calendars.
		 * If this property is <code>null</code>, the calendar is a base calendar.
		 * </p>
		 * @default a WorkCalendar class's instance.
		 */
		public function get baseCalendar():WorkCalendar
		{
			return this._baseCalendar;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		// NguyenBS 20101102 modified
		// Alow any calendar can be a base calendar
		public function set baseCalendar(value:WorkCalendar):void
		{
			this.assertNotReadOnly();
			
			if (value == this)
			{
				// A calendar cannot be itself's base-calendar
				throw MessageUtil.wrongArgument(WorkCalendar, "WorkCalendar.baseCalendar",
					"value");
			}
			
			if (value != _baseCalendar)
			{
				if (this.isRootCalendar)
				{
					for each (var period:PeriodInternal in _periods)
					{
						period.isInherited = false;
					}
					
					for each (var wdp:WeekDayInternal in _weekDays)
					{
						wdp.isInherited = false;
					}
				}
				else
				{
					_baseCalendar.removeSubcalendar(this);
				}
				
				_baseCalendar = value;
				
				if (_baseCalendar != null)
				{
					/*for each (wdp in _weekDays)
					{
						if (wdp.isInherited)
							_weekDays[wdp.dayOfWeek] =
								_baseCalendar._weekDays[wdp.dayOfWeek].clone() as
								WeekDayPeriod;
					}*/
					_baseCalendar.addSubcalendar(this);									
				}
				
				createPeriods();
				createWeekdays();	
				
				this.onChanged();
			}
		} // end function
		
		[Transient]
		/**
		 *
		 * <p>List of the specific periods defined in this calendar.</p>
		 * <p>
		 * The <code>periods</code> property is a collection of <code>Period</code>
		 * objects.<br/>
		 * The following mxml fragment shows how to specify that the period from
		 * 8/1 to 8/7/2010 is a nonworking period, and the period from 1/1 to 9/7/2010
		 * has 7AM-1PM and 3PM-8PM as working times.</p>
		 * <pre>
		 * &lt;cal:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
		 * 	&lt;cal:periods&gt;
		 * 		&lt;cal:Period start="2010/8/1" end="2010/8/1" isWorking="false" /&gt;
		 * 		&lt;cal:Period start="2010/1/1" end="2010/9/7" &gt;
		 * 			&lt;cal:workShifts&gt;
		 * 				&lt;cal:WorkShift start="07:00" end="13:00" /&gt;
		 * 				&lt;cal:WorkShift start="15:00" end="20:00" /&gt;
		 * 			&lt;/cal:workShifts&gt;
		 * 		&lt;/cal:Period&gt;
		 * 	&lt;/cal:periods&gt;
		 * &lt;/cal:WorkCalendar&gt;
		 * </pre>
		 * *
		 */
		public function get periods():Vector.<Period>
		{
			var returnPeriods:Vector.<Period> = new Vector.<Period>;
			for each (var period:PeriodInternal in this._periods)
			{
				if (!period.isInherited)
				{
					returnPeriods.push(Period.createPeriod(period));
				}
			}
			return returnPeriods;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		public function set periods(value:Vector.<Period>):void
		{
			this.assertNotReadOnly();
			this._periods = new Vector.<PeriodInternal>;
			for each (var workCalendarPeriod:Period in value)
			{
				var period:PeriodInternal =
					PeriodInternal.create(this, workCalendarPeriod);
				if (workCalendarPeriod.isWorking)
				{
					checkWorkShifts(period.workShifts);
					this.addWorkingPeriod(period);
				}
				else
				{
					this.addNonWorkingPeriod(period);
				}
			}
			this.onChanged();
		} // end function
		
		
		/**
		 *
		 * <p>List of the specific exceptions defined in this calendar.</p>
		 * <p>
		 * The <code>exceptions</code> property is a collection of 
		 * <code>WorkCalendarException</code> objects.<br/>
		 * The following mxml fragment shows how to specify that the period from
		 * 8/1 to 8/7/2010 is a nonworking period, the period from 1/1 to 9/7/2010
		 * has 7AM-1PM and 3PM-8PM as working times, and an exception on 25/1 yearly 
		 * from 2010 will be nonworking day until 10 times occurs</p>
		 * <pre>
		 * &lt;cal:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
		 * 	&lt;cal:exceptions&gt;
		 * 		&lt;cal:WorkCalendarException start="2010/8/1" end="2010/8/1" isWorking="false" /&gt;
		 * 		&lt;cal:WorkCalendarException start="2010/1/1" end="2010/9/7" &gt;
		 * 			&lt;cal:workShifts&gt;
		 * 				&lt;cal:WorkShift start="07:00" end="13:00" /&gt;
		 * 				&lt;cal:WorkShift start="15:00" end="20:00" /&gt;
		 * 			&lt;/cal:workShifts&gt;
		 * 		&lt;/cal:WorkCalendarException&gt;
		 * 		&lt;cal:WorkCalendarException start="2010/1/25" end="2019/1/25" isWorking="false"
		 * 			type="2", monthDay="25", monthIndex="0" /&gt;
		 * 	&lt;/cal:exceptions&gt;
		 * &lt;/cal:WorkCalendar&gt;
		 * </pre>
		 * 
		 * @default null
		 *
		 * @see WorkCalendarException
		 *
		 */
		public function get exceptions():Vector.<WorkCalendarException>
		{
			return _exceptions;
		}
		
		/**
		 *
		 * @private
		 *
		 */
		public function set exceptions(value:Vector.<WorkCalendarException>):void
		{
			this.assertNotReadOnly();
			
			for each (var calException:WorkCalendarException in value)
			{
				var pers:Vector.<PeriodInternal> = calException.fproject_internal::createPeriods(this);
				for each (var period:PeriodInternal in pers)
				{
					if (period.isWorking)
					{
						checkWorkShifts(period.workShifts);
						this.addWorkingPeriod(period);
					}
					else
					{
						this.addNonWorkingPeriod(period);
					}
				}
			}
			_exceptions = value;
		}
		
		/**
		 *
		 * <p>List of the days of week defined in this calendar.</p>
		 * <p>The <code>weekDays</code> property is a collection of <code>WeekDay</code>
		 * objects.<br/>
		 * The following mxml fragment shows how to specify that friday will be a
		 * nonworking day, and that the working times on monday are 7AM-1PM and 3PM-8PM.
		 * The non specified days are inherited from the base calendar, which is the
		 * <code>STANDARD</code> calendar.</p>
		 *
		 * <pre>
		 * &lt;cal:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
		 * 	&lt;cal:workingDays&gt;
		 * 		&lt;cal:WeekDay dayOfWeek="5" isWorking="false" /&gt;
		 * 		&lt;cal:WeekDay dayOfWeek="1"&gt;
		 * 			&lt;cal:workShifts&gt;
		 * 				&lt;cal:WorkShift start="07:00" end="13:00" /&gt;
		 * 				&lt;cal:WorkShift start="15:00" end="20:00" /&gt;
		 * 			&lt;/cal:workShifts&gt;
		 * 		&lt;/cal:WeekDay&gt;
		 * 	&lt;/cal:workingDays&gt;
		 * &lt;/cal:WorkCalendar&gt;
		 * </pre>
		 *
		 */
		public function get weekDays():Vector.<WeekDay>
		{
			var dayPeriod:WeekDayInternal = null;
			var weekDay:Vector.<WeekDay> = new Vector.<WeekDay>;
			for each (dayPeriod in this._weekDays)
			{
				if (dayPeriod != null)
				{
					weekDay.push(WeekDay.createWeekDay(dayPeriod));
				}
			}
			return weekDay;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		public function set weekDays(value:Vector.<WeekDay>):void
		{
			this.assertNotReadOnly();
			this._weekDays = new Vector.<WeekDayInternal>(7);
			for each (var weekDay:WeekDay in value)
			{
				this._weekDays[weekDay.dayOfWeek] =
					WeekDayInternal.create(this, weekDay);
				_weekDays[weekDay.dayOfWeek].isInherited = false;
			}
			if (this.isRootCalendar)
			{
				for (var i:int = 0; i < 7; i++)
				{
					if (this._weekDays[i] == null)
					{
						this._weekDays[i] = this.createDefaultWeekDay(i);
					}
				}
			}
			this.onChanged();
		} // end function
		
		/**
		 * Tests if the calendar is the same as another calendar.
		 * @param obj A <code>WorkCalendar</code> instance.
		 * @return <code>true</code> if the calendar is the same as the specified calendar; Otherwise, <code>false</code>.
		 *
		 */
		public function equals(obj:Object):Boolean
		{
			if (obj == this)
			{
				return true;
			}
			return obj._baseCalendar == this._baseCalendar && obj._name == this._name && 
				sameWorkingDays(obj._weekDays, this._weekDays) && samePeriods(obj._periods, this._periods);
		} // end function
		
		[Transient]
		/**
		 * <p>Indicates whether the calendar is one of the predefined calendars.</p>
		 *
		 * <p>
		 * The predefined calendars are the <code>STANDARD</code>,
		 * <code>TWENTY_FOUR_HOURS</code> and <code>NIGHT_SHIFT</code> calendars.
		 * </p>
		 *
		 * <p> The return value is <code>true</code> if this calendar is a
		 * base calendar; Otherwise, <code>false</code>.</p>
		 *
		 */
		public function get isPredefinedCalendar():Boolean
		{
			return NIGHT_SHIFT == this || STANDARD == this || TWENTY_FOUR_HOURS == this;
		} // end function
		
		
		/**
		 *
		 * <p>Copies the working time specification from the specified calendar</p>
		 * <p>The method copies all the working and nonworking times of the specified
		 * calendar to this calendar. All the information of this calendar is replaced by
		 * the information from the specified calendar. Only the name is not changed.</p>
		 * @param cal The calendar to copy from.
		 * *
		 */
		public function copyFrom(cal:WorkCalendar):void
		{
			this.assertNotReadOnly();
			this._gregorianCalendar = cal._gregorianCalendar;
			for (var i:int = 0; i < 7; i++)
			{
				var weekDay:WeekDayInternal = cal._weekDays[i];
				this._weekDays[i] =
					weekDay != null ? (WeekDayInternal(weekDay.clone())) : (null);
			}
			this._periods.splice(0, this._periods.length);
			for each (var period:PeriodInternal in cal._periods)
			{
				this._periods.push(period.clone());
			}
			if (cal.baseCalendar != this.baseCalendar)
			{
				createPeriods();
				createWeekdays();
			}
			this.onChanged();
		} // end function
		
		
		/**
		 *
		 * <p>
		 * Copies the working time specification from the specified calendar
		 * </p><p>The method copies all the working and nonworking times of the specified
		 * calendar to this calendar. All the information of this calendar is replaced by the information
		 * from the specified calendar. Only the name is not changed.</p>
		 *
		 * */
		public function clone():WorkCalendar
		{
			var workCalendar:WorkCalendar =
				new WorkCalendar(this.name, this.baseCalendar);
			workCalendar._gregorianCalendar = this.gregorianCalendar;
			workCalendar._periods = this._periods.slice(0);
			var i:int;
			for (i = 0; i < this._periods.length; i++)
			{
				if (workCalendar._periods[i] != null)
				{
					workCalendar._periods[i] =
						PeriodInternal(workCalendar._periods[i].clone());
				}
			}
			workCalendar._weekDays = this._weekDays.slice(0);
			for (i = 0; i < 7; i++)
			{
				if (workCalendar._weekDays[i] != null)
				{
					workCalendar._weekDays[i] = WeekDayInternal(this._weekDays[i].clone());
				}
			}
			return workCalendar;
		} // end function
		
		/**
		 * Converts the object to a string representation.
		 * @return A string that is the concatenation of the calendar name and the base calendar name, if any.
		 *
		 */
		override public function toString():String
		{
			return this.isRootCalendar ? (this.name) :
				(this.name + " based on " + this.baseCalendar.name);
		} // end function
		
		[Transient]
		/**
		 * <p>Indicates if the calendar is a root calendar.</p>
		 *
		 * <p>A root calendar is a calendar that does not have a base calendar.</p>
		 *
		 * <p>The return value is <code>true</code> if this calendar is a root calendar;
		 * Otherwise, <code>false</code>.</p>
		 *
		 */
		public function get isRootCalendar():Boolean
		{
			return this._baseCalendar == null;
		} // end function
		
		/**
		 * <p>Get the root work calendar in the inheritance chain of this work calendar.</p>
		 *
		 * <p>A root calendar is a calendar that does not have a base calendar.</p>
		 *
		 */
		public function getRootCalendar():WorkCalendar
		{
			var cal:WorkCalendar = this;
			while (cal.baseCalendar != null)
				cal = cal.baseCalendar;
			
			return cal;
		} // end function
		
		/**
		 * <p>Computes the amount of working time between the two specified date-times.
		 * </p>
		 * <p>The method computes the amount of working time between the two
		 * specified dates. The result can be a negative time span if the second
		 * parameter is smaller than the first one.</p>
		 * @param startTime The start date-time.
		 * @param endTime The end date-time.
		 * @return The number of working milliseconds between the specified date-times.
		 *
		 */
		public function getTotalWorkBetween(startTime:Date, endTime:Date):Number
		{
			if (startTime == null || endTime == null)
				return NaN;
			else if(startTime.getTime() == endTime.getTime())
				return 0;
			
			//20130429 Added (Start)
			var key:String = "" + startTime.time + "," + endTime.time;
			if (this._workBetweenCache != null)
			{
				var n:Object = this._workBetweenCache.getData(key);
				if (n != null)
				{
					return Number(n);
				}
			}
			//20130429 Added (End)
			
			startTime = new Date(startTime.time);
			endTime = new Date(endTime.time);
			var b:Boolean = endTime < startTime;
			if (b)
			{
				var d:Date = startTime;
				startTime = endTime;
				endTime = d;
			}
			
			var totalWork:Number;
			
			if (DateTimeUtil.fproject_internal::areOnSameDay(startTime, endTime))
			{
				var calendarPeriodBase:PeriodInternalBase = this.getPeriodAt(startTime);
				/*if (!calendarPeriodBase.isWorking)
				{
				return 0;
				}*/
				totalWork = calendarPeriodBase.getTotalWorkBetweenHours(startTime, endTime);
			}
			else
			{
				//var returnValue:Number = 0;
				startTime = this.getNextWorkingTime(startTime);
				endTime = this.getPreviousWorkingTime(endTime);
				/*if (startTime >= endTime)
				{
				return 0;
				}*/
				
				totalWork = 0;
				
				if (startTime < endTime)
					while (true)
					{
						var period:PeriodInternal = this.nextPeriod(startTime);
						if (period != null)
						{
							if (DateTimeUtil.getStartOfDay(endTime) < period.startDate)
							{
								totalWork+= this.getStandardWorkBetween(startTime, endTime);
								break;
							}
							else
							{
								if (startTime < period.startDate)
								{
									totalWork+= this.getStandardWorkBetween(startTime,
										period.startDate);
									startTime.time = period.startDate.time;
								}
								if (DateTimeUtil.getStartOfDay(endTime) <= period.endDate)
								{
									totalWork+= period.getTotalWorkBetween(startTime, endTime);
									break;
								}
								else
								{
									var endTime:Date =
										this._gregorianCalendar.dateAddByTimeUnit(period.endDate,
											TimeUnit.DAY, 1);
									totalWork+= period.getTotalWorkBetween(startTime, endTime);
									startTime.time = endTime.time;
								}
							}
							continue;
						}
						totalWork+= this.getStandardWorkBetween(startTime, endTime);
						break;
					}
				//return b ? (-returnValue) : (returnValue);
			}
			
			if(b)
				totalWork = -totalWork; 
			
			//20130429 Added (Start)
			if (this._workBetweenCache == null)
			{
				this._workBetweenCache = new LruCache(4096);
			}
			this._workBetweenCache.add(key, totalWork);
			//20130429 Added (End)
			
			return totalWork;
		} // end function
		
		/**
		 * This method get total duration in working days based on this calendar
		 * instance from an absolute period of time represented by start
		 * and end times.<br/>
		 * <br/>
		 * This method takes account of any exceptions
		 * defined for this calendar.
		 *
		 * @param startDate Start date/time of the period
		 * @param endDate End date/time of the period
		 * @return The total duration in working days.
		 */
		public function getDuration(startDate:Date, endDate:Date):Number
		{
			if (startDate == null || endDate == null || startDate > endDate)
				return NaN;
			var p:PeriodInternalBase = this.getPeriodAt(startDate);
			var n:Number = getTotalWorkAtDay(startDate);
			
			if (DateTimeUtil.areOnSameDay(startDate, endDate))
			{				
				return n > 0 ? p.getTotalWorkBetween(startDate, endDate) / n : 0;
			}
			
			var nextDayStart:Date = DateTimeUtil.getStartOfNextDay(startDate);
			var duration:Number = n > 0 ? p.getTotalWorkBetween(startDate, nextDayStart) / n : 0;
			
			var d:Date = nextDayStart;
			var end:Date = DateTimeUtil.getStartOfDay(endDate);
			while (d < end)
			{
				if (isWorkingDate(d))
					duration++;
				d.date++;
			}
			
			p = this.getPeriodAt(endDate);
			n = getTotalWorkAtDay(endDate);
			if (n > 0)
				duration+= p.getTotalWorkBetween(end, endDate) / n;
			
			return duration;
		}
		
		/**
		 * Returns total working effort at a specified day.
		 * @param d The day interest
		 * @return The total working effort at specified day
		 *
		 */
		public function getTotalWorkAtDay(d:Date):Number
		{
			var calendarPeriodBase:PeriodInternalBase = this.getPeriodAt(d);
			return calendarPeriodBase != null ? calendarPeriodBase.getTotalWorkAtDay(d) :
				0;
		}
		
		/**
		 * This method return the completed period by a working duration and a
		 * period that lacks of <code>endTime</code> or <code>startTime</code> field.
		 * @param period The input period. If one of the two fields <code>endTime</code>
		 * and <code>startTime</code> is missed, it will be calculated from the other one
		 * and the <code>workingDuration</code>.
		 * @param workingDuration The working duration measured in <code>unit</code>. This duration
		 * will be considered as elapsed working day in the WorkCalendar regardless
		 * of the work shifts in that day.
		 * @param unit The measuring unit of <code>workingDuration</code>. If this parameter
		 * is missed, the measuring unit will be <code>TimeUnit.MILLISECOND</code>
		 * @return The completed period.<br/>
		 * <br/>
		 * If there isn't exist a date from WorkCalendar satisfies the calculation, the
		 * missed field will be set to <code>null</code>.
		 *
		 */
		public function fillPeriodByWorkingDuration(period:Period, workingDuration:Number,
													durationUnit:TimeUnit = null):Period
		{
			if (workingDuration <= 0)
				throw MessageUtil.wrongArgument(
					WorkCalendar, "WorkCalendar.fillPeriodByWorkingDuration", "workingDuration");
			
			if (durationUnit == null)
				durationUnit = TimeUnit.MILLISECOND;
			
			var filledPeriod:Period = new Period();
			filledPeriod.start = period.start;
			filledPeriod.end = period.end;
			if (filledPeriod.start == null && filledPeriod.end == null)
			{
				filledPeriod.start = new Date();
			}
			
			var d:Date;
			var step:int;
			if (filledPeriod.start != null)
			{
				d = new Date(filledPeriod.start.time);
				step = 1;
			}
			else
			{
				d = new Date(filledPeriod.end.time);
				step = -1;
			}
			
			var count:Number = int(workingDuration / TimeUnit.DAY.milliseconds);
			
			if (!isWorkingDate(d))
			{
				if (step > 0)
					d = getNextWorkingTime(d);
				else
					d = getPreviousWorkingTime(d);
			}
			
			while (count > 0 && isWorkingDate(d))
			{
				count--;
				d.date += step;
				if (count > 0 && !isWorkingDate(d))
				{
					if (step > 0)
						d = getNextWorkingTime(d);
					else
						d = getPreviousWorkingTime(d);
				}
			}
			if (count == 0)
			{
				d.date -= step;
				if (step == 1)
					filledPeriod.end = d;
				else
					filledPeriod.start = d;
			}
			return filledPeriod;
		}
		
		/**
		 * This method return the completed period by a number of working effort and a
		 * period that lacks of <code>endTime</code> or <code>startTime</code> field.
		 * @param period The input period. If one of the two fields <code>endTime</code>
		 * and <code>startTime</code> is <code>null</code>, it will be calculated from
		 * the other one and the <code>duration</code>.<br/>
		 * If both of the two fields <code>endTime</code> and <code>startTime</code>
		 * are <code>null</code>, the <code>startTime</code> will be set to current
		 * time for calculation.
		 * @param work The number of working effort measured in <code>unit</code>.
		 * This value must be greater than zero.
		 * @param unit The measuring unit of <code>work</code>. If this parameter
		 * is missed, the measuring unit will be <code>TimeUnit.MILLISECOND</code>
		 * @return The completed period that satisfy the start or end time specified, and
		 * contains extractly the number of working duration.<br/>
		 * <br/>
		 * If there isn't exist a date from WorkCalendar satisfies the calculation, the
		 * missed field will be set to <code>null</code>.
		 *
		 */
		public function fillPeriodByWork(period:Period, work:Number,
										 durationUnit:TimeUnit = null):Period
		{
			if (work <= 0)				
				throw MessageUtil.wrongArgument(
					WorkCalendar, "WorkCalendar.fillPeriodByWork", "work");
			
			if (durationUnit == null)
				durationUnit = TimeUnit.MILLISECOND;
			
			var filledPeriod:Period = new Period();
			filledPeriod.start = period.start;
			filledPeriod.end = period.end;
			
			if (filledPeriod.start == null && filledPeriod.end == null)
			{
				filledPeriod.start = new Date();
			}
			
			var d:Date;
			var step:int;
			if (filledPeriod.start != null)
			{
				d = new Date(filledPeriod.start.time);
				step = 1;
			}
			else
			{
				d = new Date(filledPeriod.end.time);
				step = -1;
			}
			
			if (!isWorkingDate(d))
			{
				if (step > 0)
					d = getNextWorkingTime(d);
				else
					d = getPreviousWorkingTime(d);
			}
			
			var count:Number = 0;
			
			while (count < work && isWorkingDate(d))
			{
				count += getTotalWorkAtDay(d);
				d.date += step;
				if (count < work && !isWorkingDate(d))
				{
					if (step > 0)
						d = getNextWorkingTime(d);
					else
						d = getPreviousWorkingTime(d);
				}
			}
			if (count >= work)
			{
				d.date -= step;
				if (step == 1)
					filledPeriod.end = d;
				else
					filledPeriod.start = d;
			}
			return filledPeriod;
		}
		
		/**
		 * <p>Computes the previous working date and time from the specified date.</p>
		 * <p>The method computes the previous working time from a specified date.</p>
		 * @param time The Date object.
		 * @return The resulting date time object.
		 *
		 */
		public function getPreviousWorkingTime(time:Date):Date
		{
			if (this._previousWorkingTimeCache != null)
			{
				var data:Object = this._previousWorkingTimeCache.getData(time.time);
				if (data != null)
				{
					return new Date(Number(data));
				}
			}
			var returnDate:Date = this.getPreviousWorkingTimeInternal(time);
			if (time.time == returnDate.time)
			{
				if (this._previousWorkingTimeCache == null)
				{
					this._previousWorkingTimeCache = new LruCache();
				}
				this._previousWorkingTimeCache.add(time.time, returnDate.time);
			}
			return returnDate;
		} // end function
		
		/**
		 * <p>Computes the previous working date and time from the specified date.</p>
		 * <p>The method computes the previous working time from a specified date.</p>
		 * @param time The Date object.
		 * @return The resulting date time object.
		 *
		 */
		fproject_internal function getPreviousWorkingTimeInternal(time:Date):Date
		{
			//var p:InternalPeriod;
			//var wd:WeekDayPeriod;
			//var startOfDay:Date;
			var time:Date = new Date(time.time);
			//try
			//{
			if (!this.hasPreviousWorkingTime(time))
			{
				return time;
			}
			while (true)
			{
				var p:PeriodInternal = this.getInternalPeriodBackwardAt(time);
				if (p != null)
				{
					if (p.isWorking)
					{
						if (p.computePreviousWorkingTime(time))
						{
							return time;
						}
					}
					else
					{
						time = p.startDate;
					}
					continue;
				}
				var wd:WeekDayInternal = this.getWeekDayPeriodBackwardAt(time);
				if (wd.isWorking)
				{
					if (wd.computePreviousWorkingTime(time))
					{
						return time;
					}
					continue;
				}
				var startOfDay:Date = DateTimeUtil.getStartOfDay(time);
				if (time.time == startOfDay.time)
				{
					//time.date--;
					this.gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.DAY, -1, true);
					continue;
				}
				time.time = startOfDay.time;
			}
			//}
			//catch (err:Error)
			//{
			//	time.time = DateTimeUtil.MINIMUM_DATE.time;
			//}
			return time;
		} // end function
		
		/**
		 * Computes the first working date time of the specified date.
		 * @param time The Date object.
		 * @return The resulting date and time, 
		 * <code>null</code> if the date is not a working date.
		 *
		 */
		public function getFirstWorkingTime(date:Date):Date
		{
			if (!this.isWorkingDate(date))
				return null;
			return getNextWorkingTime(DateTimeUtil.getStartOfDay(new Date(date.time)));
		}
		
		/**
		 * Computes the last working date time of the specified date.
		 * @param time The Date object.
		 * @return The resulting date and time, 
		 * <code>null</code> if the date is not a working date.
		 *
		 */
		public function getLastWorkingTime(date:Date):Date
		{
			if (!this.isWorkingDate(date))
				return null;
			return getPreviousWorkingTime(DateTimeUtil.getStartOfNextDay(new Date(date.time)));
		}
		
		/**
		 * Computes the next working date time from the specified date.
		 * @param time The Date object.
		 * @return The resulting date and time.
		 * If the input <code>time</code> is a working time then return the new Date instance that equals to <code>time</code>.
		 *
		 */
		public function getNextWorkingTime(time:Date):Date
		{
			if (this._nextWorkingTimeCache != null)
			{
				var data:Object = this._nextWorkingTimeCache.getData(time.time);
				if (data != null)
				{
					return new Date(Number(data));
				}
			}
			var returnDate:Date = this.getNextWorkingTimeInternal(time);
			if (time.time != returnDate.time)
			{
				if (this.getPreviousWorkingTimeInternal(time).time == time.time)
				{
					if (this._nextWorkingTimeCache == null)
					{
						this._nextWorkingTimeCache = new LruCache();
					}
					this._nextWorkingTimeCache.add(time.time, returnDate.time);
				}
			}
			return returnDate;
		} // end function
		
		
		/**
		 * Computes the next working date and time from the specified date.
		 * @param time The Date object.
		 * @return The resulting date and time.
		 *
		 */
		fproject_internal function getNextWorkingTimeInternal(time:Date):Date
		{
			//var working:Boolean;
			//var wd:WeekDayPeriod;
			//var p:InternalPeriod;
			//var wd2:WeekDayPeriod;
			var time:Date = new Date(time.time);
			//try
			//{
			if (!this.hasNextWorkingTime(time))
			{
				return time;
			}
			
			if (this._periods.length == 0)
			{
				while (true)
				{
					var wd:WeekDayInternal = this.getWeekDayPeriodAtDow(time.day);
					if (wd.isWorking)
					{
						var working:Boolean = wd.computeNextWorkingTime(time);
						if (working)
						{
							return time;
						}
						continue;
					}
					//time = DateTimeUtil.getStartOfNextDay(time);
					this.gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.DAY, 1, true);
				}
			}
			else
			{
				while (true)
				{
					var p:PeriodInternal = this.getInternalPeriodAt(time);
					if (p != null)
					{
						if (p.isWorking)
						{
							working = p.computeNextWorkingTime(time);
							if (working)
							{
								return time;
							}
						}
						else
						{
							time = DateTimeUtil.getStartOfNextDay(p.endDate);
							//time.time = p.endDateAndTime.time;
						}
						continue;
					}
					wd = this.getWeekDayPeriodAtDow(time.day);
					if (wd.isWorking)
					{
						working = wd.computeNextWorkingTime(time);
						if (working)
						{
							return time;
						}
						continue;
					}
					this._gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.DAY, 1,
						true);
				}
			}
			//}
			//catch (err:Error)
			//{
			//	time.time = DateTimeUtil.MAXIMUM_DATE.time;
			//}
			return time;
		} // end function
		
		/**
		 * Computes the next non-working date-time from the specified date.
		 * @param time The <code>Date</code> object.
		 * @return The resulting date time object.
		 *
		 */
		public function getNextNonWorkingTime(time:Date):Date
		{
			if (this._nextNonWorkingTimeCache != null)
			{
				var data:Object = this._nextNonWorkingTimeCache.getData(time.time);
				if (data != null)
				{
					return new Date(Number(data));
				}
			}
			var nextNonWtInternal:Date = this.getNextNonWorkingTimeInternal(time);
			if (time.time != nextNonWtInternal.time)
			{
				if (this._nextNonWorkingTimeCache == null)
				{
					this._nextNonWorkingTimeCache = new LruCache();
				}
				this._nextNonWorkingTimeCache.add(time.time, nextNonWtInternal.time);
			}
			return nextNonWtInternal;
		} // end function
		
		/**
		 * Computes the next non-working date-time from the specified date.
		 * @param time The <code>Date</code> object.
		 * @return The resulting date time object.
		 *
		 */
		fproject_internal function getNextNonWorkingTimeInternal(time:Date):Date
		{
			var p:PeriodInternal;
			var wd:WeekDayInternal;
			var time:Date = new Date(time.time);
			//try
			//{
			if (!this.hasNextNonWorkingTime(time))
			{
				return time;
			}
			while (true)
			{
				
				p = this.getInternalPeriodAt(time);
				if (p != null)
				{
					if (!p.isWorking || p.computeNextNonWorkingTime(time))
					{
						break;
					}
					continue;
				}
				wd = this.getWeekDayPeriodAtDow(time.day);
				if (!wd.isWorking || wd.computeNextNonWorkingTime(time))
				{
					break;
				}
			}
			//}
			//catch (err:Error)
			//{
			//	time.time = DateTimeUtil.MAXIMUM_DATE.time;
			//}
			return time;
		} // end function
		
		private function hasWorkingWeekDayInBase() : Boolean
		{
			for (var i:int = 0; i < 7; i++)
			{
				if (this.getWeekDayPeriodAtDow(i).isWorking)
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * Checks if there is a working time following the specified date.
		 * @param time The Date object.
		 * @return <code>true</code> if there's a working period following
		 * <code>time</code>; Otherwise, <code>false</code>.
		 *
		 */
		public function hasNextWorkingTime(time:Date):Boolean
		{
			//var j:int;
			//var p:InternalPeriod;
			//var date:Date;
			//var hour:Number;
			//var time:Date = time;
			//try
			//{
			/*for (var i:int = 0; i < 7; i++)
			{
			if (this.getWeekDayPeriodFromWeekDay(i).isWorking)
			{
			return true;
			}
			//i++;
			}*/
			
			if (hasWorkingWeekDayInBase())
				return true;
			
			//j = (this._periods.length - 1);
			//while (i >= 0)
			
			var date:Date = DateTimeUtil.getStartOfDay(time);
			var hour:Number = time.time - date.time;
			
			for each (var p:PeriodInternal in this._periods)
			{
				//p = this._periods[i];
				//date = DateTimeUtil.getStartOfDay(time);
				
				if (date <= p.endDate)
				{
					if (p.isWorking)
					{
						if (date < p.endDate)
						{
							return true;
						}
						//hour = time.time - date.time;
						return hour < p.workShifts[p.workShifts.length - 1].endTime;
					}
				}					
				//j--;
			}
			//}
			//catch (err:Error)
			//{
			//}
			return false;
		} // end function
		
		/**
		 * Checks if there is a working time before the specified date.
		 * @param time The Date object.
		 * @return <code>true</code> if there's a working period before
		 * <code>time</code>; Otherwise, <code>false</code>.
		 *
		 */
		public function hasPreviousWorkingTime(time:Date):Boolean
		{
			//var i:int = 0;
			//var p:InternalPeriod;
			//var date:Date;
			//var hour:Number;
			/*try
			{
			while (i < 7)
			{
			if (this.getWeekDayPeriodFromWeekDay(i).isWorking)
			{
			return true;
			}
			i++;
			}
			i = 0;*/
			
			if (hasWorkingWeekDayInBase())
				return true;
			
			var date:Date = DateTimeUtil.getStartOfDay(time);
			var hour:Number = time.time - date.time;
			
			for each (var p:PeriodInternal in this._periods)
			{
				//p = this._periods[i];
				//date = DateTimeUtil.getStartOfDay(time);
				if (date < p.startDate)
				{
					return false;
				}
				if (p.isWorking)
				{
					if (date > p.startDate)
					{
						return true;
					}
					//hour = time.time - date.time;
					return hour >= p.workShifts[0].startTime;
				}
				//i++;
			}
			/*}
			catch (err:Error)
			{
			}*/
			return false;
		} // end function
		
		/**
		 * Checks if there is a nonworking period time following the specified date.
		 * @param time The <code>Date</code> object.
		 * @return <code>true</code> if there's a nonworking period following
		 * <code>time</code>; Otherwise, <code>false</code>.
		 *
		 */
		public function hasNextNonWorkingTime(time:Date):Boolean
		{
			//var i:int = 0;
			var p:PeriodInternal;
			var date:Date;
			var hour:Number;
			var max:Number;
			var j:int;
			var wt:WorkShift;
			var time:Date = time;
			/*try
			{*/
			for (var i:int = 0; i < 7; i++)
			{
				if (!this.getWeekDayPeriodAtDow(i).is24HoursWork())
				{
					return true;
				}
				//i++;
			}
			//i = this._periods.length - 1;
			for (i = this._periods.length - 1; i >= 0; i--)
			{
				p = this._periods[i];
				date = DateTimeUtil.getStartOfDay(time);
				if (date > p.endDate)
				{
					return false;
				}
				if (!p.isWorking)
				{
					return true;
				}
				if (!p.is24HoursWork())
				{
					if (date < p.endDate)
					{
						return true;
					}
					hour = time.time - date.time;
					max = TimeUnit.DAY.milliseconds;
					j = p.workShifts.length - 1;
					while (j >= 0)
					{
						wt = p.workShifts[j];
						if (wt.endTime == max)
						{
							max = wt.startTime;
						}
						else
						{
							return hour < max;
						}
						j--;
					}
				}
				//i--;
			}
			/*}
			catch (err:Error)
			{
			}*/
			return false;
		} // end function
		
		/**
		 * Resets the specified period to default working/nonworking times.
		 * @param start The start date of the period.
		 * @param end The end date of the period.
		 *
		 */
		public function resetPeriodToDefault(start:Date, end:Date):void
		{
			var period:PeriodInternal = null;
			var newPeriod:PeriodInternal;
			this.assertNotReadOnly();
			start = DateTimeUtil.getStartOfDay(start);
			end = DateTimeUtil.getStartOfDay(end);
			if (end < start)
			{
				var tmp:Date = start;
				start = end;
				end = tmp;
			}
			if (this._periods.length == 0)
			{
				return;
			}
			var subPeriods:Vector.<PeriodInternal> = this._periods.slice(0);
			for each (period in subPeriods)
			{
				if (period.intersects(start, end))
				{
					var idx:int = this._periods.indexOf(period);
					this._periods.splice(idx, 1);
					if (period.startDate < start)
					{
						newPeriod = PeriodInternal(period.clone());
						newPeriod.endDate = new Date(start.time);
						newPeriod.endDate.date--;
						this._periods.splice(idx++, 0, newPeriod);
					}
					if (period.endDate > end)
					{
						newPeriod = PeriodInternal(period.clone());
						newPeriod.startDate =
							this._gregorianCalendar.dateAddByTimeUnit(end, TimeUnit.DAY,
								1);
						this._periods.splice(idx, 0, newPeriod);
					}
				}
			}
			if (this._baseCalendar != null)
			{
				for each (period in this._baseCalendar._periods)
				{
					if (period.intersects(start, end))
					{
						newPeriod = PeriodInternal(period.clone());
						newPeriod.isInherited = true;
						newPeriod.startDate = DateTimeUtil.max(newPeriod.startDate, start);
						newPeriod.endDate = DateTimeUtil.min(newPeriod.endDate, end);
						var i:uint = this._periods.length;
						var j:uint = 0;
						for each (var p:PeriodInternal in this._periods)
						{
							if (newPeriod.startDate < p.startDate)
							{
								i = j;
								break;
							}
							j++;
						}
						this._periods.splice(i, 0, newPeriod);
					}
				}
			}
			this.onChanged();
		} // end function
		
		/**
		 * Changes the work shifts on the specified period.
		 * @param fromDate fromDate The start date of the period.
		 * @param toDate The end date of the period.
		 * @param workShifts The work shifts array.
		 *
		 */
		public function setPeriodWorkShifts(fromDate:Date, toDate:Date,
											workShifts:Vector.<WorkShift>):void
		{
			this.assertNotReadOnly();
			fromDate = DateTimeUtil.getStartOfDay(fromDate);
			toDate = DateTimeUtil.getStartOfDay(toDate);
			var period:PeriodInternal = new PeriodInternal(this, true, fromDate, toDate);
			if (workShifts != null && workShifts.length != 0)
			{
				checkWorkShifts(workShifts);
				period.workShifts.splice(0, period.workShifts.length);
				for each (var shift:WorkShift in workShifts)
				{
					period.workShifts.push(shift.clone());
				}
			}
			
			this.addWorkingPeriod(period);
			this.onChanged();
		} // end function
		
		/**
		 * Sets the specified period as a non-working period.
		 * @param fromDate The start date of the period.
		 * @param toDate The end date of the period.
		 *
		 */
		public function setPeriodToNonWorking(fromDate:Date, toDate:Date):void
		{
			this.assertNotReadOnly();
			fromDate = DateTimeUtil.getStartOfDay(fromDate);
			toDate = DateTimeUtil.getStartOfDay(toDate);
			this.addNonWorkingPeriod(new PeriodInternal(this, false, fromDate, toDate));
			this.onChanged();
		} // end function
		
		/**
		 * Sets the specified day of week as a non-working day.
		 * @param wd An integer value that represents the day of week, starting at 0 for Sunday.
		 *
		 */
		public function setWeekDayToNonWorking(wd:int):void
		{
			this.assertNotReadOnly();
			this._weekDays[wd] = new WeekDayInternal(this, false, wd);
			this.onChanged();
		} // end function
		
		/**
		 * Sets the working times for the specified day of the week.
		 * @param wd An integer value that represents the day of week,
		 * starting at 0 for Sunday.
		 * @param ws An array of <code>WorkShift</code> that represents the new working
		 * times for the specified day.
		 *
		 */
		public function setWeekDayWorkShifts(wd:int, ws:Vector.<WorkShift>):void
		{
			this.assertNotReadOnly();
			var dayPeriod:WeekDayInternal = new WeekDayInternal(this, true, wd);
			if (ws != null && ws.length != 0)
			{
				checkWorkShifts(ws);
				dayPeriod.workShifts.splice(0, dayPeriod.workShifts.length);
				for (var timeIdx:int = 0; timeIdx < ws.length; timeIdx++)
				{
					if (ws[timeIdx] != null)
						dayPeriod.workShifts.push(ws[timeIdx].clone());
				}
			}
			
			this._weekDays[wd] = dayPeriod;
			this.onChanged();
		} // end function
		
		/**
		 * Indicates if the specified day of week is a working day.
		 * @param wd An integer value that represents the day of week, starting at 0 for sunday.
		 * @return <code>true</code> if the specified day is a working day; Otherwise, <code>false</code>.
		 *
		 */
		public function isWorkingDayOfWeek(wd:int):Boolean
		{
			return this.getWeekDayPeriodAtDow(wd).isWorking;
		} // end function
		
		/**
		 * Indicates if the specified date is a working date.
		 * @param date The date to test.
		 * @return <code>true</code> if the specified date is a working date; Otherwise, <code>false</code>.
		 *
		 */
		public function isWorkingDate(date:Date):Boolean
		{
			return this.getPeriodAt(date).isWorking;
		} // end function
		
		/**
		 * Checks if the calendar is modified from its base calendar.<br/>
		 * <br/>
		 * A calendar is called modified calendar if there exist a difference in
		 * weekday or period from it base calendar.
		 * @return <code>true</code> if the calendar is modified from its base calendar;
		 * Otherwise, <code>false</code>.
		 *
		 */
		public function isModifiedFromBaseCalendar():Boolean
		{
			if (this.isRootCalendar)
			{
				return false;
			}
			var i:int;
			for (i = 0; i < 7; i++)
			{
				if (this._weekDays[i] != null)
				{
					if (!this._weekDays[i].equals(this._baseCalendar._weekDays[i]))
					{
						return true;
					}
				}
			}
			for (i = 0; i < this._periods.length; i++)
			{
				if (!this._periods[i].isInherited)
				{
					return true;
				}
			}
			return false;
		} // end function
		
		/**
		 * Indicates if the specified date is in a period modified from the base calendar.
		 * @param date The date.
		 * @return <code>true</code> if the specified date is in a period modified from the base calendar; Otherwise, <code>false</code>.
		 *
		 */
		public function isModifiedPeriodAt(date:Date):Boolean
		{
			var period:PeriodInternalBase = this.getPeriodAt(date);
			return this.isRootCalendar ? (!(period is PeriodInternal)) :
				(period is PeriodInternal ? (period.isInherited) : (true));
		} // end function
		
		
		/**
		 * Indicates if the specified date has default (base calendar) specification.
		 * @param date The date object.
		 * @return <code>true</code> if the specified date has default (base calendar)
		 * specification; Otherwise, <code>false</code>.
		 *
		 */
		public function isDefaultWorkingDate(date:Date):Boolean
		{
			var period:PeriodInternalBase = this.getPeriodAt(date);
			if (!this.isRootCalendar)
			{
				return period.isInherited;
			}
			if (period is WeekDayInternal)
			{
				return this.isStandardWeekDay(WeekDayInternal(period).dayOfWeek);
			}
			return periodHasStandardWorkShifts(period);
		} // end function
		
		/**
		 * Indicates if the specified working day of week has default (base calendar) specification.
		 * @param wd An integer value that represents the day of week, starting at 0 for Sunday.
		 * @return <code>true</code> if the week days is default working day;
		 * Otherwise, <code>false</code>.
		 *
		 */
		public function isDefaultWorkingWeekDay(wd:int):Boolean
		{
			return this.isRootCalendar ? (this.isStandardWeekDay(wd)) :
				(this.getWeekDayPeriodAtDow(wd).isInherited);
		} // end function
		
		/**
		 * Indicates if the specified day of week uses default specification.
		 * @param wd An integer value that represents the day of week, starting at 0 for Sunday.
		 * @return <code>true</code> if the week days uses default specification; Otherwise, <code>false</code>.
		 *
		 */
		public function isDefaultWeekDay(wd:int):Boolean
		{
			return this.isRootCalendar ? (this._weekDays[wd].isInherited) :
				(this._weekDays[wd] == null);
		} // end function
		
		/**
		 * Gets the shifts for the specified date.
		 * @param date The date.
		 * @return An array of <code>WorkShift</code> that represents the
		 * working times for the specified date.
		 * @see #getNonWorkingTimesAt()
		 */
		public function getWorkShiftsAt(date:Date):Vector.<WorkShift>
		{
			var calPeriod:PeriodInternalBase = this.getPeriodAt(date);
			return calPeriod != null && calPeriod.isWorking ?
				(calPeriod.getClonedWorkShifts()) : (new Vector.<WorkShift>);
			
		} // end function
		
		/**
		 * Gets the work shifts for the specified day of week.
		 * @param wd An integer value that represents the day of week,
		 * starting at 0 for Sunday.
		 * @return An array of <code>WorkShift</code> that represents the
		 * work shifts for the specified day.
		 *
		 */
		public function getWorkShiftsAtWeekDay(wd:int):Vector.<WorkShift>
		{
			var wdFromWeek:WeekDayInternal = this.getWeekDayPeriodAtDow(wd);
			return wdFromWeek != null && wdFromWeek.isWorking ?
				(wdFromWeek.getClonedWorkShifts()) : (new Vector.<WorkShift>);
		} // end function
		
		/**
		 * Indicates if the specified date has standard working times.
		 * @param date The date.
		 * @return <code>true</code> if the working times are from 8AM to 12AM and from
		 * 1PM to 5PM; Otherwise, <code>false</code>.
		 *
		 */
		public function isStandardWorkingDate(date:Date):Boolean
		{
			return periodHasStandardWorkShifts(this.getPeriodAt(date));
		} // end function
		
		/**
		 * Indicates if the specified day of week has standard working times.
		 * @param wd An integer value that represents the day of week,
		 * starting at 0 for Sunday.
		 * @return <code>true</code> if the specified day of week has standard working
		 * times; Otherwise, <code>false</code>.
		 *
		 */
		public function isStandardWorkingDay(wd:int):Boolean
		{
			return periodHasStandardWorkShifts(this.getWeekDayPeriodAtDow(wd));
		} // end function
		
		/**
		 * Specifies that the week day uses default specification from the base calendar.
		 * @param wd An integer value that represents the day of week, starting at 0 for Sunday.
		 *
		 */
		public function resetWeekDayToDefault(wd:int):void
		{
			this.assertNotReadOnly();
			if (!this.isDefaultWorkingWeekDay(wd))
			{
				this._weekDays[wd] =
					this.isRootCalendar ? (this.createDefaultWeekDay(wd)) : (null);
				this.onChanged();
			}
		} // end function
		
		/**
		 * Create a default working day for a weekday
		 * @param wd An integer value that represents the day of week,
		 * 0 represents Sunday, and 6 represents Saturday.
		 * @return The new created default working day at the specified weekday.
		 *
		 */
		internal function createDefaultWeekDay(wd:int):WeekDayInternal
		{
			var isWorkingDay:Boolean = getDefaultNonWorkingDays().indexOf(wd) == -1;
			var period:WeekDayInternal = new WeekDayInternal(this, isWorkingDay, wd);
			period.isInherited = true;
			return period;
		} // end function
		
		/**
		 * Create default working day for all week days of this calendar.
		 *
		 */
		internal function initDefaultWeekDays():void
		{
			for (var dayIdx:int = 0; dayIdx < 7; dayIdx++)
			{
				if (this._weekDays[dayIdx] == null || this._weekDays[dayIdx].isInherited)
					this._weekDays[dayIdx] = this.createDefaultWeekDay(dayIdx);
			}
		}
		
		/**
		 * Remove a sub calendar from sub calendars collection.
		 * @param cal The sub-calendar to remove.
		 *
		 */
		private function removeSubcalendar(cal:WorkCalendar):void
		{
			if (this.isPredefinedCalendar || this._subCalendars == null)
			{
				return;
			}
			var idx:int = this._subCalendars.indexOf(cal);
			if (idx != -1)
			{
				this._subCalendars.splice(idx, 1);
			}
		} // end function
		
		/**
		 * Add a sub calendar to sub calendars collection.
		 * @param cal The sub-calendar to add.
		 *
		 */
		private function addSubcalendar(cal:WorkCalendar):void
		{
			if (this.isPredefinedCalendar)
			{
				return;
			}
			if (this._subCalendars == null)
			{
				this._subCalendars = new Vector.<WorkCalendar>;
			}
			this._subCalendars.push(cal);
		} // end function
		
		/**
		 * Add a non-working period to this calendar.
		 * @param newPeriod The PeriodInternal object to add.
		 *
		 */
		private function addNonWorkingPeriod(newPeriod:PeriodInternal):void
		{
			var oldPeriods:Vector.<PeriodInternal> = null;
			var newPeriods:Vector.<PeriodInternal> = null;
			var period:PeriodInternal = null;
			var i:int = 0;
			var isEarlier:Boolean = false;
			var clonedPeriod:PeriodInternal = null;
			if (this._periods.length == 0)
			{
				this._periods.push(newPeriod);
			}
			else
			{
				oldPeriods = this._periods.slice(0);
				newPeriods = new Vector.<PeriodInternal>;
				for each (period in oldPeriods)
				{
					
					if (!period.isWorking)
					{
						if (!period.intersects(newPeriod.startDate, newPeriod.endDate))
						{
							period.intersects(newPeriod.startDate, newPeriod.endDate);
						}
						if (period.endDate.time + TimeUnit.DAY.milliseconds ==
							newPeriod.startDate.time ||
							newPeriod.endDate.time + TimeUnit.DAY.milliseconds ==
							period.startDate.time)
						{
							if (!period.isInherited)
							{
								newPeriod.startDate =
									DateTimeUtil.min(period.startDate, newPeriod.startDate);
								newPeriod.endDate =
									DateTimeUtil.max(period.endDate, newPeriod.endDate);
							}
							else
							{
								if (period.startDate < newPeriod.startDate)
								{
									clonedPeriod = PeriodInternal(period.clone());
									clonedPeriod.endDate =
										this._gregorianCalendar.
										dateAddByTimeUnit(newPeriod.startDate,
											TimeUnit.DAY, -1);
									newPeriods.push(clonedPeriod);
								}
								if (period.endDate > newPeriod.endDate)
								{
									clonedPeriod = PeriodInternal(period.clone());
									clonedPeriod.startDate =
										this._gregorianCalendar.
										dateAddByTimeUnit(newPeriod.endDate, TimeUnit.DAY,
											1);
									newPeriods.push(clonedPeriod);
								}
							}
						}
						else
						{
							newPeriods.push(period);
						}
						continue;
					}
					if (period.intersects(newPeriod.startDate, newPeriod.endDate))
					{
						if (period.startDate < newPeriod.startDate)
						{
							clonedPeriod = PeriodInternal(period.clone());
							clonedPeriod.endDate =
								this._gregorianCalendar.dateAddByTimeUnit(newPeriod.startDate,
									TimeUnit.DAY, -1);
							newPeriods.push(clonedPeriod);
						}
						if (period.endDate > newPeriod.endDate)
						{
							clonedPeriod = PeriodInternal(period.clone());
							clonedPeriod.startDate =
								this._gregorianCalendar.dateAddByTimeUnit(newPeriod.endDate,
									TimeUnit.DAY, 1);
							newPeriods.push(clonedPeriod);
						}
						continue;
					}
					newPeriods.push(period);
				}
				i = 0;
				isEarlier = false;
				for each (period in newPeriods)
				{
					if (newPeriod.endDate < period.endDate)
					{
						newPeriods.splice(i, 0, newPeriod);
						isEarlier = true;
						break;
					}
					i++;
				}
				if (!isEarlier)
				{
					newPeriods.push(newPeriod);
				}
				this._periods.splice(0, this._periods.length);
				for each (period in newPeriods)
				{
					this._periods.push(period);
				}
			}
		} // end function
		
		/**
		 * Add a working period to <code>periods</code> vector.<br/><br/>
		 * The new period will be inserted in to existing periods in a correct
		 * position so that the <code>periods</code> alsays be sorted ascending.
		 * @param periodInternal The new period
		 *
		 */
		private function addWorkingPeriod(periodInternal:PeriodInternal):void
		{
			if (this._periods.length == 0)
			{
				this._periods.push(periodInternal);
			}
			else
			{
				var oldPeriods:Vector.<PeriodInternal> = this._periods.slice(0);
				var newPeriods:Vector.<PeriodInternal> = new Vector.<PeriodInternal>;
				var period:PeriodInternal;
				for each (period in oldPeriods)
				{
					
					if (period.isWorking)
					{
						if (!periodInternal.intersects(period.startDate, period.endDate))
						{
							periodInternal.intersects(period.startDate, period.endDate);
						}
						if (periodInternal.intersects(period.startDate, period.endDate) ||
							period.endDate.time + TimeUnit.DAY.milliseconds ==
							periodInternal.startDate.time ||
							periodInternal.endDate.time + TimeUnit.DAY.milliseconds ==
							period.startDate.time)
						{
							if (!period.isInherited &&
								periodInternal.compareWorkShifts(period))
							{
								periodInternal.startDate =
									DateTimeUtil.min(period.startDate,
										periodInternal.startDate);
								periodInternal.endDate =
									DateTimeUtil.max(period.endDate, periodInternal.endDate);
							}
							else
							{
								var clonedPeriod:PeriodInternal;
								if (period.startDate < periodInternal.startDate)
								{
									clonedPeriod = PeriodInternal(period.clone());
									clonedPeriod.startDate =
										this._gregorianCalendar.
										dateAddByTimeUnit(periodInternal.startDate,
											TimeUnit.DAY, -1);
									newPeriods.push(clonedPeriod);
								}
								if (period.endDate > periodInternal.endDate)
								{
									clonedPeriod = PeriodInternal(period.clone());
									clonedPeriod.startDate =
										this._gregorianCalendar.
										dateAddByTimeUnit(periodInternal.endDate,
											TimeUnit.DAY, 1);
									newPeriods.push(clonedPeriod);
								}
							}
						}
						else
						{
							newPeriods.push(period);
						}
						continue;
					}
					if (period.intersects(periodInternal.startDate,
						periodInternal.endDate))
					{
						if (period.startDate < periodInternal.startDate)
						{
							clonedPeriod = PeriodInternal(period.clone());
							clonedPeriod.startDate =
								this._gregorianCalendar.dateAddByTimeUnit(periodInternal.
									startDate, TimeUnit.DAY, -1);
							newPeriods.push(clonedPeriod);
						}
						if (period.endDate > periodInternal.endDate)
						{
							clonedPeriod = PeriodInternal(period.clone());
							clonedPeriod.startDate =
								this._gregorianCalendar.dateAddByTimeUnit(periodInternal.
									endDate, TimeUnit.DAY, 1);
							newPeriods.push(clonedPeriod);
						}
						continue;
					}
					newPeriods.push(period);
				}
				var idx:int = 0;
				var isEarlier:Boolean = false;
				for each (period in newPeriods)
				{
					
					if (periodInternal.endDate < period.endDate)
					{
						newPeriods.splice(idx, 0, periodInternal);
						isEarlier = true;
						break;
					}
					idx = idx + 1;
				}
				if (!isEarlier)
				{
					newPeriods.push(periodInternal);
				}
				this._periods.splice(0, this._periods.length);
				for each (period in newPeriods)
				{
					
					this._periods.push(period);
				}
			}
		} // end function
		
		/**
		 * Get total standard work beetween two date-times.
		 * @param start The start date-time
		 * @param end The finish date-time
		 * @return The total standard work beetween two date-times.
		 *
		 */
		private function getStandardWorkBetween(start:Date, end:Date):Number
		{
			if (start > end)
			{
				throw MessageUtil.wrongArgument(WorkCalendar,
					"WorkCalendar.standardWorkBetween", "t1 > t2");
			}
			if (DateTimeUtil.areOnSameDay(start, end))
				var workBeetween:Number = getWeekDayPeriodAt(start).getTotalWorkBetween(start, end);
			else
				workBeetween = stdWorkBetweenDiffDates(start, end);
			return workBeetween;
		} // end function
		
		private function stdWorkBetweenDiffDates(start:Date, end:Date) : Number
		{			
			var floorStart:Date = this.gregorianCalendar.fproject_internal::floor(start, TimeUnit.DAY, 1);
			var floorEnd:Date = this.gregorianCalendar.fproject_internal::floor(end, TimeUnit.DAY, 1);
			var nextDayStart:Date = this.gregorianCalendar.dateAddByTimeUnit(floorStart, TimeUnit.DAY, 1, false);
			nextDayStart = this.gregorianCalendar.fproject_internal::floor(nextDayStart, TimeUnit.DAY, 1);
			var d:Date = new Date(nextDayStart.time);
			var wdp:WeekDayInternal = this.getWeekDayPeriodAt(start);
			var work:Number = wdp.getTotalWorkBetween(start, d);
			var days:Number = DateTimeUtil.millisecondToDay(floorEnd.time - d.time);
			var weeks:Number = Math.floor(days / 7);
			if (weeks != 0)
			{
				work = work + weeks * this.workInOneWeek;
				d = this.gregorianCalendar.dateAddByTimeUnit(d, TimeUnit.WEEK, weeks, true);
				d = this.gregorianCalendar.fproject_internal::floor(d, TimeUnit.DAY, 1);
			}
			while (d < floorEnd)
			{				
				nextDayStart = this.gregorianCalendar.dateAddByTimeUnit(d, TimeUnit.DAY, 1, false);
				nextDayStart = this.gregorianCalendar.fproject_internal::floor(nextDayStart, TimeUnit.DAY, 1);
				wdp = this.getWeekDayPeriodAt(d);
				work = work + wdp.getTotalWorkBetween(d, nextDayStart);
				d.time = nextDayStart.time;
			}
			if (end > d)
			{
				wdp = this.getWeekDayPeriodAt(d);
				work = work + wdp.getTotalWorkBetween(d, end);
			}
			return work;
		}// end function
		
		/**
		 * The total work of this calendar in one week based on weekday periods.
		 *
		 */
		private function get workInOneWeek():Number
		{
			var workCount:Number = 0;
			for (var idx:int = 0; idx < 7; idx++)
			{
				workCount =
					workCount + this.getWeekDayPeriodAtDow(idx).totalWorkInOneDay;
			}
			return workCount;
		} // end function
		
		/**
		 * The average work of this calendar in one week based on weekday's working periods.
		 *
		 */
		private function get averageWorkOfWeekDay():Number
		{
			var cnt:Number = 0;
			for (var idx:int = 0; idx < 7; idx++)
			{
				if (this.getWeekDayPeriodAtDow(idx).isWorking)
					cnt++;
			}
			return cnt != 0 ? this.workInOneWeek/cnt : 0;
		}
		
		/**
		 *
		 * @private
		 *
		 */
		private function nextPeriod(t:Date):PeriodInternal
		{
			if (this._periods.length == 0)
			{
				return null;
			}
			var startOfDay:Date = DateTimeUtil.getStartOfDay(t);
			for each (var period:PeriodInternal in this._periods)
			{
				
				if (startOfDay <= period.endDate)
				{
					return period;
				}
			}
			return null;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function previousPeriod(t:Date):PeriodInternal
		{
			var len:int = this._periods.length - 1;
			if (len == -1)
			{
				return null;
			}
			var startOfDay:Date = DateTimeUtil.getStartOfDay(t);
			while (len >= 0)
			{
				var period:PeriodInternal = this._periods[len];
				if (startOfDay > period.startDate)
				{
					return period;
				}
				len--;
			}
			return null;
		} // end function
		
		/**
		 * Check if a day of week is standard<br/>
		 * <br/>
		 * A day is called standard day if it is a default non-working day
		 * or it has the same workshifts as the corresponding default working day.
		 */
		internal function isStandardWeekDay(dayOfWeek:int):Boolean
		{
			
			var dayPeriod:WeekDayInternal = this.getWeekDayPeriodAtDow(dayOfWeek);
			var isNonWorkingDay:Boolean =
				getDefaultNonWorkingDays().indexOf(dayOfWeek) != -1;
			return isNonWorkingDay ? (!dayPeriod.isWorking) :
				(dayPeriod.isWorking ? periodHasStandardWorkShifts(dayPeriod) : false);
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function onChanged():void
		{
			var oldCals:Vector.<WorkCalendar> = null;
			var subCalendar:WorkCalendar = null;
			this._previousWorkingTimeCache = null;
			this._nextWorkingTimeCache = null;
			this._nextNonWorkingTimeCache = null;
			this._workBetweenCache = null;//20130429 Added
			
			if (this._disableEvents)
			{
				return;
			}
			if (this._subCalendars != null)
			{
				oldCals = this._subCalendars.slice(0);
				for (var idx:int = 0; idx < oldCals.length; idx++)
				{
					subCalendar = oldCals[idx];
					if (subCalendar != null)
					{
						subCalendar.onBaseCalendarChanged();
					}
					else
					{
						this._subCalendars.splice(idx, 1);
					}
				}
			}
			
			dispatchEvent(new Event(Event.CHANGE));
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function onBaseCalendarChanged():void
		{
			createPeriods();
			createWeekdays();
			this.onChanged();
		} // end function
		
		/**
		 * Create periods for this calendar from base calendar's periods
		 *
		 */
		private function createPeriods():void
		{
			var thisPeriods:Vector.<PeriodInternal>;
			var p:PeriodInternal;
			var a:PeriodInternal;
			var shifts:Vector.<WorkShift>;
			this._disableEvents = true;
			thisPeriods = this._periods.slice(0);//Copy all elements
			this._periods.splice(0, this._periods.length);//Delete all elements
			
			var basePeriods:Vector.<PeriodInternal> = this._baseCalendar._periods;
			try
			{
				// Copy all periods of base calendar
				for each (p in basePeriods)
				{
					a = PeriodInternal(p.clone());
					a.isInherited = true;
					this._periods.push(a);
				}
				
				// only reuse periods that not belong to any parent calendar in inheritance chain
				for each (p in thisPeriods)
				{					
					if (!p.isInherited)
					{
						if (!p.isWorking)
						{
							this.setPeriodToNonWorking(p.startDate, p.endDate);
							continue;
						}
						shifts = p.workShifts.slice(0);
						// Copy p to this calendar's period
						this.setPeriodWorkShifts(p.startDate, p.endDate, shifts);
					}
				}
			}
			catch (err:Error)
			{
				trace(err.errorID + err.message);
				throw err;
			}
			finally
			{
				this._disableEvents = false;
			}
		} // end function
		
		/**
		 * Create week days for this calendar from base calendar's week days
		 *
		 */
		private function createWeekdays():void
		{
			var dp:WeekDayInternal;
			this._disableEvents = true;
			var thisWeekDays:Vector.<WeekDayInternal> = this._weekDays.slice(0);
			this._weekDays.splice(0, this._weekDays.length);
			
			var baseWeekDays:Vector.<WeekDayInternal> = this._baseCalendar._weekDays;
			try
			{
				// Copy all week days of base calendar
				for each (dp in baseWeekDays)
				{
					var a:WeekDayInternal = WeekDayInternal(dp.clone());
					a.isInherited = true;
					this._weekDays.push(a);
				}
				
				// only reuse weekday that not belong to any parent calendar in inheritance chain
				for each (dp in thisWeekDays)
				{					
					if (dp != null && !dp.isInherited)
					{
						this._weekDays[dp.dayOfWeek] = dp;
					}
				}
			}
			catch (err:Error)
			{
				trace(err.errorID + err.message);
				throw err;
			}
			finally
			{
				this._disableEvents = false;
			}
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function assertNotReadOnly():void
		{
			if (this.isPredefinedCalendar)
			{
				/*throw new Error(MessageUtil.log(WorkCalendar, LogEventLevel.ERROR,
					ResourceUtil.PROJECT_GANTT_BUNDLE,
					MessageUtil.CANNOT_MODIFY_READONLY_CALENDAR_MESSAGE));*/
				LoggingUtil.logAndThrowError(WorkCalendar, ResourceUtil.FPRJ_UTILITIES, 2, null, 
					ResourceUtil.FPRJ_UTILS_BUNDLE, "cannot.modify.readonly.calendar.message");					
				
			}
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function getWeekDayPeriodAt(time:Date):WeekDayInternal
		{
			return this.getWeekDayPeriodAtDow(time.day);
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function getWeekDayPeriodBackwardAt(time:Date):WeekDayInternal
		{
			var intDay:int = 0;
			if (time.time == DateTimeUtil.getStartOfDay(time).time)
			{
				intDay = time.day - 1;
				if (intDay == -1)
				{
					intDay = 6;
				}
				return this.getWeekDayPeriodAtDow(intDay);
			}
			else
			{
				return this.getWeekDayPeriodAtDow(time.day);
			}
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function getWeekDayPeriodAtDow(dow:int):WeekDayInternal
		{
			var cal:WorkCalendar = this;
			var dayPeriod:WeekDayInternal = cal._weekDays[dow];
			while (dayPeriod == null && cal._baseCalendar != null)
			{
				cal = cal._baseCalendar;
				dayPeriod = cal._weekDays[dow];
			}
			return dayPeriod;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function getInternalPeriodAt(time:Date):PeriodInternal
		{
			var period:PeriodInternal = null;
			var len:uint = this._periods.length;
			if (len == 0)
			{
				return null;
			}
			var startOfDay:Date = DateTimeUtil.getStartOfDay(time);
			for (var i:int = 0; i < len; i++)
			{
				period = this._periods[i];
				if (startOfDay >= period.startDate)
				{
					if (startOfDay <= period.endDate)
					{
						return period;
					}
				}
				else
				{
					break;
				}
			}
			return null;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private function getInternalPeriodBackwardAt(time:Date):PeriodInternal
		{
			var period:PeriodInternal = null;
			var len:uint = this._periods.length;
			if (len == 0)
			{
				return null;
			}
			
			for (var i:int = 0; i < len; i++)
			{
				
				period = this._periods[i];
				if (time > period.startDate)
				{
					if (time.time <= period.endDate.time + TimeUnit.DAY.milliseconds)
					{
						return period;
					}
				}
				else
				{
					break;
				}
			}
			return null;
		} // end function
		
		/**
		 * Get the PeriodInternalBase object at a time value.
		 * @param time The time value
		 * @return The PeriodInternalBase object at a time value.
		 *
		 */
		internal function getPeriodAt(time:Date):PeriodInternalBase
		{
			var period:PeriodInternal = this.getInternalPeriodAt(time);
			return period == null ? this.getWeekDayPeriodAtDow(time.day) : period;
		} // end function
		
		/**
		 * Gets/sets default work shifts for the calendar.
		 * The default work shifts for the calendar can also be set from an
		 * array with elements are pairs of strings representing the
		 * start time and end time of the default working period.<br/>
		 * <br/>
		 * Note that if you set a new value for <code>defaultWorkShifts</code>
		 * property, the <code>weekDays</code> property will be immediately set
		 * to default.
		 * @see #setDefaultWorkShifts()
		 *
		 */
		public function get defaultWorkShifts():Vector.<WorkShift>
		{
			return getDefaultWorkShiftsInternal();
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		public function set defaultWorkShifts(value:Vector.<WorkShift>):void
		{
			if (_defaultWorkShifts != value)
			{
				_defaultWorkShifts = value;
				initDefaultWeekDays();
				onChanged();
			}
		}
		
		/**
		 * Set default work shifts for the calendar from an
		 * array with elements are pairs of strings representing the
		 * start time and end time of the default working period.
		 *
		 * @param wsStrings an array with elements are pairs of strings
		 * representing the start time and end time of the default working period
		 * <p>
		 * Example of wsStrings:<br/>
		 * <code>wsStrings = ["08:00","12:00","13:00","17:00"];</code>
		 * </p>
		 * Note that the length of <code>wsStrings</code> always be an even
		 * number. In case of  wsStrings or wsStrings.length &lt; 2 or
		 * the length is not an even number, the <code>defaultWorkShifts</code>
		 * will be set to <code>{08:00-12:00, 13:00-17:00}</code>
		 */
		public function setDefaultWorkShifts(wsStrings:Array):void
		{
			setDefaultWorkShiftsInternal(wsStrings);
		}
		
		/**
		 *
		 * @copy #setDefaultWorkShifts()
		 *
		 */
		internal static function setDefaultWorkShiftsInternal(wsStrings:Array):void
		{
			_defaultWorkShifts = new Vector.<WorkShift>();
			if (wsStrings == null || wsStrings.length < 2 || wsStrings.length % 2 != 0)
			{
				_defaultWorkShifts.push(WorkShift.create(DateTimeUtil.getTime(8),
					DateTimeUtil.getTime(12)));
				_defaultWorkShifts.push(WorkShift.create(DateTimeUtil.getTime(13),
					DateTimeUtil.getTime(17)));
			}
			else
			{
				var i:int = 0;
				while (i < wsStrings.length)
				{
					var wt:WorkShift = new WorkShift();
					wt.start = wsStrings[i];
					wt.end = wsStrings[i + 1];
					_defaultWorkShifts.push(wt);
					i = i + 2;
				}
			}
			
		} // end function
		
		/**
		 *
		 * @copy #defaultWorkShifts()
		 *
		 */
		internal static function getDefaultWorkShiftsInternal():Vector.<WorkShift>
		{
			if (_defaultWorkShifts == null)
			{
				var defaultWorkingTimesArr:Array =
					resourceManager.getStringArray(ResourceUtil.FPRJ_GANTT_BUNDLE,
						"default.workshifts");
				//"08:30,12:00,13:00,17:30".split(",");
				setDefaultWorkShiftsInternal(defaultWorkingTimesArr);
			}
			return _defaultWorkShifts;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private static function get resourceManager():IResourceManager
		{
			if (_resourceManager == null)
			{
				_resourceManager = ResourceManager.getInstance();
			}
			return _resourceManager;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		//NguyenBS 20100610 modified
		internal static function getDefaultNonWorkingDays():Vector.<uint>
		{
			var nonWdStr:String = null;
			var nonWdArr:Array = null;
			if (_defaultNonWorkingDays == null)
			{
				_defaultNonWorkingDays = new Vector.<uint>;
				nonWdStr =
					resourceManager.getString(ResourceUtil.FPRJ_GANTT_BUNDLE,
						"default.non.working.days.of.week");
				if (nonWdStr == null)
				{
					_defaultNonWorkingDays.splice(0, 0, 0, 6);
				}
				else
				{
					nonWdArr = nonWdStr.split(",");
					for (var i:int = 0; i < nonWdArr.length; i++)
					{
						_defaultNonWorkingDays.push(parseInt(nonWdArr[i]));
					}
				}
			}
			return _defaultNonWorkingDays;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private static function createStandardCalendar():WorkCalendar
		{
			return new WorkCalendar(CALRENDAR_NAME_STANDARD);
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private static function create24HoursCalendar():WorkCalendar
		{
			var workCalendar:WorkCalendar = new WorkCalendar(CALRENDAR_NAME_24HOURS);
			var workingTimes:Vector.<WorkShift> = new Vector.<WorkShift>(1);
			workingTimes[0] = WorkShift.create(0, DateTimeUtil.getTime(24));
			
			for (var i:int = 0; i < 7; i++)
			{
				workCalendar.setWeekDayWorkShifts(i, workingTimes);
			}
			return workCalendar;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private static function createNightShiftCalendar():WorkCalendar
		{
			
			var workCalendar:WorkCalendar = new WorkCalendar(CALRENDAR_NAME_NIGHT_SHIFT);
			
			workCalendar.setWeekDayToNonWorking(DateTimeUtil.SUNDAY);
			
			var wts:Vector.<WorkShift> = new Vector.<WorkShift>(3);
			wts[0] = WorkShift.create(DateTimeUtil.getTime(0), DateTimeUtil.getTime(3));
			wts[1] = WorkShift.create(DateTimeUtil.getTime(4), DateTimeUtil.getTime(8));
			wts[2] = WorkShift.create(DateTimeUtil.getTime(23), DateTimeUtil.getTime(24));
			workCalendar.setWeekDayWorkShifts(DateTimeUtil.MONDAY, wts);
			workCalendar.setWeekDayWorkShifts(DateTimeUtil.TUESDAY, wts);
			workCalendar.setWeekDayWorkShifts(DateTimeUtil.WEDNESDAY, wts);
			workCalendar.setWeekDayWorkShifts(DateTimeUtil.THURSDAY, wts);
			workCalendar.setWeekDayWorkShifts(DateTimeUtil.FRIDAY, wts);
			
			wts = new Vector.<WorkShift>(2);
			wts[0] = WorkShift.create(DateTimeUtil.getTime(0), DateTimeUtil.getTime(3));
			wts[1] = WorkShift.create(DateTimeUtil.getTime(4), DateTimeUtil.getTime(8));
			workCalendar.setWeekDayWorkShifts(DateTimeUtil.SATURDAY, wts);
			
			return workCalendar;
		} // end function
		
		/**
		 *
		 * @private
		 *
		 */
		private static function checkWorkShifts(times:Vector.<WorkShift>):void
		{
			if (times == null || times.length == 0)
			{
				throw MessageUtil.wrongArgument(WorkCalendar,
					"WorkCalendar.checkWorkShifts", "times");
			}
			var timeIdx:int = 1;
			while (timeIdx < times.length)
			{
				if (times[timeIdx] != null)
				{
					times[timeIdx].validate();
					if (times[timeIdx].startTime <= times[(timeIdx - 1)].endTime)
					{
						throw MessageUtil.wrongArgument(WorkCalendar,
							"WorkCalendar.checkWorkShifts", "times");
					}
				}
				timeIdx++;
			}
		} // end function
		
		/**
		 * Check if all work shifts of a period are the standard working time.
		 * @param p the period interest.
		 * @return true if all work shifts of a period are the standard working time.
		 * false if otherwise.
		 *
		 */
		internal static function periodHasStandardWorkShifts(p:PeriodInternalBase):Boolean
		{
			var defaultWts:Vector.<WorkShift> = getDefaultWorkShiftsInternal();
			if (p.workShifts.length != defaultWts.length)
			{
				return false;
			}
			
			for (var i:int = 0; i < defaultWts.length; i++)
			{
				if (defaultWts[i].startTime != p.workShifts[i].startTime ||
					defaultWts[i].endTime != p.workShifts[i].endTime)
				{
					return false;
				}
			}
			return true;
		} // end function
		
		/**
		 * Check if the two vectors of WeekDayPeriod are the same.
		 * @param a the first vector of WeekDayPeriod
		 * @param b the second vector of WeekDayPeriod
		 * @return true if the two vectors are the same. false if otherwise.
		 *
		 */
		private static function sameWorkingDays(a:Vector.<WeekDayInternal>,
												b:Vector.<WeekDayInternal>):Boolean
		{
			var dayIdx:int = 0;
			while (dayIdx < 7)
			{
				if (a[dayIdx] != null || b[dayIdx] != null)
				{
					if (a[dayIdx] != null && b[dayIdx] == null)
					{
						return false;
					}
					
					if (a[dayIdx] == null && b[dayIdx] != null)
					{
						return false;
					}
					if (!a[dayIdx].equals(b[dayIdx]))
					{
						return false;
					}
				}
				dayIdx++;
			}
			return true;
		} // end function
		
		/**
		 * Check if the two vectors of periods are the same.
		 * @param a the first vector of periods
		 * @param b the second vector of periods
		 * @return true if the two vectors are the same. false if otherwise.
		 *
		 */
		private static function samePeriods(a:Vector.<PeriodInternal>,
											b:Vector.<PeriodInternal>):Boolean
		{
			if (a.length != b.length)
			{
				return false;
			}
			for (var i:int = 0; i < a.length; i++)
			{
				if (!a[i].equals(b[i]))
				{
					return false;
				}
			}
			return true;
		} // end function
		
		/**
		 * Gets the non-working times for the specified date.
		 * @param date The date.
		 * @return An array of <code>TimeRange</code> that represents the
		 * working times for the specified date.
		 * @see #getNonWorkingTimesAt()
		 */
		public function getNonWorkingTimesAt(date:Date):Vector.<TimeRange>
		{
			var period:PeriodInternalBase = getPeriodAt(date);
			if(period.isWorking)
				return period.getNonWorkingTimes();
			else
			{
				var v:Vector.<TimeRange> = new Vector.<TimeRange>();
				v.push(new TimeRange(new Time(0), new Time(TimeUnit.DAY.milliseconds -1)));
				return v;
			} 
		}
		
		//20130502 Added (Start)
		/**
		 * <p>
		 * Adds a specified amount of working time in milliseconds to a date.
		 * </p>
		 * @param time A <code>Date</code> instance.
		 * @param duration A <code>Number</code> representing the amount of work to add, in
		 * milliseconds.
		 * @return A <code>Date</code> after <code>time</code> , and corresponding to an
		 * elapsed working time of <code>duration</code>. Or <code>time</code> itself if 
		 * <code>duration</code> is negative.
		 */
		public function dateAddByWork(time:Date, duration:Number) : Date
		{
			time = new Date(time.time);
			while (duration > 0)
			{
				time = this.getNextWorkingTime(time);
				
				if (!this.hasNextWorkingTime(time))
				{
					return time;
				}				
				
				var p:PeriodInternal = this.getInternalPeriodAt(time);
				if (p != null)
				{
					duration = p.addWork(time, duration);
					continue;
				}
				p = this.nextPeriod(time);
				var d:Number = duration;
				if (p != null)
				{
					d = Math.min(duration, this.getStandardWorkBetween(time, p.startDate));
				}
				duration = duration - d;
				var ww:Number = this.workInOneWeek;
				if (ww != 0 && d >= ww)
				{
					var n:Number = int(d / ww);
					if (d % ww == 0)
					{
						n = n - 1;
					}
					time = this.gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.WEEK, n, true);
					d = d - n * ww;
				}
				while (d != 0)
				{					
					time = this.getNextWorkingTime(time);
					d = this.getWeekDayPeriodAt(time).addWork(time, d);
				}
			}
			return time;
		}// end function
		//20130502 Added (End)
		
		//20130702 Added (Start)
		/**
		 * <p>
		 * Adds/subtracts a specified amount of working days to/from a date.
		 * </p>
		 * @param time A <code>Date</code> instance.
		 * @param duration A <code>Number</code> representing the amount of work 
		 * to add/subtract, in days.
		 * @return If <code>days</code> is positive, this function returns a
		 * <code>Date</code> after <code>time</code>, and corresponding to an
		 * elapsed working time of <code>days</code>.<br>
		 * If <code>days</code> is negative, this function returns a
		 * <code>Date</code> before <code>time</code>, and corresponding to an
		 * elapsed working time of <code>days</code>.
		 */
		public function dateAddByWorkingDays(time:Date, days:Number) : Date
		{
			if (isNaN(days))
				return null;
			
			time = new Date(time.time);
			if (days > 0)
			{
				var sign:int = 1;
			}
			else
			{
				sign = -1;
				days = -days;
			}
			
			var dayEndOrStart:Date = sign > 0 ? DateTimeUtil.getEndOfDay(time) : DateTimeUtil.getStartOfDay(time);
			var d:Number = this.getTotalWorkBetween(time, dayEndOrStart);
			if (d > 0)
			{
				var dayTotal:Number = this.getTotalWorkAtDay(time);
				d = d / dayTotal;
				if (days <= d)
					return sign > 0 ? this.dateAddByWork(time, days * dayTotal)
						: this.dateSubByWork(time, days * dayTotal);

				days = days - d;
				time = dayEndOrStart;
			}

			while (days >=1)
			{	
				if ((sign > 0 && !this.hasNextWorkingTime(time))
					|| (sign < 0 && !this.hasPreviousWorkingTime(time)))
					break;
				time = sign > 0 ? DateTimeUtil.getEndOfNextDay(time) : DateTimeUtil.getStartOfPreviousDay(time);
				var p:PeriodInternalBase = this.getPeriodAt(time);
				if (p.isWorking)
				{
					days = days - 1;					
				}
			}
			
			if (days > 0)
			{
				if ((sign > 0 && !this.hasNextWorkingTime(time))
					|| (sign < 0 && !this.hasPreviousWorkingTime(time)))
				{
					time = sign > 0 ? this.getPreviousWorkingTime(time) : this.getNextWorkingTime(time);
				}
				else
				{
					time = sign > 0 ? this.getNextWorkingTime(time) : this.getPreviousWorkingTime(time);
					dayTotal = this.getTotalWorkAtDay(time);
					time = sign > 0 ? this.dateAddByWork(time, days * dayTotal) : this.dateSubByWork(time, days * dayTotal);
				}
			}
			
			return time;
		}// end function
		//20130702 Added (End)
		
		//20130516 Added (Start) : May Migration
		/* ***************************************************************
		*           New methods added for May Migration				 *
		******************************************************************/
		
		/**
		 * <p>
		 * Subtracts a specified amount of working time from a date.
		 * </p>
		 * @param time A <code>Date</code> instance.
		 * @param duration A <code>Number</code> representing the amount of work to remove, in
		 * milliseconds.
		 * @return A <code>Date</code> before <code>time</code> , and corresponding to an
		 * elapsed working time of<code>duration</code>. Or <code>time</code> itself if 
		 * <code>duration</code> is negative.
		 */
		public function dateSubByWork(time:Date, duration:Number) : Date
		{
			time = new Date(time.time);
			while (duration > 0)
			{
				time = this.getPreviousWorkingTime(time);
				if (!this.hasPreviousWorkingTime(time))
				{
					return time;
				}
				var p:PeriodInternal = this.getInternalPeriodBackwardAt(time);
				if (p != null)
				{
					duration = p.removeWork(time, duration);
					continue;
				}
				p = this.previousPeriod(time);
				var d:Number = duration;
				if (p != null)
				{
					var n:Number = this.getStandardWorkBetween(p.endOfEndDate, time);
					d = Math.min(duration, n);
				}
				duration = duration - d;
				var w:Number = this.workInOneWeek;
				if (d >= w)
				{
					n = Math.floor(d / w);
					if (d % w == 0)
					{
						n = n - 1;
					}
					time = this.gregorianCalendar.dateAddByTimeUnit(time, TimeUnit.WEEK, -n, true);
					d = d - n * w;
				}
				while (d != 0 && time.time != DateTimeUtil.MINIMUM_DATE.time)
				{
					
					time = this.getPreviousWorkingTime(time);
					d = this.getWeekDayPeriodBackwardAt(time).removeWork(time, d);
				}
			}
			return time;
		}// end function
		
		/**
		 * <p>
		 * Returns the amount of working time for a given time precision.
		 * </p>
		 * @param unit The unit of the time precision
		 * @param steps The number of units for the time precision.
		 * @return The amount of working time for the time precision.
		 */
		public function getWorkingTimeForUnit(unit:TimeUnit, steps:Number) : Number
		{
			var n:Number = unit.milliseconds / TimeUnit.WEEK.milliseconds * steps;
			if (n >= 1)
			{
				return n * this.workInOneWeek;
			}
			switch(unit)
			{
				case TimeUnit.MILLISECOND:
				{
					return steps;
				}
				case TimeUnit.SECOND:
				{
					return steps * unit.milliseconds;
				}
				case TimeUnit.MINUTE:
				{
					return steps * unit.milliseconds;
				}
				case TimeUnit.HOUR:
				{
					return steps * unit.milliseconds;
				}
				case TimeUnit.HOUR_CALENDAR:
				{
					return steps * unit.milliseconds;
				}
				case TimeUnit.DAY:
				{
					return steps * this.getMinWorkingTimePerDay();
				}
				default:
				{
					break;
				}
			}
			return 0;
		}// end function
		
		/**
		 * 
		 * Get minimum working time of weekdays.
		 * @return The minimum working time of weekdays.
		 * 
		 */		
		private function getMinWorkingTimePerDay() : Number
		{
			var n:Number = NaN;
			for (var i:int = 0; i < 7; i++)
			{				
				var wd:WeekDayInternal = this.getWeekDayPeriodAtDow(i);
				if (wd.isWorking)
				{
					var work:Number = wd.totalWorkInOneDay;
					if (isNaN(n) || work < n)
					{
						n = work;
					}
				}
			}
			return n;
		}// end function
		
		//20130516 Added (End)
		
		/**
		 * Create a <code>WorkCalendar</code> instance from a JSON string
		 * @param json the JSON string that represents a work calendar
		 * @return a <code>WorkCalendar</code> instance
		 * 
		 */
		public static function fromJSON(json:String):WorkCalendar
		{
			return Deserializer.getInstance().fromJSON(json, WorkCalendar) as WorkCalendar;
		}
	}
}
