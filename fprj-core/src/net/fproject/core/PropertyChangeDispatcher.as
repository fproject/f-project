///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.PropertyChangeEvent;
	
	/**
	 * 
	 * The base class for all components of F-Project that can fire PropertyChangeEvent event
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class PropertyChangeDispatcher extends EventDispatcher
	{
		public function dispatchChangeEvent(prop:String, oldValue:*, newValue:*):void
		{
			if(!changeEventDisabled && this.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, prop, oldValue, newValue));
		}
		
		private var changeEventDisabled:Boolean;
		
		public function disableChangeEvent():void
		{
			changeEventDisabled = true;
		}
		
		public function enableChangeEvent():void
		{
			changeEventDisabled = false;
		}
		
		public function PropertyChangeDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}