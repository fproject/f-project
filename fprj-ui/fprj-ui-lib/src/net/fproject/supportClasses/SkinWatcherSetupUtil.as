package net.fproject.supportClasses
{
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	
	public class SkinWatcherSetupUtil implements IWatcherSetupUtil2
	{
		private var setupFunction:Function;
		
		public static function init(factory:IFlexModuleFactory, skinClass:Class,
									setupFunction:Function=null) : void
		{
			var util:SkinWatcherSetupUtil = new SkinWatcherSetupUtil();
			util.setupFunction = setupFunction;
			skinClass['watcherSetupUtil'] = util;
		}
		
		public function setup(target:Object, propertyGetter:Function,
							  staticPropertyGetter:Function,
							  bindings:Array, watchers:Array) : void
		{
			if(setupFunction !== null)
				setupFunction(target, propertyGetter, staticPropertyGetter, bindings, watchers);
		}
	}
}
