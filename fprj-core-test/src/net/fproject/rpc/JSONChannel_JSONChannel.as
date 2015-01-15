package net.fproject.rpc
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONChannel(id:String, uri:String = "")</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONChannel
	 */
	public class JSONChannel_JSONChannel
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

		[Test (description="Normal case: [id = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', uri = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>uri = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var id:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var uri:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = '', uri = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = ""</code><br/>
		 * <code>uri = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var id:String = "";
			var uri:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = null, uri = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = null</code><br/>
		 * <code>uri = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var id:String = null;
			var uri:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', uri = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>uri = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var id:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var uri:String = "";
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = '', uri = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = ""</code><br/>
		 * <code>uri = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var id:String = "";
			var uri:String = "";
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = null, uri = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = null</code><br/>
		 * <code>uri = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var id:String = null;
			var uri:String = "";
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', uri = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>uri = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var id:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var uri:String = null;
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = '', uri = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = ""</code><br/>
		 * <code>uri = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var id:String = "";
			var uri:String = null;
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

		[Test (description="Boundary case: [id = null, uri = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>id = null</code><br/>
		 * <code>uri = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var id:String = null;
			var uri:String = null;
			var returnTestValue:JSONChannel = new JSONChannel(id, uri);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(id, returnTestValue.id);
			assertEquals(uri, returnTestValue.uri);
			assertEquals(uri, returnTestValue.url);
			//-------------------------------------
		}

	}
}