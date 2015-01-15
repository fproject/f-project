package testdata
{
	[RemoteObject(name="MyService",destination="amf-destination")]
	public class RemoteObjectFactory_getInstance_003
	{
		[RestOperation(method="POST",returning="MyModel",namedParams="true")]
		public function method01():void
		{
		}
	}
}