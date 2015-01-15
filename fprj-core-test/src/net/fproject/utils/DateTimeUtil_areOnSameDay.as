package net.fproject.utils
{
	import net.fproject.fproject_internal;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.internals.flexunit_internal;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal static function areOnSameDay(date1:Date, date2:Date):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.utils.DateTimeUtil
	 */
	public class DateTimeUtil_areOnSameDay
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

		[Test (description="Normal case: [date1 = new Date(), date2 = new Date()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date1 = new Date()</code><br/>
		 * <code>date2 = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var date1:Date = new Date();
			var date2:Date = new Date();
			var returnTestValue:Boolean = DateTimeUtil.fproject_internal::areOnSameDay(date1, date2);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [date1 = null, date2 = new Date()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date1 = null</code><br/>
		 * <code>date2 = new Date()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var date1:Date = null;
			var date2:Date = new Date();
			var returnTestValue:Boolean = DateTimeUtil.fproject_internal::areOnSameDay(date1, date2);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [date1 = new Date(), date2 = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date1 = new Date()</code><br/>
		 * <code>date2 = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var date1:Date = new Date();
			var date2:Date = null;
			var returnTestValue:Boolean = DateTimeUtil.flexunit_internal::areOnSameDay(date1, date2);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [date1 = null, date2 = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>date1 = null</code><br/>
		 * <code>date2 = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var date1:Date = null;
			var date2:Date = null;
			var returnTestValue:Boolean = DateTimeUtil.flexunit_internal::areOnSameDay(date1, date2);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

	}
}