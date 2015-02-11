package testdata.di
{
	public class Injector_instantiateMembers_003_container
	{
		[Instantiator(impl="testdata.di.Injector_instantiateMembers_003_impl")]
		public var impl:Injector_instantiateMembers_003_interface;
	}
}