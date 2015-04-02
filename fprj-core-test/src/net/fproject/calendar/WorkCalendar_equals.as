package net.fproject.calendar
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.events.FlexEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.Time;
	import net.fproject.core.TimeRange;
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.DateTimeUtil;
	import net.fproject.utils.GregorianCalendar;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.LruCache;
	import net.fproject.utils.MessageUtil;
	import net.fproject.utils.ResourceUtil;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function equals(obj:Object):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_equals
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

		[Test (description="Normal case: [obj = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>obj = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var obj:WorkCalendar = new WorkCalendar();
			var returnTestValue:Boolean = workcalendar.equals(obj);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [obj = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>obj = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var obj:WorkCalendar = null;
			var returnTestValue:Boolean = workcalendar.equals(obj);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}