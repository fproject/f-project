package net.fproject.active
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function ActiveCallResponder(activeDataProvider:ActiveDataProvider)</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveCallResponder
	 */
	public class ActiveCallResponder_ActiveCallResponder
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

		[Test (description="Normal case: [activeDataProvider = new ActiveDataProvider()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>activeDataProvider = new ActiveDataProvider()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var activeDataProvider:ActiveDataProvider = new ActiveDataProvider(null);
			var returnTestValue:ActiveCallResponder = new ActiveCallResponder(activeDataProvider);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(activeDataProvider.criteria);
			assertEquals(activeDataProvider, returnTestValue.activeDataProvider);
			//-------------------------------------
		}

		[Test (description="Boundary case: [activeDataProvider = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>activeDataProvider = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var activeDataProvider:ActiveDataProvider = null;
			var returnTestValue:ActiveCallResponder = new ActiveCallResponder(activeDataProvider);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue.activeDataProvider);
			//-------------------------------------
		}

	}
}