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
package net.fproject.util
{
	import net.fproject.utils.ResourceUtil;
	
	public class FprjuiUtil
	{
		/**
		 * Gets the string corresponding to the specified key 
		 * in the 'fprjui.properties' resource bundle
		 * 
		 * @param key The name of a resource in the resource bundle.
		 * 
		 * @param params An Array of parameters that are
		 * substituted for the placeholders.
		 * Each parameter is converted to a String with the <code>toString()</code> method
		 * before being substituted.
		 */
		public static function getString(key:String, params:Array=null):String
		{
			return ResourceUtil.getString(key, "fprjui", params);
		}
	}
}