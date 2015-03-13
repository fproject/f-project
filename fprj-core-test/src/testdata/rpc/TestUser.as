package testdata.rpc
{
	public class TestUser
	{
		public function TestUser(src:Object=null)
		{
			if(src != null)
			{
				this.id = src.id;
				this.username = src.username;
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
	}
}