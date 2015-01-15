package net.fproject.rpc
{
	import flash.net.URLRequest;
	
	import mx.core.mx_internal;
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.messaging.messages.IMessage;
	
	import net.fproject.utils.StringUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function createURLRequest(message:IMessage):URLRequest</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONChannel
	 */
	public class JSONChannel_createURLRequest
	{
		private var jsonchannel:JSONChannel;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			jsonchannel = new JSONChannel("ABC","http://abc.com.vn");
			//Your test data initialization
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			jsonchannel = null;
			//Your test data cleaning
		}
		
		[Test (description="Normal case: [message = new IMessage()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = new IMessage()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var message:HTTPRequestMessage = new HTTPRequestMessage();
			message.contentType = "application/json";
			message.body = {name:"ABC", id:12345};
			message.method = HTTPRequestMessage.GET_METHOD;
			message.url = jsonchannel.url + "/?r=abc&p1=1&p2=2";
			
			var returnTestValue:URLRequest = jsonchannel.mx_internal::createURLRequest(message);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(message.contentType,returnTestValue.contentType);
			assertEquals(null,returnTestValue.data);
			assertEquals(null,returnTestValue.digest);
			assertEquals(message.method,returnTestValue.method);
			assertEquals(0,returnTestValue.requestHeaders.length);
			assertTrue(StringUtil.startsWith(returnTestValue.url,"http://abc.com.vn/?r=abc&p1=1&p2=2&"))
			assertTrue(StringUtil.endsWith(returnTestValue.url,"&name=ABC&id=12345")
				||StringUtil.endsWith(returnTestValue.url,"&id=12345&name=ABC"));
			//-------------------------------------
		}
		
		[Test (expected="Error",description="Boundary case: [message = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var message:IMessage = null;
			var returnTestValue:URLRequest = jsonchannel.mx_internal::createURLRequest(message);
		}
		
		[Test (description="Normal case: [message = new IMessage()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>message = new IMessage()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var message:HTTPRequestMessage = new HTTPRequestMessage();
			message.contentType = "application/json";
			message.body = {name:"ABC", id:12345};
			message.method = HTTPRequestMessage.POST_METHOD;
			message.url = jsonchannel.url + "/?r=abc&p1=1&p2=2";
			
			var returnTestValue:URLRequest = jsonchannel.mx_internal::createURLRequest(message);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(message.contentType,returnTestValue.contentType);
			assertEquals(message.body,returnTestValue.data);
			assertEquals(null,returnTestValue.digest);
			assertEquals(message.method,returnTestValue.method);
			assertEquals(0,returnTestValue.requestHeaders.length);
			assertEquals("http://abc.com.vn/?r=abc&p1=1&p2=2",returnTestValue.url);
			//-------------------------------------
		}
		
	}
}