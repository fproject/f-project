package testdata.di
{
	import net.fproject.core.PropertyChangeDispatcher;
	
	import testdata.TestUser;
	import testdata.TestUserProfile;

	public class Injector_bindProperties_032_SkinPart extends PropertyChangeDispatcher
	{
		[Bindable]
		public var user:TestUser;
		[Bindable]
		public var userProfile:TestUserProfile;
	}
}