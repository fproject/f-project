package testdata.di
{
	public class Injector_instantiateMembers_001_container
	{
		[AutoInstance(factory="testdata.di.Injector_instantiateMembers_001_impl")]
		public var impl:Injector_instantiateMembers_001_interface;
	}
}