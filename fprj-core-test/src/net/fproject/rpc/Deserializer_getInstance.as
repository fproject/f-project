package net.fproject.rpc
{
	import net.fproject.serialize.Deserializer;
	
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function getInstance():JSONDataUtil</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONDataUtil
	 */
	public class Deserializer_getInstance
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
			var returnTestValue:Deserializer = Deserializer.getInstance();
			var returnTest1Value:Deserializer = Deserializer.getInstance();
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, returnTest1Value);
			//-------------------------------------
		}

	}
}