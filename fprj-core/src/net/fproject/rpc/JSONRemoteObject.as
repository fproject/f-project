///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.FlexVersion;
	import mx.core.mx_internal;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.HTTPChannel;
	import mx.messaging.channels.SecureHTTPChannel;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.AppContext;
	import net.fproject.event.AppContextEvent;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.StringUtil;
	
	/**
	 * The JSONRemoteObject class provides access to JSON-based RESTful services on remote servers.
	 *  
	 */
	public dynamic class JSONRemoteObject extends AbstractService implements IRemoteObject
	{	
		/**
		 * 
		 * Constructor
		 * 
		 * @param name
		 * @param dest Destination of the JSONRemoteObject.
		 * Should match a destination ID in the services-config.xml file.
		 * @param chanel
		 * @param opToMeta
		 * @param uri
		 * @param modelClassName
		 * @param proxy
		 * 
		 */
		public function JSONRemoteObject(name:String, dest:String, channel:Channel,
										 opToMeta:Object, uri:String, modelClassName:String,
										 proxy:Object)
		{
			super(dest);
			
			this.channel = channel;
			
			_source = channel.url;
			if(!StringUtil.endsWith(_source, "/"))
				_source += "/";			
			
			if(StringUtil.isBlank(uri))
			{
				_source += name.toLowerCase();
			}
			else
			{
				if(StringUtil.startsWith(uri, "/"))
					uri = uri.substr(1);
				_source += uri;
			}
			
			this.fproject_internal::operationNameToMetadata = opToMeta;
			
			this.modelClassName = modelClassName;
			
			this.proxy = proxy;
		}
		
		private var channel:Channel;
		
		private var _source:String
		
		/**
		 * Lets you specify a source value on the client;
		 * This is an absolute URL to use for accessing a service
		 *     
		 */
		public function get source():String
		{
			return _source;
		}
		
		/**
		 * @private
		 */
		public function set source(value:String):void
		{
			_source = value;
		}
		
		public override function getOperation(name:String):AbstractOperation
		{
			var op:AbstractOperation = super.getOperation(name);
			if (op == null)
			{
				op = new JSONOperation(this, name);
				mx_internal::_operations[name] = op;
				op.mx_internal::asyncRequest = mx_internal::asyncRequest;
				if(FlexVersion.CURRENT_VERSION >= 0x040B0000)
				{
					var n:QName = new QName(mx_internal, "setKeepLastResultIfNotSet");
					op[n](this.keepLastResult);
				}
			}
			
			return op;
		}
		
		private var _endpoint:String;
		
		[Inspectable(category="General")]
		/**
		 * This property allows the developer to quickly specify an endpoint for a JSONRemoteObject
		 * destination without referring to a services configuration file at compile time or programmatically creating 
		 * a ChannelSet. It also overrides an existing ChannelSet if one has been set for the JSONRemoteObject service.
		 *
		 * <p>If the endpoint url starts with "https" a SecureHTTPChannel will be used, otherwise an HTTPChannel will 
		 * be used. Two special tokens, {server.name} and {server.port}, can be used in the endpoint url to specify
		 * that the channel should use the server name and port that was used to load the SWF. </p>
		 *
		 * <p><b>Note:</b> This property is required when creating AIR applications.</p>
		 *  
		 */
		public function get endpoint():String
		{
			return _endpoint;
		}
		
		public function set endpoint(url:String):void
		{
			// If endpoint has changed, null out channelSet to force it
			// to be re-initialized on the next Operation send
			if (_endpoint != url || url == null)
			{
				_endpoint = url;
				channelSet = null;
			}
		}
		
		/**
		 * An optional function, primarily intended for framework developers who need to install
		 * a function to get called with the parameters passed to each remote object invocation.
		 * The function takes an array of parameters and returns the potentially altered array.
		 *
		 * The function definition should look like:
		 * <code>
		 *   function myParametersFunction(parameters:Array):Array
		 * </code>
		 *  
		 */
		public var convertParametersHandler:Function;
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setConvertParametersHandler(value:Function):void
		{
			convertParametersHandler = value;
		}
		
		/**
		 * <p>An optional function, primarily intended for framework developers who need to install
		 * a hook to process the results of an operation before notifying the result handlers.</p>
		 *
		 * <p>The function definition should look like:
		 * <code>
		 *   function myConvertResultsFunction(operation:JSONOperation, result:&#42;, message:IMessage):&#42;
		 * </code>, wherea, <code>operation</code> is the currently invoking JSON operation,
		 * <code>result</code> is the deserialized result returned by the operation and <code>message</code>
		 * is the original HTTP message returned by the operation.</p>
		 * 
		 * It is passed the result just after the makeObjectsBindable conversion has been done
		 * but before the result event is created.
		 *  
		 */
		public var convertResultHandler:Function;
		
		/**
		 * The class used to serialize/deserialize JSON data.
		 */
		public var modelClassName:String;
		
		private var _modelClass:Class;

		/**
		 * The class used to serialize/deserialize JSON data.
		 */
		public function get modelClass():Class
		{
			if(_modelClass == null)
			{
				if(!StringUtil.isBlank(modelClassName))
				{
					if(modelClassName.indexOf(".") < 0 && modelClassName.indexOf("::") < 0)
					{
						if(ApplicationDomain.currentDomain.hasDefinition(modelClassName))
							_modelClass = ApplicationDomain.currentDomain.getDefinition(modelClassName) as Class;
					}
					else
					{
						try
						{
							_modelClass = getDefinitionByName(modelClassName) as Class;
						}
						catch(e:Error)
						{
							LoggingUtil.fproject_internal::warn(JSONRemoteObject, 9, "model.class.not.found", [modelClassName]);
						}
					}
				}
				
				if(_modelClass == null && proxy.hasOwnProperty("modelClass"))
					_modelClass = proxy["modelClass"];
				
				if(_modelClass == null)
				{
					var s:String = getQualifiedClassName(proxy);
					var i:int = s.lastIndexOf("::");
					s = s.substr(i + 1);
					if(StringUtil.endsWith(s, "Service"))
						s = s.substr(0, s.length - 7);
					if(ApplicationDomain.currentDomain.hasDefinition(s))
						_modelClass = ApplicationDomain.currentDomain.getDefinition(s) as Class;
				}
			}			
			
			return _modelClass;
		}

		public var proxy:Object;
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setConvertResultHandler(value:Function):void
		{
			convertResultHandler = value;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setAuthToken(token:String):void
		{
			channelSet.setCredentials(token, null);
			channel.setCredentials(token);
			AppContext.instance.addEventListener(AppContextEvent.ACCESS_TOKEN_CHANGE,
				function(e:AppContextEvent):void
				{
					channelSet.setCredentials(e.data as String, null);
					channel.setCredentials(e.data as String);
				});
		}
		
		private var _endpointInitialized:Boolean;
		
		public function get endpointInitialized():Boolean
		{
			return _endpointInitialized;
		}
		
		/**
		 * Init endpoint 
		 * 
		 */
		fproject_internal function initEndpoint(channelSet:ChannelSet):void
		{
			if (endpoint != null && !_endpointInitialized)
			{
				var chan:Channel;
				if (endpoint.indexOf("https") == 0)
				{
					chan = new SecureHTTPChannel(null, endpoint);
				}
				else
				{
					chan = new HTTPChannel(null, endpoint);
				}
				
				// Propagate requestTimeout.
				chan.requestTimeout = requestTimeout;
				if(this.channelSet == null)
				{
					if(channelSet == null)
						channelSet = new ChannelSet();
					this.channelSet = channelSet;
				}
				
				this.channelSet.addChannel(chan);
				if(chan.channelSets.indexOf(channelSet) == -1)
					chan.channelSets.push(channelSet);
				
				_endpointInitialized = true;
			}
		}
		
		/**
		 * @private 
		 */
		fproject_internal var operationNameToMetadata:Object;
	}
}