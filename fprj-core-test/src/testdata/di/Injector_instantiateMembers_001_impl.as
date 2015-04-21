package testdata.di
{
	public class Injector_instantiateMembers_001_impl implements Injector_instantiateMembers_001_interface
	{
		private var _param:Object;

		public function get param():Object
		{
			return _param;
		}

		public function Injector_instantiateMembers_001_impl(param:Object=null)
		{
			this._param = param;
		}
	}
}