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
	}
}