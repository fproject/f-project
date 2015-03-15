package net.fproject.utils.AdvancedDateFormatter
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import mx.core.mx_internal;
	import mx.formatters.DateBase;
	import mx.formatters.Formatter;
	import mx.utils.StringUtil;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.AdvancedDateFormatter;


	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function get formatString():String</code><br/>
	 * of class<br/>
	 * net.fproject.utils.AdvancedDateFormatter
	 */
	public class AdvancedDateFormatter_get_formatString
	{
		private var advanceddateformatter:AdvancedDateFormatter;

		[Before]
		public function runBeforeEveryTest():void
		{
			advanceddateformatter = new AdvancedDateFormatter();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			advanceddateformatter = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: []")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var returnTestValue:String = advanceddateformatter.formatString;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}