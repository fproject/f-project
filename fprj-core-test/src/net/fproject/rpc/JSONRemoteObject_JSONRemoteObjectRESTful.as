package net.fproject.rpc
{
	import mx.rpc.AsyncToken;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.ServiceTestCaseBase;
	import net.fproject.di.InstanceFactory;
	
	import org.flexunit.asserts.assertEquals;
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
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase001_checkResult, null), 2000, null));
		}
		
		public function testCase001_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is Array);
			assertEquals("1", event.result.id);
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
			var at:AsyncToken = restService.findOne("1").token;
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},2000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},2500);
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
			var at:AsyncToken = restService.save({"id":null,"name":"User 04","bod":1325397000000}).token;
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},2000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},2500);
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
			var at:AsyncToken = restService.batchSave(
				[
					{"id":null,"name":"Batch User 01","bod":1325397000000},
					{"id":null,"name":"Batch User 02","bod":1325398000000},
					{"id":null,"name":"Batch User 03","bod":1325399000000}
				]).token;
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},2000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},2500);
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
			var at:AsyncToken = restService.remove("1").token;
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(true);
				},2000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},2500);
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
			var at:AsyncToken = restService.batchRemove([2,3]).token;
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},2000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},2500);
		}
	}
}