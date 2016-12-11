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
		}
		
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
		}
		
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
		}
		
		
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
			logWarn(clazz, ResourceUtil.FPRJ_CORE, messageNumber, null, 
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
		}
		
		/**
		 * Log a message at the ERROR level according to the specified message bundle message and parameters.
		 * An Error is thrown after logging.
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
		}
		
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
		}
		
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
		}
		
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
		}
		
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
		}
		
		/**
		 * Log a message at the INFO level by a message from resource bundle.
		 * The resource name is composed from message number, bundle key and "I" prefix.
		 * For example, the call 
		 * <code>logInfo(MyClass, "FPRJ0", 99, null, "fprjcore", "my.bundle.key")</code>
		 * will search in resource bundle <code>fprjcore.properties</code> to find a resource
		 * with name <code>my.bundle.key.FPRJ0099I</code>
		 * 
		 * @param clazz The source class to log
		 * @param module The source module to log
		 * @param messageNumber The message number, this should be unique for each module scope
		 * @param resourceManager an IResourceManager instance to handle resource bundle.
		 * If <code>null</code> is passed to this argument, the logger will use  ResourceManager.getInstance() instead.
		 * @param resourceBundle The resource bundle
		 * @param bundleKey The bundle key that is used to find log message 
		 * @param parameters An Array of parameters that are substituted for the "{0}", "{1}", and so on.
		 * Each parameter is converted to a String with the toString() method before being substituted.
		 * 
		 */
		public static function logInfo(clazz:Class, module:String, messageNumber:uint, 
									   resourceManager:IResourceManager, resourceBundle:String, 
									   bundleKey:String, parameters:Array = null) : void
		{
			log(clazz, LogEventLevel.INFO, ResourceUtil.getInfo(
				module, messageNumber, resourceManager, resourceBundle, bundleKey, parameters));
		}
		
		/**
		 * <p>Log a message at the WARN level by a message from resource bundle.
		 * The resource name is composed from message number, bundle key and "W" prefix.</p>
		 * <p>For example, the call 
		 * <code>logWarn(MyClass, "FPRJ0", 11, null, "fprjcore", "my.bundle.key")</code>
		 * will search in resource bundle <code>fprjcore.properties</code> to find a resource
		 * with name <code>my.bundle.key.FPRJ0011W</code></p>
		 * 
		 * @param clazz The source class to log
		 * @param module The source module to log
		 * @param messageNumber The message number, this should be unique for each module scope
		 * @param resourceManager an IResourceManager instance to handle resource bundle.
		 * If <code>null</code> is passed to this argument, the logger will use  ResourceManager.getInstance() instead.
		 * @param resourceBundle The resource bundle
		 * @param bundleKey The bundle key that is used to find log message 
		 * @param parameters An Array of parameters that are substituted for the "{0}", "{1}", and so on.
		 * Each parameter is converted to a String with the toString() method before being substituted.
		 * 
		 */
		public static function logWarn(clazz:Class, module:String, messageNumber:uint, 
										  resourceManager:IResourceManager, resourceBundle:String, 
										  bundleKey:String, parameters:Array = null) : void
		{
			log(clazz, LogEventLevel.WARN, ResourceUtil.getWarn(
				module, messageNumber, resourceManager, resourceBundle, bundleKey, parameters));
		}
		
		/**
		 * <p>Log a message at the ERROR level by a message from resource bundle, and throw an Error after logging.
		 * The resource name is composed from message number, bundle key and "E" prefix.</p>
		 * <p>For example, the call 
		 * <code>logAndThrowError(MyClass, "FPRJ0", 1, null, "fprjcore", "my.bundle.key")</code>
		 * will search in resource bundle <code>fprjcore.properties</code> to find a resource
		 * with name <code>my.bundle.key.FPRJ0001E</code></p>
		 * 
		 * @param clazz The source class to log
		 * @param module The source module to log
		 * @param messageNumber The message number, this should be unique for each module scope
		 * @param resourceManager an IResourceManager instance to handle resource bundle.
		 * If <code>null</code> is passed to this argument, the logger will use  ResourceManager.getInstance() instead.
		 * @param resourceBundle The resource bundle
		 * @param bundleKey The bundle key that is used to find log message 
		 * @param parameters An Array of parameters that are substituted for the "{0}", "{1}", and so on.
		 * Each parameter is converted to a String with the toString() method before being substituted.
		 * 
		 */
		public static function logAndThrowError(clazz:Class, module:String, messageNumber:uint, 
												resourceManager:IResourceManager, resourceBundle:String, 
												bundleKey:String, parameters:Array = null) : void
		{
			var msgUid:String = ResourceUtil.getError(module, messageNumber, resourceManager, 
				resourceBundle, bundleKey, parameters);
			log(clazz, LogEventLevel.ERROR, msgUid);
			throw new Error(msgUid);
		}
	}
}
