package net.fproject.rpc
{
	public class JSONPredefOperation extends JSONOperation
	{
		private var _predefInfo:Object;
		
		public function JSONPredefOperation(service:JSONRemoteObject=null, name:String=null, predefInfo:Object=null)
		{
			super(service, name);
			_predefInfo = predefInfo;
		}
	}
}