///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.active
{
	import mx.rpc.CallResponder;
	
	public class ActiveCallResponder extends CallResponder
	{
		private var _activeDataProvider:IActiveDataProvider;

		public function get activeDataProvider():IActiveDataProvider
		{
			return _activeDataProvider;
		}
		
		public function ActiveCallResponder(activeDataProvider:IActiveDataProvider)
		{
			super();
			_activeDataProvider = activeDataProvider;
		}
		
		/**
		 *  This method is called by a remote service when the return value has been 
		 *  received.
		 *
		 *  @param data Object containing the information about the result. .
		 *  While <code>data</code> is typed as Object, it is often (but not always) 
		 *  an mx.rpc.events.ResultEvent.
		 */
		override public function result(data:Object):void
		{
			if(_activeDataProvider != null)
				_activeDataProvider.result(data);
			super.result(data);
		}
		
		/**
		 *  This method is called by a remote service when the failed result has been
		 *  received.
		 *
		 *  @param data Object containing the information about the error that occured. .
		 *  While <code>data</code> is typed as Object, it is often (but not always) 
		 *  an mx.rpc.events.ResultEvent.
		 */
		override public function fault(data:Object):void
		{
			if(_activeDataProvider != null)
				_activeDataProvider.fault(data);
			super.result(data);
		}
	}
}