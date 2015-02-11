package net.fproject.di
{
	import org.flexunit.asserts.assertFalse;

	[ResourceBundle("fprjcore")]
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public static function inject(container:Object, deferredBinding:Boolean = true, constructorParam:* = undefined):void</code><br/>
	 * of class<br/>
	 * net.fproject.utils.Injector
	 */
	public class Injector_inject
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

		[Test (description="Normal case: [container = {}, deferredBinding = false, constructorParam = new *()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = {}</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var t1:Injector_instantiateMembers = new Injector_instantiateMembers;
			var t2:Injector_attachEventListeners = new Injector_attachEventListeners;
			var t3:Injector_bindProperties = new Injector_bindProperties;
			t1.testCase001();
			t2.testCase001();
			t3.testCase001();
		}

		[Test (expected="Error",description="Boundary case: [container = null, deferredBinding = false, constructorParam = new *()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var container:Object = null;
			var constructorParam:* = {};
			Injector.inject(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = {}, deferredBinding = false, constructorParam = undefined]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = {}</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = undefined</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var container:Object = {};
			var constructorParam:* = undefined;
			Injector.inject(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [container = null, deferredBinding = false, constructorParam = undefined]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = undefined</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var container:Object = null;
			var constructorParam:* = undefined;
			Injector.inject(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = {}, deferredBinding = false, constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = {}</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var container:Object = {};
			var constructorParam:* = null;
			Injector.inject(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [container = null, deferredBinding = false, constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase006():void
		{
			var container:Object = null;
			var constructorParam:* = null;
			Injector.inject(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}
	}
}