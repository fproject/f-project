package testdata.di
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Injector_bindProperties_016_prop extends EventDispatcher
	{
		public function Injector_bindProperties_016_prop(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		[Bindable]
		public var functionProp:Function;
		
		public var functionProp1:Function;
		
		public var objectProp:Object = {functionProp:null};
	}
}