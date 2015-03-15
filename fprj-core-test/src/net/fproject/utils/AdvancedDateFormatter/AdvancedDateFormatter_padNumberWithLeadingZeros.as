package net.fproject.utils.AdvancedDateFormatter
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import mx.core.mx_internal;
	import mx.formatters.DateBase;
	import mx.formatters.Formatter;
	import mx.utils.StringUtil;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.AdvancedDateFormatter;


	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function padNumberWithLeadingZeros(value:Number, paddedLength:Number, usePositiveSign:Boolean = false):String</code><br/>
	 * of class<br/>
	 * net.fproject.utils.AdvancedDateFormatter
	 */
	public class AdvancedDateFormatter_padNumberWithLeadingZeros
	{
		private var advanceddateformatter:AdvancedDateFormatter;

		[Before]
		public function runBeforeEveryTest():void
		{
			advanceddateformatter = new AdvancedDateFormatter();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			advanceddateformatter = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [value = 0, paddedLength = 0, usePositiveSign = true]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var value:Number = 0;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = 0, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = 0, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = 0, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = 0, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = 0, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var value:Number = NaN;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.MAX_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.MAX_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.MAX_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.MAX_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.MAX_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.MAX_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.MIN_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase025():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.MIN_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase026():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.MIN_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase027():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.MIN_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase028():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.MIN_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase029():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.MIN_VALUE, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase030():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = NaN, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase031():void
		{
			var value:Number = 0;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = NaN, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase032():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = NaN, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase033():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = NaN, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase034():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = NaN, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase035():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = NaN, usePositiveSign = true]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = true</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase036():void
		{
			var value:Number = NaN;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = true;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = 0, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase037():void
		{
			var value:Number = 0;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = 0, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase038():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = 0, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase039():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = 0, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase040():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = 0, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase041():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = 0, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = 0</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase042():void
		{
			var value:Number = NaN;
			var paddedLength:Number = 0;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase043():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase044():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase045():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase046():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase047():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.POSITIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.POSITIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase048():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.POSITIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase049():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase050():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase051():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase052():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase053():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.NEGATIVE_INFINITY, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase054():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.NEGATIVE_INFINITY;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.MAX_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase055():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.MAX_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase056():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.MAX_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase057():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.MAX_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase058():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.MAX_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase059():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.MAX_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.MAX_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase060():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.MAX_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = Number.MIN_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase061():void
		{
			var value:Number = 0;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = Number.MIN_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase062():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = Number.MIN_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase063():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = Number.MIN_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase064():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = Number.MIN_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase065():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = Number.MIN_VALUE, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = Number.MIN_VALUE</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase066():void
		{
			var value:Number = NaN;
			var paddedLength:Number = Number.MIN_VALUE;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = 0, paddedLength = NaN, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = 0</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase067():void
		{
			var value:Number = 0;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.POSITIVE_INFINITY, paddedLength = NaN, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.POSITIVE_INFINITY</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase068():void
		{
			var value:Number = Number.POSITIVE_INFINITY;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.NEGATIVE_INFINITY, paddedLength = NaN, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.NEGATIVE_INFINITY</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase069():void
		{
			var value:Number = Number.NEGATIVE_INFINITY;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MAX_VALUE, paddedLength = NaN, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MAX_VALUE</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase070():void
		{
			var value:Number = Number.MAX_VALUE;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = Number.MIN_VALUE, paddedLength = NaN, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = Number.MIN_VALUE</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase071():void
		{
			var value:Number = Number.MIN_VALUE;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [value = NaN, paddedLength = NaN, usePositiveSign = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>value = NaN</code><br/>
		 * <code>paddedLength = NaN</code><br/>
		 * <code>usePositiveSign = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase072():void
		{
			var value:Number = NaN;
			var paddedLength:Number = NaN;
			var usePositiveSign:Boolean = false;
			var returnTestValue:String = advanceddateformatter.padNumberWithLeadingZeros(value, paddedLength, usePositiveSign);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}