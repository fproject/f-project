package net.fproject.active
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function ActiveDataProvider(service:ActiveService, criteria:Object)</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_ActiveDataProvider
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

		[Test (description="Normal case: [service = new ActiveService(), criteria = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = new ActiveService()</code><br/>
		 * <code>criteria = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var service:ActiveService = new ActiveService();
			var criteria:Object = new Object();
			var returnTestValue:ActiveDataProvider = new ActiveDataProvider(criteria, service);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertTrue(returnTestValue.criteria is DbCriteria);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = null, criteria = new Object()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = null</code><br/>
		 * <code>criteria = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var service:ActiveService = null;
			var criteria:Object = new Object();
			var returnTestValue:ActiveDataProvider = new ActiveDataProvider(criteria, service);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertTrue(returnTestValue.criteria is DbCriteria);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = new ActiveService(), criteria = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = new ActiveService()</code><br/>
		 * <code>criteria = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var service:ActiveService = new ActiveService();
			var criteria:Object = null;
			var returnTestValue:ActiveDataProvider = new ActiveDataProvider(criteria, service);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(criteria, returnTestValue.criteria);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = null, criteria = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = null</code><br/>
		 * <code>criteria = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var service:ActiveService = null;
			var criteria:Object = null;
			var returnTestValue:ActiveDataProvider = new ActiveDataProvider(criteria, service);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(criteria, returnTestValue.criteria);
			//-------------------------------------
		}

	}
}