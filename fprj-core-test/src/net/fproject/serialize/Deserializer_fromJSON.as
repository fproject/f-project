package net.fproject.serialize
{
	import flash.net.registerClassAlias;
	
	import mx.utils.ObjectUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	
	import testdata.serialize.Deserializer_fromJSON_12;
	import testdata.serialize.Deserializer_fromJSON_14;
	import testdata.serialize.Deserializer_fromJSON_15;
	import testdata.serialize.Deserializer_fromJSON_16;
	
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function objectFromJSON(json:String, returning:String):Object</code><br/>
	 * of class<br/>
	 * net.fproject.serialize.Deserializer
	 */
	public class Deserializer_fromJSON
	{
		private var deserializer:Deserializer;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			deserializer = Deserializer.getInstance();
			//Your test data initialization
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			deserializer = null;
			//Your test data cleaning
		}
		
		[Test (order="16",expected="SyntaxError",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Boundary Case<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>returning = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var json:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returning:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}
		
		[Test (order="2",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = ""</code><br/>
		 * <code>returning = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var json:String = "";
			var returning:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(json, returnTestValue);
			//-------------------------------------
		}
		
		[Test (order="3",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var json:String = null;
			var returning:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(null, returnTestValue);
			//-------------------------------------
		}
		
		[Test (order="4",expected="SyntaxError",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>returning = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var json:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returning:String = "";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}
		
		[Test (order="5",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = ""</code><br/>
		 * <code>returning = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var json:String = "";
			var returning:String = "";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(json, returnTestValue);
			//-------------------------------------
		}
		
		[Test (order="6",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var json:String = null;
			var returning:String = "";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(json, returnTestValue);
			//-------------------------------------
		}
		
		[Test (order="7",expected="SyntaxError",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var json:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returning:String = null;
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}
		
		[Test (order="8",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = ""</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var json:String = "";
			var returning:String = null;
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(json, returnTestValue);
			//-------------------------------------
		}
		
		[Test (order="9",description="Boundary case: [json = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', returning = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var json:String = null;
			var returning:String = null;
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(json, returnTestValue);
			//-------------------------------------
		}
		
		[Test (order="10",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var json:String = "{}";
			var returning:String = null;
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(isEmptyObject(returnTestValue));
			//-------------------------------------
		}
		
		private function isEmptyObject(myObject:Object):Boolean {
			var isEmpty:Boolean=true;
			
			for (var s:String in myObject) {
				isEmpty = false;
				break;
			}
			
			return isEmpty;
		}
		
		[Test (order="11",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var json:String = "{}";
			var returning:String = "Employee";
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(0, ObjectUtil.compare({}, returnTestValue));
		}
		
		[Test (order="12",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var json:String = "{}";
			registerClassAlias("Vanilla_objectFromJSON_12", Deserializer_fromJSON_12);
			var returnTestValue:Object = deserializer.fromJSON(json, "Vanilla_objectFromJSON_12");
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue is Deserializer_fromJSON_12);
			assertEquals(0, ObjectUtil.compare(new Deserializer_fromJSON_12, returnTestValue));
			//-------------------------------------
		}
		
		[Test (order="13",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var json:String = '{"field1":"ABC","field2":123,"field3":true}';
			var returning:String = null;
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(0,ObjectUtil.compare({"field1":"ABC","field2":123,"field3":true}, returnTestValue));
			//-------------------------------------
		}
		
		[Test (order="14",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var json:String = '{"field1":"ABC","field2":123,"field3":true}';
			registerClassAlias("Vanilla_objectFromJSON_14", Deserializer_fromJSON_14);
			var returnTestValue:Object = deserializer.fromJSON(json, "Vanilla_objectFromJSON_14");
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue is Deserializer_fromJSON_14);
			var expected: Deserializer_fromJSON_14 = 
				new Deserializer_fromJSON_14({field1:"ABC",field2:123,field3:true});
			assertEquals(0,ObjectUtil.compare(expected, returnTestValue));
			//-------------------------------------
		}
		
		[Test (order="15",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var json:String = '{"field1":1365699600000,"field2":"2014-01-01T12:00:00 GMT+07","field3":"<elt x=\'abc\'><name>AAA</name><type>1</type></elt>"}';
			registerClassAlias("Vanilla_objectFromJSON_15", Deserializer_fromJSON_15);
			var returnTestValue:Object = deserializer.fromJSON(json, "Vanilla_objectFromJSON_15");
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue is Deserializer_fromJSON_15);
			var expected: Deserializer_fromJSON_15 = 
				new Deserializer_fromJSON_15(
					{
						field1:new Date(1365699600000),
						field2:new Date("1/1/2014 12:00:00 GMT+0700"),
						field3:<elt x='abc'><name>AAA</name><type>1</type></elt>}
				);
			assertEquals(expected.field1.time, returnTestValue.field1.time);
			assertEquals(expected.field2.time, returnTestValue.field2.time);
			assertEquals(expected.field3.toXMLString(), returnTestValue.field3.toXMLString());
			//-------------------------------------
		}
		
		[Test (order="1",description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var json:String = '{"field1":"ABC","field2":1234,"field3":"2014-01-01T12:00:00 GMT+07",'+
				'"field4":"<elt x=\'abc\'><name>AAA</name></elt>",' +
				'"field5":{"field1":"ABC","field2":123,"field3":true}' +
				'}';
			
			registerClassAlias("Vanilla_objectFromJSON_14", Deserializer_fromJSON_14);
			registerClassAlias("Vanilla_objectFromJSON_16", Deserializer_fromJSON_16);
			var returnTestValue:Object = deserializer.fromJSON(json, "Vanilla_objectFromJSON_16");
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			
			assertTrue(returnTestValue is Deserializer_fromJSON_16);
			var retObj:Deserializer_fromJSON_16 = Deserializer_fromJSON_16(returnTestValue);
			
			assertEquals("ABC", retObj.field1);
			assertEquals(1234, retObj.field2);
			assertEquals((new Date("1/1/2014 12:00:00 GMT+0700")).time, retObj.field3);
			assertEquals((<elt x='abc'><name>AAA</name></elt>).toXMLString(), retObj.field4.toXMLString());
			assertNull(retObj.field99);
			
			var field5Expected: Deserializer_fromJSON_14 = 
				new Deserializer_fromJSON_14({field1:"ABC",field2:123,field3:true});
			assertEquals(0,ObjectUtil.compare(field5Expected, retObj.field5));
			
			//-------------------------------------
		}
		
		[Test (order="17",description="Normal case")]
		/**
		 * Test Case Type: Performance Test.
		 * Deserialize 20000 objects in object graph.
		 * OUTPUT EXPECTED:<br/>
		 * The deserializing time must less than one second.
		 * 
		 */
		public function testCase017():void
		{
			var elt:String = '{"field1":"ABC","field2":1234,"field3":"2014-01-01T12:00:00 GMT+07",'+
				'"field4":"<elt x=\'abc\'><name>AAA</name></elt>",' +
				'"field5":{"field1":"ABC","field2":123,"field3":true}' +
				'}';
			var json:String = '[';
			
			//10000 root objects in type of Deserializer_fromJSON_16,
			//each object has one child in type of Deserializer_fromJSON_14
			for (var i:int = 0; i < 10000; i++)
			{
				if(i > 0)
					json += ",";
				json += elt;
			}
			
			json += "]";
			
			registerClassAlias("Vanilla_objectFromJSON_14", Deserializer_fromJSON_14);
			registerClassAlias("Vanilla_objectFromJSON_16", Deserializer_fromJSON_16);
			
			var start:Date = new Date;
			
			var returnTestValue:Object = deserializer.fromJSON(json, "Vanilla_objectFromJSON_16[]");
			
			var finish:Date = new Date;
			
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue is Array);
			
			var duration:Number = finish.time - start.time;
			assertTrue(duration < 1000);
			//-------------------------------------
		}
		
		[Test (order="10",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var json:String = "null";
			var returning:String = null;
			var returnTestValue:Object = deserializer.fromJSON(json, returning);
			assertNull(returnTestValue);
		}
		
		[Test (order="10",description="Boundary case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>json = null</code><br/>
		 * <code>returning = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var json:String = "[]";
			var returnTestValue:Object = deserializer.fromJSON(json);
			assertTrue(returnTestValue is Array);
			assertEquals(0, (returnTestValue as Array).length);
		}
		
		[Test (description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 *
		 * OUTPUT EXPECTED:<br/>
		 *
		 */
		public function testCase020():void
		{
			var a:Array = [];
			for(var i:int = 0; i<10; i++)
			{
				var jsObj:Deserializer_fromJSON_14 = new Deserializer_fromJSON_14(
					{
						field1:"ABC No."+i,field2:i,field3:true
					});
				a.push(jsObj);
			}
			var json:String = JSON.stringify(a);
			var returnTestValue:Object = deserializer.fromJSON(json, Vector.<Deserializer_fromJSON_14>);
			assertTrue(returnTestValue is Vector.<Deserializer_fromJSON_14>);
			assertEquals(10, returnTestValue.length);
			for(i = 0; i<10; i++)
			{
				assertTrue(returnTestValue[i] is Deserializer_fromJSON_14);
				assertEquals("ABC No."+i, Deserializer_fromJSON_14(returnTestValue[i]).field1);
				assertEquals(i, Deserializer_fromJSON_14(returnTestValue[i]).field2);
				assertTrue(Deserializer_fromJSON_14(returnTestValue[i]).field3);
			}
		}
		
		[Test (description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 *
		 * OUTPUT EXPECTED:<br/>
		 *
		 */
		public function testCase021():void
		{
			var a:Array = [];
			for(var i:int = 0; i<10; i++)
			{
				var jsObj:Deserializer_fromJSON_14 = new Deserializer_fromJSON_14(
					{
						field1:"ABC No."+i,field2:i,field3:true
					});
				a.push(jsObj);
			}
			var json:String = JSON.stringify(a);
			var returnTestValue:Object = deserializer.fromJSON(json, Deserializer_fromJSON_14);
			assertTrue(returnTestValue is Array);
			assertEquals(10, returnTestValue.length);
			for(i = 0; i<10; i++)
			{
				assertTrue(returnTestValue[i] is Deserializer_fromJSON_14);
				assertEquals("ABC No."+i, Deserializer_fromJSON_14(returnTestValue[i]).field1);
				assertEquals(i, Deserializer_fromJSON_14(returnTestValue[i]).field2);
				assertTrue(Deserializer_fromJSON_14(returnTestValue[i]).field3);
			}
		}
	}
}