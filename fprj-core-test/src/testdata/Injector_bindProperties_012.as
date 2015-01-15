package testdata
{
	import flash.events.EventDispatcher;
	
	import mx.events.PropertyChangeEvent;
	
	import spark.components.Label;

	public class Injector_bindProperties_012 extends EventDispatcher
	{
		[PropertyBinding(text="myText@")]
		public var label:Label = new Label();
		
		private var _myText:String;

		[Bindable(event="propertyChange")]
		public function get myText():String
		{
			return _myText;
		}

		public function set myText(value:String):void
		{
			if( _myText !== value)
			{
				var oldValue:String = _myText;
				_myText = value;
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myText", oldValue, value));
			}
		}

	}
}