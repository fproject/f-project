package net.fproject.utils
{
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function bound(time:Date, minValue:Date, maxValue:Date):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_bound
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

		[Test (description="Normal case: [time = new Date(), minValue = new Date(), maxValue = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>minValue = new Date()</code><br/>
		 * <code>maxValue = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var time:Date = new Date();
			var minValue:Date = new Date(time.time-1000);
			var maxValue:Date = new Date(time.time+1000);
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(time.time,returnTestValue.time);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, minValue = new Date(), maxValue = new Date()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>minValue = new Date()</code><br/>
		 * <code>maxValue = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var time:Date = null;
			var minValue:Date = new Date();
			var maxValue:Date = new Date(minValue + 1000);
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(minValue,returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), minValue = null, maxValue = new Date()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>minValue = null</code><br/>
		 * <code>maxValue = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var time:Date = new Date();
			var minValue:Date = null;
			var maxValue:Date = new Date();
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(time,returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, minValue = null, maxValue = new Date()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>minValue = null</code><br/>
		 * <code>maxValue = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var time:Date = null;
			var minValue:Date = null;
			var maxValue:Date = new Date();
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(time,returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), minValue = new Date(), maxValue = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>minValue = new Date()</code><br/>
		 * <code>maxValue = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var time:Date = new Date();
			var minValue:Date = new Date();
			var maxValue:Date = null;
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(maxValue,returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, minValue = new Date(), maxValue = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>minValue = new Date()</code><br/>
		 * <code>maxValue = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var time:Date = null;
			var minValue:Date = new Date();
			var maxValue:Date = null;
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(minValue,returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), minValue = null, maxValue = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>minValue = null</code><br/>
		 * <code>maxValue = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var time:Date = new Date();
			var minValue:Date = null;
			var maxValue:Date = null;
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(null,returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, minValue = null, maxValue = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>minValue = null</code><br/>
		 * <code>maxValue = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var time:Date = null;
			var minValue:Date = null;
			var maxValue:Date = null;
			var returnTestValue:Date = DateTimeUtil.bound(time, minValue, maxValue);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(time,returnTestValue);
			//-------------------------------------
		}

	}
}