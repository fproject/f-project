package net.fproject.utils
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function compareDatePart(a:Date, b:Date):int</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_compareDatePart
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

		[Test (description="Normal case: [a = new Date(), b = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>a = new Date()</code><br/>
		 * <code>b = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var a:Date = new Date();
			a.hours = 0;
			var b:Date = new Date(a.time + 1000);
			var returnTestValue:int = DateTimeUtil.compareDatePart(a, b);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(0, returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [a = null, b = new Date()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>a = null</code><br/>
		 * <code>b = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var a:Date = null;
			var b:Date = new Date();
			var returnTestValue:int = DateTimeUtil.compareDatePart(a, b);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(1, returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [a = new Date(), b = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>a = new Date()</code><br/>
		 * <code>b = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var a:Date = new Date();
			var b:Date = null;
			var returnTestValue:int = DateTimeUtil.compareDatePart(a, b);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(-1, returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [a = null, b = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>a = null</code><br/>
		 * <code>b = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var a:Date = null;
			var b:Date = null;
			var returnTestValue:int = DateTimeUtil.compareDatePart(a, b);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(0, returnTestValue);
			//-------------------------------------
		}

		[Test (description="Normal case: [a = new Date(), b = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>a = new Date()</code><br/>
		 * <code>b = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var a:Date = new Date();
			var b:Date = new Date(a.time + TimeUnit.DAY.milliseconds);
			var returnTestValue:int = DateTimeUtil.compareDatePart(a, b);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(-1, returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [a = new Date(), b = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>a = new Date()</code><br/>
		 * <code>b = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var a:Date = new Date();
			var b:Date = new Date(a.time - TimeUnit.DAY.milliseconds);
			var returnTestValue:int = DateTimeUtil.compareDatePart(a, b);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(1, returnTestValue);
			//-------------------------------------
		}
	}
}