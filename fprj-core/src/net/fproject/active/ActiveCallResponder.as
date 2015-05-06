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
	
	/**
	 *  This component helps you manage the results for asynchronous calls made from
	 *  ActiveService and binding those result with an IActiveDataProvider.
	 *  While each individual service
	 *  and operation dispatches result and fault events, it is common to need to use the
	 *  same operation in different parts of your application.  Using one event listener
	 *  or lastResult value across the entire application can be awkward.  Rather than creating
	 *  two service components which refer to the same service, you can use a simple lightweight
	 *  IActiveDataProvider to manage the event listeners and lastResult value for a specific invocation
	 *  of a service.
	 *  <p>
	 *  You set the token property of this component to the AsyncToken returned by the 
	 *  service.  You can then add event listeners on this component instead of having to
	 *  add them to each AsyncToken returned.   This component also maintains the
	 *  lastResult property which is a copy of the value returned by the last successful
	 *  result event dispatched by a token monitored by this service.  Though you can
	 *  bind to either the <code>callResponder.token.result</code> or 
	 *  <code>callResponder.lastResult</code>, the latter will be preserved while a second
	 *  call to the same service is in progress while the former will be reset as soon
	 *  as a new service invocation is started.
	 *  </p>
	 *  
	 * @see net.fproject.active.ActiveService
	 * @see net.fproject.active.IActiveDataProvider
	 * 
	 * @author Bui Sy Nguyen
	 */
	public class ActiveCallResponder extends CallResponder
	{
		private var _activeDataProvider:IActiveDataProvider;

		/**
		 * The active data privider dedicated to this call responder.
		 * 
		 */
		public function get activeDataProvider():IActiveDataProvider
		{
			return _activeDataProvider;
		}
		
		/**
		 * Constructor
		 * 
		 * @param activeDataProvider The active data privider dedicated to this call responder.
		 * 
		 */
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
		 *  an mx.rpc.events.FaultEvent.
		 */
		override public function fault(data:Object):void
		{
			if(_activeDataProvider != null)
				_activeDataProvider.fault(data);
			super.fault(data);
		}
	}
}