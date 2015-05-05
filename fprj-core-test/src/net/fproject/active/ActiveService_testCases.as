package net.fproject.active
{
	import flash.events.Event;
	
	import mx.rpc.CallResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.UIDUtil;
	
	import net.fproject.ServiceTestCaseBase;
	import net.fproject.di.InstanceFactory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.flexunit.async.TestResponder;
	
	import testdata.TestUser;
	import testdata.TestUserProfile;
	import testdata.active.JSONRemoteObject_RESTfulService;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONRemoteObject(destination:String = null)</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONRemoteObject
	 */
	public class ActiveService_testCases extends ServiceTestCaseBase
	{
		private var restService:JSONRemoteObject_RESTfulService;
		
		[Before(async)]
		override public function runBeforeEveryTest():void
		{
			super.runBeforeEveryTest();
			restService = InstanceFactory.getInstance(JSONRemoteObject_RESTfulService) as JSONRemoteObject_RESTfulService;
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
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase100_checkResult, onFault), 2000));
		}
		
		public function testCase100_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is PaginationResult);
			var p:PaginationResult = event.result as PaginationResult;
			for each(var o:Object in p.items)
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
		public function testCase101():void
		{
			var responder:CallResponder = restService.find({condition:"username like :name", params:{":name":"%Batch%"}});
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase101_checkResult, onFault), 2000));
		}
		
		public function testCase101_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is PaginationResult);
			var p:PaginationResult = event.result as PaginationResult;
			for each(var o:Object in p.items)
			{
				assertTrue(o is TestUser);
				assertTrue(TestUser(o).username.indexOf("Batch") != -1);
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
		public function testCase102():void
		{
			var responder:CallResponder = restService.find({condition:"id < :id", params:{":id":5}});
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase102_checkResult, onFault), 2000));
		}
		
		public function testCase102_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is PaginationResult);
			var p:PaginationResult = event.result as PaginationResult;
			for each(var o:Object in p.items)
			{
				assertTrue(o is TestUser);
				assertTrue(Number(TestUser(o).id) < 5);
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
		public function testCase103():void
		{
			var responder:CallResponder = restService.find(null, NaN, NaN, null, null, null, "expand=profile");
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase103_checkResult, onFault), 2000));
		}
		
		public function testCase103_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is PaginationResult);
			var p:PaginationResult = event.result as PaginationResult;
			for each(var o:Object in p.items)
			{
				assertTrue(o is TestUser);
				if(TestUser(o).profile != null)
					assertTrue(TestUser(o).profile is TestUserProfile);
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
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase200_checkResult, onFault), 2000));
		}
		
		public function testCase200_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is TestUser);
			assertEquals("1", TestUser(event.result).id);
			assertEquals(null, TestUser(event.result).profile);
			assertEquals(null, TestUser(event.result).password);	
			assertEquals(null, TestUser(event.result).authKey);
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
		public function testCase201():void
		{
			var responder:CallResponder = restService.findOne("1",null,null,{expand:"profile"});
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase201_checkResult, onFault), 2000));
		}
		
		public function testCase201_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertTrue(event.result is TestUser);
			assertEquals("1", TestUser(event.result).id)			
			assertTrue(TestUser(event.result).profile is TestUserProfile);
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
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase300_checkResult, onFault), 2000));
		}
		
		public function testCase300_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertNotNull(event.result);
		}
		
		[Test (async, description="Normal case",order=3)]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase301():void
		{
			var name:String = "Save User " + UIDUtil.createUID();
			var user:Object = {"id":null,"username":name,"password":"ABC123"};
			var responder:CallResponder = restService.save(user);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase301_added, onFault), 2000, user));
		}
		
		public function testCase301_added(event:ResultEvent, user:Object):void
		{
			var id:Object = event.result;
			user.id = id;
			var responder:CallResponder = restService.findOne(id);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase301_checkAndSaveAgain, onFault), 2000, user));	
		}
		
		public function testCase301_checkAndSaveAgain(event:ResultEvent, user:Object):void
		{
			var u:TestUser = TestUser(event.result);
			assertEquals(user.username, u.username);		
			u.username = "aaa";
			u.password = "newpassword"
			var responder:CallResponder = restService.save(u, null, null, ['id','password']);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase301_findAgain, onFault), 2000, user));
		}
		
		public function testCase301_findAgain(event:ResultEvent, user:Object):void
		{
			var id:Object = event.result;
			var responder:CallResponder = restService.findOne(id);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase301_checkFinalResult, onFault), 2000, user));	
		}
		
		public function testCase301_checkFinalResult(event:ResultEvent, user:Object):void
		{
			assertNotNull(event.result);
			assertEquals(user.id, TestUser(event.result).id);
			assertEquals(user.username, TestUser(event.result).username);
			assertEquals(null, TestUser(event.result).password);	
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
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase400_checkResult, onFault), 2000));
		}
		
		public function testCase400_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertNotNull(event.result);
			assertTrue(event.result.hasOwnProperty("insertCount"));
			assertTrue(event.result.hasOwnProperty("lastId"));
			assertEquals(3, event.result["insertCount"]);
		}
		
		[Test (async, description="Normal case",order=1)]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase401():void
		{
			var id:String = UIDUtil.createUID();
			var responder:CallResponder = restService.batchSave(
				[
					{"id":"6","username":"Batch User 01" + id,"password":"ABC123"},
					{"id":"7","username":"Batch User 02" + id,"password":"ABC123"},
					{"id":"8","username":"Batch User 03" + id,"password":"ABC123"}
				]);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase401_checkResult, onFault), 2000));
		}
		
		public function testCase401_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertNotNull(event.result);
			assertTrue(event.result.hasOwnProperty("updateCount"));
			assertEquals(3, event.result["updateCount"]);
		}
		
		[Test (async, description="Normal case",order=2)]
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
			var id:String = UIDUtil.createUID();
			var responder:CallResponder = restService.save({"id":null,"username":"Batch User " + id,"password":"ABC123"});
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase500_added, onFault), 2000));
		}
		
		public function testCase500_added(event:ResultEvent, passThroughData:Object):void
		{
			var responder:CallResponder = restService.remove(event.result);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase500_checkResult, onFault), 2000));	
		}
		
		public function testCase500_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertEquals("", event.result);			
		}
		
		[Test (async, description="Normal case",order=3)]
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
			var id:String = UIDUtil.createUID();
			var responder:CallResponder = restService.batchSave(
				[{"id":null,"username":"Batch User " + id,"password":"ABC123"},
				{"id":null,"username":"Batch User " + id,"password":"ABC123"}]);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase600_added, onFault), 2000));
		}
		
		public function testCase600_added(event:ResultEvent, passThroughData:Object):void
		{
			var batchSaveReturn:Object = event.result;
			var a:Array = [];
			for(var i:int = int(batchSaveReturn.insertCount); i > 0; i--)
			{
				a.push(int(batchSaveReturn.lastId) - i + 1);
			}
			var responder:CallResponder = restService.batchRemove(a);
			responder.token.addResponder(Async.asyncResponder(this, new TestResponder(testCase600_checkResult, onFault), 2000));	
		}
		
		public function testCase600_checkResult(event:ResultEvent, passThroughData:Object):void
		{
			assertEquals(2, event.result);			
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
		public function testCase700():void
		{
			var activedataProvider:IActiveDataProvider = restService.createDataProvider({pagination:{perPage:11}});
			Async.handleEvent(this, activedataProvider, 'resultChanged', testCase700_checkResult, 2000, activedataProvider);
		}
		
		public function testCase700_checkResult(event:Event, activedataProvider:ActiveDataProvider):void
		{
			assertNotNull(activedataProvider.paginationResult);
			assertEquals(11, activedataProvider.paginationResult.perPage);
			for each(var o:Object in activedataProvider)
			{
				assertTrue(o is TestUser);
			}
		}
		
		
	}
}