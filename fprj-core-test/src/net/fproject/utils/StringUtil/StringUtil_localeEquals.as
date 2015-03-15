package net.fproject.utils.StringUtil
{
	import flash.events.Event;
	
	import mx.resources.ResourceManager;
	import mx.rpc.events.FaultEvent;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import net.fproject.utils.StringUtil;
	
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function localeEquals(s1:String, s2:String, characterCompareMethod:Function = null):Boolean</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_localeEquals
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
		
		[Test (description="Normal case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>s2 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var s1:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var s2:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = '', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = ""</code><br/>
		 * <code>s2 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var s1:String = "";
			var s2:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = null, s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = null</code><br/>
		 * <code>s2 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var s1:String = null;
			var s2:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = '', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>s2 = ""</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var s1:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var s2:String = "";
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = '', s2 = '', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = ""</code><br/>
		 * <code>s2 = ""</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var s1:String = "";
			var s2:String = "";
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = null, s2 = '', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = null</code><br/>
		 * <code>s2 = ""</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var s1:String = null;
			var s2:String = "";
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = null, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>s2 = null</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var s1:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var s2:String = null;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = '', s2 = null, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = ""</code><br/>
		 * <code>s2 = null</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var s1:String = "";
			var s2:String = null;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = null, s2 = null, characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = null</code><br/>
		 * <code>s2 = null</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var s1:String = null;
			var s2:String = null;
			var characterCompareMethod:Function = function(c1:String, c2:String):Boolean{return c1==c2};
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>s2 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var s1:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var s2:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = '', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = ""</code><br/>
		 * <code>s2 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var s1:String = "";
			var s2:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = null, s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = null</code><br/>
		 * <code>s2 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var s1:String = null;
			var s2:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = '', characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>s2 = ""</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var s1:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var s2:String = "";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = '', s2 = '', characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = ""</code><br/>
		 * <code>s2 = ""</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var s1:String = "";
			var s2:String = "";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = null, s2 = '', characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = null</code><br/>
		 * <code>s2 = ""</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var s1:String = null;
			var s2:String = "";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = null, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>s2 = null</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var s1:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var s2:String = null;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = '', s2 = null, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = ""</code><br/>
		 * <code>s2 = null</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var s1:String = "";
			var s2:String = null;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Boundary case: [s1 = null, s2 = null, characterCompareMethod = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = null</code><br/>
		 * <code>s2 = null</code><br/>
		 * <code>characterCompareMethod = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var s1:String = null;
			var s2:String = null;
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
		
		[Test (async, description="Normal case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "Tôi yêu em đến nay chừng có thể"</code><br/>
		 * <code>s2 = "Toi yeu em den nay chung co the"</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			if(ResourceManager.getInstance().localeChain == ["vi_VN"])
			{
				testCase019_resultHandler(null, null);
			}
			else
			{
				Async.handleEvent(this, ResourceManager.getInstance(), "change",
					testCase019_resultHandler,
					1000,null,
					function():void
					{
						throw new Error("Cannot dispatch CHANGE event when changing locale");
					});	
				//Change locale to Vietnamese to test "so sánh tiếng Việt không dấu"
				ResourceManager.getInstance().localeChain = ["vi_VN"];
			}
					
		}
		
		private function testCase019_resultHandler(e:Event,o:Object=null):void
		{
			Async.delayCall(this, 
				function():void
				{
					var s1:String = "Tôi yêu em đến nay chừng có thể";
					var s2:String = "Toi yeu em den nay chung co the";
					var characterCompareMethod:Function = null;
					var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
					//---- Place result assertion here ----
					// You must replace this code by function specifications or 
					// the test always returns false!
					assertTrue(returnTestValue);
					//-------------------------------------
				}, 1000);			
		}
		
		[Test (description="Normal case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "Tôi yÊu em"</code><br/>
		 * <code>s2 = "Toi yêu em"</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			//Change locale to Vietnamese to test "so sánh tiếng Việt không dấu"
			ResourceManager.getInstance().localeChain = ["vi_VN"];
			
			var s1:String = "Tôi yÊu em";
			var s2:String = "Toi yêu em";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(returnTestValue);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [s1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', s2 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', characterCompareMethod = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>s1 = "Tôi yÊu em".toLowerCase()</code><br/>
		 * <code>s2 = "Toi yêu em"</code><br/>
		 * <code>characterCompareMethod = function():Boolean</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			//Change locale to Vietnamese to test "so sánh tiếng Việt không dấu"
			ResourceManager.getInstance().localeChain = ["vi_VN"];
			
			var s1:String = "Tôi yÊu em".toLowerCase();
			var s2:String = "toi yêu em";
			var characterCompareMethod:Function = null;
			var returnTestValue:Boolean = StringUtil.localeEquals(s1, s2, characterCompareMethod);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue);
			//-------------------------------------
		}
	}
}