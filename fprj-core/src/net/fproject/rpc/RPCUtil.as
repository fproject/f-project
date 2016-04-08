package net.fproject.rpc
{
	import mx.rpc.events.FaultEvent;

	public class RPCUtil
	{
		public static function getNetworkFaultCode(e:FaultEvent):String
		{
			if(e.fault.faultCode == "Channel.Call.Failed" 
				|| e.fault.faultCode == "Client.Error.RequestTimeout"
				|| e.fault.faultCode == "Client.Error.MessageSend")
			{
				return e.fault.faultCode;
			}
			return null;
		}
	}
}