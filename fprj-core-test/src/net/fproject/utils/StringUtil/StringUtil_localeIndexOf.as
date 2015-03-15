package net.fproject.utils.StringUtil
{
	import mx.resources.ResourceManager;
	
	import org.flexunit.asserts.assertEquals;
	import net.fproject.utils.StringUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function localeIndexOf(source:String, target:String, fromIndex:int = 0, characterCompareMethod:Function = null):int</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_localeIndexOf
	{
		[Before]
		public function runBeforeEveryTest():void
		{
			//Your test data initialization
			StringUtil.defaultCharacterCompareMethod = null;
		}

		[After]
		public function runAfterEveryTest():void
		{
			//Your test data cleaning
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = null, target = '', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = 0;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = int.MAX_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase025():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase026():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = int.MIN_VALUE, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase027():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'xxxABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "xxxABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase028():void
		{
			var source:String = "xxxABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 3);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase029():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase030():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase031():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase032():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase033():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase034():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase035():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = NaN, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase036():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase037():void
		{
			var source:String = "01ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 2);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase038():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase039():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase040():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase041():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase042():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase043():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase044():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = 0, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = 0</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase045():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase046():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase047():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase048():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase049():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(-1, returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase050():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(-1, returnTestValue);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase051():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase052():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase053():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = int.MAX_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MAX_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase054():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = int.MAX_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase055():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase056():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase057():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase058():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase059():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase060():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase061():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase062():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = int.MIN_VALUE, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = int.MIN_VALUE</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase063():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = int.MIN_VALUE;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase064():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase065():void
		{
			var source:String = "";
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, -1);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase066():void
		{
			var source:String = null;
			var target:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = '', fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase067():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = "";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = '', target = '', fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase068():void
		{
			var source:String = "";
			var target:String = "";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 0);
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = '', fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = ""</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase069():void
		{
			var source:String = null;
			var target:String = "";
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = null, fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase070():void
		{
			var source:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var target:String = null;
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (description="Boundary case: [source = '', target = null, fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = ""</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase071():void
		{
			var source:String = "";
			var target:String = null;
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertEquals(returnTestValue, -1);
		}

		[Test (expected="Error", description="Boundary case: [source = null, target = null, fromIndex = NaN, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = null</code><br/>
		 * <code>target = null</code><br/>
		 * <code>fromIndex = NaN</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase072():void
		{
			var source:String = null;
			var target:String = null;
			var fromIndex:int = NaN;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [source = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', target = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', fromIndex = 0, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>source = "Hôm nay ngày đẹp giời"</code><br/>
		 * <code>target = "đẹp"</code><br/>
		 * <code>fromIndex = 0</code><br/>
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
			
			var source:String = "Hôm nay ngày đẹp giời";
			var target:String = "đẹp";
			var fromIndex:int = 0;
			var characterCompareMethod:Function = null;
			var returnTestValue:int = StringUtil.localeIndexOf(source, target, fromIndex, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(returnTestValue, 13);
			//-------------------------------------
		}
	}
}