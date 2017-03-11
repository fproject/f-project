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
