package net.fproject.utils.StringUtil
{
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import net.fproject.utils.StringUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function isBlank(s:String):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_isBlank
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
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Boolean = StringUtil.isBlank(s);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
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
			var returnTestValue:Boolean = StringUtil.isBlank(s);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
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
			var returnTestValue:Boolean = StringUtil.isBlank(s);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

	}
}