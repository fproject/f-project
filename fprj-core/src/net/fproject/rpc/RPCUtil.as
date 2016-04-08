package net.fproject.rpc
{
	import mx.rpc.Fault;

	public class RPCUtil
	{
		public static function getNetworkFaultCode(fault:Fault):String
		{
			if(fault.faultCode == "Channel.Call.Failed" 
				|| fault.faultCode == "Client.Error.RequestTimeout"
				|| fault.faultCode == "Client.Error.MessageSend")
			{
				return fault.faultCode;
			}
			return null;
		}
	}
}