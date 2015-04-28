package net.fproject.active
{
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function get service():ActiveService</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_get_service
	{
		private var activedataprovider:ActiveDataProvider;
		private var activeService:ActiveService = new ActiveService;
		[Before]
		public function runBeforeEveryTest():void
		{
			activedataprovider = new ActiveDataProvider(activeService,
				{criteria:"ccc", pagination:{page:10,perPage:100}});
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
			var returnTestValue:ActiveService = activedataprovider.service;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(activeService,returnTestValue);
			//-------------------------------------
		}

	}
}