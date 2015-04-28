package testdata.active
{
	import net.fproject.active.ActiveService;

	[RemoteObject(destination="test-http-destination",modelClass="testdata.TestUser",uri="/users")]
	public class JSONRemoteObject_JSONRemoteObjectRESTfulService extends ActiveService
	{
	}
}