package net.fproject.active
{
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function get pagination():Object</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_get_pagination
	{
		private var activedataprovider:ActiveDataProvider;

		[Before]
		public function runBeforeEveryTest():void
		{
			activedataprovider = new ActiveDataProvider(
				{criteria:"ccc", pagination:{page:10,perPage:100}},
				new ActiveService);
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activedataprovider = null;
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
			var returnTestValue:Object = activedataprovider.pagination;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(10, returnTestValue.page);
			assertEquals(100, returnTestValue.perPage);
			//-------------------------------------
		}

	}
}