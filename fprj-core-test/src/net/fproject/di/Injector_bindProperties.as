package net.fproject.di
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	
	import testdata.di.Injector_bindProperties_001;
	import testdata.di.Injector_bindProperties_005;
	import testdata.di.Injector_bindProperties_006;
	import testdata.di.Injector_bindProperties_007;
	import testdata.di.Injector_bindProperties_008;
	import testdata.di.Injector_bindProperties_009;
	import testdata.di.Injector_bindProperties_010;
	import testdata.di.Injector_bindProperties_011;
	import testdata.di.Injector_bindProperties_012;
	import testdata.di.Injector_bindProperties_013;
	import testdata.di.Injector_bindProperties_014;
	import testdata.di.Injector_bindProperties_015;
	import testdata.di.Injector_bindProperties_016;
	import testdata.di.Injector_bindProperties_017;
	import testdata.di.Injector_bindProperties_018;
	import testdata.di.Injector_bindProperties_019;
	import testdata.di.Injector_bindProperties_020;
	
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function bindProperties(container:Object, clazz:Class):void</code><br/>
	 * of class<br/>
	 * net.fproject.utils.Injector
	 */
	public class Injector_bindProperties
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
		
		[Test (description="Direct Binding: Normal case: [container = new Object(), clazz = new Class()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var container:Injector_bindProperties_001 = new Injector_bindProperties_001();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.text == "AAABBBCCC");
			assertTrue(container.label1.text == "AAABBBCCC");
			//-------------------------------------
		}
		
		[Test (expected="Error",description="Direct Binding: Boundary case: [container = null, clazz = new Class()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var container:Object = null;
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}
		
		[Test (description="Direct Binding: Boundary case: [container = new Object(), clazz = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var container:Injector_bindProperties_001 = new Injector_bindProperties_001();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.text == "AAABBBCCC");
			assertTrue(container.label1.text == "AAABBBCCC");
			//-------------------------------------
		}
		
		[Test (expected="Error",description="Direct Binding: Boundary case: [container = null, clazz = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>clazz = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var container:Object = null;
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}
		
		[Test (description="Direct Binding: Normal case: Class metadata")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var container:Injector_bindProperties_005 = new Injector_bindProperties_005();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label == container.label1);
			//-------------------------------------
		}
		
		[Test (expected="Error",description="Direct Binding: Normal case: Class metadata")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var container:Injector_bindProperties_006 = new Injector_bindProperties_006();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}
		
		[Test (description="Direct Binding: Normal case: Class metadata")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var container:Injector_bindProperties_007 = new Injector_bindProperties_007();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label == container.myObject.label);
			//-------------------------------------
		}
		
		[Test (description="Direct Binding: Normal case: Class metadata")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var container:Injector_bindProperties_008 = new Injector_bindProperties_008();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.myObject.label.text=="AAA");
			//-------------------------------------
		}
		
		[Test (description="Direct Binding: Normal case: Class metadata")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var container:Injector_bindProperties_009 = new Injector_bindProperties_009();
			Injector.bindProperties(container);
			//container.validateSkin();
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show(
				function():void
				{
					assertTrue(container.label.text=="AAABBBCCC");
					assertTrue(container.label1.text=="AAABBBCCC")
				});
			//-------------------------------------
		}
		
		[Test (async,description="Normal case: ")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase010():void
		{
			var container:Injector_bindProperties_010 = new Injector_bindProperties_010();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.proceedOnEvent(this,container,"creationComplete",10000);
			
			assertEquals("AAABBBCCC", container.label.text);
		}
		
		[Test (async, description="Normal case: ")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var container:Injector_bindProperties_011 = new Injector_bindProperties_011();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.proceedOnEvent(this, container, "creationComplete", 10000);
			assertEquals("AAABBBCCC", container.label.text);
			assertEquals(100, container.label.left);
		}
		
		[Test (description="Deferred Binding: Normal case: [container = new Object(), clazz = new Class()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var container:Injector_bindProperties_012 = new Injector_bindProperties_012();
			Injector.bindProperties(container);
			container.myText = "AAABBBCCC";
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("AAABBBCCC", container.label.text);
			//-------------------------------------
		}
		
		[Test (async,description="Deferred Binding")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase013():void
		{
			var container:Injector_bindProperties_013 = new Injector_bindProperties_013();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.proceedOnEvent(this, container, "creationComplete", 10000);
			assertEquals("AAABBBCCC", container.label.text);
		}
		
		[Test (description="Method Binding")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase014():void
		{
			var container:Injector_bindProperties_014 = new Injector_bindProperties_014();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals("AAABBBCCC", container.label.text);
		}
		
		[Test (description="Method Binding")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase015():void
		{
			var container:Injector_bindProperties_015 = new Injector_bindProperties_015();
			Injector.bindProperties(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals('myText()', container.label.text);
		}
		
		[Test (async, description="Inverse Method Binding")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase016():void
		{
			var container:Injector_bindProperties_016 = new Injector_bindProperties_016();
			Injector.bindProperties(container);
			container.show();
			Async.proceedOnEvent(this, container, 'creationComplete', 10000);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.myProp.functionProp);
			assertEquals('AAABBBCCC', container.myProp.functionProp());
		}
		
		[Test (async, description="Inverse Method Binding")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase017():void
		{
			var container:Injector_bindProperties_017 = new Injector_bindProperties_017();
			Injector.bindProperties(container);
			container.show();
			Async.proceedOnEvent(this, container, 'creationComplete', 10000);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.myProp.functionProp1);
			assertEquals('AAABBBCCC', container.myProp.functionProp1());
		}
		
		[Test (async, description="Inverse Method Binding")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase018():void
		{
			var container:Injector_bindProperties_018 = new Injector_bindProperties_018();
			Injector.bindProperties(container);
			container.show();
			Async.proceedOnEvent(this, container, 'creationComplete', 10000);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.myProp.objectProp);
			assertNotNull(container.myProp.objectProp.functionProp);
			assertEquals('AAABBBCCC', container.myProp.objectProp.functionProp());
		}
		
		[Test (async, description="Fix bug: http://bug.f-project.net/view.php?id=199")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase019():void
		{
			var container:Injector_bindProperties_019 = new Injector_bindProperties_019();
			Injector.bindProperties(container);
			container.show();
			Async.proceedOnEvent(this, container, 'creationComplete', 10000);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.adg);
			assertNotNull(container.adg.dataTipFunction);
			assertNotNull(container.adg.labelFunction);
			assertEquals('1234567890', container.adg.dataTipFunction());
		}
		
		[Test (async, description="Fix bug: http://bug.f-project.net/view.php?id=199")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase020():void
		{
			var container:Injector_bindProperties_020 = new Injector_bindProperties_020();
			Injector.bindProperties(container);
			container.show();
			Async.proceedOnEvent(this, container, 'creationComplete', 10000);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.adg);
			assertNotNull(container.adg.dataTipFunction);
			assertNotNull(container.adg.labelFunction);
			assertEquals('1234567890', container.adg.dataTipFunction(null));
			assertEquals('1234567890', container.adg.labelFunction(null));
		}
	}
}