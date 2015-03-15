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

	use namespace fproject_internal;
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal static function setTimeOfDayInMillis(date:Date, millis:Number):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_setTimeOfDayInMillis
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

		[Test (description="Normal case: [date = new Date(), millis = 0]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <code>millis = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var date:Date = new Date();
			var millis:Number = 0;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = null, millis = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <code>millis = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var date:Date = null;
			var millis:Number = 0;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = new Date(), millis = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <code>millis = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var date:Date = new Date();
			var millis:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = null, millis = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <code>millis = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var date:Date = null;
			var millis:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = new Date(), millis = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <code>millis = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var date:Date = new Date();
			var millis:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = null, millis = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <code>millis = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var date:Date = null;
			var millis:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = new Date(), millis = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <code>millis = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var date:Date = new Date();
			var millis:Number = Number.MAX_VALUE;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = null, millis = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <code>millis = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var date:Date = null;
			var millis:Number = Number.MAX_VALUE;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = new Date(), millis = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <code>millis = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var date:Date = new Date();
			var millis:Number = Number.MIN_VALUE;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = null, millis = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <code>millis = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var date:Date = null;
			var millis:Number = Number.MIN_VALUE;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = new Date(), millis = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = new Date()</code><br/>
		 * <code>millis = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var date:Date = new Date();
			var millis:Number = NaN;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [date = null, millis = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date = null</code><br/>
		 * <code>millis = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var date:Date = null;
			var millis:Number = NaN;
			var returnTestValue:Date = DateTimeUtil.setTimeOfDayInMillis(date, millis);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}