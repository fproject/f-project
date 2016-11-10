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
package net.fproject.rpc
{
	import flash.utils.getDefinitionByName;
	
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.config.ServerConfig;
	
	import net.fproject.reflect.ReflectionUtil;
	import net.fproject.utils.DataUtil;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.MetadataArgument;
	import org.as3commons.reflect.Method;
	import org.as3commons.reflect.Type;
	
	/**
	 * The RemoteObjectFactory provides factory method for instantiating
	 * remote objects in both AMF and JSON channels.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class RemoteObjectFactory
	{
		/**
		 * @private 
		 */
		private static var nameToRemoteObject:Object = {};
		
		private static var serverConfig:Object
		/**
		 * Set server configuration 
		 * @param config the server configuration, using the following sample format:
		 * <pre>{
		 * "defaultDestination" : "pk-main",
		 * "remoteObjects" : [
		 * 	{ "name" : "IssueService", "destination" : "pk-issue" },
		 * 	{ "name" : "AttachmentService", "destination" : "pk-file" }
		 * ],
		 * "htmlEndpoints" : [
		 * 	{
		 * 		"name" : "IssueKanban",
		 * 		"uri" : "http://erp.projectkit.net/auth_oauth/signin",
		 * 		"params" : {
		 * 			"access_token" : "$ACCESS_TOKEN",
		 * 			"state" : {"p": "pk", "m": 165, "d": "odoo_database"}
		 * 		}
		 * 	}
		 * ]
		 * }</pre>
		 * 
		 */
		public static function setServerConfig(config:Object):void
		{
			serverConfig = config;
		}
		
		private static const REMOTE_OBJECT:String = "remoteobject";
		private static const NAME:String = "name";
		private static const DESTINATION:String = "destination";
		private static const URI:String = "uri";
		private static const MODEL_CLASS:String = "modelClass";
		
		/**
		 * Get a singleton instance of a remote object type. 
		 * @param proxy the proxy object that contains metadata for DI reflection
		 * @return a singleton instance of the remote object type.
		 * 
		 */
		public static function getInstance(proxy:Object):IRemoteObject
		{
			var type:Type = Type.forInstance(proxy);
			
			if(nameToRemoteObject[type.fullName] != undefined)
				return nameToRemoteObject[type.fullName];
			
			var meta:Object = ReflectionUtil.findClassMetadataValue(type, REMOTE_OBJECT);
			if ((meta is Array) && meta.length > 0 && (meta[0] is Metadata))
				meta = meta[0];
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
				
				if(m.hasArgumentWithKey(MODEL_CLASS))
				{
					var modelClass:String = m.getArgument(MODEL_CLASS).value;
				}
				else if(m.arguments.length > 3 && StringUtil.isBlank(MetadataArgument(m.arguments[3]).key))
				{
					modelClass = MetadataArgument(m.arguments[3]).value;
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
				var rmObjs:Array = DataUtil.getFieldValue(serverConfig, "remoteObjects") as Array;
				if(rmObjs != null)
				{
					for each(var o:Object in rmObjs)
					{
						if(o["name"] == name)
						{
							dest = o["destination"] as String;
							var impl:String = o["impl"] as String;
							break;
						}
					}
				}
				
				if(StringUtil.isBlank(dest))
					dest = DataUtil.getFieldValue(serverConfig, "defaultDestination");
				
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
					var remoteObj:IRemoteObject = 
						new JSONRemoteObject(name, dest, channel,
							getOperationMetadata(type), uri, modelClass, proxy);
					remoteObj.channelSet = cs;
				}
				else
				{
					remoteObj = new AMFRemoteObject(dest);
					remoteObj.source = name;
				}
			}
			else
			{
				var clazz:Class = getDefinitionByName(impl) as Class;
				remoteObj = new clazz();
				remoteObj.source = name;
			}
			
			remoteObj.destination = dest;
			remoteObj.channelSet = cs;
			
			nameToRemoteObject[type.fullName] = remoteObj;
			
			return remoteObj;
		}
		
		private static const REST_OPERATION:String = "restoperation";
		private static const METHOD:String = "method";
		private static const RETURNING:String = "returning";
		private static const ROUTE:String = "route";
		private static const EXTRA_PARAMS:String = "extraParams";
		
		/**
		 * Get operation metadata from type
		 * @param type
		 * @return operation metadata
		 * 
		 */
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
							
						if(meta.hasArgumentWithKey(RETURNING))
						{
							returnMeta.returning = meta.getArgument(RETURNING).value;
							found = true;
						}
						else if(meta.arguments.length > 1 && StringUtil.isBlank(MetadataArgument(meta.arguments[1]).key))
						{
							returnMeta.returning = MetadataArgument(meta.arguments[1]).value;
							found = true;
						}
						
						if(meta.hasArgumentWithKey(ROUTE))
						{
							returnMeta.route = meta.getArgument(ROUTE).value;
							found = true;
						}
						else if(meta.arguments.length > 2 && StringUtil.isBlank(MetadataArgument(meta.arguments[2]).key))
						{
							returnMeta.route = MetadataArgument(meta.arguments[2]).value;
							found = true;
						}
						
						if(meta.hasArgumentWithKey(EXTRA_PARAMS))
						{
							returnMeta.extraParams = meta.getArgument(EXTRA_PARAMS).value;
							found = true;
						}
						else if(meta.arguments.length > 3 && StringUtil.isBlank(MetadataArgument(meta.arguments[3]).key))
						{
							returnMeta.extraParams = MetadataArgument(meta.arguments[3]).value;
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