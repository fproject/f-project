package net.fproject.calendar.recurrence
{
	import mx.events.PropertyChangeEvent;
	import mx.resources.ResourceManager;
	import mx.utils.StringUtil;
	
	import net.fproject.calendar.recurrence.supportClasses.RecurrenceUtil;
	import net.fproject.model.LocalUID;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;
	
	/**
	 * A recurrence rule as defined in the RFC-2445.
	 * <p>
	 * Not all the rules are supported by the default implementation of
	 * recurrence. See the Developer's Guide for more information.
	 * </p>
	 */
	public class RRule extends LocalUID
	{
		/**
		 * <p>
		 * The function used to parse a date.
		 * </p>
		 * <p>
		 * This function must take a <code>String</code> as parameter and returns a
		 * <code>Date</code> .
		 * </p>
		 */
		public var readDateFunction:Function = null;
		
		/**
		 * <p>
		 * A function used in the <code>toString</code> function to write
		 * <code>Date</code> instances.
		 * </p>
		 * <p>
		 * This function must take a <code>Date</code> as parameter and returns a
		 * <code>String</code> .
		 * </p>
		 */
		public var writeDateFunction:Function;
		
		private var _freq:String = "DAILY";
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * The frequence of the recurrence rule (mandatory).
		 * </p>
		 * <p>
		 * Valid values are "SECONDLY", "MINUTELY", "HOURLY", "DAILY", "WEEKLY",
		 * "MONTHLY" or "YEARLY".
		 * </p>
		 */
		public function get freq():String
		{
			return _freq;
		}
		
		/**
		 * @private
		 */
		public function set freq(value:String):void
		{
			if( _freq !== value)
			{
				var oldValue:String = _freq;
				_freq = value;
				firePropertyChange('freq', oldValue, value);
			}
		}
		
		
		private var _until:Date;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * The time which bounds the recurrence rule in an inclusive manner.
		 * </p>
		 */
		public function get until():Date
		{
			return _until;
		}
		
		/**
		 * @private
		 */
		public function set until(value:Date):void
		{
			if( _until !== value)
			{
				var oldValue:Date = _until;
				_until = value;
				firePropertyChange('until', oldValue, value);
			}
		}
		
		
		private var _count:int;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * The number of occurrences at which to range-bound the recurrence.
		 * </p>
		 */
		public function get count():int
		{
			return _count;
		}
		
		/**
		 * @private
		 */
		public function set count(value:int):void
		{
			if( _count !== value)
			{
				var oldValue:int = _count;
				_count = value;
				firePropertyChange('count', oldValue, value);
			}
		}
		
		
		private var _interval:int;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A positive integer representing how often the recurrence rule repeats.
		 * </p>
		 * @default The default value is 1
		 */
		public function get interval():int
		{
			return _interval;
		}
		
		/**
		 * @private
		 */
		public function set interval(value:int):void
		{
			if( _interval !== value)
			{
				var oldValue:int = _interval;
				_interval = value;
				firePropertyChange('interval', oldValue, value);
			}
		}
		
		
		private var _byDay:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of week days expressed as <code>WeekDay</code> .
		 * </p>
		 */
		public function get byDay():Array
		{
			return _byDay;
		}
		
		/**
		 * @private
		 */
		public function set byDay(value:Array):void
		{
			if( _byDay !== value)
			{
				var oldValue:Array = _byDay;
				_byDay = value;
				firePropertyChange('byDay', oldValue, value);
			}
		}
		
		
		private var _byMonth:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of months of the year (from 0 to 11).
		 * </p>
		 * <p>
		 * Note that in an <code>iCalendar</code> rule, the <code>byMonth</code> part
		 * uses numbers from 1 to 12, but here the <code>Date</code> month is used.
		 * </p>
		 */
		public function get byMonth():Array
		{
			return _byMonth;
		}
		
		/**
		 * @private
		 */
		public function set byMonth(value:Array):void
		{
			if( _byMonth !== value)
			{
				var oldValue:Array = _byMonth;
				_byMonth = value;
				firePropertyChange('byMonth', oldValue, value);
			}
		}
		
		
		private var _byMonthDay:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of days in the month (from -31 to 1 or 1 to 31).
		 * </p>
		 */
		public function get byMonthDay():Array
		{
			return _byMonthDay;
		}
		
		/**
		 * @private
		 */
		public function set byMonthDay(value:Array):void
		{
			if( _byMonthDay !== value)
			{
				var oldValue:Array = _byMonthDay;
				_byMonthDay = value;
				firePropertyChange('byMonthDay', oldValue, value);
			}
		}
		
		
		private var _byWeekNo:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of week numbers (from -1 to -53 or from 1 to 53).
		 * </p>
		 */
		public function get byWeekNo():Array
		{
			return _byWeekNo;
		}
		
		/**
		 * @private
		 */
		public function set byWeekNo(value:Array):void
		{
			if( _byWeekNo !== value)
			{
				var oldValue:Array = _byWeekNo;
				_byWeekNo = value;
				firePropertyChange('byWeekNo', oldValue, value);
			}
		}
		
		
		private var _byYearDay:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of days in the year (from -366 to -1 or from 1 to 366)
		 * </p>
		 */
		public function get byYearDay():Array
		{
			return _byYearDay;
		}
		
		/**
		 * @private
		 */
		public function set byYearDay(value:Array):void
		{
			if( _byYearDay !== value)
			{
				var oldValue:Array = _byYearDay;
				_byYearDay = value;
				firePropertyChange('byYearDay', oldValue, value);
			}
		}
		
		
		private var _bySetPos:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of positions of the recurrence set for the specified frequency.
		 * </p>
		 */
		public function get bySetPos():Array
		{
			return _bySetPos;
		}
		
		/**
		 * @private
		 */
		public function set bySetPos(value:Array):void
		{
			if( _bySetPos !== value)
			{
				var oldValue:Array = _bySetPos;
				_bySetPos = value;
				firePropertyChange('bySetPos', oldValue, value);
			}
		}
		
		
		private var _byHour:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of hours in the day (from 0 to 23).
		 * </p>
		 */
		public function get byHour():Array
		{
			return _byHour;
		}
		
		/**
		 * @private
		 */
		public function set byHour(value:Array):void
		{
			if( _byHour !== value)
			{
				var oldValue:Array = _byHour;
				_byHour = value;
				firePropertyChange('byHour', oldValue, value);
			}
		}
		
		
		private var _byMinute:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of minutes in an hour (from 0 to 59).
		 * </p>
		 */
		public function get byMinute():Array
		{
			return _byMinute;
		}
		
		/**
		 * @private
		 */
		public function set byMinute(value:Array):void
		{
			if( _byMinute !== value)
			{
				var oldValue:Array = _byMinute;
				_byMinute = value;
				firePropertyChange('byMinute', oldValue, value);
			}
		}
		
		
		private var _bySecond:Array;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * A list of seconds in a minute (from 0 to 59).
		 * </p>
		 */
		public function get bySecond():Array
		{
			return _bySecond;
		}
		
		/**
		 * @private
		 */
		public function set bySecond(value:Array):void
		{
			if( _bySecond !== value)
			{
				var oldValue:Array = _bySecond;
				_bySecond = value;
				firePropertyChange('bySecond', oldValue, value);
			}
		}
		
		
		private var _weekStart:RecurrenceWeekDay;
		
		[Bindable(event="propertyChange")]
		/**
		 * <p>
		 * The start of the week.
		 * </p>
		 */
		public function get weekStart():RecurrenceWeekDay
		{
			return _weekStart;
		}
		
		/**
		 * @private
		 */
		public function set weekStart(value:RecurrenceWeekDay):void
		{
			if( _weekStart !== value)
			{
				var oldValue:RecurrenceWeekDay = _weekStart;
				_weekStart = value;
				firePropertyChange('weekStart', oldValue, value);
			}
		}
		
		
		/**
		 * <p>
		 * The constant string for the SECONDLY frequency.
		 * </p>
		 */
		public static const SECONDLY:String = "SECONDLY";
		
		/**
		 * <p>
		 * The constant string for the MINUTELY frequency.
		 * </p>
		 */
		public static const MINUTELY:String = "MINUTELY";
		
		/**
		 * <p>
		 * The constant string for the HOURLY frequency.
		 * </p>
		 */
		public static const HOURLY:String = "HOURLY";
		
		/**
		 * <p>
		 * The constant string for the DAILY frequency.
		 * </p>
		 */
		public static const DAILY:String = "DAILY";
		
		/**
		 * <p>
		 * The constant string for the WEEKLY frequency.
		 * </p>
		 */
		public static const WEEKLY:String = "WEEKLY";
		
		/**
		 * <p>
		 * The constant string for the MONTHLY frequency.
		 * </p>
		 */
		public static const MONTHLY:String = "MONTHLY";
		
		/**
		 * <p>
		 * The constant string for the YEARLY frequency.
		 * </p>
		 */
		public static const YEARLY:String = "YEARLY";
		
		/**
		 * <p>
		 * The list of valid frequencies.
		 * </p>
		 */
		public static const FREQUENCIES:Array = [SECONDLY, MINUTELY, HOURLY, DAILY, WEEKLY, MONTHLY, YEARLY];
		
		/**
		 * <p>
		 * Constructor
		 * </p>
		 */
		public function RRule(icalRule:String = null)
		{
			this._interval = 1;
			this._byDay = [];
			this._byMonth = [];
			this._byMonthDay = [];
			this._byWeekNo = [];
			this._byYearDay = [];
			this._bySetPos = [];
			this._byHour = [];
			this._byMinute = [];
			this._bySecond = [];
			if (icalRule != null)
			{
				this.parse(icalRule);
			}
		}
		
		private function parseDate(icalRule:String) : Date
		{
			if (this.readDateFunction != null)
				return this.readDateFunction(icalRule) as Date;
			else
				return DateTimeUtil.parseIsoDate(icalRule);
		}
		
		private function startsWith(s1:String, s2:String) : Boolean
		{
			return s1.indexOf(s2) == 0;
		}
		
		private function parseIntArray(strInts:String, allowNegative:Boolean) : Array
		{
			var strArray:Array = strInts.split(",");
			var intArray:Array = new Array(strArray.length);
			
			for (var i:uint = 0; i < strArray.length; i++)
			{                
				validateIntString(strArray[i], allowNegative);
				intArray[i] = parseInt(strArray[i]);
				if (intArray[i] == null)
				{
					LoggingUtil.logAndThrowError(RRule, 
						ResourceUtil.FPRJ_CALENDAR, 25, null, ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
						"parse.error.int.not.valid", [strArray[i]]);
				}
			}
			intArray = RecurrenceUtil.sortAndUniquifyInts(intArray);
			return intArray;
		}
		
		private function parseWeekDays(strWeekdays:String) : Array
		{
			var strArray:Array = strWeekdays.split(",");
			var wdArray:Array = new Array(strArray.length);
			
			for (var i:uint = 0; i < strArray.length; i++)
			{                
				wdArray[i] = RecurrenceWeekDay.parse(strArray[i]);
			}
			return wdArray;
		}
		
		/**
		 * <p>
		 * Parses the <code>iCalendar</code> recurrence rule string and fills this
		 * instance.
		 * </p>
		 * <p>
		 * This method throws an error when a token is not successfully parsed.
		 * </p>
		 * <p>
		 * To check the values contained in a recurrence rule, call the
		 * <code>validate()</code> method.
		 * </p>
		 * @param icalRule The <code>iCalendar</code> recurrence rule.
		 * 
		 * @see #validate()
		 */
		public function parse(icalRule:String) : void
		{
			var ruleArray:Array = null;
			
			this.reset();
			icalRule = icalRule.toUpperCase();
			var strArray:Array = icalRule.split(";");
			
			for (var i:uint = 0; i < strArray.length; i++)
			{                
				ruleArray = strArray[i].split("=");
				ruleArray[0] = StringUtil.trim(ruleArray[0]);
				ruleArray[1] = StringUtil.trim(ruleArray[1]);
				switch(ruleArray[0])
				{
					case "FREQ":
					{
						if (FREQUENCIES.indexOf(ruleArray[1]) == -1)
						{
							LoggingUtil.logAndThrowError(RRule, ResourceUtil.FPRJ_CALENDAR, 
								21, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
								"parse.error.frequency", [ruleArray[1]]);
						}
						this.freq = ruleArray[1];
						break;
					}
					case "UNTIL":
					{
						this.until = this.parseDate(ruleArray[1]);
						break;
					}
					case "COUNT":
					{
						validateIntString(ruleArray[1], false);
						this.count = parseInt(ruleArray[1]);
						break;
					}
					case "INTERVAL":
					{
						validateIntString(ruleArray[1], false);
						this.interval = parseInt(ruleArray[1]);
						break;
					}
					case "BYSECOND":
					{
						this.bySecond = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "BYMINUTE":
					{
						this.byMinute = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "BYHOUR":
					{
						this.byHour = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "BYDAY":
					{
						this.byDay = this.parseWeekDays(ruleArray[1]);
						break;
					}
					case "BYMONTHDAY":
					{
						this.byMonthDay = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "BYYEARDAY":
					{
						this.byYearDay = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "BYWEEKNO":
					{
						this.byWeekNo = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "BYMONTH":
					{
						this.byMonth = this.parseIntArray(ruleArray[1], true);
						for (var j:uint = 0; j < this.byMonth.length; j++)
						{                            
							this.byMonth[j] = this.byMonth[j] - 1;
							if (this.byMonth[j] < 0 || this.byMonth[j] > 11)
							{
								LoggingUtil.logAndThrowError(RRule, ResourceUtil.FPRJ_CALENDAR, 
									15, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
									"illegal.month.error", [ruleArray[1]]);
							}
						}
						break;
					}
					case "BYSETPOS":
					{
						this.bySetPos = this.parseIntArray(ruleArray[1], true);
						break;
					}
					case "WKST":
					{
						this.weekStart = RecurrenceWeekDay.parse(ruleArray[1]);
						break;
					}
					default:
					{
						if (ruleArray[0] != "")
						{
							LoggingUtil.logAndThrowError(
								RRule, ResourceUtil.FPRJ_CALENDAR, 11, null, ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
								"parse.error.token", [ruleArray[0]]);
						}
						break;
					}
				}
			}
		}
		
		public function reset() : void
		{
			this.freq = "DAILY";
			this.until = null;
			this.count = 0;
			this.interval = 1;
			this.byDay = [];
			this.byMonth = [];
			this.byMonthDay = [];
			this.byWeekNo = [];
			this.byYearDay = [];
			this.bySetPos = [];
			this.byHour = [];
			this.byMinute = [];
			this.bySecond = [];
			this.weekStart = null;
		}
		
		private var _iCalRule:String;
		
		[Bindable(event="propertyChange")]
		public function get iCalRule():String
		{
			if(_iCalRule == null)
				_iCalRule = toString();
			return _iCalRule;
		}
		
		private function firePropertyChange(prop:String, oldValue:*, value:*):void
		{
			if(hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
			{
				dispatchChangeEvent(prop, oldValue, value);
				if(prop != "iCalRule")
				{
					oldValue = _iCalRule;
					_iCalRule = toString();
					dispatchChangeEvent("iCalRule", oldValue, _iCalRule);
				}
			}
		}
		
		override public function toString() : String
		{
			var srule:String = "FREQ=" + this.freq;
			if (this.interval > 1)
			{
				srule = srule + (";INTERVAL=" + this.interval);
			}
			if (this.bySecond.length > 0)
			{
				srule = srule + (";BYSECOND=" + this.bySecond.join(","));
			}
			if (this.byMinute.length > 0)
			{
				srule = srule + (";BYMINUTE=" + this.byMinute.join(","));
			}
			if (this.byHour.length > 0)
			{
				srule = srule + (";BYHOUR=" + this.byHour.join(","));
			}
			if (this.byDay.length > 0)
			{
				srule = srule + (";BYDAY=" + this.byDay.join(","));
			}
			if (this.byMonthDay.length > 0)
			{
				srule = srule + (";BYMONTHDAY=" + this.byMonthDay.join(","));
			}
			if (this.byYearDay.length > 0)
			{
				srule = srule + (";BYYEARDAY=" + this.byYearDay.join(","));
			}
			if (this.byWeekNo.length > 0)
			{
				srule = srule + (";BYWEEKNO=" + this.byWeekNo.join(","));
			}
			if (this.byMonth.length > 0)
			{
				var a:Array = [];
				
				for (var i:uint = 0; i < this.byMonth.length; i++)
				{                    
					a[i] = this.byMonth[i] + 1;
				}
				srule = srule + (";BYMONTH=" + a.join(","));
			}
			if (this.bySetPos.length > 0)
			{
				srule = srule + (";BYSETPOS=" + this.bySetPos.join(","));
			}
			if (this.weekStart != null)
			{
				srule = srule + (";WKST=" + this.weekStart.toString());
			}
			if (this.count != 0)
			{
				srule = srule + (";COUNT=" + this.count);
			}
			if (this.until != null)
			{
				srule = srule + (";UNTIL=" + this.writeDate(this.until));
			}
			return srule;
		}
		
		/**
		 * <p>
		 * Checks that a frequency is defined and that the values are in valid ranges.
		 * </p>
		 * @return <code>true</code> if the rule is valid, <code>false</code> otherwise.
		 */
		public function validate() : Boolean
		{
			if (FREQUENCIES.indexOf(this.freq) == -1)
			{
				return false;
			}
			for each (var i:int in this.bySecond)
			{
				
				if (i < 0 || i > 59)
				{
					return false;
				}
			}
			for each (i in this.byMinute)
			{
				
				if (i < 0 || i > 59)
				{
					return false;
				}
			}
			for each (i in this.byHour)
			{
				
				if (i < 0 || i > 23)
				{
					return false;
				}
			}
			for each (i in this.byMonthDay)
			{
				
				if ((i < -31 || i > -1) && (i < 1 || i > 31))
				{
					return false;
				}
			}
			for each (i in this.byMonth)
			{
				
				if (i < -11 || i > 11)
				{
					return false;
				}
			}
			for each (i in this.byYearDay)
			{
				
				if ((i < -366 || i > -1) && (i < 1 || i > 366))
				{
					return false;
				}
			}
			for each (i in this.byWeekNo)
			{
				
				if ((i < -53 || i > -1) && (i < 1 || i > 53))
				{
					return false;
				}
			}
			if (this.interval < 0)
			{
				return false;
			}
			return true;
		}
		
		private function writeDate(d:Date) : String
		{
			if (this.writeDateFunction != null)
				return this.writeDateFunction(d);
			else
				return DateTimeUtil.formatIsoDate(d);
		}
		
		private static function validateIntString(strInt:String, allowNegative:Boolean) : void
		{
			strInt = StringUtil.trim(strInt);
			if (strInt == "")
			{
				LoggingUtil.logAndThrowError(RRule, ResourceUtil.FPRJ_CALENDAR, 
					23, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
					"parse.error.int.expected");
			}
			var cnt:uint = 0;
			if (strInt.charAt(0) == "-")
			{
				if (allowNegative)
				{
					cnt = cnt + 1;
				}
				else
				{
					LoggingUtil.logAndThrowError(
						RRule, ResourceUtil.FPRJ_CALENDAR, 12, null, ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
						"parse.error.not.negative", [strInt]);
				}
			}
			while (cnt < strInt.length)
			{           
				var charCode:Number = strInt.charCodeAt(cnt);
				if (charCode < 48 || charCode > 57)
				{
					throw new Error(ResourceUtil.getError(ResourceUtil.FPRJ_CALENDAR, 52, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, "parse.error.int.not.valid", [strInt]));
				}
				cnt = cnt + 1;
			}
		}
	}
}
