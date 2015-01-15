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
		public function AMFRemoteObject(destination:String=null)
		{
			super(destination);
		}
	}
}