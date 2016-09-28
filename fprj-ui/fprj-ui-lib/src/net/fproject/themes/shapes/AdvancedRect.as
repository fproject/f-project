package net.fproject.themes.shapes
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.mx_internal;
	
	import spark.primitives.Rect;
	
	/**
	 *  The AdvancedRect class is an extension of <code>spark.primitives.Rect</code> that supports
	 * advanced display settings.
	 *  
	 *  @see spark.primitives.Rect
	 *  
	 */
	public class AdvancedRect extends Rect
	{
		private var borderVisibleDirty:Boolean;
		
		/**
		 * Constructor 
		 * 
		 */		
		public function AdvancedRect()
		{
			super();
			leftBorderVisible = rightBorderVisible = topBorderVisible = bottomBorderVisible = true;
		}
		
		private var _leftBorderVisible:Boolean;

		/**
		 * Indicate whether the left-side border is visible or not.
		 * 
		 * @default <code>true</code>
		 * 
		 */
		public function get leftBorderVisible():Boolean
		{
			return _leftBorderVisible;
		}

		/**
		 * 
		 * @private
		 * 
		 */		
		public function set leftBorderVisible(value:Boolean):void
		{
			if( _leftBorderVisible !== value)
			{
				_leftBorderVisible = value;
				borderVisibleDirty = true;
				if(!this.mx_internal::invalidatePropertiesFlag)
					invalidateProperties();
			}
		}

		private var _rightBorderVisible:Boolean;

		/**
		 * Indicate whether the right-side border is visible or not.
		 * 
		 * @default <code>true</code>
		 * 
		 */
		public function get rightBorderVisible():Boolean
		{
			return _rightBorderVisible;
		}

		/**
		 * 
		 * @private
		 * 
		 */	
		public function set rightBorderVisible(value:Boolean):void
		{
			if( _rightBorderVisible !== value)
			{
				_rightBorderVisible = value;
				borderVisibleDirty = true;
				if(!this.mx_internal::invalidatePropertiesFlag)
					invalidateProperties();
			}
		}

		private var _topBorderVisible:Boolean;

		/**
		 * Indicate whether the top-side border is visible or not.
		 * 
		 * @default <code>true</code>
		 * 
		 */
		public function get topBorderVisible():Boolean
		{
			return _topBorderVisible;
		}

		/**
		 * 
		 * @private
		 * 
		 */	
		public function set topBorderVisible(value:Boolean):void
		{
			if( _topBorderVisible !== value)
			{
				_topBorderVisible = value;
				borderVisibleDirty = true;
				if(!this.mx_internal::invalidatePropertiesFlag)
					invalidateProperties();
			}
		}

		private var _bottomBorderVisible:Boolean;

		/**
		 * Indicate whether the bottom-side border is visible or not.
		 * 
		 * @default <code>true</code>
		 * 
		 */
		public function get bottomBorderVisible():Boolean
		{
			return _bottomBorderVisible;
		}

		/**
		 * 
		 * @private
		 * 
		 */	
		public function set bottomBorderVisible(value:Boolean):void
		{
			if( _bottomBorderVisible !== value)
			{
				_bottomBorderVisible = value;
				borderVisibleDirty = true;
				if(!this.mx_internal::invalidatePropertiesFlag)
					invalidateProperties();
			}
		}
		
		/**
		 * @inheritDoc 
		 * 
		 */
		override protected function commitProperties():void
		{
			if(borderVisibleDirty)
			{
				if(!this.mx_internal::invalidateDisplayListFlag)
					invalidateDisplayList();
				borderVisibleDirty = false;
			}
			super.commitProperties();
		}
		
		/**
		 *  @inheritDoc
		 *  
		 */
		override protected function beginDraw(g:Graphics):void
		{
			if(leftBorderVisible && rightBorderVisible && topBorderVisible && bottomBorderVisible)
			{
				super.beginDraw(g);
				return;
			}
			
			if (fill)
			{
				var fillBounds:Rectangle = new Rectangle(drawX, drawY, width, height);
				fill.begin(g, fillBounds, new Point(drawX, drawY));
			}
		}
		
		/**
		 *  @inheritDoc
		 *  
		 */
		override protected function draw(g:Graphics):void
		{
			if(leftBorderVisible && rightBorderVisible && topBorderVisible && bottomBorderVisible)
			{
				super.draw(g);
				return;
			}
			
			if(this.fill != null)
			{
				g.drawRect(drawX, drawY, width, height);
			}
			
			if (stroke)
			{
				var strokeBounds:Rectangle = getStrokeBounds();
				strokeBounds.offset(drawX, drawY);
				stroke.apply(g, strokeBounds, new Point(drawX, drawY));
			}
			else
				g.lineStyle();
			
			if(leftBorderVisible)
			{
				g.moveTo(drawX, drawY);
				g.lineTo(drawX, drawY + height);
			}
			
			if(bottomBorderVisible)
			{
				g.moveTo(drawX, drawY + height);
				g.lineTo(drawX + width, drawY + height);
			}
			
			if(rightBorderVisible)
			{
				g.moveTo(drawX + width, drawY + height);
				g.lineTo(drawX + width, drawY);
			}
			
			if(topBorderVisible)
			{
				g.moveTo(drawX , drawY);
				g.lineTo(drawX + width, drawY);
			}			
			
		}
	}
}