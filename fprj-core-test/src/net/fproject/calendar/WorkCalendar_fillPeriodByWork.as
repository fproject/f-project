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
	import net.fproject.core.Time;
	import net.fproject.core.TimeRange;
	import net.fproject.core.TimeUnit;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function fillPeriodByWork(period:Period, work:Number, durationUnit:TimeUnit = null):Period</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_fillPeriodByWork
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

		[Test (description="Normal case: [period = new Period(), work = 0, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = 0</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var period:Period = new Period();
			var work:Number = 0;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = 0, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = 0</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var period:Period = null;
			var work:Number = 0;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.POSITIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var period:Period = new Period();
			var work:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.POSITIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var period:Period = null;
			var work:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.NEGATIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var period:Period = new Period();
			var work:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.NEGATIVE_INFINITY, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var period:Period = null;
			var work:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.MAX_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var period:Period = new Period();
			var work:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.MAX_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var period:Period = null;
			var work:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.MIN_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var period:Period = new Period();
			var work:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.MIN_VALUE, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var period:Period = null;
			var work:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = NaN, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = NaN</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var period:Period = new Period();
			var work:Number = NaN;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = NaN, durationUnit = TimeUnit.DAY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = NaN</code><br/>
		 * <code>durationUnit = TimeUnit.DAY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var period:Period = null;
			var work:Number = NaN;
			var durationUnit:TimeUnit = TimeUnit.DAY;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = 0, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = 0</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var period:Period = new Period();
			var work:Number = 0;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = 0, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = 0</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var period:Period = null;
			var work:Number = 0;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.POSITIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var period:Period = new Period();
			var work:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.POSITIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.POSITIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var period:Period = null;
			var work:Number = Number.POSITIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.NEGATIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var period:Period = new Period();
			var work:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.NEGATIVE_INFINITY, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var period:Period = null;
			var work:Number = Number.NEGATIVE_INFINITY;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.MAX_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var period:Period = new Period();
			var work:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.MAX_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.MAX_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var period:Period = null;
			var work:Number = Number.MAX_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = Number.MIN_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var period:Period = new Period();
			var work:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = Number.MIN_VALUE, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = Number.MIN_VALUE</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var period:Period = null;
			var work:Number = Number.MIN_VALUE;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = new Period(), work = NaN, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = new Period()</code><br/>
		 * <code>work = NaN</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var period:Period = new Period();
			var work:Number = NaN;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [period = null, work = NaN, durationUnit = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>period = null</code><br/>
		 * <code>work = NaN</code><br/>
		 * <code>durationUnit = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var period:Period = null;
			var work:Number = NaN;
			var durationUnit:TimeUnit = null;
			var returnTestValue:Period = workcalendar.fillPeriodByWork(period, work, durationUnit);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}