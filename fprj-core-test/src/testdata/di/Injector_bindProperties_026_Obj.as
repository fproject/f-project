package testdata.di
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import testdata.TestUser;

	public class Injector_bindProperties_026_Obj extends EventDispatcher
	{
		private var _selectedUser:TestUser;

		[Bindable(event="selectedUserChange")]
		public function get selectedUser():TestUser
		{
			return _selectedUser;
		}

		public function set selectedUser(value:TestUser):void
		{
			if( _selectedUser !== value)
			{
				_selectedUser = value;
				dispatchEvent(new Event("selectedUserChange"));
			}
		}
		
		public function Injector_bindProperties_026_Obj(src:Object = null)
		{
			if(src != null)
			{
				selectedUser = src.selectedUser;
			}
		}
	}
}