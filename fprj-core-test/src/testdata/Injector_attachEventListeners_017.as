package testdata
{
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.events.PropertyChangeEvent;
	
	import spark.components.Label;

	public class Injector_attachEventListeners_017 extends EventDispatcher
	{
		private var _label:Label;

		[Bindable(event="propertyChange")]
		[EventHandling(event="click", handler="mouseClick")]
		public function get label():Label
		{
			return _label;
		}

		public function set label(value:Label):void
		{
			if( _label !== value)
			{
				var oldValue:Label = _label;
				_label = value;
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label", oldValue, value));
			}
		}

		public function mouseClick(e:MouseEvent):void
		{
			
		}
	}
}