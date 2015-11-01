///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	import flash.utils.getDefinitionByName;
	
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.config.ServerConfig;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.Injector;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.MetadataArgument;
	import org.as3commons.reflect.Method;
	import org.as3commons.reflect.Type;
	
	public class RemoteObjectFactory
	{
		private static var nameToRemoteObject:Object = {};
		
		private static var serverConfig:XML
		/**
		 * Set server configuration 
		 * @param config the server configuration, using the following sample format:
		 * <pre>
		 *&lt;ServerConfig&gt;
	     *   		&lt;DefaultDestination&gt;projectkitamf&lt;/DefaultDestination&gt;
	     *   		&lt;RemoteObject&gt;
	     *     			&lt;Name&gt;IssueService&lt;/Name&gt;
	     *     			&lt;Destination&gt;pk-http&lt;/Destination&gt;
	     *    			&lt;Impl&gt;net.fproject.rpc.JSONRemoteObject&lt;/Impl&gt;
	     *   		&lt;/RemoteObject&gt;
	     *	&lt;/ServerConfig&gt;</pre>
		 * 
		 */
		public static function setServerConfig(config:XML):void
		{
			serverConfig = config;
		}
		
		private static const REMOTE_OBJECT:String = "remoteobject";
		private static const NAME:String = "name";
		private static const DESTINATION:String = "destination";
		private static const URI:String = "uri";
		
		public static function getInstance(proxy:Object):IRemoteObject
		{
			var type:Type = Type.forInstance(proxy);
			
			if(nameToRemoteObject[type.fullName] != undefined)
				return nameToRemoteObject[type.fullName];
			
			var meta:Object = Injector.findClassMetadataValue(type, REMOTE_OBJECT);
			if (meta is Metadata)
			{
				var m:Metadata = Metadata(meta);
				if(m.hasArgumentWithKey(NAME))
				{
					var name:String = m.getArgument(NAME).value;
				}
				else
				{
					name = MetadataArgument(m.arguments[0]).value;
				}
				
				if(m.hasArgumentWithKey(DESTINATION))
				{
					var dest:String = m.getArgument(DESTINATION).value;
				}
				else if(StringUtil.isBlank(MetadataArgument(m.arguments[1]).key))
				{
					dest = MetadataArgument(m.arguments[1]).value;
				}
				
				if(m.hasArgumentWithKey(URI))
				{
					var uri:String = m.getArgument(URI).value;
				}
				else if(m.arguments.length > 2 && StringUtil.isBlank(MetadataArgument(m.arguments[2]).key))
				{
					uri = MetadataArgument(m.arguments[2]).value;
				}
			}
			else
			{
				name = meta as String;
			}
			
			if(StringUtil.isBlank(name))
				return null;
			
			if(StringUtil.isBlank(dest))
			{
				for each(var x:XML in serverConfig.RemoteObject)
				{
					if(x.Name == name)
					{
						dest = x.Destination;
						var impl:String = x.Impl;
						break;
					}
				}
				
				if(StringUtil.isBlank(dest))
					dest = serverConfig.DefaultDestination;
				if(StringUtil.isBlank(dest))
					return null;
			}
			
			var cs:ChannelSet = ServerConfig.getChannelSet(dest);
			if(cs == null)
				return null;
			
			if(StringUtil.isBlank(impl))
			{
				var channel:Channel = ServerConfig.getChannel(cs.channelIds[0]);
				if(channel is JSONChannel)
				{
					var source:String = channel.url;
					if(!StringUtil.endsWith(source, "/"))
						source += "/";
					
					var remoteObj:IRemoteObject = new JSONRemoteObject(dest);
					JSONRemoteObject(remoteObj).fproject_internal::operationNameToMetadata = getOperationMetadata(type);
					if(StringUtil.isBlank(uri))
					{
						source += name.toLowerCase();
					}
					else
					{
						if(StringUtil.startsWith(uri, "/"))
							uri = uri.substr(1);
						source += uri;
					}
				}
				else
				{
					remoteObj = new AMFRemoteObject(dest);
					source = name;
				}
			}
			else
			{
				var clazz:Class = getDefinitionByName(impl) as Class;
				remoteObj = new clazz();
			}
			
			remoteObj.source = source;
			remoteObj.destination = dest;
			remoteObj.channelSet = cs;
			
			nameToRemoteObject[type.fullName] = remoteObj;
			
			return remoteObj;
		}
		
		private static const REST_OPERATION:String = "restoperation";
		private static const METHOD:String = "method";
		private static const RETURNING:String = "returning";
		private static const NAMED_PARAMS:String = "namedParams";
		private static const ROUTE:String = "route";
		
		private static function getOperationMetadata(type:Type):Object
		{
			var opMeta:Object = {};
			for each(var method:Method in type.methods)
			{
				var found:Boolean = false;
				for each (var meta:Metadata in method.metadata)
				{
					if(meta.name.toLowerCase() == REST_OPERATION)
					{
						var returnMeta:Object = {};
						if(meta.hasArgumentWithKey(METHOD))
						{
							returnMeta.method = meta.getArgument(METHOD).value;
							found = true;
						}
						else if(meta.arguments.length > 0 && StringUtil.isBlank(MetadataArgument(meta.arguments[0]).key))
						{
							returnMeta.method = MetadataArgument(meta.arguments[0]).value;
							found = true;
						}
							
						if(meta.hasArgumentWithKey(NAMED_PARAMS))
						{
							returnMeta.namedParams = ("true" == meta.getArgument(NAMED_PARAMS).value);
							found = true;
						}
						else if(meta.arguments.length > 1 && StringUtil.isBlank(MetadataArgument(meta.arguments[1]).key))
						{
							returnMeta.namedParams = ("true" == MetadataArgument(meta.arguments[1]).value);
							found = true;
						}
						
						if(meta.hasArgumentWithKey(RETURNING))
						{
							returnMeta.returning = meta.getArgument(RETURNING).value;
							found = true;
						}
						else if(meta.arguments.length > 2 && StringUtil.isBlank(MetadataArgument(meta.arguments[2]).key))
						{
							returnMeta.returning = MetadataArgument(meta.arguments[2]).value;
							found = true;
						}
						
						if(meta.hasArgumentWithKey(ROUTE))
						{
							returnMeta.route = meta.getArgument(ROUTE).value;
							found = true;
						}
						else if(meta.arguments.length > 3 && StringUtil.isBlank(MetadataArgument(meta.arguments[3]).key))
						{
							returnMeta.route = MetadataArgument(meta.arguments[3]).value;
							found = true;
						}
						
						break;
					}
				}
				if(found)
					opMeta[method.name] = returnMeta;
			}
			return opMeta;
		}
	}
}