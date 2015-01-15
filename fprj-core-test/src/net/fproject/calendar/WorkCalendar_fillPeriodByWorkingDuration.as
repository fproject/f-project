package net.fproject.calendar
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.events.FlexEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	
	import net.fproject.fproject_internal;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.GregorianCalendar;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.LruCache;
	import net.fproject.utils.MessageUtil;
	import net.fproject.utils.ResourceUtil;
	import net.fproject.utils.Time;
	import net.fproject.utils.TimeRange;
	import net.fproject.utils.TimeUnit;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function fillPeriodByWorkingDuration(period:Period, workingDuration:Number, durationUnit:TimeUnit = null):Period</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_fillPeriodByWorkingDuration
	{
		private var workcalendar:WorkCalendar;

		[Before]
		public function runBeforeEveryTest():void
		{
			workcalendar = new WorkCalendar();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			workcalendar = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [period = new Period(), workingDuration = 0, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = 0</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var period:Period = new Period();
			var workingDuration:Number = 0;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = 0, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = 0</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var period:Period = null;
			var workingDuration:Number = 0;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.POSITIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.POSITIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.NEGATIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.NEGATIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.MAX_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.MAX_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.MIN_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.MIN_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = NaN, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = NaN</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var period:Period = new Period();
			var workingDuration:Number = NaN;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = NaN, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = NaN</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var period:Period = null;
			var workingDuration:Number = NaN;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = 0, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = 0</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var period:Period = new Period();
			var workingDuration:Number = 0;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = 0, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = 0</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var period:Period = null;
			var workingDuration:Number = 0;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.POSITIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.POSITIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.NEGATIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.NEGATIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.MAX_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.MAX_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = Number.MIN_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var period:Period = new Period();
			var workingDuration:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = Number.MIN_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var period:Period = null;
			var workingDuration:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), workingDuration = NaN, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>workingDuration = NaN</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var period:Period = new Period();
			var workingDuration:Number = NaN;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, workingDuration = NaN, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>workingDuration = NaN</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var period:Period = null;
			var workingDuration:Number = NaN;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWorkingDuration(period, workingDuration, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}