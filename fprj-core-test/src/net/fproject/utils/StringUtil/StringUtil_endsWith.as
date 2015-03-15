package net.fproject.utils.StringUtil
{
	import mx.resources.ResourceManager;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import net.fproject.utils.StringUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function endsWith(s:String, suffix:String, caseSensitive:Boolean = false, localeComparison:Boolean = false, characterCompareMethod:Function = null):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_endsWith
	{
		[Before]
		public function runBeforeEveryTest():void
		{
			StringUtil.defaultCharacterCompareMethod = null
		}

		[After]
		public function runAfterEveryTest():void
		{
			//Your test data cleaning
		}

		[Test (description="Normal case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = false, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase025():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase026():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = true, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase027():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase028():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase029():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase030():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase031():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase032():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase033():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase034():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase035():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = false, localeComparison = false, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase036():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase037():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase038():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase039():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase040():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase041():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase042():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase043():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase044():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = true, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase045():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase046():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase047():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase048():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase049():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase050():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase051():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase052():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase053():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = false, localeComparison = true, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase054():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase055():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase056():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase057():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase058():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase059():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase060():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase061():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase062():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = true, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase063():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase064():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase065():void
		{
			var s:String = "";
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase066():void
		{
			var s:String = null;
			var suffix:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = '', caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase067():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = '', caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase068():void
		{
			var s:String = "";
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = '', caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = ""</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase069():void
		{
			var s:String = null;
			var suffix:String = "";
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Boundary case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = null, caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase070():void
		{
			var s:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = '', suffix = null, caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = ""</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase071():void
		{
			var s:String = "";
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [s = null, suffix = null, caseSensitive = false, localeComparison = false, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = null</code><br/>
		 * <code>suffix = null</code><br/>
		 * <code>caseSensitive = false</code><br/>
		 * <code>localeComparison = false</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase072():void
		{
			var s:String = null;
			var suffix:String = null;
			var caseSensitive:Boolean = false;
			var localeComparison:Boolean = false;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertFalse(returnTestValue);
		}

		[Test (description="Normal case: [s = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', suffix = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', caseSensitive = true, localeComparison = true, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s = "Tôi yêu em"</code><br/>
		 * <code>suffix = "yeu em"</code><br/>
		 * <code>caseSensitive = true</code><br/>
		 * <code>localeComparison = true</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase073():void
		{
			//Change locale to Vietnamese to test "so sánh tiếng Việt không dấu"
			ResourceManager.getInstance().localeChain = ["vi_VN"];
			
			var s:String = "Tôi yêu em";
			var suffix:String = "yeu em";
			var caseSensitive:Boolean = true;
			var localeComparison:Boolean = true;
			var characterCompareMethod:Function = null;//use default locale compare method
			var returnTestValue:Boolean = StringUtil.endsWith(s, suffix, caseSensitive, localeComparison, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
	}
}