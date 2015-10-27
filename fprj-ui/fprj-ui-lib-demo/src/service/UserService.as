///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2013 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package service
{
	import net.fproject.active.ActiveService;
	import net.fproject.di.InstanceFactory;

	[RemoteObject("Users")]
	public class UserService extends ActiveService
	{
		public static function get instance():UserService{
			
			return InstanceFactory.getInstance(UserService) as UserService;
		}
	}
}