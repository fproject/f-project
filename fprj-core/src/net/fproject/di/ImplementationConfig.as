///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
			for each(var i:Implementation in impls)
			{
				if(i.abstractor == impl.abstractor)
				{
					i.impl = impl.impl;
					var found:Boolean = true;
					break;
				}
			}
			if(!found)
				impls.push(impl);
		}
	}
}