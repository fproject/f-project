package com.domain.service
{
	import net.fproject.active.ActiveService;
	import net.fproject.di.InstanceFactory;

	[RemoteObject(destination="test-http-destination",modelClass="com.domain.model.Employee",uri="/employees")]
	public class EmployeeService extends ActiveService
	{
		public static function get instance():EmployeeService
		{
			return InstanceFactory.getInstance(EmployeeService) as EmployeeService;
		}
	}
}