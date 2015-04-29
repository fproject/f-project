package net.fproject.active
{
	import flash.events.IEventDispatcher;
	import mx.events.FlexEvent;
	
	import org.flexunit.asserts.assertTrue;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function createCursor():IViewCursor</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_createCursor
	{
		private var activedataprovider:ActiveDataProvider;

		[Before]
		public function runBeforeEveryTest():void
		{
			activedataprovider = new ActiveDataProvider({}, new ActiveService);
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activedataprovider = null;
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
			var returnTestValue:IEventDispatcher = IEventDispatcher(activedataprovider.createCursor());
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue.hasEventListener(FlexEvent.CURSOR_UPDATE));
			//-------------------------------------
		}

	}
}