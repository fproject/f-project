///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	public class HorizontalSeparator extends LineSeparatorBase
	{		
		public function HorizontalSeparator()
		{
			super();
			this.yFrom = 0;
			this.yTo = 0;
			this.xFrom = 0;
			this.styleName = ".horizontalSeparator";
		}
		
		/**
		 *  @private
		 */
		override public function set width(value:Number):void
		{
			super.width = value;
			xTo = this.width;
			invalidateParentSizeAndDisplayList();
		}
	}
}