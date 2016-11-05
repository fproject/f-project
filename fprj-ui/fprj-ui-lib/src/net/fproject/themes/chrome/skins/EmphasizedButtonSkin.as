package net.fproject.themes.chrome.skins
{
	import mx.binding.BindingManager;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	
	import spark.primitives.Rect;
	
	public class EmphasizedButtonSkin extends ButtonSkin
	{
		private var _emphasizedFill:SolidColor;
		
		private var _emphasizedOverlay:Rect;
		
		private var _emphasizedStroke:SolidColorStroke;
		
		override protected function createMxmlContent():Array
		{
			var a:Array = super.createMxmlContent();
			a.insertAt(2, this.createEmphasizedOverlay()); 
			return a;
		}
		

		protected function createEmphasizedOverlay() : Rect
		{
			var r:Rect = new Rect();
			r.left = 0;
			r.right = 0;
			r.top = 0;
			r.bottom = 0;
			r.radiusX = 3;
			r.stroke = this.createEmphasizedStroke();
			r.fill = this.createEmphasizedFill();
			r.initialized(this,"emphasizedOverlay");
			this.emphasizedOverlay = r;
			BindingManager.executeBindings(this,"emphasizedOverlay",this.emphasizedOverlay);
			return r;
		}
		
		protected function createEmphasizedStroke() : SolidColorStroke
		{
			var s:SolidColorStroke = new SolidColorStroke(0x194E84);
			s.alpha = 0.5;
			this.emphasizedStroke = s;
			BindingManager.executeBindings(this,"emphasizedStroke",this.emphasizedStroke);
			return s;
		}
		
		protected function createEmphasizedFill() : SolidColor
		{
			var f:SolidColor = new SolidColor(0x194E84);
			f.alpha = 0.1;
			this.emphasizedFill = f;
			BindingManager.executeBindings(this,"emphasizedFill",this.emphasizedFill);
			return f;
		}
		
		[Bindable(event="propertyChange")]
		public function get emphasizedFill() : SolidColor
		{
			return this._emphasizedFill;
		}
		
		public function set emphasizedFill(value:SolidColor) : void
		{
			var o:Object = this._emphasizedFill;
			if(o !== value)
			{
				this._emphasizedFill = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emphasizedFill",o,value));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get emphasizedOverlay() : Rect
		{
			return this._emphasizedOverlay;
		}
		
		public function set emphasizedOverlay(value:Rect) : void
		{
			var o:Object = this._emphasizedOverlay;
			if(o !== value)
			{
				this._emphasizedOverlay = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emphasizedOverlay",o,value));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get emphasizedStroke() : SolidColorStroke
		{
			return this._emphasizedStroke;
		}
		
		public function set emphasizedStroke(value:SolidColorStroke) : void
		{
			var o:Object = this._emphasizedStroke;
			if(o !== value)
			{
				this._emphasizedStroke = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emphasizedStroke",o,value));
				}
			}
		}
	}
}