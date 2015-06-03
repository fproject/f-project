package net.fproject.utils.DateTimeUtil
{
	import net.fproject.utils.DateTimeUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function startOfDay(time:Date):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_startOfDay
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

		[Test (description="Normal case: [time = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var time:Date = new Date(2014, 11, 11, 20, 17, 39, 123);
			var returnTestValue:Date = DateTimeUtil.startOfDay(time);
			var expect:Date = new Date(2014, 11, 11);
			assertEquals(expect.time, returnTestValue.time);
		}

		[Test (description="Boundary case: [time = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var time:Date = null;
			var returnTestValue:Date = DateTimeUtil.startOfDay(time);
			assertNull(returnTestValue);
		}

	}
}