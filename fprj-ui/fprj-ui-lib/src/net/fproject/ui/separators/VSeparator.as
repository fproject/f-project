package net.fproject.ui.separators
{
	import flash.display.Graphics;
	
	[DefaultProperty("mxmlContent")]

	 /**
	 * Vertical separator class.
	 * @see net.fproject.ui.separators.SeparatorBase
	 */
	public class VSeparator extends SeparatorBase
	{
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			var g:Graphics = graphics;
			g.clear();
			var h:Number = unscaledHeight - _paddingTop - _paddingBottom;
			g.beginFill(_primaryStrokeColor,_primaryStrokeAlpha);
			g.drawRect(_paddingLeft,_paddingTop,_primaryStrokeThickness,h);
			g.endFill();
			g.beginFill(_secondaryStrokeColor,_secondaryStrokeAlpha);
			g.drawRect(_paddingLeft + _primaryStrokeThickness,_paddingTop,_secondaryStrokeThickness,h);
			g.endFill();
		}
	}
}