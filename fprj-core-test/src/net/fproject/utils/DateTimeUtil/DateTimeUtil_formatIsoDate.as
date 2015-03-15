package net.fproject.utils.DateTimeUtil
{
	import org.flexunit.asserts.assertEquals;
	import net.fproject.utils.DateTimeUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function formatIsoDate(d:Date):String</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_formatIsoDate
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

		[Test (description="Normal case: [d = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var d:Date = new Date("1/1/2014 13:00:00 GMT+7");
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("2014-01-01T06:00:00", returnTestValue);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case: [d = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var d:Date = null;
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Normal case: [d = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var d:Date = new Date("1/1/2014 13:00:00 GMT+07");
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("2014-01-01T06:00:00", returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [d = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var d:Date = new Date(1419764961007);//2014-12-28T18:09:21.007 GMT+07
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("2014-12-28T11:09:21", returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [d = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var d:Date = new Date(1419764961007);//2014-12-28T18:09:21.007 GMT+07
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d, true);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("2014-12-28T11:09:21.007", returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [d = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var d:Date = new Date(1419764961567);//2014-12-28T18:09:21.567 GMT+07
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d, true, true);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("2014-12-28T11:09:21.567Z", returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [d = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>d = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var d:Date = new Date(1419764961737);//2014-12-28T18:09:21.737 GMT+07
			var returnTestValue:String = DateTimeUtil.formatIsoDate(d, false, true);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("2014-12-28T11:09:21Z", returnTestValue);
			//-------------------------------------
		}
	}
}