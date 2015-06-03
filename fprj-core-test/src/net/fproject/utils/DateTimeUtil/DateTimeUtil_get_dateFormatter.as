package net.fproject.utils.DateTimeUtil
{
	import net.fproject.utils.AdvancedDateFormatter;
	import net.fproject.utils.DateTimeUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function get dateFormatter():AdvancedDateFormatter</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_get_dateFormatter
	{
		[Before]
		public function runBeforeEveryTest():void
		{
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
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
			var returnTestValue:AdvancedDateFormatter = DateTimeUtil.dateFormatter;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			var returnTestValue1:AdvancedDateFormatter = DateTimeUtil.dateFormatter;
			assertEquals(returnTestValue, returnTestValue1);
		}

	}
}