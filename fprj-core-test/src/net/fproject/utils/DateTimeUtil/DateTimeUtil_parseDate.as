package net.fproject.utils.DateTimeUtil
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import mx.core.mx_internal;
	import mx.formatters.DateBase;
	import mx.formatters.NumberFormatter;
	
	import net.fproject.fproject_internal;
	import net.fproject.utils.DateTimeUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function parseDate(strDate:String, formatString:String = null):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_parseDate
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

		[Test (description="Normal case: [strDate = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', formatString = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>formatString = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var strDate:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var formatString:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = '', formatString = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = ""</code><br/>
		 * <code>formatString = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var strDate:String = "";
			var formatString:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = null, formatString = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = null</code><br/>
		 * <code>formatString = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var strDate:String = null;
			var formatString:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', formatString = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>formatString = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var strDate:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var formatString:String = "";
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = '', formatString = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = ""</code><br/>
		 * <code>formatString = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var strDate:String = "";
			var formatString:String = "";
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = null, formatString = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = null</code><br/>
		 * <code>formatString = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var strDate:String = null;
			var formatString:String = "";
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', formatString = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>formatString = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var strDate:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var formatString:String = null;
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = '', formatString = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = ""</code><br/>
		 * <code>formatString = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var strDate:String = "";
			var formatString:String = null;
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [strDate = null, formatString = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>strDate = null</code><br/>
		 * <code>formatString = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var strDate:String = null;
			var formatString:String = null;
			var returnTestValue:Date = DateTimeUtil.parseDate(strDate, formatString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}