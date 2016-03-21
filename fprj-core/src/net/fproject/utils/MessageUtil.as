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
package net.fproject.utils
{
    import mx.resources.*;

	/**
	 *  
	 * Message Utility
	 * 
	 */
    final public class MessageUtil
    {
		// Error Messages
		
        public static function getMessage(bundleName:String, resourceName:String, parameters:Array = null, 
										  resourceManager:IResourceManager = null) : String
        {
            if (resourceManager == null)
            {
                resourceManager = ResourceManager.getInstance();
            }            
            return getMessageUniqueID(resourceName) + ": " + 
				resourceManager.getString(bundleName, resourceName, parameters);
        }

        public static function wrongArgument(clazz:Class, method:String, argument:String, 
											 resourceManager:IResourceManager = null) : Error
        {
            var msg:String = ResourceUtil.getError(ResourceUtil.FPRJ_CORE, 1, resourceManager,
				ResourceUtil.FPRJ_CORE_BUNDLE, "invalid.argument.message", [method, argument]);
            return new ArgumentError(msg);
        }

        private static function getMessageUniqueID(resourceName:String) : String
        {
            var i:int = resourceName.lastIndexOf(".");
            return i != -1 ? resourceName.substr(i + 1) : "";
        }

		/**
		 * Shorten the logging message to 1000 characters limit 
		 * @param s
		 * 
		 */
		public static function shortenMsg(s:String):String
		{
			if(s != null)
				s = s.substr(0, 1000);
			return s;
		}
    }
}
