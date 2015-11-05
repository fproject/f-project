package testdata.active
{
	import net.fproject.active.ActiveService;

	[RemoteObject(destination="test-http-destination",modelClass="testdata.UserDepartmentAssignment",uri="/user-department-assignments")]
	public class UserDepartmentAssignmentService extends ActiveService
	{
	}
}