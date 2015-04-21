package net.fproject.di
{
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	
	import testdata.di.Injector_instantiateMembers_001_container;
	import testdata.di.Injector_instantiateMembers_001_impl;
	import testdata.di.Injector_instantiateMembers_003_container;
	import testdata.di.Injector_instantiateMembers_003_impl;
	import testdata.di.Injector_instantiateMembers_005_container;
	import testdata.di.Injector_instantiateMembers_005_impl;
	
	[ResourceBundle("fprjcore")]
	/**
	 * FlexUnit test case class for method<br/>
	 * <code>internal function instantiateMembers(container:Object, constructorParam:*):void</code><br/>
	 * of class<br/>
	 * net.fproject.utils.Injector
	 */
	public class Injector_instantiateMembers
	{
		private var injectionutil:Injector;

		[Before]
		public function runBeforeEveryTest():void
		{
			injectionutil = new Injector();
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			injectionutil = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [container = new Object(), constructorParam = new *()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var container:Injector_instantiateMembers_001_container = new Injector_instantiateMembers_001_container();
			var constructorParam:* = "ABCXYZ";
			Injector.instantiateMembers(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.impl);
			assertTrue(container.impl is Injector_instantiateMembers_001_impl);
			assertEquals(constructorParam, container.impl.param);
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [container = null, constructorParam = new *()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var container:Object = null;
			var constructorParam:* = new Object();
			Injector.instantiateMembers(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var container:Injector_instantiateMembers_003_container = new Injector_instantiateMembers_003_container();
			var constructorParam:* = null;
			Injector.instantiateMembers(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.impl);
			assertTrue(container.impl is Injector_instantiateMembers_003_impl);
			//-------------------------------------
		}

		[Test (expected="Error",description="Boundary case: [container = null, constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var container:Object = null;
			var constructorParam:* = null;
			Injector.instantiateMembers(container, constructorParam);
		}

		
		[Test (description="Normal case: [container = new Object(), constructorParam = null]")]
		public function testCase005():void
		{
			var container:Injector_instantiateMembers_005_container = new Injector_instantiateMembers_005_container();
			var constructorParam:* = null;
			Injector.instantiateMembers(container, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertNotNull(container.impl);
			assertTrue(container.impl is Injector_instantiateMembers_005_impl);
			//-------------------------------------
		}
	}
}