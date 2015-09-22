///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.rpc
{
	import mx.rpc.remoting.RemoteObject;
	
	import net.fproject.core.AppContext;
	import net.fproject.event.AppContextEvent;
	
	public dynamic class AMFRemoteObject extends RemoteObject implements IRemoteObject
	{
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setAuthToken(token:String):void
		{
			this.setCredentials('', token);
			AppContext.instance.addEventListener(AppContextEvent.ACCESS_TOKEN_CHANGE,
				function(e:AppContextEvent):void
				{
					setCredentials('', e.data as String);
				});
		}
		
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
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setConvertResultHandler(value:Function):void
		{
			convertResultHandler = value;
		}
		
		public function AMFRemoteObject(destination:String=null)
		{
			super(destination);
		}
	}
}