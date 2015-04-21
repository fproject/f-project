package testdata.di
{
	public class Injector_instantiateMembers_005_impl implements Injector_instantiateMembers_005_interface
	{
		private var _muAutoInstance:Injector_instantiateMembers_003_interface;

		[AutoInstance(factory="testdata.di.Injector_instantiateMembers_003_impl")]
		public function get muAutoInstance():Injector_instantiateMembers_003_interface
		{
			return _muAutoInstance;
		}

		public function set muAutoInstance(value:Injector_instantiateMembers_003_interface):void
		{
			_muAutoInstance = value;
		}

	}
}