package com.domain.service
{
	import net.fproject.active.ActiveService;
	import net.fproject.di.InstanceFactory;

	[RemoteObject(destination="test-http-destination",modelClass="com.domain.model.User",uri="/users")]
	public class UserService extends ActiveService
	{
		public static function get instance():UserService
		{
			return InstanceFactory.getInstance(UserService) as UserService;
		}
	}
}