package net.fproject.active
{
	import mx.rpc.events.ResultEvent;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function result(data:Object):void</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveCallResponder
	 */
	public class ActiveCallResponder_result
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

		[Test (expected="TypeError",description="Normal case: [data = new Object()]")]
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
			activeCallResponder.result(data);
		}

		[Test (expected="TypeError",description="Boundary case: [data = null]")]
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
			activeCallResponder.result(data);
		}

		[Test (description="Normal case")]
		public function testCase003():void
		{
			var pr:PaginationResult = new PaginationResult();
			pr.items = [];
			pr.meta = {totalCount:0, currentPage:1,pageCount:0};
			var data:Object = new ResultEvent(ResultEvent.RESULT, false, true, pr);
			activeCallResponder.result(data);
		}

	}
}