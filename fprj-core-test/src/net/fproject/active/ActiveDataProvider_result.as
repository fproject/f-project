package net.fproject.active
{
	import mx.rpc.events.ResultEvent;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function result(data:Object):void</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_result
	{
		private var activeDataProvider:ActiveDataProvider;

		[Before]
		public function runBeforeEveryTest():void
		{
			activeDataProvider = new ActiveDataProvider(null);
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activeDataProvider = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [data = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>data = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var data:Object = new Object();
			activeDataProvider.result(data);
		}

		[Test (description="Boundary case: [data = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>data = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var data:Object = null;
			activeDataProvider.result(data);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
		}

		[Test (description="Normal case")]
		public function testCase003():void
		{
			var pr:PaginationResult = new PaginationResult();
			pr.items = [];
			pr.meta = {totalCount:0, currentPage:1,pageCount:0};
			var data:Object = new ResultEvent(ResultEvent.RESULT, false, true, pr);
			activeDataProvider.result(data);
		}
	}
}