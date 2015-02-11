package testdata.di
{
	public class Injector_instantiateMembers_001_container
	{
		[Instantiator(impl="testdata.di.Injector_instantiateMembers_001_impl")]
		public var impl:Injector_instantiateMembers_001_interface;
	}
}