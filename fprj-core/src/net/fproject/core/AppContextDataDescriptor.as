///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	public class AppContextDataDescriptor
	{
		public var initInfoToLoginUserId:Function;
		public var initInfoToLoginUserToken:Function;
		public var contextDataToServerConfig:Function;
		public var loginResultToLoginUserId:Function;
		public var loginResultToLoginUserToken:Function;
		
		protected function defaultInitInfoToLoginUserId(info:Object):String
		{
			return info.loginUserId;
		}
		
		protected function defaultInitInfoToLoginUserToken(info:Object):String
		{
			return info.userToken;
		}
		
		protected function defaultContextDataToServerConfig(data:Object):XML
		{
			return data.serverConfig;
		}
		
		protected function defaultLoginResultToLoginUserId(result:String):String
		{
			var i:int = result.indexOf(":");
			return result.substring(0, i);
		}
		
		protected function defaultLoginResultToLoginUserToken(result:String):String
		{
			var i:int = result.indexOf(":");
			return result.substring(i + 1);	
		}
		
		/**
		 * 
		 * Constructor 
		 * 
		 */
		public function AppContextDataDescriptor()
		{
			initInfoToLoginUserId = defaultInitInfoToLoginUserId;
			initInfoToLoginUserToken = defaultInitInfoToLoginUserToken;
			contextDataToServerConfig = defaultContextDataToServerConfig;
			loginResultToLoginUserId = defaultLoginResultToLoginUserId;
			loginResultToLoginUserToken = defaultLoginResultToLoginUserToken;
		}
	}
}