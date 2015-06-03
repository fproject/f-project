package net.fproject.active
{
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function get activeDataProvider():ActiveDataProvider</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveCallResponder
	 */
	public class ActiveCallResponder_get_activeDataProvider
	{
		private var activeDp:ActiveDataProvider;
		private var activeCallResponder:ActiveCallResponder;

		[Before]
		public function runBeforeEveryTest():void
		{
			activeDp = new ActiveDataProvider(null);
			activeCallResponder = new ActiveCallResponder(activeDp);
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activeCallResponder = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: []")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var returnTestValue:IActiveDataProvider = activeCallResponder.activeDataProvider;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(activeDp, returnTestValue);
			//-------------------------------------
		}

	}
}