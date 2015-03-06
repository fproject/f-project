package net.fproject.rpc
{
	import mx.messaging.channels.HTTPChannel;
	import mx.messaging.channels.SecureHTTPChannel;
	
	import net.fproject.fproject_internal;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function initEndpoint():void</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONRemoteObject
	 */
	public class JSONRemoteObject_initEndpoint
	{
		private var jsonRemoteObject:JSONRemoteObject;

		[Before]
		public function runBeforeEveryTest():void
		{
			jsonRemoteObject = new JSONRemoteObject("","",null,null,"","",null);
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			jsonRemoteObject = null;
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
			jsonRemoteObject.endpoint = "http://abc.com/xyz/?r=amf";
			jsonRemoteObject.fproject_internal::initEndpoint();
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertTrue(jsonRemoteObject.channelSet.channels[0] is HTTPChannel);
			assertEquals(jsonRemoteObject.endpoint, jsonRemoteObject.channelSet.channels[0].uri);
			assertEquals(jsonRemoteObject.endpoint, jsonRemoteObject.channelSet.channels[0].url);
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
		public function testCase002():void
		{
			jsonRemoteObject.endpoint = "https://abc.com/xyz/?r=amf";
			jsonRemoteObject.fproject_internal::initEndpoint();
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertTrue(jsonRemoteObject.channelSet.channels[0] is SecureHTTPChannel);
			assertEquals(jsonRemoteObject.endpoint, jsonRemoteObject.channelSet.channels[0].uri);
			assertEquals(jsonRemoteObject.endpoint, jsonRemoteObject.channelSet.channels[0].url);
		}

	}
}