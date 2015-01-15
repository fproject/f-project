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
	 * <code>public function WorkCalendar(name:String = WorkCalendar.CALRENDAR_NAME_DEFAULT, baseCalendar:WorkCalendar = null)</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_WorkCalendar
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

		[Test (description="Normal case: [name = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', baseCalendar = new WorkCalendar()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>baseCalendar = new WorkCalendar()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var name:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var baseCalendar:WorkCalendar = new WorkCalendar();
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = WorkCalendar.CALRENDAR_NAME_DEFAULT, baseCalendar = new WorkCalendar()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = WorkCalendar.CALRENDAR_NAME_DEFAULT</code><br/>
		 * <code>baseCalendar = new WorkCalendar()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var name:String = WorkCalendar.CALRENDAR_NAME_DEFAULT;
			var baseCalendar:WorkCalendar = new WorkCalendar();
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = '', baseCalendar = new WorkCalendar()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = ""</code><br/>
		 * <code>baseCalendar = new WorkCalendar()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var name:String = "";
			var baseCalendar:WorkCalendar = new WorkCalendar();
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = null, baseCalendar = new WorkCalendar()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = null</code><br/>
		 * <code>baseCalendar = new WorkCalendar()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var name:String = null;
			var baseCalendar:WorkCalendar = new WorkCalendar();
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', baseCalendar = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>baseCalendar = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var name:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var baseCalendar:WorkCalendar = null;
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = WorkCalendar.CALRENDAR_NAME_DEFAULT, baseCalendar = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = WorkCalendar.CALRENDAR_NAME_DEFAULT</code><br/>
		 * <code>baseCalendar = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var name:String = WorkCalendar.CALRENDAR_NAME_DEFAULT;
			var baseCalendar:WorkCalendar = null;
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = '', baseCalendar = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = ""</code><br/>
		 * <code>baseCalendar = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var name:String = "";
			var baseCalendar:WorkCalendar = null;
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = null, baseCalendar = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = null</code><br/>
		 * <code>baseCalendar = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var name:String = null;
			var baseCalendar:WorkCalendar = null;
			var returnTestValue:WorkCalendar = new WorkCalendar(name, baseCalendar);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}