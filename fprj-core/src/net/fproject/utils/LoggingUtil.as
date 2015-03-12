///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import mx.logging.targets.TraceTarget;
	import mx.resources.IResourceManager;
	
	import net.fproject.fproject_internal;
	
	/**
	 * 
	 * Provides some convenience methods for client logging, code debugging and exception handling.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class LoggingUtil
	{
		private static var isInitialized:Boolean = false;
		
		private static function initLogging():void {
			// Create a target.
			var logTarget:TraceTarget = new TraceTarget();
			
			// Log only messages for the classes in the mx.rpc.* and 
			// mx.messaging packages.
			logTarget.filters=ResourceUtil.getString("common.log.target.filters", 
				ResourceUtil.FPRJ_CORE_BUNDLE).split(",");
			
			// Log all log levels.
			logTarget.level = LogEventLevel.ALL;
			
			// Add date, time, category, and log level to the output.
			logTarget.includeDate = 
				new Boolean(ResourceUtil.getString("common.log.target.includeDate"));
			logTarget.includeTime = 
				new Boolean(ResourceUtil.getString("common.log.target.includeTime"));
			logTarget.includeCategory = 
				new Boolean(ResourceUtil.getString("common.log.target.includeCategory"));
			logTarget.includeLevel = 
				new Boolean(ResourceUtil.getString("common.log.target.includeLevel"));
			
			// Begin logging.
			Log.addTarget(logTarget);
			isInitialized = true;
		}
		
		private static function getLogger(clazz:Class) : ILogger
		{	
			var qualifiedClassName:String = getQualifiedClassName(clazz);
			qualifiedClassName = qualifiedClassName.replace("::", ".");
			return Log.getLogger(qualifiedClassName);
		}// end function
		
		/**
		 * Log a message at the INFO level according to the specified message bundle message and parameters.
		 *  
		 * @param clazz
		 * @param resourceManager
		 * @param bundleName
		 * @param resourceName
		 * @param parameters
		 * @param locale
		 * 
		 */
		public static function info(clazz:Class, resourceManager:IResourceManager, 
									resourceBundle:String, bundleKey:String, parameters:Array = null, 
									locale:String = null) : void
		{
			if (Log.isInfo())
			{
				getLogger(clazz).info(resourceManager.getString(resourceBundle, bundleKey, parameters, locale));
			}
		}// end function
		
		/**
		 * Log a message at the WARN level according to the specified message bundle message and parameters. 
		 * 
		 * @param clazz
		 * @param resourceManager
		 * @param bundleName
		 * @param resourceName
		 * @param parameters
		 * @param locale
		 * 
		 */
		public static function warn(clazz:Class, resourceManager:IResourceManager, 
									resourceBundle:String, bundleKey:String, parameters:Array = null, 
									locale:String = null) : void
		{
			if (Log.isWarn())
			{
				getLogger(clazz).warn(resourceManager.getString(resourceBundle, bundleKey, parameters, locale));
			}
		}// end function
		
		
		/**
		 * Log a message at the WARN level according to the specified message bundle message and parameters.
		 *  
		 * @param clazz
		 * @param messageNumber
		 * @param bundleKey
		 * @param parameters
		 * 
		 */
		fproject_internal static function warn(clazz:Class, messageNumber:int, 
											   bundleKey:String, parameters:Array = null):void
		{
			logWarning(clazz, ResourceUtil.FPRJ_CORE, messageNumber, null, 
				ResourceUtil.FPRJ_CORE_BUNDLE, bundleKey, parameters);
		}
		
		/**
		 * Log a message at the ERROR level according to the specified message bundle message and parameters. 
		 * 
		 * @param clazz
		 * @param resourceManager
		 * @param bundleName
		 * @param resourceName
		 * @param parameters
		 * @param locale
		 * 
		 */
		public static function error(clazz:Class, resourceManager:IResourceManager, 
									 resourceBundle:String, bundleKey:String, parameters:Array = null, 
									 locale:String = null) : void
		{
			if (Log.isError())
			{
				getLogger(clazz).error(resourceManager.getString(resourceBundle, bundleKey, parameters, locale));
			}
		}// end function
		
		/**
		 * Log a message at the ERROR level according to the specified message bundle message and parameters.
		 *  
		 * @param clazz
		 * @param messageNumber
		 * @param bundleKey
		 * @param parameters
		 * 
		 */
		fproject_internal static function error(clazz:Class, messageNumber:int, 
												bundleKey:String, parameters:Array = null):void
		{
			logAndThrowError(clazz, ResourceUtil.FPRJ_CORE, messageNumber, null, 
				ResourceUtil.FPRJ_CORE_BUNDLE, bundleKey, parameters);
		}
		
		/**
		 * Log a message at the DEBUG level according to the specified message bundle message and parameters.
		 * 
		 * @param clazz
		 * @param resourceManager
		 * @param bundleName
		 * @param resourceName
		 * @param parameters
		 * @param locale
		 * 
		 */
		public static function debug(clazz:Class, resourceManager:IResourceManager, 
									 resourceBundle:String, bundleKey:String, parameters:Array = null, 
									 locale:String = null) : void
		{
			if (Log.isDebug())
			{
				getLogger(clazz).debug(resourceManager.getString(resourceBundle, bundleKey, parameters, locale));
			}
		}// end function
		
		/**
		 * Log a message at the FATAL level according to the specified message bundle message and parameters.
		 * 
		 * @param clazz
		 * @param resourceManager
		 * @param bundleName
		 * @param resourceName
		 * @param parameters
		 * @param locale
		 * 
		 */
		public static function fatal(clazz:Class, resourceManager:IResourceManager, 
									 resourceBundle:String, bundleKey:String, parameters:Array = null, 
									 locale:String = null) : void
		{
			if (Log.isFatal())
			{
				getLogger(clazz).fatal(resourceManager.getString(resourceBundle, bundleKey, parameters, locale));
			}
		}// end function
		
		/**
		 * Log a message at the specified level according to the specified category, message message and parameters.
		 * 
		 * @param category
		 * @param level
		 * @param message
		 * @param parameters
		 * 
		 */
		public static function logCategory(category:String, level:int, message:String, 
										   parameters:Array = null) : void
		{
			if (isLoggable(level))
			{
				Log.getLogger(category).log(level, message, parameters);
			}
		}// end function
		
		/**
		 * Log a message at the specified level according to the specified message.
		 * 
		 * @param clazz
		 * @param level
		 * @param message
		 * 
		 */
		public static function log(clazz:Class, level:int, message:String) : void
		{
			if (isLoggable(level))
			{
				getLogger(clazz).log(level, message);
			}
		}// end function
		
		private static function isLoggable(level:int) : Boolean
		{
			if (!isInitialized)
			{
				initLogging();
			}
			switch(level)
			{
				case LogEventLevel.ALL:
				{
					return true;
				}
				case LogEventLevel.DEBUG:
				{
					return Log.isDebug();
				}
				case LogEventLevel.FATAL:
				{
					return Log.isFatal();
				}
				case LogEventLevel.ERROR:
				{
					return Log.isError();
				}
				case LogEventLevel.WARN:
				{
					return Log.isWarn();
				}
				case LogEventLevel.INFO:
				{
					return Log.isInfo();
				}
				default:
				{
					break;
				}
			}
			return false;
		}// end function
		
		public static function logInfo(clazz:Class, module:String, messageNumber:uint, 
									   resourceManager:IResourceManager, resourceBundle:String, 
									   bundleKey:String, parameters:Array = null) : void
		{
			log(clazz, LogEventLevel.INFO, ResourceUtil.getInfo(
				module, messageNumber, resourceManager, resourceBundle, bundleKey, parameters));
		}// end function
		
		public static function logWarning(clazz:Class, module:String, messageNumber:uint, 
										  resourceManager:IResourceManager, resourceBundle:String, 
										  bundleKey:String, parameters:Array = null) : void
		{
			log(clazz, LogEventLevel.WARN, ResourceUtil.getWarning(
				module, messageNumber, resourceManager, resourceBundle, bundleKey, parameters));
		}// end function
		
		public static function logAndThrowError(clazz:Class, module:String, messageNumber:uint, 
												resourceManager:IResourceManager, resourceBundle:String, 
												bundleKey:String, parameters:Array = null) : void
		{
			var msgUid:String = ResourceUtil.getError(module, messageNumber, resourceManager, 
				resourceBundle, bundleKey, parameters);
			log(clazz, LogEventLevel.ERROR, msgUid);
			throw new Error(msgUid);
		}// end function
	}
}
