package net.fproject.utils.StringUtil
{
	import org.flexunit.asserts.assertEquals;
	import net.fproject.utils.StringUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function splitEx(value:String, delims:String):Array</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_splitEx
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

		[Test (description="Normal case: [value = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>delims = ","</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var value:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var delims:String = ",";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue.length, 1);
			assertEquals(returnTestValue[0], value);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = '', delims = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ""</code><br/>
		 * <code>delims = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var value:String = "";
			var delims:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(0, returnTestValue.length);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [value = null, delims = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = null</code><br/>
		 * <code>delims = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var value:String = null;
			var delims:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', delims = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>delims = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var value:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var delims:String = "";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(1, returnTestValue.length);
			assertEquals(value, returnTestValue[0]);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = '', delims = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ""</code><br/>
		 * <code>delims = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var value:String = "";
			var delims:String = "";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(0, returnTestValue.length);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [value = null, delims = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = null</code><br/>
		 * <code>delims = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var value:String = null;
			var delims:String = "";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [value = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', delims = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>delims = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var value:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var delims:String = null;
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = '', delims = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ""</code><br/>
		 * <code>delims = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var value:String = "";
			var delims:String = null;
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(0, returnTestValue.length);
		}

		[Test (expected="Error", description="Boundary case: [value = null, delims = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = null</code><br/>
		 * <code>delims = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var value:String = null;
			var delims:String = null;
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Normal case: [value = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,"</code><br/>
		 * <code>delims = ","</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var value:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,";
			var delims:String = ",";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(1, returnTestValue.length);
			assertEquals("ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789", returnTestValue[0]);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = ',ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ",ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>delims = ","</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var value:String = ",ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var delims:String = ",";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(1, returnTestValue.length);
			assertEquals("ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789", returnTestValue[0]);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = ';ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ";ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,"</code><br/>
		 * <code>delims = ",;"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var value:String = ";ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,";
			var delims:String = ",;";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(1, returnTestValue.length);
			assertEquals("ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789", returnTestValue[0]);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = ',;ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = ";ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,"</code><br/>
		 * <code>delims = ",;"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var value:String = "aaa,;ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,";
			var delims:String = ",;";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(2, returnTestValue.length);
			assertEquals("aaa", returnTestValue[0]);
			assertEquals("ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789", returnTestValue[1]);
			//-------------------------------------			
		}
		
		[Test (description="Normal case: [value = 'aaa,ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "aaa,ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>delims = ","</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var value:String = "aaa,ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var delims:String = ",";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(2, returnTestValue.length);
			assertEquals("aaa", returnTestValue[0]);
			assertEquals("ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789", returnTestValue[1]);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [value = 'aaa,ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,,,,,', delims = ',']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = "aaa,ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,,,,,"</code><br/>
		 * <code>delims = ","</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var value:String = "aaa,ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789,,,,,";
			var delims:String = ",";
			var returnTestValue:Array = StringUtil.splitEx(value, delims);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(2, returnTestValue.length);
			assertEquals("aaa", returnTestValue[0]);
			assertEquals("ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789", returnTestValue[1]);
			//-------------------------------------
		}
	}
}