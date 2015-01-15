package net.fproject.rpc
{
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function JSONMessage()</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONMessage
	 */
	public class JSONMessage_JSONMessage
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

		[Test (description="Normal case: []")]
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
			var returnTestValue:JSONMessage = new JSONMessage();
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(JSONMessage.CONTENT_TYPE_JSON, returnTestValue.contentType);
			//-------------------------------------
		}

	}
}