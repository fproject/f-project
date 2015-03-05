package net.fproject.di
{
	import spark.components.Label;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	
	import testdata.di.Injector_bindProperties_001;
	import testdata.di.InjectionUtil_findMemberMetadataValue_001;
	import testdata.di.InjectionUtil_findMemberMetadataValue_037;

	[ResourceBundle("fprjcore")]
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function findMemberMetadataValue(clazz:Class, member:Object, metadataName:String, argumentName:String = null):Object</code><br/>
	 * of class<br/>
	 * net.fproject.utils.Injector
	 */
	public class InjectionUtil_findClassMetadataValue
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

		[Test (description="Normal case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var container:InjectionUtil_findMemberMetadataValue_001 = new InjectionUtil_findMemberMetadataValue_001();
			var member:Label = container.label;
			var metadataName:String = "Abc";
			var argumentName:String = "a";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(
				InjectionUtil_findMemberMetadataValue_001, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue == "A");
			//-------------------------------------
		}

		[Test (description="Normal Case")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var container:InjectionUtil_findMemberMetadataValue_001 = new InjectionUtil_findMemberMetadataValue_001();
			var metadataName:String = "Abc";
			var argumentName:String = "b";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(
				InjectionUtil_findMemberMetadataValue_001, 'label', metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue == "b");
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertNull(returnTestValue);
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
			assertNull(returnTestValue);
		}

		[Test (expected="Error",description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = '', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = "";
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = '', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = "";
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = '', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = "";
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = '', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = "";
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = null, argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = null;
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = null, argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = null;
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = null, argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = null;
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = null, argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = null;
			var argumentName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = '', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = "";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = '', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = "";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = '', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = "";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = '', argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = "";
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = null, argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase021():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = null;
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = null, argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase022():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = null;
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = null, argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase023():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = null;
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = null, argumentName = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase024():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = null;
			var argumentName:String = "";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase025():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase026():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase027():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase028():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = '', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase029():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = "";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = '', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase030():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = "";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = '', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase031():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = "";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = '', argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = ""</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase032():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = "";
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = null, argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase033():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = new Object();
			var metadataName:String = null;
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = new Object(), metadataName = null, argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase034():void
		{
			var clazz:Class = null;
			var member:Object = new Object();
			var metadataName:String = null;
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = Injector_bindProperties_001, member = null, metadataName = null, argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase035():void
		{
			var clazz:Class = Injector_bindProperties_001;
			var member:Object = null;
			var metadataName:String = null;
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Boundary case: [clazz = null, member = null, metadataName = null, argumentName = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = null</code><br/>
		 * <code>member = null</code><br/>
		 * <code>metadataName = null</code><br/>
		 * <code>argumentName = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase036():void
		{
			var clazz:Class = null;
			var member:Object = null;
			var metadataName:String = null;
			var argumentName:String = null;
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(clazz, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNull(returnTestValue);
			//-------------------------------------
		}

		[Test (description="Normal case: [clazz = Injector_bindProperties_001, member = new Object(), metadataName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789', argumentName = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>clazz = Injector_bindProperties_001</code><br/>
		 * <code>member = new Object()</code><br/>
		 * <code>metadataName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <code>argumentName = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase037():void
		{
			var member:String="myMember";
			var metadataName:String = "Abc";
			var argumentName:String = "a";
			var returnTestValue:Object = InjectionUtil.findMemberMetadataValue(
				InjectionUtil_findMemberMetadataValue_037, member, metadataName, argumentName);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(returnTestValue == "a");
			//-------------------------------------
		}
	}
}