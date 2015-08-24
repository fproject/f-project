///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
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

    }
}
