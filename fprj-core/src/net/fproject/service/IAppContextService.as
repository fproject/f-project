///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.service
{
	import mx.rpc.CallResponder;
	
	import net.fproject.model.User;

	/**
	 * 
	 * The IAppContextService declare an interface for application context service.
	 * This service supplies methods to load/save context data, and login/logout.
	 * 
	 */
	public interface IAppContextService
	{
		/**
		 * Load application context data.
		 * @param loginUserId the logged in user ID
		 * @param completeCallback the call-back function that will be invoked after
		 * the remote object call succesfully returned. This function must have one parameter,
		 * which will be passed an AppContextData object after the call responsed
		 * @param failCallback the call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 */
		function load(loginUserId:String,
					  completeCallback:Function=null, failCallback:Function=null):CallResponder;
		
		/**
		 * Save application context data.
		 * @param data the application context data object.
		 * 
		 * @param completeCallback the call-back function that will be invoked after
		 * the remote object call succesfully returned. This function must have one parameter,
		 * which will be passed a boolean indicates whether the call is success or not.
		 * @param failCallback the call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 */
		function save(data:Object,
					  completeCallback:Function=null, failCallback:Function=null,
					  attributes:Array=null):CallResponder;
		
		/**
		 * Authenticate a user by username and password. 
		 * @param userName the user name credential. This can be user account name or email
		 * @param password the password credential
		 * @param completeCallback
		 * @param failCallback
		 * @return if current chanelSet is null, this function will set credential for service and returns null.
		 * otherwise, it returns a responder for the login service call
		 * 
		 */
		function login(userName:String, password:String,
					   completeCallback:Function=null, failCallback:Function=null):CallResponder;
		
		/**
		 * Log the current user out 
		 * @param completeCallback
		 * @param failCallback
		 * @return a responder for this service call
		 */
		function logout(completeCallback:Function=null, failCallback:Function=null):CallResponder;
		
		/**
		 * Load application context initialize information.
		 * @param completeCallback the call-back function that will be invoked after
		 * the remote object call succesfully returned. This function must have one parameter,
		 * which will be passed an initialize information object after the call responsed
		 * @param failCallback the call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 */
		function initialize(completeCallback:Function, failCallback:Function):void;
		
		/**
		 * Create default login user.
		 * @return the default login user.
		 */
		function createDefaultLoginUser():User;
		
		/**
		 * Create default application context data.
		 * @return the default application context data.
		 */
		function createDefaultContextData():Object;
	}
}