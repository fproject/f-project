package net.fproject.model
{
	import flash.events.EventDispatcher;
	
	import mx.core.IUID;
	import mx.events.PropertyChangeEvent;
	
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
	}
}