package net.fproject.active
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import mx.rpc.CallResponder;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function get activeDataProvider():ActiveDataProvider</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveCallResponder
	 */
	public class ActiveCallResponder_get_activeDataProvider
	{
		private var activecallresponder:ActiveCallResponder;

		[Before]
		public function runBeforeEveryTest():void
		{
			activecallresponder = new ActiveCallResponder();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activecallresponder = null;
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
			var returnTestValue:ActiveDataProvider = activecallresponder.activeDataProvider;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}