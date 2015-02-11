package net.fproject.di
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.components.Label;
	import spark.events.TextOperationEvent;
	
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	
	import testdata.di.Injector_attachEventListeners_001;
	import testdata.di.Injector_attachEventListeners_009;
	import testdata.di.Injector_attachEventListeners_011;
	import testdata.di.Injector_attachEventListeners_012;
	import testdata.di.Injector_attachEventListeners_013;
	import testdata.di.Injector_attachEventListeners_014;
	import testdata.di.Injector_attachEventListeners_015;
	import testdata.di.Injector_attachEventListeners_016;
	import testdata.di.Injector_attachEventListeners_017;
	import testdata.di.Injector_attachEventListeners_018;
	import testdata.di.Injector_attachEventListeners_019;

	[ResourceBundle("fprjcore")]
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function attachEventListeners(container:Object, clazz:Class:Boolean):void</code><br/>
	 * of class<br/>
	 * net.fproject.utils.Injector
	 */
	public class Injector_attachEventListeners
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

		[Test (description="Normal case: ")]
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
		public function testCase001():void
		{
			var container:Injector_attachEventListeners_001 = new Injector_attachEventListeners_001();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.hasEventListener("click"));
			assertTrue(container.label.hasEventListener(MouseEvent.DOUBLE_CLICK));
		}

		[Test (expected="Error", description="Boundary case: [container = null, clazz = new Class() = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>clazz = new Class()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var container:Injector_attachEventListeners_001 = null;
			
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), clazz = null = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>clazz = null</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var container:Injector_attachEventListeners_001 = new Injector_attachEventListeners_001();
			
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.hasEventListener(MouseEvent.DOUBLE_CLICK));
			//-------------------------------------
		}

		[Test (expected="Error", description="Boundary case: [container = null, clazz = null = false]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>clazz = null</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var container:Object = null;
			
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}


		[Test (description="Normal case: ")]
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
		public function testCase009():void
		{
			var container:Injector_attachEventListeners_009 = new Injector_attachEventListeners_009();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.hasEventListener("click"));
			assertTrue(container.hasEventListener(MouseEvent.DOUBLE_CLICK));
		}
		
		[Test (description="Normal case: ")]
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
			var container:Injector_attachEventListeners_009 = new Injector_attachEventListeners_009();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.hasEventListener(MouseEvent.DOUBLE_CLICK));
		}
		
		[Test (description="Normal case: ")]
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
			var container:Injector_attachEventListeners_011 = new Injector_attachEventListeners_011();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.hasEventListener("click"));
			assertTrue(container.label.hasEventListener(MouseEvent.DOUBLE_CLICK));
		}
		
		[Test (description="Normal case: ")]
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
		public function testCase012():void
		{
			var container:Injector_attachEventListeners_012 = new Injector_attachEventListeners_012();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.hasEventListener("click"));
			assertTrue(container.myObject.label.hasEventListener("doubleClick"));
			assertTrue(container.myObject.label.hasEventListener("click"));
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
		public function testCase013():void
		{
			var container:Injector_attachEventListeners_013 = new Injector_attachEventListeners_013();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.proceedOnEvent(this, container, "creationComplete");
			assertTrue(container.label.hasEventListener("click"));
			assertTrue(container.dataGrid.hasEventListener("change"));
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
		public function testCase014():void
		{
			var container:Injector_attachEventListeners_014 = new Injector_attachEventListeners_014();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.proceedOnEvent(this, container, "creationComplete");
			assertTrue(container.dataGrid.hasEventListener("itemDoubleClick"));
			assertTrue(container.dataGrid.hasEventListener("change"));
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
		public function testCase015():void
		{
			var container:Injector_attachEventListeners_015 = new Injector_attachEventListeners_015();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.proceedOnEvent(this, container, "creationComplete");
			assertTrue(container.dataGrid.hasEventListener("itemDoubleClick"));
			assertTrue(container.dataGrid.hasEventListener("change"));
		}
		
		[Test (description="Normal case: ")]
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
			var container:Injector_attachEventListeners_016 = new Injector_attachEventListeners_016();
			Injector.attachEventListeners(container);
			container.label = new Label();
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertTrue(container.label.hasEventListener("click"));
		}
		
		[Test (description="Normal case: ")]
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
			var container:Injector_attachEventListeners_017 = new Injector_attachEventListeners_017();
			Injector.attachEventListeners(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.label = new Label();
			assertTrue(container.label.hasEventListener("click"));
		}
		
		[Test (async,description="Normal case: Test integration to bindProperties()")]
		/**
		 * Test Case Type: Normal<br/>
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
			var container:Injector_attachEventListeners_018 = new Injector_attachEventListeners_018();
			Injector.inject(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.handleEvent(this, container.textInput, "change",testCase018_change, 100000, container);
			Async.proceedOnEvent(this, container, "creationComplete", 10000);
			assertNotNull(container.textInput);
			container.textInput.dispatchEvent(new TextOperationEvent("change"));
		}
		
		public function testCase018_change(e:Event, container:Injector_attachEventListeners_018):void
		{
			assertTrue(container.textInput_changeRunned);	
		}
		
		
		[Test (async,description="Normal case: Using complex dispatcher")]
		/**
		 * Test Case Type: Normal<br/>
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
			var container:Injector_attachEventListeners_019 = new Injector_attachEventListeners_019();
			Injector.inject(container);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			container.show();
			Async.handleEvent(this, container.comboBox.textInput, "myEvent",testCase019_myEvent, 100000, container);
			Async.proceedOnEvent(this, container, "creationComplete", 10000);			
			container.comboBox.textInput.dispatchEvent(new Event("myEvent"));
		}
		
		public function testCase019_myEvent(e:Event, container:Injector_attachEventListeners_019):void
		{
			assertTrue(container.textInput_myEventRunned);	
		}
	}
}