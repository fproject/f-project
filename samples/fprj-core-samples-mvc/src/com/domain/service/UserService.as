package com.domain.service
{
	import net.fproject.di.InstanceFactory;
	import net.fproject.service.ActiveService;

	[RemoteObject(destination="test-http-destination",modelClass="com.domain.model.User",uri="/users")]
	public class UserService extends ActiveService
	{
		public static function get instance():UserService
		{
			return InstanceFactory.getInstance(UserService) as UserService;
		}
	}
}