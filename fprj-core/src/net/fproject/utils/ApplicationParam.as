package net.fproject.utils
{
	import mx.core.FlexGlobals;
	
	import net.fproject.di.InstanceFactory;

	public class ApplicationParam
	{
		static public function get instance() : ApplicationParam
		{
			return InstanceFactory.getInstance(ApplicationParam);
		}
		
		public function getParameter(paramName:String):*
		{
			return decodeURIComponent(FlexGlobals.topLevelApplication.parameters[paramName]);
		}
	}
}