package net.fproject.themes.flat.skins
{
	import flash.display.Graphics;
	
	import mx.skins.ProgrammaticSkin;
	
	public class DataGridHeaderSeparator extends ProgrammaticSkin
	{
		/**
		 *  @private
		 */
		override public function get measuredWidth():Number
		{
			return 2;
		}
		
		//----------------------------------
		//  measuredHeight
		//----------------------------------
		
		/**
		 *  @private
		 */
		override public function get measuredHeight():Number
		{
			return 10;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			var g:Graphics = graphics;
			
			g.clear();
			
			var c:* = getStyle("verticalGridLineColor");
			if(c === undefined)
				c = 13421772;
			
			// Highlight
			g.lineStyle(1, 0xFFFFFF, 0.5);
			g.moveTo(0, 0);
			g.lineTo(0, h);
			g.lineStyle(1, c); 
			g.moveTo(1, 0);
			g.lineTo(1, h);
		}
	}
}