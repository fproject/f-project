package net.fproject.utils
{
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_format;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_get_dayNamesNarrow;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_get_formatString;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_get_gregorianCalendar;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_get_monthNamesNarrow;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_get_referenceDate;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_get_startOfYear;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_parse;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_set_dayNamesNarrow;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_set_formatString;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_set_gregorianCalendar;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_set_monthNamesNarrow;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_set_referenceDate;
	import net.fproject.utils.AdvancedDateFormatter.AdvancedDateFormatter_set_startOfYear;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AdvancedDateFormatter_TestSuite
	{
		public var advanceddateformatterGetGregoriancalendar:AdvancedDateFormatter_get_gregorianCalendar;
		public var advanceddateformatterSetGregoriancalendar:AdvancedDateFormatter_set_gregorianCalendar;
		public var advanceddateformatterGetDaynamesnarrow:AdvancedDateFormatter_get_dayNamesNarrow;
		public var advanceddateformatterSetDaynamesnarrow:AdvancedDateFormatter_set_dayNamesNarrow;
		public var advanceddateformatterGetMonthnamesnarrow:AdvancedDateFormatter_get_monthNamesNarrow;
		public var advanceddateformatterSetMonthnamesnarrow:AdvancedDateFormatter_set_monthNamesNarrow;
		public var advanceddateformatterGetFormatstring:AdvancedDateFormatter_get_formatString;
		public var advanceddateformatterSetFormatstring:AdvancedDateFormatter_set_formatString;
		public var advanceddateformatterGetReferencedate:AdvancedDateFormatter_get_referenceDate;
		public var advanceddateformatterSetReferencedate:AdvancedDateFormatter_set_referenceDate;
		public var advanceddateformatterGetStartofyear:AdvancedDateFormatter_get_startOfYear;
		public var advanceddateformatterSetStartofyear:AdvancedDateFormatter_set_startOfYear;
		public var advanceddateformatterFormat:AdvancedDateFormatter_format;
		public var advanceddateformatterParse:AdvancedDateFormatter_parse;
	}
}