package testdata
{
	public class TestUser
	{
		public function TestUser(src:Object=null)
		{
			if(src != null)
			{
				for (var s:String in src)
				{
					if(this.hasOwnProperty(s))
						this[s] = src[s];
				}
			}
		}
		
		[Bindable]
		public var id:String;
		[Bindable]
		public var username:String;
		[Bindable]
		public var password:String;
		public var authKey:String;
		public var accessToken:String;
		
		public var profile:TestUserProfile
		
		[Bindable]
		public var birthDay:Date;
	}
}