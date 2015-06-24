package net.fproject.flatspark.mobile
{
	import mx.core.mx_internal;
	import mx.utils.ColorUtil;
	
	import spark.skins.mobile.ButtonSkin;
	
	use namespace mx_internal;
	
	public class ButtonSkin extends spark.skins.mobile.ButtonSkin
	{
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.drawBackground(unscaledWidth, unscaledHeight);
			
			var chromeColor:uint = getStyle(fillColorStyleName);
			
			// In the down state, the fill shadow is defined in the FXG asset
			if (currentState == "down")
				graphics.beginFill(chromeColor);
			else
				graphics.beginFill(ColorUtil.adjustBrightness(chromeColor, 10));
			
			// inset chrome color by BORDER_SIZE
			// bottom line is a shadow
			graphics.drawRoundRect(layoutBorderSize, layoutBorderSize, 
				unscaledWidth - (layoutBorderSize * 2), 
				unscaledHeight - (layoutBorderSize * 2), 
				layoutCornerEllipseSize, layoutCornerEllipseSize);
			graphics.endFill();
		}
	}
}