package net.fproject.themes.flat.skins
{
	import flash.display.Graphics;
	
	import mx.skins.ProgrammaticSkin;
	
	public class AdvancedDataGridHeaderHorizontalSeparator extends ProgrammaticSkin
	{
		//----------------------------------
		//  measuredWidth
		//----------------------------------
		
		/**
		 *  @private
		 */
		override public function get measuredWidth():Number
		{
			return 10;
		}
		
		//----------------------------------
		//  measuredHeight
		//----------------------------------
		
		/**
		 *  @private
		 */
		override public function get measuredHeight():Number
		{
			return 2;
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
			var c:* = getStyle("verticalGridLineColor");
			if(c === undefined)
				c = 13421772;
			g.clear();
			g.moveTo(0, 0);
			g.lineTo(w, 0);
			g.lineStyle(1, c); 
			g.moveTo(0, 1);
			g.lineTo(w, 1);
		}
	}
}