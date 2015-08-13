package net.fproject.model
{
	import flash.events.EventDispatcher;
	
	import mx.core.IUID;
	import mx.events.PropertyChangeEvent;
	
	/**
	 * 
	 * LocalUID class is abstract class for all model classes that have 'uid' field.
	 * By default, if the model has an 'id' field, then the 'uid' value always the same as 'id'.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class LocalUID extends EventDispatcher implements IUID
	{
		private var _uid:String;
		
		[Transient]
		[Bindable(event="propertyChange")]
		public function get uid():String
		{
			if(this.hasOwnProperty('id'))
				return this['id'];
			else
				return _uid;
		}
		
		public function set uid(value:String):void
		{
			if(this.uid != value)
			{
				if(this.hasOwnProperty('id'))
				{
					this['id'] = value;
				}
				else 
				{
					var oldValue:String = _uid;
					_uid = value;
				}
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, 'uid', oldValue, value));
			}
		}
		
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
	}
}