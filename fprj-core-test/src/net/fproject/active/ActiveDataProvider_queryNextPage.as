package net.fproject.active
{
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.ServiceTestCaseBase;
	import net.fproject.di.InstanceFactory;
	
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.flexunit.async.TestResponder;
	
	import testdata.TestUser;
	import testdata.active.JSONRemoteObject_RESTfulService;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function queryNextPage():void</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_queryNextPage extends ServiceTestCaseBase
	{
		private var restService:JSONRemoteObject_RESTfulService;
		
		private var activedataProvider:ActiveDataProvider;

		[Before(async)]
		override public function runBeforeEveryTest():void
		{
			restService = InstanceFactory.getInstance(JSONRemoteObject_RESTfulService) as JSONRemoteObject_RESTfulService;
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activedataProvider = null;
			restService = null;
			//Your test data cleaning
		}

		public function onFault(data:Object, passThroughData:Object ):void 
		{
			throw new Error("Test was failed: data = " + data + ", passThroughData = " + passThroughData);
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
			var resp:ActiveCallResponder = activedataProvider.fetchNextPage();
			resp.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase001_checkResult, onFault), 2000));
		}
		
		public function testCase001_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is PaginationResult);
			var p:PaginationResult = event.result as PaginationResult;
			for each(var o:Object in p.items)
			{
				assertTrue(o is TestUser);
			}
		}

	}
}