package net.fproject.active
{
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.ServiceTestCaseBase;
	import net.fproject.di.InstanceFactory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.flexunit.async.TestResponder;
	
	import testdata.TestUser;
	import testdata.active.TestUserService;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function get pagination():Object</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_get_paginationResult extends ServiceTestCaseBase
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
			activedataProvider = new ActiveDataProvider({}, restService);
			var returnTestValue:PaginationResult = activedataProvider.paginationResult;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
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
		public function testCase002():void
		{
			activedataProvider = new ActiveDataProvider({}, restService);
			var resp:ActiveCallResponder = activedataProvider.fetchFirstPage();
			resp.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase002_checkResult, onFault), 2000));
		}
		
		public function testCase002_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertNotNull(activedataProvider.paginationResult);
			var p:PaginationResult = activedataProvider.paginationResult;
			assertEquals(1, p.currentPage);
			for each(var o:Object in p.items)
			{
				assertTrue(o is TestUser);
			}
		}		
	}
}