package net.fproject.utils
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function set defaultCharacterCompareMethod(value:Function):void</code><br/>
	 * of class<br/>
	 * net.fproject.utils.StringUtil
	 */
	public class StringUtil_set_defaultCharacterCompareMethod
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

		[Test (description="Normal case: [value = function():Boolean]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = function():void{}</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var value:Function = function():void{};
			StringUtil.defaultCharacterCompareMethod = value;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(StringUtil.defaultCharacterCompareMethod, value);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			StringUtil.defaultCharacterCompareMethod = null;
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(StringUtil.defaultCharacterCompareMethod);
			//-------------------------------------
		}

	}
}