package com.domain.model
{
	import net.fproject.model.LocalUID;

	public class User extends LocalUID
	{
		public var id:String;
		public var username:String;
		public var password:String;
		public var authKey:String;
		public var accessToken:String;
		public var profile:Profile;
		public var department:Department;
	}
}