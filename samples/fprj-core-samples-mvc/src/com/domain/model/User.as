package com.domain.model
{
	import net.fproject.mvc.model.LocalUID;

	public class User extends LocalUID
	{
		[Bindable]
		public var id:String;
		[Bindable]
		public var username:String;
		[Bindable]
		public var password:String;
		[Bindable]
		public var authKey:String;
		[Bindable]
		public var accessToken:String;
		[Bindable]
		public var profile:Profile;
		[Bindable]
		public var department:Department;
	}
}