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
	 * <code>public function isWorkingDayOfWeek(wd:int):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_isWorkingDayOfWeek
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

		[Test (description="Normal case: [wd = 0]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = 0</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var wd:int = 0;
			var returnTestValue:Boolean = workcalendar.isWorkingDayOfWeek(wd);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = int.MAX_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = int.MAX_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var wd:int = int.MAX_VALUE;
			var returnTestValue:Boolean = workcalendar.isWorkingDayOfWeek(wd);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = int.MIN_VALUE]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = int.MIN_VALUE</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var wd:int = int.MIN_VALUE;
			var returnTestValue:Boolean = workcalendar.isWorkingDayOfWeek(wd);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [wd = NaN]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>wd = NaN</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var wd:int = NaN;
			var returnTestValue:Boolean = workcalendar.isWorkingDayOfWeek(wd);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}