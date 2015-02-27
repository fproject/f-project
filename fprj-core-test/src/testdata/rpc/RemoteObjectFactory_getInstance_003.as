package testdata.rpc
{
	[RemoteObject(name="MyService",destination="amf-destination")]
	public class RemoteObjectFactory_getInstance_003
	{
		[RestOperation(method="POST",returning="MyModel")]
		public function method01():void
		{
		}
	}
}