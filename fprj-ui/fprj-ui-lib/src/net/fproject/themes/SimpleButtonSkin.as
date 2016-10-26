package net.fproject.themes
{
	import mx.binding.IBindingClient;
	import mx.core.IStateClient2;
	import mx.core.IVisualElement;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	
	import spark.skins.SparkButtonSkin;
	
	public class SimpleButtonSkin extends SparkButtonSkin implements IBindingClient, IStateClient2
	{
		public function SimpleButtonSkin(properties:Object=null)
		{
			super();
			for (var s:String in properties)
			{
				if(this.hasOwnProperty(s))
					this[s] = properties[s];
			}
			construct();
		}
		
		protected function construct():void
		{
			mx_internal::_document = this;
			this.currentState = "up";
			this.states = [new State({
				"name":"up"
			}),new State({
				"name":"over"
			}),new State({
				"name":"down",
				"overrides":[
					new SetProperty().initializeFromObject({
						"name":"alpha",
						"value":0.8
					})
				]
			}),new State({
				"name":"disabled"
			})];
			
			this.addEventListener("propertyChange",function(e:PropertyChangeEvent):void
			{
				if((e.property == "border" && e.newValue != null)||
					e.property == "borderVisibleStates" && border != null)
				{
					if(e.newValue)
						mxmlContent = [e.newValue];
					bindBorderVisibleStates("border");
				}				
			});
		}
		
		private var _border:IVisualElement;
		
		public function get border() : IVisualElement
		{
			return this._border;
		}
		
		public function set border(value:IVisualElement) : void
		{
			var o:Object = this._border;
			if(o !== value)
			{
				this._border = value;
				if(this.hasEventListener("propertyChange"))
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",o,value));
			}
		}
		
		private var _borderVisibleStates:Object;
		
		[Bindable(event="propertyChange")]
		public function get borderVisibleStates():Object
		{
			return _borderVisibleStates;
		}
		
		public function set borderVisibleStates(value:Object):void
		{
			if( _borderVisibleStates !== value)
			{
				var oldValue:Object = _borderVisibleStates;
				if(value is String)
				{
					var s:String = value as String;
					value = {};
					if(s.length > 0)
					{
						var a:Array = s.split(",");
						for each(var st:String in a)
						{
							value[st] = true;
						}
					}					
				}
				_borderVisibleStates = value;
				dispatchPropertyChangeEvent("borderVisibleStates", oldValue, value);
			}
		}
		
		protected function bindBorderVisibleStates(target:String):void
		{
			if(_borderVisibleStates == null)
				return;
			
			for each (var s:State in this.states)
			{
				if(s.name in _borderVisibleStates)
					var alpha:Number = 1;
				else
					alpha = 0;
				s.overrides.push(new SetProperty().initializeFromObject({
					"target":target,
					"name":"alpha",
					"value":alpha
				}));
			}
		}
	}
}