///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di
{
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;
	
	[DefaultProperty("impls")]
	/**
	 * <p>The ImplementationConfig class is used to separate system's implementation configuration 
	 * into configuration MXML files allowing the system to be easily reconfigured for different 
	 * situations that require different implementations of components.</p>
	 * <p>Example:
	 * <pre>
	 * &lt;fx:Declarations&gt;
	 * 	&lt;fprj:ImplementationConfig&gt;
	 * 		&lt;fprj:Implementation abstractor="net.projectkit.controller.IAppContextController"
	 * 			impl="net.projectkit.controller.WebAppContextController"/&gt;
	 * 		&lt;fprj:Implementation abstractor="net.projectkit.util.IExternalInterfaceUtil"
	 * 			impl="net.projectkit.util.web.WebExternalInterfaceUtil"/&gt;
	 * 	&lt;/fprj:ImplementationConfig&gt;
	 * &lt;/fx:Declarations&gt;</pre>
	 * </p>
	 */
	public class ImplementationConfig
	{
		/**
		 * An array of implementation declarations 
		 */
		public var impls:Array;
		
		private static var _instance:ImplementationConfig;
		
		public static function get instance():ImplementationConfig
		{
			if(_instance == null)
				_instance = new ImplementationConfig;
			return _instance;
		}
		
		/**
		 * Constrcutror 
		 * 
		 */
		public function ImplementationConfig()
		{
			if(_instance != null)
				LoggingUtil.logAndThrowError(ImplementationConfig, ResourceUtil.FPRJ_CORE, 2, null,
					ResourceUtil.FPRJ_CORE_BUNDLE, "singleton.violation");
			_instance = this;
		}
		
		/**
		 * Add an implementation definition 
		 * @param impl the implementation to add.
		 * 
		 */
		public function addImplementation(impl:Implementation):void
		{
			if(impls == null)
				impls = [];
			impls.push(impl);
		}
	}
}