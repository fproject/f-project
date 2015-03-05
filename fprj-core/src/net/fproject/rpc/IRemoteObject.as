///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	import flash.events.IEventDispatcher;
	
	import mx.messaging.ChannelSet;

	public interface IRemoteObject extends IEventDispatcher
	{
		function set source(value:String):void;
		function set destination(value:String):void;
		function set channelSet(value:ChannelSet):void;
		function get channelSet():ChannelSet;
		
		function setCredentials(username:String, password:String, charset:String=null):void;
		
		/**
		 * Set the convertParametersHandler function.
		 * This is an optional function, primarily intended for framework developers who need to install
		 * a function to get called with the parameters passed to each remote object invocation.
		 * The function takes an array of parameters and returns the potentially altered array.
		 *
		 * The function definition should look like:
		 * <code>
		 *   function myParametersFunction(parameters:Array):Array
		 * </code>
		 * @param value the value to set
		 * 
		 */
		function setConvertParametersHandler(value:Function):void;
		
		/**
		 * Set the convertResultHandler function.
		 * This is an optional function, primarily intended for framework developers who need to install
		 * a hook to process the results of an operation before notifying the result handlers.
		 *
		 * The function definition should look like:
		 * <code>
		 *   function myConvertResultsFunction(result:&#42;, operation:AbstractOperation):&#42;
		 * </code>
		 * 
		 * It is passed the result just after the makeObjectsBindable conversion has been done
		 * but before the result event is created.
		 *  
		 */
		function setConvertResultHandler(value:Function):void;
	}
}