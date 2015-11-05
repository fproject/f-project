package net.fproject.active
{
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.ServiceTestCaseBase;
	import net.fproject.di.InstanceFactory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.flexunit.async.TestResponder;
	
	import testdata.TestUser;
	import testdata.active.TestUserService;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function queryNextPage():void</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_fetchFirstPage extends ServiceTestCaseBase
	{
		private var restService:TestUserService;
		
		private var activedataProvider:ActiveDataProvider;

		[Before(async)]
		override public function runBeforeEveryTest():void
		{
			restService = InstanceFactory.getInstance(TestUserService) as TestUserService;
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activedataProvider = null;
			restService = null;
			//Your test data cleaning
		}

		[Test (async,description="Normal case: []")]
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
			activedataProvider = new ActiveDataProvider({}, restService);
			var resp:ActiveCallResponder = activedataProvider.fetchFirstPage();
			resp.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase001_checkResult, onFault), 2000));
		}
		
		public function testCase001_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			checkResult(event, passThroughData, 1);
		}
		
		private function checkResult(event:ResultEvent, passThroughData:Object, page:Number):void
		{
			assertTrue(event.result is PaginationResult);
			var p:PaginationResult = event.result as PaginationResult;
			assertEquals(page, p.currentPage);
			for each(var o:Object in p.items)
			{
				assertTrue(o is TestUser);
			}
		}

	}
}