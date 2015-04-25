package net.fproject.active
{
	import mx.rpc.Responder;
	
	
	public class ActiveCallResponder extends Responder
	{
		public var criteria:DbCriteria
		public function ActiveCallResponder(result:Function, fault:Function)
		{
			super(result, fault);
		}
	}
}