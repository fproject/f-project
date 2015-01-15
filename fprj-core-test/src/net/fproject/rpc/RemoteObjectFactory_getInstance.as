package net.fproject.rpc
{
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.config.ServerConfig;
	import mx.utils.ObjectUtil;
	
	import net.fproject.fproject_internal;
	import net.fproject.utils.StringUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	
	import testdata.RemoteObjectFactory_getInstance_001;
	import testdata.RemoteObjectFactory_getInstance_003;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function getInstance(proxy:Object):IRemoteObject</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.RemoteObjectFactory
	 */
	public class RemoteObjectFactory_getInstance
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

		[Test (description="Normal case: [proxy = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>proxy = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var returnTestValue:IRemoteObject = RemoteObjectFactory.getInstance(RemoteObjectFactory_getInstance_001);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue is JSONRemoteObject);
			var jsonRemote:JSONRemoteObject = JSONRemoteObject(returnTestValue);
			assertEquals("http-destination", jsonRemote.destination);
			
			var cs:ChannelSet = ServerConfig.getChannelSet("http-destination");
			var channel:Channel = ServerConfig.getChannel(cs.channelIds[0]);
			var url:String = StringUtil.endsWith(channel.url, "/") ? channel.url + "myService" : channel.url + "/myService";
			assertEquals(url, jsonRemote.source);
			
			var meta:Object = jsonRemote.fproject_internal::operationNameToMetadata["method01"];
			assertEquals(0, ObjectUtil.compare({method:"POST", returning:"MyModel", namedParams:true}, meta));
			//-------------------------------------
		}

		[Test (expected="TypeError",description="Boundary case: [proxy = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>proxy = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var proxy:Object = null;
			var returnTestValue:IRemoteObject = RemoteObjectFactory.getInstance(proxy);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Normal case: [proxy = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>proxy = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var returnTestValue:IRemoteObject = RemoteObjectFactory.getInstance(RemoteObjectFactory_getInstance_003);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue is AMFRemoteObject);
			var amfRemote:AMFRemoteObject = AMFRemoteObject(returnTestValue);
			assertEquals("amf-destination", amfRemote.destination);
			assertEquals("MyService", amfRemote.source);
			//-------------------------------------
		}
	}
}