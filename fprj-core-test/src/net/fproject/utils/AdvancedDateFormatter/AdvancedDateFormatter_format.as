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
	 * <code>public function format(value:Object):String</code><br/>
	 * of class<br/>
	 * net.fproject.utils.AdvancedDateFormatter
	 */
	public class AdvancedDateFormatter_format
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

		[Test (description="Normal case: [value = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var value:Object = new Object();
			var returnTestValue:String = advanceddateformatter.format(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var value:Object = null;
			var returnTestValue:String = advanceddateformatter.format(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}