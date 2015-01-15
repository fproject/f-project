///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	public class VerticalSeparator extends LineSeparatorBase
	{		
		public function VerticalSeparator()
		{
			super();
			this.xFrom = 0;
			this.xTo = 0;
			this.yFrom = 0;
			this.styleName = ".verticalSeparator";
		}
		
		/**
		 *  @private
		 */
		override public function set height(value:Number):void
		{
			super.height = value;
			yTo = this.height;
			invalidateParentSizeAndDisplayList();
		}
	}
}