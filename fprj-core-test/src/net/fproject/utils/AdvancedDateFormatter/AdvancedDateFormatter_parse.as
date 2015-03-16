package net.fproject.utils.AdvancedDateFormatter
{
	import net.fproject.utils.AdvancedDateFormatter;
	
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;


	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function parse(valueString:String):Date</code><br/>
	 * of class<br/>
	 * net.fproject.utils.AdvancedDateFormatter
	 */
	public class AdvancedDateFormatter_parse
	{
		private var advancedDateformatter:AdvancedDateFormatter;

		[Before]
		public function runBeforeEveryTest():void
		{
			advancedDateformatter = new AdvancedDateFormatter();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			advancedDateformatter = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [valueString = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>valueString = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var valueString:String = "2010-5-29 8:0:0";
			advancedDateformatter.formatString = "yyyy-M-dd h:m:s";
			var returnTestValue:Date = advancedDateformatter.parse(valueString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue.fullYear==2010 && returnTestValue.month==4 && 
				returnTestValue.date==29 && returnTestValue.hours==8 && 
				returnTestValue.minutes==0 && returnTestValue.seconds==0);
			//-------------------------------------
		}

		[Test (description="Boundary case: [valueString = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>valueString = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var valueString:String = "";
			var returnTestValue:Date = advancedDateformatter.parse(valueString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [valueString = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>valueString = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var valueString:String = null;
			var returnTestValue:Date = advancedDateformatter.parse(valueString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Normal case: [valueString = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>valueString = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var valueString:String = "2010-5-2 8:0:0";
			advancedDateformatter.formatString = "yyyy-M-dd h:m:s";
			var returnTestValue:Date = advancedDateformatter.parse(valueString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue.fullYear==2010 && returnTestValue.month==4 && 
				returnTestValue.date==2 && returnTestValue.hours==8 && 
				returnTestValue.minutes==0 && returnTestValue.seconds==0);
			//-------------------------------------
		}
		
		[Test (description="Normal case: [valueString = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>valueString = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var valueString:String = "2010-25-2 8:0:0";
			advancedDateformatter.formatString = "yyyy-M-d h:m:s";
			var returnTestValue:Date = advancedDateformatter.parse(valueString);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue.fullYear==2010 && returnTestValue.month==4 && 
				returnTestValue.date==2 && returnTestValue.hours==8 && 
				returnTestValue.minutes==0 && returnTestValue.seconds==0);
			//-------------------------------------
		}
	}
}