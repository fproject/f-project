package testdata.di
{
	import flash.events.EventDispatcher;
	
	import testdata.TestUser;

	public class Injector_bindProperties_025_Obj extends EventDispatcher
	{
		[Bindable]
		public var selectedUser:TestUser;
		
		public function Injector_bindProperties_025_Obj(src:Object = null)
		{
			if(src != null)
			{
				selectedUser = src.selectedUser;
			}
		}
	}
}