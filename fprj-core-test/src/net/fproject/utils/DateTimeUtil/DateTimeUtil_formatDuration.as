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
	 * <code>public static function formatDuration(duration:Number, minutesPerDay:Number = NaN, showUnit:Boolean = false):String</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_formatDuration
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

		[Test (description="Normal case: [duration = 0, minutesPerDay = 0, showUnit = true]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = 0, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = 0, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = 0, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = 0, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = 0, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.MAX_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase025():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase026():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase027():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase028():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase029():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.MIN_VALUE, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase030():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase031():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase032():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase033():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase034():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase035():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = NaN, showUnit = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase036():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = true;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = 0, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase037():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = 0, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase038():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = 0, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase039():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = 0, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase040():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = 0, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase041():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = 0, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = 0</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase042():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = 0;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase043():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase044():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase045():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase046():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase047():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.POSITIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.POSITIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase048():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.POSITIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase049():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase050():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase051():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase052():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase053():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.NEGATIVE_INFINITY, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase054():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.NEGATIVE_INFINITY;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase055():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase056():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase057():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase058():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase059():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.MAX_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.MAX_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase060():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.MAX_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase061():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase062():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase063():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase064():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase065():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = Number.MIN_VALUE, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = Number.MIN_VALUE</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase066():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = Number.MIN_VALUE;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = 0, minutesPerDay = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = 0</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase067():void
		{
			var duration:Number = 0;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.POSITIVE_INFINITY, minutesPerDay = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase068():void
		{
			var duration:Number = Number.POSITIVE_INFINITY;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.NEGATIVE_INFINITY, minutesPerDay = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase069():void
		{
			var duration:Number = Number.NEGATIVE_INFINITY;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MAX_VALUE, minutesPerDay = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MAX_VALUE</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase070():void
		{
			var duration:Number = Number.MAX_VALUE;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = Number.MIN_VALUE, minutesPerDay = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = Number.MIN_VALUE</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase071():void
		{
			var duration:Number = Number.MIN_VALUE;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [duration = NaN, minutesPerDay = NaN, showUnit = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>duration = NaN</code><br/>
		 * <code>minutesPerDay = NaN</code><br/>
		 * <code>showUnit = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase072():void
		{
			var duration:Number = NaN;
			var minutesPerDay:Number = NaN;
			var showUnit:Boolean = false;
			var returnTestValue:String = DateTimeUtil.formatDuration(duration, null, showUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}