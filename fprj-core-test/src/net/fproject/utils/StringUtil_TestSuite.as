package net.fproject.utils
{
	import net.fproject.utils.StringUtil.StringUtil_endsWith;
	import net.fproject.utils.StringUtil.StringUtil_get_defaultCharacterCompareMethod;
	import net.fproject.utils.StringUtil.StringUtil_isBlank;
	import net.fproject.utils.StringUtil.StringUtil_localeEquals;
	import net.fproject.utils.StringUtil.StringUtil_localeIndexOf;
	import net.fproject.utils.StringUtil.StringUtil_localeLastIndexOf;
	import net.fproject.utils.StringUtil.StringUtil_set_defaultCharacterCompareMethod;
	import net.fproject.utils.StringUtil.StringUtil_splitEx;
	import net.fproject.utils.StringUtil.StringUtil_startsWith;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class StringUtil_TestSuite
	{
		public var stringutilStartswith:StringUtil_startsWith;
		public var stringutilEndswith:StringUtil_endsWith;
		public var stringutilSplitex:StringUtil_splitEx;
		public var stringutilIsblank:StringUtil_isBlank;
		public var stringutilLocaleindexof:StringUtil_localeIndexOf;
		public var stringutilLocalelastindexof:StringUtil_localeLastIndexOf;
		public var stringutilLocaleequals:StringUtil_localeEquals;
		public var stringutilGetDefaultcharactercomparemethod:StringUtil_get_defaultCharacterCompareMethod;
		public var stringutilSetDefaultcharactercomparemethod:StringUtil_set_defaultCharacterCompareMethod;
	}
}