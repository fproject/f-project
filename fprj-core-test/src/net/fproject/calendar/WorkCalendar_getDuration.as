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
	 * <code>public function getDuration(startDate:Date, endDate:Date):Number</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_getDuration
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

		[Test (description="Normal case: [startDate = new Date(), endDate = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>startDate = new Date()</code><br/>
		 * <code>endDate = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var startDate:Date = new Date();
			var endDate:Date = new Date();
			var returnTestValue:Number = workcalendar.getDuration(startDate, endDate);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [startDate = null, endDate = new Date()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>startDate = null</code><br/>
		 * <code>endDate = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var startDate:Date = null;
			var endDate:Date = new Date();
			var returnTestValue:Number = workcalendar.getDuration(startDate, endDate);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [startDate = new Date(), endDate = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>startDate = new Date()</code><br/>
		 * <code>endDate = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var startDate:Date = new Date();
			var endDate:Date = null;
			var returnTestValue:Number = workcalendar.getDuration(startDate, endDate);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [startDate = null, endDate = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>startDate = null</code><br/>
		 * <code>endDate = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var startDate:Date = null;
			var endDate:Date = null;
			var returnTestValue:Number = workcalendar.getDuration(startDate, endDate);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}