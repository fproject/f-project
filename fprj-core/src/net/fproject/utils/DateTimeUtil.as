///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import mx.core.mx_internal;
	import mx.formatters.DateBase;
	import mx.formatters.NumberFormatter;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.TimeUnit;
	import net.fproject.di.InstanceFactory;
	
	use namespace mx_internal;
	/**
	 * 
	 * DateTimeUtil class provides a set of common static methods for date-time handling
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class DateTimeUtil
	{
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		public static const defaultMinutesPerDay:Number = 480;
		
		public static const defaultMinutesPerWeek:Number = 2400;
		
		public static const defaultDaysPerMonth:Number = 20;
		
		
		/**
		 * <p>Defines the minimum value for <code>Date</code> objects. 
		 * <code>Date</code> treats year number
		 * below <code>100</code> as if the date was within the current century.</p>
		 * 
		 * <p>The minimum value is <code>100-1-1 00:00:00</code>.</p> 
		 */
		public static const MINIMUM_DATE:Date = new Date(100, 0);
		
		/**
		 * <p>Defines the maximum value for <code>Date</code> objects. 
		 * This limit is somehow arbitrary, the
		 * time does not behave nicely with year number of five digits.</p>
		 * 
		 * <p>The maximum value is <code>10000-1-1 00:00:00</code>.</p> 
		 */
		public static const MAXIMUM_DATE:Date = new Date(10000, 0);
		
		private static const DAY_MILLIS:Number = TimeUnit.DAY.milliseconds;
		private static const HOUR_MILLIS:Number = TimeUnit.HOUR.milliseconds;
		private static const MINUTE_MILLIS:Number = TimeUnit.MINUTE.milliseconds;
		private static const SECOND_MILLIS:Number = TimeUnit.SECOND.milliseconds;
		
		
		//--------------------------------------------------------------------------
		//
		//  Static Members
		//
		//--------------------------------------------------------------------------
		
		private static var _defaultGregorianCalendar:GregorianCalendar = InstanceFactory.getInstance(GregorianCalendar) as GregorianCalendar;
		
		private static var _dateFormatter:AdvancedDateFormatter;

		/**
		 * 
		 * Singleton of AdvancedDateFormatter
		 * 
		 */
		public static function get dateFormatter():AdvancedDateFormatter
		{
			if(_dateFormatter == null)
				_dateFormatter = new AdvancedDateFormatter;
			return _dateFormatter;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Static Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Check a time with a time range.
		 * @param time The Date to check.
		 * @param minValue The minimum value of the time range.
		 * @param maxValue The maximum value of the time range.
		 * @return <code>0</code> if time within minValue and maxValue, 
		 * <code>-1</code> if time before range, <code>1</code> if time after range
		 * 
		 */
		public static function checkBoundDate(time:Date, minValue:Date, maxValue:Date) : int
		{
			var timeDate:Date = fproject_internal::getStartOfDay(time);
			var minDate:Date = fproject_internal::getStartOfDay(minValue);
			var maxDate:Date = fproject_internal::getStartOfDay(maxValue);
			
			if (timeDate >= minDate
				&& timeDate <= maxDate)
			{
				return 0;
			} 
			else if (timeDate < minDate)
				return -1;
			else // if (timeDate > maxDate)
				return 1;
		}
		
		/**
		 * Ensures a time is within a time range. The bounded value
		 * is used to return incase of the time value is out of range.		 
		 * @param time The Date to check.
		 * @param minValue The minimum value of the time range.
		 * @param maxValue The maximum value of the time range.
		 * @return <code>time</code> bounded in the range defined by
		 * <code>minValue</code> and <code>maxValue</code>
		 * 
		 */
		public static function bound(time:Date, minValue:Date, maxValue:Date) : Date
		{
			if (time < minValue)
			{
				return minValue;
			}
			if (time > maxValue)
			{
				return maxValue;
			}
			return time;
		}
		
		/**
		 * Sets a <code>Date</code> to the first instant in the day for this time.
		 * @param time The time of interest. Note that if <code>recycle</code> is <code>true</code> then
		 *  this parameter will be modified
		 * when the function returned.
		 * @param recycle Recycle the input date/time object. Default is true.
		 * @return <code>time</code> modified so that is corresponds to the 
		 * first time of the day.
		 * 
		 */
		public static function startOfDay(time:Date, recycle:Boolean=true) : Date
		{
			if (time != null) 
			{
				if(recycle)
				{
					time.hours = 0;
					time.minutes = 0;
					time.seconds = 0;
					time.milliseconds = 0;
				}
				else
				{
					time = fproject_internal::getStartOfDay(time);
				}
			}
			
			return time;
		}
		
		/**
		 * Sets a <code>Date</code> to the last instant in the day for this time.          
		 * @param time The time of interest. Note that if <code>recycle</code> is <code>true</code> then
		 * this parameter will be modified
		 * when the function returned.
		 * @param recycle Recycle the input date/time object. Default is true.
		 * @return <code>time</code> modified so that is corresponds to the latest time of the day. 
		 * 
		 */
		public static function endOfDay(time:Date, recycle:Boolean=true) : Date
		{
			if (time != null)
			{
				if(recycle)
				{
					time.hours = 23;
					time.minutes = 59;
					time.seconds = 59;
					time.milliseconds = 999;
				}
				else
				{
					time = fproject_internal::getEndOfDay(time);
				}
			}
			return time;
		}
		
		
		/**
		 * <p>Returns a <code>Date</code> for the given value that can be a
		 * <code>Date</code> or a time in the form of a <code>String</code>.</p>
		 * 
		 * <p>If the value is a <code>Date</code> it is returned as is. If the value
		 * is a <code>String</code> it is converted to a <code>Date</code> using
		 * the <code>String</code> constructor of <code>Date</code>.</p> 
		 * 
		 * @param value The value from which to retrieve a <code>Date</code>.
		 * @return A <code>Date</code> corresponding to the value or
		 * <code>null</code> if the value cannot be converted to a Date.
		 * 
		 */
		public static function getDate(value:Object) : Date
		{
			if (value is Date)
			{
				return value as Date;
			}
			if (value)
			{
				return new Date(String(value));
			}
			return null;
		}
		
		/**
		 * Returns the number of milliseconds for the specified parameters  
		 * @param hours The number of hours. 
		 * @param minutes The number of minutes. 
		 * @param seconds The number of seconds. 
		 * @param milliseconds The number of milliseconds. 
		 * @return The number of milliseconds for the specified parameters. 
		 * 
		 */
		public static function getTime(hours:Number, minutes:Number = 0, 
									   seconds:Number = 0, milliseconds:Number = 0) : Number
		{
			return hours * HOUR_MILLIS + minutes * MINUTE_MILLIS + 
				seconds * SECOND_MILLIS + milliseconds;
		}
		
		/**
		 * Returns the number of milliseconds for the specified date  
		 * @param value The date value. 
		 * @return The number of milliseconds for the specified date. 
		 * 
		 */
		public static function getTimeInMillis(value:Date) : Number
		{
			return getTime(value.hours, value.minutes, value.seconds, value.milliseconds);
		}
		
		/**
		 * Compare the date part of two <code>Date</code> objects and returns an integer value 
		 * indicating if the first <code>Date</code> object is before, equal to, 
		 * or after the second item.<br/><br/>
		 * The date part of a <code>Date</code> object is the part having 
		 * only day, month and year information.
		 *
		 * @param a Date object.
		 *
		 * @param b Date object.
		 *
		 * @return 0 if the date parts of <code>a</code> and <code>b</code> are equal
		 * (or both of dates are <code>null</code>);
		 * -1 if <code>a</code> is before <code>b</code>
		 * (or <code>b</code> is <code>null</code>);
		 * 1 if <code>a</code> is after <code>b</code>
		 * (or <code>a</code> is <code>null</code>).     
		 */
		public static function compareDatePart(a:Date, b:Date):int
		{
			if (a == null && b == null)
				return 0;
			
			if (a == null)
				return 1;
			
			if (b == null)
				return -1;
			
			var sa:Date = fproject_internal::getStartOfDay(a)
			var sb:Date = fproject_internal::getStartOfDay(b);
			
			if (sa < sb)
				return -1;
			
			if (sa > sb)
				return 1;
			
			return 0;
		}
		
		/**
		 * Get a month number by name
		 * @param monthName The name of the month, it can be in long format
		 * (e.g. 'January') or in short format (e.g. 'Jan').<br/><br/>
		 * Month names must match the names in mx.formatters.DateBase
		 * @return The month number, from 0 to 11.
		 * In case the <code>monthName</code> parameter is invalid, it returns -1.
		 * @see mx.formatters.DateBase
		 */
		public static function getMonthNumberByName(monthName:String):int
		{
			var n:int = DateBase.defaultStringKey.length;
			for (var i:int = 0; i < n && i < 12; i++)
			{
				var s:String = String(DateBase.defaultStringKey[i]);
				if (s.toLowerCase() == monthName.toLowerCase() ||
					s.toLowerCase().substr(0,3) == monthName.toLowerCase())
				{
					return i;
				}
			}
			
			// Not a valid month name 
			return -1;
		}
		
		/**
		 *
		 * Parse a string date to <code>Date</code> type
		 * @param strDate The input string represents a date time object.
		 * @param formatString The input date-time format.<br/>
		 * This is the date format patterns from 
		 * the unicode Common Locale Data Repository (CLDR), version 1.9.  
		 * The date formats for CLDR are specified in 
		 * <a href="http://www.unicode.org/reports/tr35/#Date_Format_Patterns">
		 * http://www.unicode.org/reports/tr35/#Date_Format_Patterns</a>.<br/>
		 * <br/>
		 * If this parameter is not specified, default value will be get from default
		 * resource bundle with key = <code>'common.dateFormat'</code>
		 * @return The parsed Date object if succeed. <code>null</code> if failure.
		 * 
		 * @see AdvancedDateFormatter#formatString
		 *
		 */
		public static function parseDate(strDate:String, formatString:String = null):Date
		{
			if (formatString == null)
				dateFormatter.formatString = ResourceUtil.getString('common.dateFormat');
			else
				dateFormatter.formatString = formatString;
			return dateFormatter.parse(strDate);			
		}
		
		/**
		 *
		 * Parse a string date to <code>Date</code> type, using standard UTC date format: yyyy-MM-dd hh:mm:ss.bbb
		 * @param strDate The input string represents a date time object.
		 * @return The parsed Date object if succeed. <code>null</code> if failure.
		 *
		 */
		public static function parseStandardDate(s:String):Date
		{
			return parseDate(s, "yyyy-MM-dd hh:mm:ss.bbb");
		}
		
		/**
		 * Parses the specified string as a duration.
		 * @param s the input string
		 * @param minutesPerDay The number of working minutes per day
		 * @param minutesPerWeek The number of working minutes per week
		 * @param daysPerMonth The number of working days per month
		 * @return The parsed duration in days
		 */
		public static function parseDuration(s:String, minutesPerDay:Number = 0, 
											 minutesPerWeek:Number = 0, daysPerMonth:Number = 0) : Number
		{
			
			if (minutesPerDay == 0)
				minutesPerDay = defaultMinutesPerDay;
			if (minutesPerWeek == 0)
				minutesPerWeek = defaultMinutesPerWeek;
			if (daysPerMonth == 0)
				daysPerMonth = defaultDaysPerMonth;
			
			var f:Number;
			var suffix:String;
			
			// Deal with hours
			suffix = ResourceUtil.getString("common.caption.hour");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return 60 * f / minutesPerDay; 
			}
			suffix = ResourceUtil.getString("common.caption.hours");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return 60 * f / minutesPerDay;
			}
			
			// Deal with days
			suffix = ResourceUtil.getString("common.caption.day");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f;
			}
			suffix = ResourceUtil.getString("common.caption.days");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f;
			}
			
			// Deal with weeks
			suffix = ResourceUtil.getString("common.caption.week");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f * minutesPerWeek / minutesPerDay;
			}
			suffix = ResourceUtil.getString("common.caption.weeks");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f * minutesPerWeek / minutesPerDay;
			}
			
			// Deal with months
			suffix = ResourceUtil.getString("common.caption.month");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f * daysPerMonth;
			}
			suffix = ResourceUtil.getString("common.caption.months");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f * daysPerMonth;
			}
			
			// Deal with short suffices after because it may conflict with long suffices.
			//
			// Deal with short hours
			suffix = ResourceUtil.getString("common.caption.shortHours");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return 60 * f / minutesPerDay;
			}
			
			// Deal with short days
			suffix = ResourceUtil.getString("common.caption.shortDays");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f;
			}
			
			// Deal with short weeks
			suffix = ResourceUtil.getString("common.caption.shortWeeks");
			if (StringUtil.endsWith(s, suffix, false, true))
			{
				f = getDoubleFromString(s, suffix);
				return f * minutesPerWeek / minutesPerDay;
			}
			
			if (isNaN(Number(s))) 
				return NaN;
			
			// Default is days.. could be specified in model
			return parseFloat(s);
		}
		
		/**
		 * Formats the specified date using a format string.
		 * @param date The date interest
		 * @param format The output date format. If this parameter is not specified
		 * the default value will be get from resource bundle 'common.dateFormat'
		 * in the bundle file FPROJECT_CORE.properties 
		 * @return The formatted date string 
		 * 
		 * @see net.fproject.utils.AdvancedDateFormatter#formatString
		 */
		public static function formatDate(date:Date, formatString:String = null):String
		{
			if (formatString == null)
				dateFormatter.formatString=ResourceUtil.getString('common.dateFormat');			
			else
				dateFormatter.formatString = formatString;
			return dateFormatter.format(date);  
		}
		
		/**
		 * Formats the specified duration. The result displays a number of working days.
		 * @param duration The duration in milliseconds
		 * @param minutesPerDay The number of working minutes per day
		 * @param showUnit Show the unit text or not
		 * @return The formatted result
		 * 
		 */          
		public static function formatDuration(duration:Number, minutesPerDay:Number = NaN, showUnit:Boolean = false):String
		{
			var minutes:Number = duration / 60000;
			
			if (isNaN(NaN))
				minutesPerDay = defaultMinutesPerDay;
			
			var days:Number = minutes / minutesPerDay;     
			return daysDurationToString(days, showUnit);		
		}
		
		/**
		 * Formats the specified duration in days. The result displays a number of working days.
		 * @param days The number of day.
		 * @param showUnit Show the unit text or not.
		 * @return The formatted result.
		 * 
		 */    
		public static function daysDurationToString(days:Number, showUnit:Boolean) : String
		{
			var formatter:NumberFormatter = new NumberFormatter();
			formatter.precision = 2;
			var result:String = formatter.format(days);
			var toRemove:int;
			if (result.charAt(result.length - 1) == '0')
				toRemove = 1;
			if (toRemove == 1 && result.charAt(result.length - 2) == '0')
				toRemove = 3;
			return showUnit? result.substr(0, result.length - toRemove) + " " + (days == 1 ? 
				ResourceUtil.getString("common.caption.day") 
				: ResourceUtil.getString("common.caption.days"))
				: result.substr(0, result.length - toRemove);
		}
		
		/**
		 * Parse an ISO date to Date type.
		 * This method support <code>ISO8601</code> and <code>Extended ISO8601</code> format.
		 * @param str the ISO date string, which can be in ISO8601 or Extended ISO8601 format.<br/>
		 * <p>The <code>ISO8601</code> formats are as follows:
		 * <pre>
		 * Complete date:
		 * 	YYYY-MM-DD (eg 1997-07-16)
		 * Complete date plus hours and minutes:
		 * 	YYYY-MM-DDThh:mm (eg 1997-07-16T19:20)
		 * Complete date plus hours, minutes and seconds:
		 * 	YYYY-MM-DDThh:mm:ss (eg 1997-07-16T19:20:30)
		 * Complete date plus hours, minutes, seconds and a decimal fraction of a second
		 * 	YYYY-MM-DDThh:mm:ss.s (eg 1997-07-16T19:20:30.456)
		 * Complete date plus hours and minutes with time zone:
		 * 	YYYY-MM-DDThh:mmTZD (eg 1997-07-16T19:20+01:00)
		 * Complete date plus hours, minutes and seconds with time zone:
		 * 	YYYY-MM-DDThh:mm:ssTZD (eg 1997-07-16T19:20:30+01:00)
		 * Complete date plus hours, minutes, seconds and a decimal fraction of a second with time zone
		 * 	YYYY-MM-DDThh:mm:ss.sTZD (eg 1997-07-16T19:20:30.45+01:00)
		 * Complete date plus hours, minutes, seconds with Zero time zone
		 * 	YYYY-MM-DDThh:mm:ss.sTZD (eg 1997-07-16T19:20:30Z)
		 * </pre></p>
		 * <p>The <code>Extended ISO8601</code> formats is the same as <code>ISO8601</code>,
		 * excepts for the <code>"T"</code> character is replaced by whitespace <code>" "</code>.</p>
		 * @return The new date if no error.
		 * If there's an error in parsing, the returned date will be an invalid Date instance.
		 * 
		 */		
		public static function parseIsoDate(str:String):Date
		{
			var finalDate:Date;
			try
			{
				if(str.charAt(10) == " ")
					var i:int = 10;
				else
					i = str.indexOf("T");
				if(i != -1)
				{
					var dateStr:String = str.substring(0, i);
					var timeStr:String = str.substring(i + 1, str.length);
					
					if (timeStr.indexOf("Z") != -1)
					{
						var multiplier:int = 1;
						var offsetHours:int = 0;
						var offsetMinutes:int = 0;
						timeStr = timeStr.replace("Z", "");
					}
					else
					{
						if (timeStr.indexOf("+") != -1)
						{
							multiplier = 1;
							var offsetSign:String = "+";
						}
						else // offset is -
						{
							multiplier = -1;
							offsetSign = "-";
						}
						
						i = timeStr.indexOf(offsetSign);
						if(i != -1)
						{
							var offsetStr:String = timeStr.substring(i + 1, timeStr.length);
							timeStr = timeStr.substring(0, i);
							i = offsetStr.indexOf(":");
							if(i != -1)
							{
								offsetHours = int(offsetStr.substring(0, i));
								offsetMinutes = int(offsetStr.substring(i + 1, offsetStr.length));
							}
							else
							{
								offsetHours = int(offsetStr);
								offsetMinutes = 0;
							}
							
							if(timeStr.substr(-3) == "GMT")
								timeStr = timeStr.substr(0, timeStr.length - 3);
						}
					}
					
					var timeArr:Array = timeStr.split(":");
					var hour:int = int(timeArr.shift());
					var minutes:int = int(timeArr.shift());
					var secondsArr:Array = (timeArr.length > 0) ? String(timeArr.shift()).split(".") : null;
					var seconds:int = (secondsArr != null && secondsArr.length > 0) ? int(secondsArr.shift()) : 0;
					var milliseconds:Number = (secondsArr != null && secondsArr.length > 0) ? 
						1000*parseFloat("0." + secondsArr.shift()) : 0; 
				}
				else
				{
					dateStr = str;
					milliseconds = 0;
				}
				
				var dateArr:Array = dateStr.split("-");
				var year:int = int(dateArr.shift());
				var month:int = int(dateArr.shift());
				var date:int = int(dateArr.shift());
				
				
				var utc:Number = Date.UTC(year, month-1, date, hour, minutes, seconds, milliseconds);
				var offset:Number = (((offsetHours * 3600000) + (offsetMinutes * 60000)) * multiplier);
				finalDate = new Date(utc - offset);
				
				if (finalDate.toString() == "Invalid Date")
				{
					throw new Error("This date does not conform to W3CDTF.");
				}
			}
			catch (e:Error)
			{
				var eStr:String = "Unable to parse the string [" +str+ "] into a date. ";
				eStr += "The internal error was: " + e.toString();
				throw new Error(eStr);
			}
			return finalDate;
		}
		
		/**
		 * Format a date to using ISO Date format. This method is use to process Date data for MS Project
		 * @param value The ISO date string.
		 * @param includeMilliseconds Determines whether to include the
		 * milliseconds value (if any) in the formatted string.
		 * @param useZsign whether include "Z" sign to the end of output string or not
		 * @param useTsign whether use "T" sign to to seperate date part and time part or not
		 * 
		 * @return The ISO date formatted string if no error.
		 * 
		 */		
		public static function formatIsoDate(d:Date, includeMilliseconds:Boolean=false,
											 useZsign:Boolean=false, useTsign:Boolean=true):String
		{
			var date:Number = d.getUTCDate();
			var month:Number = d.getUTCMonth();
			var hours:Number = d.getUTCHours();
			var minutes:Number = d.getUTCMinutes();
			var seconds:Number = d.getUTCSeconds();
			var milliseconds:Number = d.getUTCMilliseconds();
			var sb:String = new String();
			
			sb += d.getUTCFullYear();
			sb += "-";
			
			if (month + 1 < 10)
			{
				sb += "0";
			}
			sb += month + 1;
			sb += "-";
			if (date < 10)
			{
				sb += "0";
			}
			sb += date;
			sb += useTsign ? "T" : " ";
			if (hours < 10)
			{
				sb += "0";
			}
			sb += hours;
			sb += ":";
			if (minutes < 10)
			{
				sb += "0";
			}
			sb += minutes;
			sb += ":";
			if (seconds < 10)
			{
				sb += "0";
			}
			sb += seconds;
			if (includeMilliseconds && milliseconds > 0)
			{
				sb += ".";
				if (milliseconds < 100)
				{
					sb += "0";
				}
				if (milliseconds < 10)
				{
					sb += "0";
				}
				sb += milliseconds;
			}
			if(useZsign)
				sb += "Z";
			return sb;
		}
		
		/* **************************************************************
		* F-Project Internal Methods
		* **************************************************************/
		
		fproject_internal static function getStartOfDay(date:Date) : Date
		{
			return new Date(date.fullYear, date.month, date.date, 0, 0, 0, 0);
		}
		
		fproject_internal static function getEndOfDay(date:Date) : Date
		{
			return new Date(date.fullYear, date.month, date.date, 23, 59, 59, 999);
		}
		
		fproject_internal static function getStartOfNextDay(date:Date) : Date
		{
			return new Date(date.fullYear, date.month, (date.date + 1), 0, 0, 0, 0);
		}
		
		fproject_internal static function getEndOfNextDay(date:Date) : Date
		{
			return new Date(date.fullYear, date.month, (date.date + 1), 23, 59, 59, 999);
		}
		
		fproject_internal static function getStartOfPreviousDay(date:Date) : Date
		{
			return new Date(date.fullYear, date.month, (date.date - 1), 0, 0, 0, 0);
		}
		
		fproject_internal static function getEndOfPreviousDay(date:Date) : Date
		{
			return new Date(date.fullYear, date.month, (date.date - 1), 23, 59, 59, 999);
		}
		
		/*[Deprecated(replacement="getTimeOfDayInMillis")]
		fproject_internal static function getTimeOfDay(date:Date) : Number
		{
		return date.time - fproject_internal::getStartOfDay(date).time;
		}*/// end function
		
		fproject_internal static function getTimeOfDayInMillis(date:Date) : Number
		{
			var millis:Number = date.time - date.timezoneOffset * TimeUnit.MINUTE.milliseconds;
			var todMillis:Number = millis % TimeUnit.DAY.milliseconds;
			if (todMillis < 0)
			{
				todMillis = todMillis + TimeUnit.DAY.milliseconds;
			}
			return todMillis;
		}
		
		fproject_internal static function setTimeOfDayInMillis(date:Date, millis:Number) : Date
		{
			var tzo1:Number = date.timezoneOffset;
			var todMillis:Number = fproject_internal::getTimeOfDayInMillis(date);
			date.time = date.time + (millis - todMillis);
			var tzo2:Number = date.timezoneOffset;
			if (tzo2 != tzo1)
			{
				date.time = date.time + (tzo2 - tzo1) * TimeUnit.MINUTE.milliseconds;
			}
			return date;
		}
		
		fproject_internal static function millisecondToDay(millis:Number) : Number
		{
			return Math.floor(millis / DAY_MILLIS);
		}
		
		/*[Deprecated(replacement="millisecondToDay")]
		fproject_internal static function getDayMilliseconds(ticks:Number) : int
		{
		return int(ticks / DAY_MILLIS);
		}*/// end function
		
		fproject_internal static function min(date1:Date, date2:Date) : Date
		{
			return date1 < date2 ? (date1) : (date2);
		}
		
		fproject_internal static function max(date1:Date, date2:Date) : Date
		{
			return date1 > date2 ? (date1) : (date2);
		}
		
		fproject_internal static function areOnSameDay(date1:Date, date2:Date) : Boolean
		{
			var d:Date = new Date(date1.fullYear, date1.month, date1.date);
			var d1:Date = new Date(date1.fullYear, date1.month, date1.date, 24);
			return date2 >= d && date2 <= d1;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Static Private Methods
		//
		//--------------------------------------------------------------------------    
		
		/**
		 * Expands the general supported date formats 
		 */
		static private function expandDefaultFormats(format:String):String
		{
			// TODO : Handle default formats 
			return format;
		}
		
		/**
		 * Modifies the specified date using the format/value pair.  
		 */
		static private function applyDateFormat(date:Date, format:String, value:String, am:Boolean):Boolean
		{
			switch (format)
			{
				case "A":
					break;
				case "D":
				case "DD":
				case "d":
				case "dd": 
					var day:int = int(parseInt(value));
					date.date = day;          
					break;
				case "M":
				case "MM": 
					var month:int = int(parseInt(value)) - 1;
					date.month = month;          
					break;
				case "Y":
				case "YY":
				case "YYYY":
				case "y":
				case "yy":
				case "yyyy":
					var year:int = int(parseInt(value));
					date.fullYear = year;          
					break;
				case "K":
					var hours:int = int(parseInt(value));
					date.hours = am ? hours : hours + 12;          
					break;
				case "L":
					var hours2:int = int(parseInt(value));
					if (hours2 == 12 && am)
						hours2 = 0;
					date.hours = am? hours2 : hours2 + 12;          
					break;
				case "J":
				case "H":
				case "HH":
					var hours3:int = int(parseInt(value));
					date.hours = hours3;          
					break;
				case "N":
				case "NN":
				case "m":
				case "mm":
					var minutes:int = int(parseInt(value));
					date.minutes = minutes;          
					break;
				case "S":
				case "s":
				case "ss":
					var seconds:int = int(parseInt(value));
					date.seconds = seconds;          
					break;            
				default:
					return false;
			}
			return true;
		}
		
		/**
		 * Indicates whether the format contains the AM designator
		 */
		private static function containsAMDesignator(formatTokens:Array, formatValues:Array):Boolean
		{
			for (var index:int = 0; index < formatTokens.length; ++index)
			{
				if (formatTokens[index] == 'A')
					return formatValues[index] == ResourceUtil.getString("common.caption.am");
			}   
			return true;
		}
		
		/**
		 * Gets the numeric value in a string with a value and a suffix ("4 days")  
		 */
		private static function getDoubleFromString(s:String, suffix:String):Number
		{
			s = s.substr(0, s.length - suffix.length);
			return parseFloat(s);
		}
	}
}