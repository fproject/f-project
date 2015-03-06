package testdata.rpc
{
	import net.fproject.service.ActiveService;

	[RemoteObject(destination="test-http-destination",modelClass="testdata.rpc.TestUser",uri="/users")]
	public class JSONRemoteObject_JSONRemoteObjectRESTfulService extends ActiveService
	{
	}
}