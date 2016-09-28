package net.fproject.themes
{
	import mx.core.mx_internal;
	import mx.graphics.IFill;
	import mx.graphics.SolidColor;
	
	public class BorderAndSolidFillSkin extends AdvancedBorderSkin
	{
		protected var _backgroundColor:uint;
		
		protected var backgroundColorChanged:Boolean;
		
		override protected function commitProperties() : void
		{
			var b:* = mx_internal::invalidateDisplayListFlag;
			mx_internal::invalidateDisplayListFlag = true;
			super.commitProperties();
			mx_internal::invalidateDisplayListFlag = b;
			
			b = false;
			
			if(backgroundColorChanged)
			{
				backgroundColorChanged = false;
				this._backgroundColor = getStyle("backgroundColor");
				b = true;
			}
			
			if(b)
			{
				invalidateDisplayList();
			}
		}
		
		override public function styleChanged(styleProp:String) : void
		{
			if(styleProp == null || styleProp == "backgroundColor")
				backgroundColorChanged = true;
				borderColorChanged = true;
			
			var b:* = mx_internal::invalidatePropertiesFlag;
			mx_internal::invalidatePropertiesFlag = true;
			super.styleChanged(styleProp);
			mx_internal::invalidatePropertiesFlag = b;
			
			invalidateProperties();
		}
		
		override protected function createBackgroundFill() : IFill
		{
			var f:SolidColor = new SolidColor();
			f.color = _backgroundColor;
			this.backgroundFill = f;
			return super.createBackgroundFill();
		}
		
		override protected function updateDisplayList(uw:Number, uh:Number) : void
		{
			if(this.background && this.backgroundFill)
			{
				SolidColor(this.backgroundFill).color = this._backgroundColor;
				SolidColor(this.backgroundFill).alpha = this._backgroundAlpha;
			}
			
			super.updateDisplayList(uw,uh);
		}
	}
}