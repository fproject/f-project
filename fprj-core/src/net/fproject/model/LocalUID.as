package net.fproject.model
{
	import mx.core.IUID;
	
	import net.fproject.core.PropertyChangeDispatcher;
	
	/**
	 * 
	 * LocalUID class is abstract class for all model classes that have 'uid' field.
	 * By default, if the model has an 'id' field, then the 'uid' value always the same as 'id'.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class LocalUID extends PropertyChangeDispatcher implements IUID
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
				dispatchChangeEvent('uid', oldValue, value);
			}
		}		
	}
}