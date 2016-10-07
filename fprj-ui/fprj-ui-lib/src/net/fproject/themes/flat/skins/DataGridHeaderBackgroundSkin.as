package net.fproject.themes.flat.skins
{
	import flash.display.Graphics;
	
	import mx.skins.ProgrammaticSkin;

	public class DataGridHeaderBackgroundSkin extends ProgrammaticSkin
	{
		/**
		 *  @private
		 */
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			var g:Graphics = graphics;
			g.clear();
			
			var cls:Array = getStyle("alternatingItemColors");
			if(cls != null && cls.length > 1)
				var c:uint = cls[1];
			else
				c = 16250871;
			var bc:* = getStyle("verticalGridLineColor");
			if(bc === undefined)
				bc = 13421772;
			
			g.beginFill(c, 1);
			g.lineStyle(0, c, 0);
			g.moveTo(0, 0);
			g.lineTo(w, 0);
			g.lineTo(w, h - 0.5);
			g.lineStyle(0, bc, 100);
			g.lineTo(0, h - 0.5);
			g.lineStyle(0, c, 0);
			g.endFill();
		}
	}
}