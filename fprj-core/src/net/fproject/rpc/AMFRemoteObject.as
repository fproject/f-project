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