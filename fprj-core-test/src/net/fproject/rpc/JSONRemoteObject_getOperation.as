package net.fproject.rpc
{
	import mx.rpc.AbstractOperation;
	
	import org.flexunit.asserts.assertEquals;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function getOperation(name:String):AbstractOperation</code><br/>
	 * of class<br/>
	 * net.fproject.rpc.JSONRemoteObject
	 */
	public class JSONRemoteObject_getOperation
	{
		private var jsonRemoteObject:JSONRemoteObject;

		[Before]
		public function runBeforeEveryTest():void
		{
			jsonRemoteObject = new JSONRemoteObject("","",null,null,"","",null);
			//Your test data initialization
		}

		[After]
		public function runAfterEveryTest():void
		{
			jsonRemoteObject = null;
			//Your test data cleaning
		}

		[Test (description="Normal case: [name = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789']")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789"</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var name:String = "ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789";
			var returnTestValue:AbstractOperation = jsonRemoteObject.getOperation(name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(name, returnTestValue.name);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = '']")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = ""</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase002():void
		{
			var name:String = "";
			var returnTestValue:AbstractOperation = jsonRemoteObject.getOperation(name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(name, returnTestValue.name);
			//-------------------------------------
		}

		[Test (description="Boundary case: [name = null]")]
		/**
		 * Test Case Type: Boundary<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase003():void
		{
			var name:String = null;
			var returnTestValue:AbstractOperation = jsonRemoteObject.getOperation(name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(name, returnTestValue.name);
			//-------------------------------------
		}

		[Test (description="Normal case")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <code>name = null</code><br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase004():void
		{
			var name:String = "ABC";
			var op:JSONOperation = new JSONOperation(null, name);
			jsonRemoteObject.operations = {ABC:op};
			var returnTestValue:AbstractOperation = jsonRemoteObject.getOperation(name);
			//---- Place result assertion here ----
			// You must replace this code by function specifications or 
			// the test always returns false!
			assertEquals(op, returnTestValue);
			//-------------------------------------
		}
	}
}