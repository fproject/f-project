package net.fproject.utils.StringUtil
{
	import mx.resources.ResourceManager;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import net.fproject.utils.StringUtil;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function get defaultCharacterCompareMethod():Function</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_get_defaultCharacterCompareMethod
	{
		[Before]
		public function runBeforeEveryTest():void
		{
			StringUtil.defaultCharacterCompareMethod = null
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
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
			//Change locale to Vietnamese to test "so sánh tiếng Việt không dấu"
			ResourceManager.getInstance().localeChain = ["vi_VN"];
			
			StringUtil.defaultCharacterCompareMethod = null;
			var returnTestValue:Function = StringUtil.defaultCharacterCompareMethod;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(StringUtil.defaultCharacterCompareMethod, returnTestValue);
			
			var b:Boolean = returnTestValue("a", "â");
			
			assertTrue(b);
			//-------------------------------------
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
			var f:Function = function():void{};
			StringUtil.defaultCharacterCompareMethod = f;
			var returnTestValue:Function = StringUtil.defaultCharacterCompareMethod;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(f, returnTestValue);
			//-------------------------------------
		}
	}
}