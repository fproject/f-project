package net.fproject.rpc
{
	import mx.rpc.AsyncToken;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.UIDUtil;
	
	import net.fproject.ServiceTestCaseBase;
	import net.fproject.di.InstanceFactory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.flexunit.async.TestResponder;
	
	import testdata.rpc.JSONRemoteObject_JSONRemoteObjectRESTfulService;
	import testdata.rpc.TestUser;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONRemoteObject(destination:String = null)</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONRemoteObject
	 */
	public class JSONRemoteObject_JSONRemoteObjectRESTful extends ServiceTestCaseBase
	{
		private var restService:JSONRemoteObject_JSONRemoteObjectRESTfulService;
		
		//Just for including the testdata.rpc.TestUser class in to current application domain
		private var dummy:TestUser;
		[Before(async)]
		override public function runBeforeEveryTest():void
		{
			super.runBeforeEveryTest();
			restService = InstanceFactory.getInstance(JSONRemoteObject_JSONRemoteObjectRESTfulService) as JSONRemoteObject_JSONRemoteObjectRESTfulService;
		}

		[After]
		public function runAfterEveryTest():void
		{
			//Your test data cleaning
		}

		[Test (async, description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase100():void
		{
			var responder:CallResponder = restService.find();
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase100_checkResult, null), 2000, null));
		}
		
		public function testCase100_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is Array);
			for each(var o:Object in event.result)
			{
				assertTrue(o is TestUser);
			}
		}
		
		[Test (async, description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase200():void
		{
			var responder:CallResponder = restService.findOne("1");
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase200_checkResult, null), 2000, null));
		}
		
		public function testCase200_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is TestUser);
			assertEquals("1", TestUser(event.result).id)
		}
		
		[Test (async, description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase300():void
		{
			var responder:CallResponder = restService.save({"id":null,"username":"User 04"+UIDUtil.createUID(),"password":"ABC123"});
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase300_checkResult, null), 2000, null));
		}
		
		public function testCase300_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertNotNull(event.result);
		}
		
		[Test (async, description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase400():void
		{
			var id:String = UIDUtil.createUID();
			var responder:CallResponder = restService.batchSave(
				[
					{"id":null,"username":"Batch User 01" + id,"password":"ABC123"},
					{"id":null,"username":"Batch User 02" + id,"password":"ABC123"},
					{"id":null,"username":"Batch User 03" + id,"password":"ABC123"}
				]);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase400_checkResult, null), 2000, null));
		}
		
		public function testCase400_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertNotNull(event.result);
			assertTrue(event.result.hasOwnProperty("insertCount"));
			assertTrue(event.result.hasOwnProperty("lastId"));
			assertEquals(3, event.result["insertCount"]);
		}
		
		[Test (async, description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase500():void
		{
			var responder:CallResponder = restService.remove("3");
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase500_checkResult, null), 2000, null));
		}
		
		public function testCase500_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertEquals("", event.result);			
		}
		
		[Test (async, description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase600():void
		{
			var responder:CallResponder = restService.batchRemove([4,5]);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase600_checkResult, null), 2000, null));
		}
		
		public function testCase600_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertEquals(2, event.result);			
		}
	}
}