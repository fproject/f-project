///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.model
{
	import net.fproject.fproject_internal;

	/**
	 * Represents an user.
	 */
	public class User
	{
		[Bindable]
		/**
		 * An unique number identity of user 
		 */
		public var id:String;

		[Bindable]
		/**
		 * The user account name 
		 */
		public var userName:String;
		
		private var _token:String;
		
		[Transient]
		/**
		 * The authentication token 
		 */
		public function get token():String
		{
			return _token;
		}
		
		/**
		 * Set the authentication token 
		 */
		fproject_internal function setToken(value:String):void
		{
			_token = value;
		}
	}
}