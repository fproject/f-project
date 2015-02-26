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
	 * <code>public function dateAddByWorkingDays(time:Date, days:Number):Date</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_dateAddByWorkingDays
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

		[Test (description="Normal case: [time = new Date(), days = 0]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>days = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var time:Date = new Date();
			var days:Number = 0;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, days = 0]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>days = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var time:Date = null;
			var days:Number = 0;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), days = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>days = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var time:Date = new Date();
			var days:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, days = Number.POSITIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>days = Number.POSITIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var time:Date = null;
			var days:Number = Number.POSITIVE_INFINITY;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), days = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>days = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var time:Date = new Date();
			var days:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, days = Number.NEGATIVE_INFINITY]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>days = Number.NEGATIVE_INFINITY</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var time:Date = null;
			var days:Number = Number.NEGATIVE_INFINITY;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), days = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>days = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var time:Date = new Date();
			var days:Number = Number.MAX_VALUE;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, days = Number.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>days = Number.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var time:Date = null;
			var days:Number = Number.MAX_VALUE;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), days = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>days = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var time:Date = new Date();
			var days:Number = Number.MIN_VALUE;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, days = Number.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>days = Number.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var time:Date = null;
			var days:Number = Number.MIN_VALUE;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = new Date(), days = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = new Date()</code><br/>
		 * <code>days = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var time:Date = new Date();
			var days:Number = NaN;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [time = null, days = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>time = null</code><br/>
		 * <code>days = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var time:Date = null;
			var days:Number = NaN;
			var returnTestValue:Date = workcalendar.dateAddByWorkingDays(time, days);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}