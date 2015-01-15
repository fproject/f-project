package net.fproject.utils
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function daysDurationToString(days:Number, showUnit:Boolean):String</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_daysDurationToString
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

		[Test (description="Normal case: [days = 0, showUnit = false]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var days:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("0 day",returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var days:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var days:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var days:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var days:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var days:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Normal case: [days = 0, showUnit = true]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var days:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var days:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var days:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var days:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var days:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [days = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>days = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var days:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.daysDurationToString(days, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}