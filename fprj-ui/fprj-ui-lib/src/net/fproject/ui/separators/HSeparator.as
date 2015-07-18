package net.fproject.ui.separators
{
	import flash.display.Graphics;
	
	[DefaultProperty("mxmlContent")]

	 /**
	 * Horizontal separator class.
	 * @see net.fproject.ui.separators.SeparatorBase
	 */
	public class HSeparator extends SeparatorBase
	{
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			var g:Graphics = graphics;
			g.clear();
			var w:Number = unscaledWidth - _paddingLeft - _paddingRight;
			g.beginFill(_primaryStrokeColor,_primaryStrokeAlpha);
			g.drawRect(_paddingLeft,_paddingTop,w,_primaryStrokeThickness);
			g.endFill();
			g.beginFill(_secondaryStrokeColor,_secondaryStrokeAlpha);
			g.drawRect(_paddingLeft,_paddingTop + _primaryStrokeThickness,w,_secondaryStrokeThickness);
			g.endFill();
		}
	}
}