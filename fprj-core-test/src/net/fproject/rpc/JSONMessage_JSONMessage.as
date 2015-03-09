package net.fproject.rpc
{
	import mx.core.mx_internal;
	import mx.messaging.Channel;
	import mx.rpc.AsyncToken;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONMessage(operation:JSONOperation, sendingArgs:Array, token:AsyncToken)</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONMessage
	 */
	public class JSONMessage_JSONMessage
	{
		private var service:JSONRemoteObject;
		private const BASE_URL:String = "http://abc.com/test-service";
		[Before]
		public function runBeforeEveryTest():void
		{
			service = new JSONRemoteObject("TestService", null, new Channel, null, null, null, null);
			service.source = BASE_URL;
		}

		[After]
		public function runAfterEveryTest():void
		{
			//Your test data cleaning
		}

		[Test (description="Normal case: [operation = new JSONOperation(), sendingArgs = [new Object()], token = new AsyncToken()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = new JSONOperation()</code><br/>
		 * <code>sendingArgs = [new Object()]</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{			
			var operation:JSONOperation = new JSONOperation();
			operation.route="?criteria={0}&page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "GET";
			var sendingArgs:Array = [null, NaN, 10, null];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			assertEquals(BASE_URL + "?per-page=10", returnTestValue.url);
		}

		[Test (description="Boundary case: [operation = null, sendingArgs = [new Object()], token = new AsyncToken()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = null</code><br/>
		 * <code>sendingArgs = [new Object()]</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var operation:JSONOperation = new JSONOperation();
			operation.route="?criteria={0}&page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "GET";
			var obj:Object = {a:"A", b:"B"};
			var sendingArgs:Array = [obj, NaN, NaN, null];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			var b:Boolean = (BASE_URL + "?criteria={\"a\":\"A\",\"b\":\"B\"}" == returnTestValue.url) || (BASE_URL + "?criteria={\"b\":\"B\",\"a\":\"A\"}" == returnTestValue.url);
			assertTrue(b);
		}

		[Test (description="Boundary case: [operation = new JSONOperation(), sendingArgs = [], token = new AsyncToken()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = new JSONOperation()</code><br/>
		 * <code>sendingArgs = []</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var operation:JSONOperation = new JSONOperation();
			operation.route="?page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "GET";
			var obj:Object = {a:"A", b:"B"};
			var sendingArgs:Array = [obj, NaN, NaN, null];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			assertEquals(BASE_URL, returnTestValue.url);
			assertNull(returnTestValue.body);
		}

		[Test (description="Boundary case: [operation = null, sendingArgs = [], token = new AsyncToken()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = null</code><br/>
		 * <code>sendingArgs = []</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var operation:JSONOperation = new JSONOperation();
			operation.route="?page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "POST";
			var obj:Object = {a:"A", b:"B"};
			var sendingArgs:Array = [obj, NaN, NaN, null];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			assertEquals(BASE_URL, returnTestValue.url);
			var b:Boolean = "{\"a\":\"A\",\"b\":\"B\"}" == returnTestValue.body || "{\"b\":\"B\",\"a\":\"A\"}" == returnTestValue.body;
			assertTrue(b);
		}

		[Test (description="Boundary case: [operation = new JSONOperation(), sendingArgs = null, token = new AsyncToken()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = new JSONOperation()</code><br/>
		 * <code>sendingArgs = null</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var operation:JSONOperation = new JSONOperation();
			operation.route="?criteria={0}&page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "GET";
			var sendingArgs:Array = [null, 5, 10, "ABC"];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			assertEquals(BASE_URL + "?page=5&per-page=10&sort=ABC", returnTestValue.url);
		}

		[Test (description="Boundary case: [operation = null, sendingArgs = null, token = new AsyncToken()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = null</code><br/>
		 * <code>sendingArgs = null</code><br/>
		 * <code>token = new AsyncToken()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var operation:JSONOperation = new JSONOperation();
			operation.route="?criteria={0}&page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "GET";
			var sendingArgs:Array = [null, NaN, NaN, "ABC"];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			assertEquals(BASE_URL + "?sort=ABC", returnTestValue.url);
		}

		[Test (description="Boundary case: [operation = new JSONOperation(), sendingArgs = [new Object()], token = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = new JSONOperation()</code><br/>
		 * <code>sendingArgs = [new Object()]</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var operation:JSONOperation = new JSONOperation();
			operation.route="?criteria={0}&page={1}&per-page={2}&sort={3}";
			operation.mx_internal::setService(service);
			operation.method = "GET";
			var obj:Object = {a:"A", b:"B"};
			var sendingArgs:Array = [obj, 5, 10, "XYZ"];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = new JSONMessage(operation, sendingArgs, token);
			var s1:String = BASE_URL + "?criteria={\"a\":\"A\",\"b\":\"B\"}&page=5&per-page=10&sort=XYZ";
			var s2:String = BASE_URL + "?criteria={\"b\":\"B\",\"a\":\"A\"}&page=5&per-page=10&sort=XYZ";
			assertTrue(returnTestValue.url == s1 || returnTestValue.url == s2);
		}
	}
}