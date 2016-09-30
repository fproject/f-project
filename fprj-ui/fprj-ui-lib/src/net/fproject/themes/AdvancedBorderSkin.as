package net.fproject.themes
{
	import mx.binding.BindingManager;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.IFill;
	import mx.graphics.SolidColorStroke;
	
	import spark.components.supportClasses.Skin;
	import spark.primitives.Rect;
	
	import net.fproject.themes.shapes.AdvancedRect;
	
	public class AdvancedBorderSkin extends Skin implements IStateClient2
	{
		protected var _backgroundAlpha:Number;
		
		protected var _borderColor:uint;
		
		protected var _borderAlpha:Number;
		
		protected var _leftBorderVisible:Boolean;
		protected var _rightBorderVisible:Boolean;
		protected var _topBorderVisible:Boolean;
		protected var _bottomBorderVisible:Boolean;
		
		protected var backgroundAlphaChanged:Boolean;
		
		protected var borderColorChanged:Boolean;
		
		protected var borderAlphaChanged:Boolean;
		
		protected var sideVisibleChanged:Boolean;
		
		public function AdvancedBorderSkin()
		{
			_leftBorderVisible = _rightBorderVisible = _topBorderVisible = _bottomBorderVisible = true;
		}
		
		override protected function commitProperties() : void
		{
			super.commitProperties();
			var dirty:Boolean = false;
			
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
			
			if(sideVisibleChanged)
			{
				sideVisibleChanged = false;
				var styleVal:*;
				if((styleVal=getStyle("borderVisible")) !== undefined && !styleVal)
				{
					_leftBorderVisible = _rightBorderVisible = _topBorderVisible = _bottomBorderVisible = false;
				}
				else
				{
					if((styleVal=getStyle("leftBorderVisible")) !== undefined)
						this._leftBorderVisible = styleVal;
					
					if((styleVal=getStyle("rightBorderVisible")) !== undefined)
						this._rightBorderVisible = styleVal;
					
					if((styleVal=getStyle("topBorderVisible")) !== undefined)
						this._topBorderVisible = styleVal;
					
					if((styleVal=getStyle("bottomBorderVisible")) !== undefined)
						this._bottomBorderVisible = styleVal;
				}
				
				dirty = true;
			}
			
			if(dirty)
			{
				invalidateDisplayList();
			}
		}
		
		override public function styleChanged(styleProp:String) : void
		{
			if(styleProp == null || styleProp == "backgroundAlpha")
				backgroundAlphaChanged = true;
			if(styleProp == null || styleProp == "borderColor")
				borderColorChanged = true;
			if(styleProp == null || styleProp == "borderAlpha")
				borderAlphaChanged = true;
			if(styleProp == null || styleProp == "borderVisible" || styleProp == "leftBorderVisible" ||
				styleProp == "rightBorderVisible" || styleProp == "topBorderVisible"|| styleProp == "bottomBorderVisible")
				sideVisibleChanged = true;
			
			super.styleChanged(styleProp);
			
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
		
		protected function createBackgroundFill() : IFill
		{
			BindingManager.executeBindings(this,"backgroundFill",this.backgroundFill);
			return this.backgroundFill;
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
		
		override protected function updateDisplayList(uw:Number, uh:Number) : void
		{
			if(this.background)
			{
				if(this.backgroundFill)
					this.background.visible = true;
				else
					this.background.visible = false;
			}
			
			if(this.border)
			{
				if((_leftBorderVisible || _rightBorderVisible || _topBorderVisible || _bottomBorderVisible)
					&& this.borderStroke)
				{
					this.border.mx_internal::invalidatePropertiesFlag = true;
					this.border.visible = true;
					this.border.leftBorderVisible = _leftBorderVisible;
					this.border.rightBorderVisible = _rightBorderVisible;
					this.border.topBorderVisible = _topBorderVisible;
					this.border.bottomBorderVisible = _bottomBorderVisible;
					
					this.borderStroke.color = this._borderColor;
					this.borderStroke.alpha = this._borderAlpha;
					this.border.mx_internal::invalidatePropertiesFlag = false;
					this.border.invalidateProperties();
				}
				else
				{
					this.border.visible = false;
				}
			}
			
			super.updateDisplayList(uw,uh);
		}
		
		protected var _background:Rect;
		
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
		
		protected var _backgroundFill:IFill;
		public function get backgroundFill() : IFill
		{
			return this._backgroundFill;
		}
		
		public function set backgroundFill(value:IFill) : void
		{
			var o:IFill = this._backgroundFill;
			if(o !== value)
			{
				this._backgroundFill = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFill",o,value));
				}
			}
		}
		
		protected var _border:AdvancedRect;
		
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
		
		protected var _borderStroke:SolidColorStroke;
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