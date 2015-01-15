package net.fproject.utils
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import mx.core.mx_internal;
	import mx.formatters.DateBase;
	import mx.formatters.NumberFormatter;
	
	import net.fproject.fproject_internal;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function parseDuration(s:String, minutesPerDay:Number = 0, minutesPerWeek:Number = 0, daysPerMonth:Number = 0):Number</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_parseDuration
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

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase025():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase026():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase027():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase028():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase029():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase030():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase031():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase032():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase033():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase034():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase035():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase036():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase037():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase038():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase039():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase040():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase041():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase042():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase043():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase044():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase045():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase046():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase047():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase048():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase049():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase050():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase051():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase052():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase053():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase054():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase055():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase056():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase057():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase058():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase059():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase060():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase061():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase062():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase063():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase064():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase065():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase066():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase067():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase068():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase069():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase070():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase071():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase072():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase073():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase074():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase075():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase076():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase077():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase078():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase079():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase080():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase081():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase082():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase083():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase084():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase085():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase086():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase087():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase088():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase089():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase090():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase091():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase092():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase093():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase094():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase095():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase096():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase097():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase098():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase099():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase100():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase101():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase102():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase103():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase104():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase105():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase106():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase107():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase108():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = 0;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase109():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase110():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase111():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase112():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase113():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase114():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase115():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase116():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase117():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase118():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase119():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase120():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase121():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase122():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase123():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase124():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase125():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase126():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase127():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase128():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase129():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase130():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase131():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase132():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase133():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase134():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase135():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase136():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase137():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase138():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase139():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase140():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase141():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase142():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase143():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase144():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase145():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase146():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase147():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase148():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase149():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase150():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase151():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase152():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase153():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase154():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase155():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase156():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase157():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase158():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase159():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase160():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase161():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase162():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase163():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase164():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase165():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase166():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase167():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase168():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase169():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase170():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase171():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase172():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase173():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase174():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase175():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase176():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase177():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase178():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase179():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase180():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase181():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase182():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase183():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase184():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase185():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase186():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase187():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase188():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase189():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase190():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase191():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase192():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase193():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase194():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase195():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase196():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase197():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase198():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase199():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase200():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase201():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase202():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase203():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase204():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase205():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase206():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase207():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase208():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase209():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase210():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase211():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase212():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase213():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase214():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase215():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase216():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase217():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase218():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase219():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase220():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase221():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase222():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase223():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase224():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase225():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase226():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase227():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase228():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase229():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase230():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase231():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase232():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase233():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase234():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase235():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase236():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase237():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase238():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase239():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase240():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase241():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase242():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase243():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase244():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase245():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase246():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase247():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase248():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase249():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase250():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase251():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase252():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase253():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase254():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase255():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase256():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase257():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase258():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase259():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase260():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase261():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase262():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase263():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase264():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase265():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase266():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase267():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase268():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase269():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase270():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase271():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase272():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase273():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase274():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase275():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase276():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase277():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase278():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase279():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase280():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase281():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase282():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase283():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase284():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase285():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase286():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase287():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase288():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase289():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase290():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase291():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase292():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase293():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase294():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase295():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase296():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase297():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase298():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase299():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase300():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase301():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase302():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase303():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase304():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase305():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase306():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase307():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase308():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase309():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase310():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase311():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase312():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase313():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase314():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase315():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase316():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase317():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase318():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase319():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase320():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase321():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase322():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase323():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase324():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase325():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase326():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase327():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase328():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase329():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase330():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase331():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase332():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase333():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase334():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase335():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase336():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase337():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase338():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase339():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase340():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase341():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase342():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase343():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase344():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase345():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase346():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase347():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase348():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase349():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase350():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase351():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase352():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase353():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase354():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase355():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase356():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase357():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase358():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase359():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase360():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase361():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase362():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase363():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase364():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase365():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase366():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase367():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase368():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase369():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase370():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase371():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase372():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase373():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase374():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase375():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase376():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase377():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase378():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase379():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase380():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase381():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase382():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase383():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase384():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase385():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase386():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase387():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase388():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase389():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase390():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase391():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase392():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase393():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase394():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase395():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase396():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase397():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase398():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase399():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase400():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase401():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase402():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase403():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase404():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase405():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase406():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase407():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase408():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase409():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase410():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase411():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase412():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase413():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase414():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase415():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase416():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase417():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase418():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase419():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase420():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase421():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase422():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase423():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase424():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase425():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase426():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase427():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase428():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase429():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase430():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase431():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase432():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MAX_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase433():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase434():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase435():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase436():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase437():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase438():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase439():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase440():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase441():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase442():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase443():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase444():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase445():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase446():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase447():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase448():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase449():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase450():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase451():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase452():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase453():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase454():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase455():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase456():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase457():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase458():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase459():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase460():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase461():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase462():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase463():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase464():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase465():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase466():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase467():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase468():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase469():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase470():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase471():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase472():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase473():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase474():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase475():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase476():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase477():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase478():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase479():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase480():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase481():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase482():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase483():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase484():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase485():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase486():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase487():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase488():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase489():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase490():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase491():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase492():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase493():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase494():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase495():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase496():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase497():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase498():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase499():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase500():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase501():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase502():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase503():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase504():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase505():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase506():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase507():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase508():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase509():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase510():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase511():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase512():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase513():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase514():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase515():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase516():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase517():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase518():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase519():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase520():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase521():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase522():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase523():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase524():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase525():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase526():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase527():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase528():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase529():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase530():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase531():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase532():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase533():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase534():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase535():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase536():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase537():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase538():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase539():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase540():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = Number.MIN_VALUE;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase541():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase542():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase543():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase544():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase545():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase546():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase547():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase548():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase549():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase550():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase551():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase552():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase553():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase554():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase555():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase556():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase557():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = 0, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = 0</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase558():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = 0;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase559():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase560():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase561():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase562():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase563():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase564():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase565():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase566():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase567():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase568():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase569():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase570():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase571():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase572():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase573():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase574():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase575():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.POSITIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.POSITIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase576():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.POSITIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase577():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase578():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase579():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase580():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase581():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase582():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase583():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase584():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase585():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase586():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase587():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase588():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase589():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase590():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase591():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase592():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase593():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.NEGATIVE_INFINITY, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase594():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.NEGATIVE_INFINITY;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase595():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase596():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase597():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase598():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase599():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase600():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase601():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase602():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase603():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase604():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase605():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase606():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase607():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase608():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase609():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase610():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase611():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MAX_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MAX_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase612():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MAX_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase613():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase614():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase615():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase616():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase617():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase618():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase619():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase620():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase621():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase622():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase623():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase624():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase625():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase626():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase627():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase628():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase629():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = Number.MIN_VALUE, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = Number.MIN_VALUE</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase630():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = Number.MIN_VALUE;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase631():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase632():void
		{
			var s:String = "";
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = 0, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase633():void
		{
			var s:String = null;
			var minutesPerDay:Number = 0;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase634():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase635():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.POSITIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase636():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase637():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase638():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.NEGATIVE_INFINITY, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase639():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase640():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase641():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MAX_VALUE, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase642():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase643():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase644():void
		{
			var s:String = "";
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = Number.MIN_VALUE, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase645():void
		{
			var s:String = null;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase646():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase647():void
		{
			var s:String = "";
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, minutesPerDay = NaN, minutesPerWeek = NaN, daysPerMonth = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>minutesPerWeek = NaN</code><br/>
		 * <code>daysPerMonth = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase648():void
		{
			var s:String = null;
			var minutesPerDay:Number = NaN;
			var minutesPerWeek:Number = NaN;
			var daysPerMonth:Number = NaN;
			var returnTestValue:Number = DateTimeUtil.parseDuration(s, minutesPerDay, minutesPerWeek, daysPerMonth);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}