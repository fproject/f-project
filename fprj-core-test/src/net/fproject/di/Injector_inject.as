package net.fproject.di
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import flash.events.IEventDispatcher;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.binding.utils.BindingUtils;
	import mx.events.PropertyChangeEvent;
	import mx.utils.UIDUtil;
	
	import spark.events.SkinPartEvent;
	
	import net.fproject.fproject_internal;
	
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.MetadataArgument;
	import org.as3commons.reflect.Type;

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

		[Test (description="Normal case: [container = new Object(), deferredBinding = false, constructorParam = new *()]")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var container:Object = new Object();
			var deferredBinding:Boolean = false;
			var constructorParam:* = new Object();
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = null, deferredBinding = false, constructorParam = new *()]")]
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
			var deferredBinding:Boolean = false;
			var constructorParam:* = new Object();
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), deferredBinding = true, constructorParam = new *()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>deferredBinding = true</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var container:Object = new Object();
			var deferredBinding:Boolean = true;
			var constructorParam:* = new Object();
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = null, deferredBinding = true, constructorParam = new *()]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>deferredBinding = true</code><br/>
		 * <code>constructorParam = new *()</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var container:Object = null;
			var deferredBinding:Boolean = true;
			var constructorParam:* = new Object();
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), deferredBinding = false, constructorParam = undefined]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = undefined</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase005():void
		{
			var container:Object = new Object();
			var deferredBinding:Boolean = false;
			var constructorParam:* = undefined;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = null, deferredBinding = false, constructorParam = undefined]")]
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
		public function testCase006():void
		{
			var container:Object = null;
			var deferredBinding:Boolean = false;
			var constructorParam:* = undefined;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), deferredBinding = true, constructorParam = undefined]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>deferredBinding = true</code><br/>
		 * <code>constructorParam = undefined</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase007():void
		{
			var container:Object = new Object();
			var deferredBinding:Boolean = true;
			var constructorParam:* = undefined;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = null, deferredBinding = true, constructorParam = undefined]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>deferredBinding = true</code><br/>
		 * <code>constructorParam = undefined</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase008():void
		{
			var container:Object = null;
			var deferredBinding:Boolean = true;
			var constructorParam:* = undefined;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), deferredBinding = false, constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>deferredBinding = false</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase009():void
		{
			var container:Object = new Object();
			var deferredBinding:Boolean = false;
			var constructorParam:* = null;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = null, deferredBinding = false, constructorParam = null]")]
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
		public function testCase010():void
		{
			var container:Object = null;
			var deferredBinding:Boolean = false;
			var constructorParam:* = null;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = new Object(), deferredBinding = true, constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = new Object()</code><br/>
		 * <code>deferredBinding = true</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase011():void
		{
			var container:Object = new Object();
			var deferredBinding:Boolean = true;
			var constructorParam:* = null;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

		[Test (description="Boundary case: [container = null, deferredBinding = true, constructorParam = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>container = null</code><br/>
		 * <code>deferredBinding = true</code><br/>
		 * <code>constructorParam = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase012():void
		{
			var container:Object = null;
			var deferredBinding:Boolean = true;
			var constructorParam:* = null;
			Injector.inject(container, deferredBinding, constructorParam);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertFalse(true);
			//-------------------------------------
		}

	}
}