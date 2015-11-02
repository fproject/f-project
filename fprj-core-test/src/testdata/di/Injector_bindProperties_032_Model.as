package testdata.di
{
	import net.fproject.core.PropertyChangeDispatcher;
	
	import testdata.TestUser;

	public class Injector_bindProperties_032_Model extends PropertyChangeDispatcher
	{
		[Bindable]
		public var user:TestUser;
	}
}