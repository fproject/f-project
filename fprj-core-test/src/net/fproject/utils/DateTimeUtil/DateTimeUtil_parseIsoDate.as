package net.fproject.utils.DateTimeUtil
{
	import org.flexunit.asserts.assertTrue;
	import net.fproject.utils.DateTimeUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function parseIsoDate(value:String):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_parseIsoDate
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

		[Test (expected="Error",description="Boundary case: [value = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var value:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(true, isNaN(returnTestValue.valueOf()));
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [value = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var value:String = "";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(true, isNaN(returnTestValue.valueOf()));
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [value = null]")]
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
		public function testCase003():void
		{
			var value:String = null;
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(true, isNaN(returnTestValue.valueOf()));
			//-------------------------------------
		}

		[Test (description="Normal case: [value = '1997-07-16']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var value:String = "1997-07-16";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16")).time, returnTestValue.time);
			//-------------------------------------
		}

		[Test (description="Normal case: [value = '1997-07-16T19:20']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var value:String = "1997-07-16T19:20";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20:02']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var value:String = "1997-07-16T19:20:02";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:02")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20:02']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var value:String = "1997-07-16T19:20:02.234";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:02")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20:02']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var value:String = "1997-07-16T19:20:02+0300";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:02+0300")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20:02']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var value:String = "1997-07-16T19:20:02+03:00";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:02+0300")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var value:String = "1997-07-16Z";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 07:00:00 GMT+07")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var value:String = "1997-07-16T12:20Z";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:00:00 GMT+07")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20:02']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var value:String = "1997-07-16T12:20:02Z";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:02 GMT+07")).time, returnTestValue.time);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = '1997-07-16T19:20:02']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var value:String = "1997-07-16T12:20:02.234Z";
			var returnTestValue:Date = DateTimeUtil.parseIsoDate(value);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue((new Date("1997-07-16 19:20:02 GMT+07")).time, returnTestValue.time);
			//-------------------------------------
		}
	}
}