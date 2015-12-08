package net.fproject.themes
{
	import mx.binding.BindingManager;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.SolidColorStroke;
	
	import spark.components.supportClasses.Skin;
	import spark.primitives.Rect;
	
	import net.fproject.themes.shapes.AdvancedRect;
	
	public class BorderAndGradientFillSkin extends Skin implements IStateClient2
	{
		protected var _backgroundFillColors:Array;
		
		protected var _backgroundAlpha:Number;
		
		protected var _borderColor:uint;
		
		protected var _borderAlpha:Number;
		
		protected var _borderVisible:Boolean;
		
		protected var backgroundFillColorsChanged:Boolean;
		
		protected var backgroundAlphaChanged:Boolean;
		
		protected var borderColorChanged:Boolean;
		
		protected var borderAlphaChanged:Boolean;
		
		protected var borderVisibleChanged:Boolean;
		
		public function BorderAndGradientFillSkin()
		{
			_borderVisible = true;
		}
		
		override protected function commitProperties() : void
		{
			super.commitProperties();
			var dirty:Boolean = false;
			
			if(backgroundFillColorsChanged)
			{
				backgroundFillColorsChanged = false;
				this._backgroundFillColors = getStyle("backgroundFillColors");
				dirty = true;
			}
			
			if(backgroundAlphaChanged)
			{
				backgroundAlphaChanged = false;
				this._backgroundAlpha = getStyle("backgroundAlpha");
				dirty = true;
			}
			
			if(borderColorChanged)
			{
				borderColorChanged = false;
				this._borderColor = getStyle("borderColor");
				dirty = true;
			}
			
			if(borderAlphaChanged)
			{
				borderAlphaChanged = false;
				this._borderAlpha = getStyle("borderAlpha");
				dirty = true;
			}
			
			if(borderVisibleChanged)
			{
				borderVisibleChanged = false;
				this._borderVisible = getStyle("borderVisible");
				dirty = true;
			}
			
			if(dirty && !mx_internal::invalidateDisplayListFlag)
			{
				invalidateDisplayList();
			}
		}
		
		override public function styleChanged(styleProp:String) : void
		{
			if(styleProp == null || styleProp == "backgroundFillColors")
				backgroundFillColorsChanged = true;
			if(styleProp == null || styleProp == "backgroundAlpha")
				backgroundAlphaChanged = true;
			if(styleProp == null || styleProp == "borderColor")
				borderColorChanged = true;
			if(styleProp == null || styleProp == "borderAlpha")
				borderAlphaChanged = true;
			if(styleProp == null || styleProp == "borderVisible")
				borderVisibleChanged = true;
			
			super.styleChanged(styleProp);
			
			if(!mx_internal::invalidatePropertiesFlag)
				invalidateProperties();
		}
		
		protected function createBackground() : Rect
		{
			var r:Rect = new Rect();
			r.top = 0;
			r.right = 0;
			r.bottom = 0;
			r.left = 0;
			r.fill = this.createBackgroundFill();
			r.initialized(this,"background");
			this.background = r;
			BindingManager.executeBindings(this,"background",this.background);
			return r;
		}
		
		protected function createBackgroundFill() : LinearGradient
		{
			var f:LinearGradient = new LinearGradient();
			f.rotation = 90;
			this.backgroundFill = f;
			updateBackgroundFillEntries();
			return f;
		}
		
		protected function createBorder() : AdvancedRect
		{
			var r:AdvancedRect = new AdvancedRect();
			r.visible = false;
			r.top = 0;
			r.right = 0;
			r.bottom = 0;
			r.left = 0;
			r.stroke = this.createBorderStroke();
			r.initialized(this,null);
			this.border = r;
			return r;
		}
		
		protected function createBorderStroke() : SolidColorStroke
		{
			var s:SolidColorStroke = new SolidColorStroke();
			s.weight = 1;
			s.color = 0x7A7A7A;
			s.pixelHinting = true;
			s.caps = "square";
			this.borderStroke = s;
			return s;
		}
		
		protected function updateBackgroundFillEntries():void
		{
			if(_backgroundFillColors == null)
				_backgroundFillColors = [0xEDEDED, 0xC6C6C6];
			var entries:Array = backgroundFill.entries;
			var i:int = 0;
			for each(var c:uint in _backgroundFillColors)
			{
				if(i == entries.length)
				{
					var e:GradientEntry = new GradientEntry();
					if(_backgroundFillColors.length > 1)
						e.ratio = i / (_backgroundFillColors.length - 1);
					else
						e.ratio = 1;
					entries.push(e);
				}
				else
					e = entries[i];
				e.color = c;
				e.alpha = isNaN(_backgroundAlpha) ? 1 : _backgroundAlpha;
				
				i++;
			}
			if(i > 0 && i < entries.length)
				entries = entries.slice(0, i - 1);
			backgroundFill.entries = entries;
		}
		
		override protected function updateDisplayList(uw:Number, uh:Number) : void
		{
			if(this.background)
			{
				if(this.backgroundFill)
				{
					this.background.visible = true;
					updateBackgroundFillEntries();
				}
				else
				{
					this.background.visible = false;
				}
			}
			
			if(this._borderVisible && this.border && this.borderStroke)
			{
				this.border.visible = true;
				this.borderStroke.color = this._borderColor;
				this.borderStroke.alpha = this._borderAlpha;
			}
			else if(this.border)
			{
				this.border.visible = false;
			}
			super.updateDisplayList(uw,uh);
		}
		
		private var _background:Rect;
		
		public function get background() : Rect
		{
			return this._background;
		}
		
		public function set background(value:Rect) : void
		{
			var o:Object = this._background;
			if(o !== value)
			{
				this._background = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",o,value));
				}
			}
		}
		
		private var _backgroundFill:LinearGradient;
		public function get backgroundFill() : LinearGradient
		{
			return this._backgroundFill;
		}
		
		public function set backgroundFill(value:LinearGradient) : void
		{
			var o:LinearGradient = this._backgroundFill;
			if(o !== value)
			{
				this._backgroundFill = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFill",o,value));
				}
			}
		}
		
		private var _border:AdvancedRect;
		
		public function get border() : AdvancedRect
		{
			return this._border;
		}
		
		public function set border(value:AdvancedRect) : void
		{
			var o:Object = this._border;
			if(o !== value)
			{
				this._border = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",o,value));
				}
			}
		}
		
		private var _borderStroke:SolidColorStroke;
		public function get borderStroke() : SolidColorStroke
		{
			return this._borderStroke;
		}
		
		public function set borderStroke(value:SolidColorStroke) : void
		{
			var o:Object = this._borderStroke;
			if(o !== value)
			{
				this._borderStroke = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",o,value));
				}
			}
		}
	}
}