package testdata.di
{
	import testdata.rpc.TestUser;

	public class Injector_bindProperties_022_Obj
	{
		[Bindable]
		public var selectedUser:TestUser;
		
		public function Injector_bindProperties_022_Obj(src:Object = null)
		{
			if(src != null)
			{
				selectedUser = src.selectedUser;
			}
		}
	}
}