package net.fproject.rpc
{
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	
	import testdata.rpc.JSONRemoteObject_JSONRemoteObjectRESTfulService;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONRemoteObject(destination:String = null)</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONRemoteObject
	 */
	public class JSONRemoteObject_JSONRemoteObjectRESTful
	{
		private var restService:JSONRemoteObject;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			restService = RemoteObjectFactory.getInstance(JSONRemoteObject_JSONRemoteObjectRESTfulService) as JSONRemoteObject;
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
		public function testCase001():void
		{
			var at:AsyncToken = restService.findAll();
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result is Array);
				},5000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},5500);
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
		public function testCase002():void
		{
			var at:AsyncToken = restService.findOne(1);
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},5000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},5500);
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
		public function testCase003():void
		{
			var at:AsyncToken = restService.save({"id":null,"name":"User 04","bod":1325397000000});
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},5000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},5500);
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
		public function testCase004():void
		{
			var at:AsyncToken = restService.batchSave(
				[
					{"id":null,"name":"Batch User 01","bod":1325397000000},
					{"id":null,"name":"Batch User 02","bod":1325398000000},
					{"id":null,"name":"Batch User 03","bod":1325399000000}
				]);
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},5000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},5500);
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
		public function testCase005():void
		{
			var at:AsyncToken = restService.remove(1);
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(true);
				},5000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},5500);
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
		public function testCase006():void
		{
			var at:AsyncToken = restService.batchRemove([2,3]);
			Async.handleEvent(this, at, ResultEvent.RESULT, 
				function(e:ResultEvent):void
				{
					assertTrue(e.result != null);
				},5000,null,
				function():void
				{
					throw new Error("ResultEvent not fired!");
				});
			Async.handleEvent(this, at, FaultEvent.FAULT, 
				function(e:FaultEvent):void
				{
					throw new Error(e.message);
				},5500);
		}
	}
}