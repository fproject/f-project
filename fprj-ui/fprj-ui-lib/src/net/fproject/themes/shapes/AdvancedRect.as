package net.fproject.themes.shapes
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import spark.primitives.Rect;
	
	public class AdvancedRect extends Rect
	{
		private var borderVisibleDirty:Boolean;
		
		private var _leftBorderVisible:Boolean;

		public function get leftBorderVisible():Boolean
		{
			return _leftBorderVisible;
		}

		public function set leftBorderVisible(value:Boolean):void
		{
			if( _leftBorderVisible !== value)
			{
				_leftBorderVisible = value;
				borderVisibleDirty = true;
				invalidateProperties();
			}
		}

		private var _rightBorderVisible:Boolean;

		public function get rightBorderVisible():Boolean
		{
			return _rightBorderVisible;
		}

		public function set rightBorderVisible(value:Boolean):void
		{
			if( _rightBorderVisible !== value)
			{
				_rightBorderVisible = value;
				borderVisibleDirty = true;
				invalidateProperties();
			}
		}

		private var _topBorderVisible:Boolean;

		public function get topBorderVisible():Boolean
		{
			return _topBorderVisible;
		}

		public function set topBorderVisible(value:Boolean):void
		{
			if( _topBorderVisible !== value)
			{
				_topBorderVisible = value;
				borderVisibleDirty = true;
				invalidateProperties();
			}
		}

		private var _bottomBorderVisible:Boolean;

		public function get bottomBorderVisible():Boolean
		{
			return _bottomBorderVisible;
		}

		public function set bottomBorderVisible(value:Boolean):void
		{
			if( _bottomBorderVisible !== value)
			{
				_bottomBorderVisible = value;
				borderVisibleDirty = true;
				invalidateProperties();
			}
		}
		
		override protected function commitProperties():void
		{
			if(borderVisibleDirty)
			{
				invalidateDisplayList();
				borderVisibleDirty = false;
			}
			super.commitProperties();
		}
		
		public function AdvancedRect()
		{
			super();
			leftBorderVisible = rightBorderVisible = topBorderVisible = bottomBorderVisible = true;
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