package net.fproject.utils.DateTimeUtil
{
	import net.fproject.utils.DateTimeUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function parseStandardDate(s:String):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_parseStandardDate
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

		[Test (description="Normal case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var returnTestValue:Date = DateTimeUtil.parseStandardDate('2014-12-11 20:11:39.123');
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			var d:Date = new Date(2014, 12, 11, 20, 11, 39, 123);
			assertEquals(d.time, returnTestValue.time);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var s:String = "";
			var returnTestValue:Date = DateTimeUtil.parseStandardDate(s);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var s:String = null;
			var returnTestValue:Date = DateTimeUtil.parseStandardDate(s);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

	}
}