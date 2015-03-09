package net.fproject.rpc
{
	import flash.net.registerClassAlias;
	
	import mx.core.mx_internal;
	import mx.messaging.Channel;
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.messaging.messages.IMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	
	import testdata.rpc.JSONOperation_processResult_001;
	
	use namespace mx_internal;
	
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function processResult(message:IMessage, token:AsyncToken):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONOperation
	 */
	public class JSONOperation_processResult
	{
		private var jsonOperation:JSONOperation;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			jsonOperation = new JSONOperation();
			jsonOperation.setService(new JSONRemoteObject("ABC", null,new Channel,null,null,null,null));
			//Your test data initialization
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			jsonOperation = null;
			//Your test data cleaning
		}
		
		[Test (async,description="Normal case: [message = new IMessage(), token = new AsyncToken()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = new IMessage()</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			registerClassAlias("JSONOperation_processResult_001",JSONOperation_processResult_001);
			jsonOperation.returning = "JSONOperation_processResult_001";
			var message:IMessage = new HTTPRequestMessage();
			message.body = '{"field1":"ABC","field2":1001,"field3":true,"field4":1365699600000,"field5":"2014-01-01T12:00:00 GMT+07","field6":"<elt x=\'abc\'><name>AAA</name><type>1</type></elt>"}';
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:Boolean = jsonOperation.processResult(message, token);
			
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			assertTrue(jsonOperation.mx_internal::_result is JSONOperation_processResult_001);
			var reslt:JSONOperation_processResult_001 = JSONOperation_processResult_001(jsonOperation.mx_internal::_result);
			assertEquals("ABC", reslt.field1);
			assertEquals(1001, reslt.field2);
			assertEquals(true, reslt.field3);
			assertEquals((new Date(1365699600000)).time, reslt.field4.time);
			assertEquals((new Date("1/1/2014 12:00:00 GMT+0700")).time, reslt.field5.time);
			assertEquals((<elt x='abc'><name>AAA</name><type>1</type></elt>).toXMLString(), reslt.field6.toXMLString());
			//-------------------------------------
		}
		
		[Test (async,description="Boundary case: [message = null, token = new AsyncToken()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = null</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var message:IMessage = null;
			var token:AsyncToken = new AsyncToken();
			Async.handleEvent(this, jsonOperation, FaultEvent.FAULT,
				function(e:FaultEvent,o:Object=null):void
				{
				},
				1000,null,
				function():void
				{
					throw new Error("Cannot dispatch Fault event when invoke JSONOperation");
				});
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			var returnTestValue:Boolean = jsonOperation.processResult(message, token);
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (async,description="Boundary case: [message = new IMessage(), token = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = new IMessage()</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var message:IMessage = new HTTPRequestMessage();
			var token:AsyncToken = null;
			Async.handleEvent(this, jsonOperation, FaultEvent.FAULT,
				function(e:FaultEvent,o:Object=null):void
				{
				},
				1000,null,
				function():void
				{
					throw new Error("Cannot dispatch Fault event when invoke JSONOperation");
				});
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			var returnTestValue:Boolean = jsonOperation.processResult(message, token);
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (async,description="Boundary case: [message = null, token = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = null</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var message:IMessage = null;
			var token:AsyncToken = null;
			Async.handleEvent(this, jsonOperation, FaultEvent.FAULT,
				function(e:FaultEvent,o:Object=null):void
				{
				},
				1000,null,
				function():void
				{
					throw new Error("Cannot dispatch Fault event when invoke JSONOperation");
				});
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			var returnTestValue:Boolean = jsonOperation.processResult(message, token);
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (async,description="Normal case: [message = new IMessage(), token = new AsyncToken()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = new IMessage()</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			jsonOperation.returning = null;
			var message:IMessage = new HTTPRequestMessage();
			message.body = '{"field1":"ABC","field2":1001,"field3":true,"field4":1365699600000,"field5":"2014-01-01T12:00:00 GMT+07","field6":"<elt x=\'abc\'><name>AAA</name><type>1</type></elt>"}';
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:Boolean = jsonOperation.processResult(message, token);
			
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			var reslt:Object = jsonOperation.mx_internal::_result;
			assertEquals("ABC", reslt.field1);
			assertEquals(1001, reslt.field2);
			assertEquals(true, reslt.field3);
			assertEquals(1365699600000, reslt.field4);
			assertEquals("2014-01-01T12:00:00 GMT+07", reslt.field5);
			assertEquals("<elt x='abc'><name>AAA</name><type>1</type></elt>", reslt.field6);
			//-------------------------------------
		}
		
	}
}