///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2014 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.event
{
	import flash.events.Event;
	
	public class AppContextEvent extends Event
	{
		private var _data:Object

		public function get data():Object
		{
			return _data;
		}

		public function AppContextEvent(type:String, data:Object=null)
		{
			super(type);
			_data = data;
		}
		
		public static const INITIALIZED:String = "initialized";
		
		public static const LOADED:String = "loaded";
		public static const LOAD_FAILED:String = "loadFailed";
		public static const SAVED:String = "saved";		
		
		public static const NETWORK_AVAILABILITY_CHANGE:String = "networkAvailabilityChange";
		
		public static const LOGGED_IN:String = "loggedIn";
		public static const LOGIN_FAILED:String = "loginFailed";
		public static const LOGGED_OUT:String = "loggedOut";
		
		public static const SERVICE_STARTED:String = "serviceStarted";
		public static const SERVICE_COMPLETED:String = "serviceStart";
		public static const SERVICE_FAILED:String = "serviceFailed";
		
		/**
		 * Application enters busy state 
		 * The <code>data<code> will contain a status message.
		 */
		public static const ENTER_BUSY_STATE:String = "enterBusyState";
		/**
		 * Application exits busy state 
		 */
		public static const EXIT_BUSY_STATE:String = "exitBusyState";
		
		/**
		 * Application error
		 */
		public static const APP_ERROR:String = "appError";
		
		/**
		 * A module is loaded
		 */
		public static const MODULE_LOADED:String = "moduleLoaded";
	}
}