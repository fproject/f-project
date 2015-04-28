package net.fproject.active
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.collections.CursorBookmark;
	import mx.collections.IViewCursor;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function result(data:Object):void</code><br/>
	 * of class<br/>
	 * net.fproject.active.ActiveDataProvider
	 */
	public class ActiveDataProvider_result
	{
		private var activedataprovider:ActiveDataProvider;

		[Before]
		public function runBeforeEveryTest():void
		{
			activedataprovider = new ActiveDataProvider();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			activedataprovider = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [data = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>data = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var data:Object = new Object();
			activedataprovider.result(data);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [data = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>data = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var data:Object = null;
			activedataprovider.result(data);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}