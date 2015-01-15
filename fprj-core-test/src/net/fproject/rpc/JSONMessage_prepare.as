package net.fproject.rpc
{
	import org.flexunit.asserts.assertFalse;
	import mx.rpc.AsyncToken;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function prepare(operation:JSONOperation, sendingArgs:Array, token:AsyncToken):JSONMessage</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONMessage
	 */
	public class JSONMessage_prepare
	{
		[Before]
		public function runBeforeEveryTest():void
		{
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			//Your test data cleaning
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var sendingArgs:Array = [new Object()];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var operation:JSONOperation = null;
			var sendingArgs:Array = [new Object()];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var sendingArgs:Array = [];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var operation:JSONOperation = null;
			var sendingArgs:Array = [];
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var sendingArgs:Array = null;
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var operation:JSONOperation = null;
			var sendingArgs:Array = null;
			var token:AsyncToken = new AsyncToken();
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
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
			var sendingArgs:Array = [new Object()];
			var token:AsyncToken = null;
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = null</code><br/>
		 * <code>sendingArgs = [new Object()]</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var operation:JSONOperation = null;
			var sendingArgs:Array = [new Object()];
			var token:AsyncToken = null;
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = new JSONOperation()</code><br/>
		 * <code>sendingArgs = []</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var operation:JSONOperation = new JSONOperation();
			var sendingArgs:Array = [];
			var token:AsyncToken = null;
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = null</code><br/>
		 * <code>sendingArgs = []</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var operation:JSONOperation = null;
			var sendingArgs:Array = [];
			var token:AsyncToken = null;
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = new JSONOperation()</code><br/>
		 * <code>sendingArgs = null</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var operation:JSONOperation = new JSONOperation();
			var sendingArgs:Array = null;
			var token:AsyncToken = null;
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>operation = null</code><br/>
		 * <code>sendingArgs = null</code><br/>
		 * <code>token = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var operation:JSONOperation = null;
			var sendingArgs:Array = null;
			var token:AsyncToken = null;
			var returnTestValue:JSONMessage = JSONMessage.prepare(operation, sendingArgs, token);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}