package net.fproject.utils.DateTimeUtil
{
	import net.fproject.fproject_internal;
	import net.fproject.utils.DateTimeUtil;
	
	import org.flexunit.asserts.assertEquals;

	use namespace fproject_internal;
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal static function getStartOfDay(date:Date):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_getStartOfDay
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

		[Test (description="Normal case: [date = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var time:Date = new Date(2014, 11, 11, 20, 17, 39, 123);
			var returnTestValue:Date = DateTimeUtil.getStartOfDay(time);
			var expect:Date = new Date(2014, 11, 11);
			assertEquals(expect.time, returnTestValue.time);
		}

		[Test (expected="TypeError",description="Boundary case: [date = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var date:Date = null;
			var returnTestValue:Date = DateTimeUtil.getStartOfDay(date);
		}

	}
}