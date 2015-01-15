///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
    import flash.display.*;
    
    import mx.graphics.*;

	/**
	 * Graphics utilities for drawing dashed lines, vertical lines and hrizontal lines.
	 * @author Bui Sy Nguyen
	 * 
	 */
    public class GraphicsUtil
    {
        public static function drawDashedLine(target:Graphics, stroke:IStroke, x0:Number, y0:Number, x1:Number, y1:Number, pattern:Array) : void
        {
            target.moveTo(x0, y0);
            var context:Object = {drawing:true, index:0, offset:0, styleInited:false};
            drawDashedLineImpl(target, stroke, x0, y0, x1, y1, pattern, context);
            }// end function

        private static function drawDashedLineImpl(target:Graphics, stroke:IStroke, x0:Number, y0:Number, x1:Number, y1:Number, pattern:Array, context:Object = null) : void
        {
            var dx:Number = x1 - x0;
            var dy:Number = y1 - y0;
            var r:Number = Math.sqrt(dx * dx + dy * dy);
            dx = dx / r;
            dy = dy / r;
            var ofs:Number = -context.offset;
            var drawing:Boolean = context.drawing;
            var i:Number = context.index;
            var inited:Boolean = context.styleInited;
            while (ofs < r)
            {                
                ofs = ofs + pattern[i];
                if (ofs >= r)
                {
                    context.offset = pattern[i] - (ofs - r);
                    context.patternIndex = i;
                    context.drawing = drawing;
                    context.styleInited = true;
                    ofs = r;
                }
                if (inited == false)
                {
                    if (drawing)
                    {
                        stroke.apply(target, null, null);
                    }
                    else
                    {
                        target.lineStyle(0, 0, 0);
                    }
                }
                else
                {
                    inited = false;
                }
                target.lineTo(x0 + ofs * dx, y0 + ofs * dy);
                drawing = !drawing;
                i = (i + 1) % pattern.length;
            }
            }// end function

        public static function drawVerticalDottedLine(g:Graphics, x:Number, y0:Number, y1:Number, width:Number = 1) : void
        {
            var i:Number = y0;
            while (i < y1)
            {                
                g.moveTo(x, i);
                g.lineTo(x, i + width);
                i = i + 2 * width;
            }
            }// end function

        public static function drawHorizontalDottedLine(g:Graphics, x0:Number, x1:Number, y:Number, width:Number = 1) : void
        {
            var i:Number = x0;
            while (i < x1)
            {                
                g.moveTo(i, y);
                g.lineTo(i + width, y);
                i = i + 2 * width;
            }
		}// end function

    }
}
