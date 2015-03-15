package net.fproject.utils
{
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_areOnSameDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_bound;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_checkBoundDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_compareDatePart;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_daysDurationToString;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_endOfDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_formatDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_formatDuration;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_formatIsoDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getEndOfDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getEndOfNextDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getEndOfPreviousDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getMonthNumberByName;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getStartOfDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getStartOfNextDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getStartOfPreviousDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getTime;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getTimeInMillis;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_getTimeOfDayInMillis;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_get_dateFormatter;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_max;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_millisecondToDay;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_min;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_parseDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_parseDuration;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_parseIsoDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_parseStandardDate;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_setTimeOfDayInMillis;
	import net.fproject.utils.DateTimeUtil.DateTimeUtil_startOfDay;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class DateTimeUtil_TestSuite
	{
		public var datetimeutilGetDateformatter:DateTimeUtil_get_dateFormatter;
		public var datetimeutilCheckbounddate:DateTimeUtil_checkBoundDate;
		public var datetimeutilBound:DateTimeUtil_bound;
		public var datetimeutilStartofday:DateTimeUtil_startOfDay;
		public var datetimeutilEndofday:DateTimeUtil_endOfDay;
		public var datetimeutilGetdate:DateTimeUtil_getDate;
		public var datetimeutilGettime:DateTimeUtil_getTime;
		public var datetimeutilGettimeinmillis:DateTimeUtil_getTimeInMillis;
		public var datetimeutilComparedatepart:DateTimeUtil_compareDatePart;
		public var datetimeutilGetmonthnumberbyname:DateTimeUtil_getMonthNumberByName;
		public var datetimeutilParsedate:DateTimeUtil_parseDate;
		public var datetimeutilParsestandarddate:DateTimeUtil_parseStandardDate;
		public var datetimeutilParseduration:DateTimeUtil_parseDuration;
		public var datetimeutilFormatdate:DateTimeUtil_formatDate;
		public var datetimeutilFormatduration:DateTimeUtil_formatDuration;
		public var datetimeutilDaysdurationtostring:DateTimeUtil_daysDurationToString;
		public var datetimeutilParseisodate:DateTimeUtil_parseIsoDate;
		public var datetimeutilFormatisodate:DateTimeUtil_formatIsoDate;
		public var datetimeutilGetstartofday:DateTimeUtil_getStartOfDay;
		public var datetimeutilGetendofday:DateTimeUtil_getEndOfDay;
		public var datetimeutilGetstartofnextday:DateTimeUtil_getStartOfNextDay;
		public var datetimeutilGetendofnextday:DateTimeUtil_getEndOfNextDay;
		public var datetimeutilGetstartofpreviousday:DateTimeUtil_getStartOfPreviousDay;
		public var datetimeutilGetendofpreviousday:DateTimeUtil_getEndOfPreviousDay;
		public var datetimeutilGettimeofdayinmillis:DateTimeUtil_getTimeOfDayInMillis;
		public var datetimeutilSettimeofdayinmillis:DateTimeUtil_setTimeOfDayInMillis;
		public var datetimeutilMillisecondtoday:DateTimeUtil_millisecondToDay;
		public var datetimeutilMin:DateTimeUtil_min;
		public var datetimeutilMax:DateTimeUtil_max;
		public var datetimeutilAreonsameday:DateTimeUtil_areOnSameDay;
	}
}