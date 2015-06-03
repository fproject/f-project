package net.fproject.utils.DateTimeUtil
{
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.DateTimeUtil;
	
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function getTime(hours:Number, minutes:Number = 0, seconds:Number = 0, milliseconds:Number = 0):Number</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_getTime
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

		[Test (description="Boundary case: [hours = 0, minutes = 0, seconds = 0, milliseconds = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>hours = 0</code><br/>
		 * <code>minutes = 0</code><br/>
		 * <code>seconds = 0</code><br/>
		 * <code>milliseconds = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var hours:Number = 10;
			var minutes:Number = 11;
			var seconds:Number = 59;
			var milliseconds:Number = 123.25;
			var returnTestValue:Number = DateTimeUtil.getTime(hours, minutes, seconds, milliseconds);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(hours * TimeUnit.HOUR.milliseconds + minutes * TimeUnit.MINUTE.milliseconds + 
				seconds * TimeUnit.SECOND.milliseconds + milliseconds, returnTestValue)
			//-------------------------------------
		}

		[Test (description="Boundary case: [hours = Number.POSITIVE_INFINITY, minutes = 0, seconds = 0, milliseconds = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>hours = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutes = 0</code><br/>
		 * <code>seconds = 0</code><br/>
		 * <code>milliseconds = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var hours:Number = 0;
			var minutes:Number = 0;
			var seconds:Number = 0;
			var milliseconds:Number = 0;
			var returnTestValue:Number = DateTimeUtil.getTime(hours, minutes, seconds, milliseconds);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(0, returnTestValue);
			//-------------------------------------
		}
	}
}