package testdata
{
	[RemoteObject(name="MyService",destination="http-destination",url="/myService")]
	public class RemoteObjectFactory_getInstance_001
	{
		[RestOperation(method="POST",returning="MyModel",namedParams="true")]
		public function method01():void
		{
		}
	}
}