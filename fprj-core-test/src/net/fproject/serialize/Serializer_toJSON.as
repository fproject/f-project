package net.fproject.serialize
{
	
	import flash.net.registerClassAlias;
	
	import mx.utils.ObjectUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	
	import testdata.Serializer_toJSON_001;
	import testdata.Serializer_toJSON_003;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function objectToJSON(object:Object):String</code><br/>
	 * of class<br/>
	 * net.fproject.serialize.Vanilla
	 */
	public class Serializer_toJSON
	{
		private var serializer:Serializer;

		[Before]
		public function runBeforeEveryTest():void
		{
			serializer = Serializer.getInstance();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			serializer = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [object = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>object = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var object:Object = {field1:"ABC", field2:1001, field3:true,field4:new Date(),field5:<test x="X" y='y'>ab'c"</test>};
			var returnTestValue:String = serializer.toJSON(object);
			registerClassAlias("Serializer_toJSON_001", Serializer_toJSON_001);
			var decodedObj:Serializer_toJSON_001 = 
				Deserializer.getInstance().fromJSON(returnTestValue, "Serializer_toJSON_001") as Serializer_toJSON_001;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(object.field1, decodedObj.field1);
			assertEquals(object.field2, decodedObj.field2);
			assertEquals(object.field3, decodedObj.field3);
			assertEquals(object.field4.time, decodedObj.field4.time);
			assertEquals(0,ObjectUtil.compare(object.field5, decodedObj.field5));
			//-------------------------------------
		}

		[Test (description="Boundary case: [object = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>object = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var object:Object = null;
			var returnTestValue:String = serializer.toJSON(object);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("null", returnTestValue);
			//-------------------------------------
		}

		
		[Test (description="Normal case: [object = new Object()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>object = new Object()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var object:Serializer_toJSON_003 = 
				new Serializer_toJSON_003({field1:"ABC", field2:1001, field3:true, field99:new Date()});
			var returnTestValue:String = serializer.toJSON(object);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			var decodedObj:Object = JSON.parse(returnTestValue);
			assertEquals(object.field1, decodedObj.field1);
			assertEquals(object.field2, decodedObj.field2);
			assertEquals(object.field3, decodedObj.field3);
			assertTrue(!decodedObj.hasOwnProperty("field99"));
			//-------------------------------------
		}
	}
}