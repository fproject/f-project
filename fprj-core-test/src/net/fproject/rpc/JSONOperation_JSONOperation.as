package net.fproject.rpc
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONOperation(service:JSONRemoteObject = null, name:String = null)</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONOperation
	 */
	public class JSONOperation_JSONOperation
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

		[Test (description="Normal case: [service = new JSONRemoteObject(), name = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = new JSONRemoteObject()</code><br/>
		 * <code>name = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var service:JSONRemoteObject = new JSONRemoteObject();
			var name:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:JSONOperation = new JSONOperation(service, name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(name, returnTestValue.name);
			assertFalse(returnTestValue.namedParams);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = null, name = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = null</code><br/>
		 * <code>name = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var service:JSONRemoteObject = null;
			var name:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:JSONOperation = new JSONOperation(service, name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(name, returnTestValue.name);
			assertFalse(returnTestValue.namedParams);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = new JSONRemoteObject(), name = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = new JSONRemoteObject()</code><br/>
		 * <code>name = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var service:JSONRemoteObject = new JSONRemoteObject();
			var name:String = "";
			var returnTestValue:JSONOperation = new JSONOperation(service, name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(name, returnTestValue.name);
			assertFalse(returnTestValue.namedParams);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = null, name = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = null</code><br/>
		 * <code>name = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var service:JSONRemoteObject = null;
			var name:String = "";
			var returnTestValue:JSONOperation = new JSONOperation(service, name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(name, returnTestValue.name);
			assertFalse(returnTestValue.namedParams);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = new JSONRemoteObject(), name = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = new JSONRemoteObject()</code><br/>
		 * <code>name = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var service:JSONRemoteObject = new JSONRemoteObject();
			var name:String = null;
			var returnTestValue:JSONOperation = new JSONOperation(service, name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(name, returnTestValue.name);
			assertFalse(returnTestValue.namedParams);
			//-------------------------------------
		}

		[Test (description="Boundary case: [service = null, name = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>service = null</code><br/>
		 * <code>name = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var service:JSONRemoteObject = null;
			var name:String = null;
			var returnTestValue:JSONOperation = new JSONOperation(service, name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(service, returnTestValue.service);
			assertEquals(name, returnTestValue.name);
			assertFalse(returnTestValue.namedParams);
			//-------------------------------------
		}

	}
}