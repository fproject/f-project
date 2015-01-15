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
	 * <code>public function setWeekDayWorkShifts(wd:int, ws:Vector.<WorkShift>):void</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_setWeekDayWorkShifts
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

		[Test (description="Normal case: [wd = 0, ws = new Vector.<WorkShift>()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = 0</code><br/>
		 * <code>ws = new Vector.<WorkShift>()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var wd:int = 0;
			var ws:Vector.<WorkShift> = new Vector.<WorkShift>();
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = int.MAX_VALUE, ws = new Vector.<WorkShift>()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = int.MAX_VALUE</code><br/>
		 * <code>ws = new Vector.<WorkShift>()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var wd:int = int.MAX_VALUE;
			var ws:Vector.<WorkShift> = new Vector.<WorkShift>();
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = int.MIN_VALUE, ws = new Vector.<WorkShift>()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = int.MIN_VALUE</code><br/>
		 * <code>ws = new Vector.<WorkShift>()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var wd:int = int.MIN_VALUE;
			var ws:Vector.<WorkShift> = new Vector.<WorkShift>();
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = NaN, ws = new Vector.<WorkShift>()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = NaN</code><br/>
		 * <code>ws = new Vector.<WorkShift>()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var wd:int = NaN;
			var ws:Vector.<WorkShift> = new Vector.<WorkShift>();
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = 0, ws = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = 0</code><br/>
		 * <code>ws = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var wd:int = 0;
			var ws:Vector.<WorkShift> = null;
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = int.MAX_VALUE, ws = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = int.MAX_VALUE</code><br/>
		 * <code>ws = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var wd:int = int.MAX_VALUE;
			var ws:Vector.<WorkShift> = null;
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = int.MIN_VALUE, ws = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = int.MIN_VALUE</code><br/>
		 * <code>ws = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var wd:int = int.MIN_VALUE;
			var ws:Vector.<WorkShift> = null;
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = NaN, ws = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = NaN</code><br/>
		 * <code>ws = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var wd:int = NaN;
			var ws:Vector.<WorkShift> = null;
			workcalendar.setWeekDayWorkShifts(wd, ws);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}