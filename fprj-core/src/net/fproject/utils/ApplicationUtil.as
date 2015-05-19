///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of F-Project
//
// Copyright © 2014 F-Project. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.system.Capabilities;
	
	import mx.core.FlexGlobals;
	import mx.managers.BrowserManager;
	import mx.managers.IBrowserManager;
	
	/**
	 * 
	 * A set of application utility methods
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class ApplicationUtil
	{
		public static function getModuleBaseUrl() : String
		{
			if (isDesktop())
			{
				return "modules";
			}
			else
				return getAppParameter("moduleBaseUrl");
		}
		
		public static function isDesktop():Boolean
		{
			return Capabilities.playerType == "Desktop";
		}
		
		/**
		 * Check if the runtime operating system is the given OS name
		 * @param osName the name of OS to check. This can be <code>"iOS"</code> or <code>"Android"</code>, etc...
		 * @return <code>true</code> if the runtime operating system is the given OS name.
		 * <code>false</code> if otherwise.
		 * */
		public static function checkRuntimeOS(osName:String):Boolean
		{
			return (Capabilities.manufacturer.indexOf(osName) != -1);
		}
		
		/**
		 * Get this Flex application base URL.
		 * @return the application base URL.<br/>
		 * Default value is <code>'/flexapps/projectkit'</code>
		 * 
		 */
		public static function getFlexAppBaseUrl() : String
		{
			return getAppParameter("baseUrl");
		}
		
		/**
		 * Get the base URL of RSLs.<br/>
		 * This is URL of the directory where all RSLs libraries (*.SWF files) stored.
		 * @return the RSL base URL.<br/>
		 * Default value is <code>'/flexapps/projectkit'</code>
		 * 
		 */
		public static function getRslBaseUrl() : String
		{
			return getAppParameter("rslBaseUrl");
		}
		
		/**
		 * Get the URL to a module/sub-module 
		 * @param module the name or relative path of module/sub-module.<br/>
		 * For example: <code>"TaskModule"</code> or <code>"task/CalendarView"</code>.
		 * @return the URL of module.
		 * 
		 */
		public static function getModuleUrl(module:String):String
		{
			var moduleBaseUrl:String = getModuleBaseUrl();
			if (".swf" != module.substr(module.length-5, 4).toLowerCase())
				module += ".swf";
			if (moduleBaseUrl != null && moduleBaseUrl.charAt(moduleBaseUrl.length - 1) != '/')
				moduleBaseUrl += '/';
			if (module.charAt(0) == '/')
				module = module.substr(1);
			return (moduleBaseUrl != null ? moduleBaseUrl : "") + module;
		}
		
		public static function getAppParameter(paramName:String) : *
		{
			return decodeURIComponent(FlexGlobals.topLevelApplication.parameters[paramName]);
		}
		
		/**
		 * This method build an absolute path to the given URL which is relative
		 * to the application. To do that, we get the url of the application,
		 * remove the application's name from it and finally append the given url.
		 *
		 * @param url The URL relative to the application to transform into
		 *            an absolute URL.
		 * @return The absolute URL.
		 */
		public static function getAbsolutePathTo(url:String):String
		{
			var absUrl:String = new String(url);
			if (url.substr(0,1) == "/")
				url = url.substr(1);
			// get the url of the application
			var s:String = FlexGlobals.topLevelApplication.url;
			// get the index of the last / or \ in the application url
			var index:int = Math.max(s.lastIndexOf("\\"), s.lastIndexOf("/"));
			
			// remove the application name from the absolute url and append the relative url
			if (index != -1)
				absUrl = s.substr(0, index + 1) + url;
			
			return absUrl;
		}
		
		/**
		 * Get base URL of the web application that own this Flex application.
		 * For example: http://localhost
		 * @return The web app URL.
		 */
		public static function getWebAppBaseUrl():String
		{
			// get the url of the application
			var topAppUrl:String = FlexGlobals.topLevelApplication.url;
			var flexAppBaseUrl:String = getFlexAppBaseUrl();
			// get the index of the last / or \ in the application url
			var i:int = Math.max(topAppUrl.lastIndexOf("\\"), topAppUrl.lastIndexOf("/"));
			if(i != -1)
				topAppUrl = topAppUrl.substr(0, i);
			i = topAppUrl.lastIndexOf(flexAppBaseUrl);
			if(i != -1)
				topAppUrl = topAppUrl.substring(0, i);
			return topAppUrl;
		}
		
		private static var _webAppUrl:String;
		/**
		 * Get URL of the web application that own this Flex application.
		 * For example: http://localhost/projectkit
		 * @return The web app URL.
		 */
		public static function getWebAppUrl():String
		{
			if(_webAppUrl == null)
			{
				var browserManager:IBrowserManager = BrowserManager.getInstance();
				browserManager.init();
				_webAppUrl = browserManager.base;
				if(_webAppUrl != null)
				{
					var i:int = _webAppUrl.indexOf("?r=");
					if(i > 0)
					{
						if(_webAppUrl.charAt(i - 1) == "/")
							i--;
						_webAppUrl = _webAppUrl.substr(0, i);
					}
				}
			}
			return _webAppUrl;
		}
		
		/**
		 * Get RSL absolute path from its relative path.
		 * 
		 * @param rslUrl The RSL's URL relative to the website that own this Flex application.
		 * @return The absolute URL.
		 */
		public static function getRslAbsoluteUrl(rslUrl:String):String
		{
			return getWebAppBaseUrl() + getRslBaseUrl() + "/" + rslUrl;
		}
	}
}