package net.fproject.utils.DataUtil
{
	import net.fproject.utils.DataUtil;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	public class DataUtil_parseLiteralValue
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
		
		[Test (description="Normal case:")]
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
			var returnTestValue:Object = DataUtil.parseLiteralValue('"123"');
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === '123');
			//-------------------------------------
		}
		
		[Test (description="Normal case:")]
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
			var returnTestValue:Object = DataUtil.parseLiteralValue("'abc'");
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === 'abc');
			//-------------------------------------
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("'abc'", 'String');
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === 'abc');
			//-------------------------------------
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("'abc'", 'Number');
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			assertTrue(isNaN(returnTestValue.value));
			//-------------------------------------
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("'abc'", 'Boolean');
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			assertFalse(returnTestValue.value);
			//-------------------------------------
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("'abc,cde'", 'Array');
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value is Array);
			assertEquals(2, returnTestValue.value.length);
			assertEquals('abc', returnTestValue.value[0]);
			assertEquals('cde', returnTestValue.value[1]);
			//-------------------------------------
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("'-1'", 'int');
			assertNotNull(returnTestValue);
			assertEquals(-1, returnTestValue.value);
			returnTestValue = DataUtil.parseLiteralValue("'102'", 'uint');
			assertNotNull(returnTestValue);
			assertEquals(102, returnTestValue.value);
			returnTestValue = DataUtil.parseLiteralValue("'1.02'", 'number');
			assertNotNull(returnTestValue);
			assertEquals(1.02, returnTestValue.value);
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("'true'");
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === 'true');
			
			returnTestValue = DataUtil.parseLiteralValue("'false'");
			assertNotNull(returnTestValue)
			assertTrue(returnTestValue.value === 'false');
			
			returnTestValue = DataUtil.parseLiteralValue("false");
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === false);
			
			returnTestValue = DataUtil.parseLiteralValue("true");
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === true);
			
			returnTestValue = DataUtil.parseLiteralValue("null");
			assertNotNull(returnTestValue);
			assertTrue(returnTestValue.value === null);
		}
		
		[Test (description="Normal case:")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var returnTestValue:Object = DataUtil.parseLiteralValue("abc");
			assertNull(returnTestValue);
			returnTestValue = DataUtil.parseLiteralValue("abc.def");
			assertNull(returnTestValue);
		}
	}
}