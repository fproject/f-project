package net.fproject.ui.separators
{
	import spark.components.Group;
	
	 /**
	 * Bottom padding to apply below the strokes.
	 * @default 0 or 10 depending on direction
	 */
	[Style(name="paddingBottom", type="Number", inherit="no")]

	 /**
	 * Left padding to apply left of the strokes.
	 * @default 0 or 20 depending on direction
	 */
	[Style(name="paddingLeft", type="Number", inherit="no")]

	 /**
	 * Right padding to apply right of the strokes.
	 * @default 0 or 20 depending on direction
	 */
	[Style(name="paddingRight", type="Number", inherit="no")]

	 /**
	 * Top padding to apply above the strokes.
	 * @default 0 or 10 depending on direction
	 */
	[Style(name="paddingTop", type="Number", inherit="no")]

	 /**
	 * The alpha of the primary stroke.
	 * @default 0.5
	 */
	[Style(name="primaryStrokeAlpha", type="Number", inherit="no")]

	 /**
	 * The color of the primary stroke.
	 * @default #000000
	 */
	[Style(name="primaryStrokeColor", type="uint", format="Color", inherit="no")]

	 /**
	 * The thickness of the primary stroke.
	 * @default 1
	 */
	[Style(name="primaryStrokeThickness", type="Number", inherit="no")]

	 /**
	 * The alpha of the secondary stroke.
	 * @default 0.2
	 */
	[Style(name="secondaryStrokeAlpha", type="Number", inherit="no")]

	 /**
	 * The color of the secondary stroke.
	 * @default #000000
	 */
	[Style(name="secondaryStrokeColor", type="uint", format="Color", inherit="no")]

	 /**
	 * The thickness of the secondary stroke.
	 * @default 1
	 */
	[Style(name="secondaryStrokeThickness", type="Number", inherit="no")]


	[DefaultProperty("mxmlContent")]

	 /**
	 * <p>Base class for components that display vertical and horizontal separator
	 * lines.</p>
	 * <p>The Separator components allow you to provide visually appealing breaks
	 * between layout elements and alter the spacing between elements without changing
	 * the gap in the layout.</p>
	 * 
	 * @author Bui Sy Nguyen
	 */
	public class SeparatorBase extends Group
	{
		
		protected var stylesDirty:Boolean;
		
		protected var _primaryStrokeColor:uint = 0;
		
		protected var _primaryStrokeAlpha:Number = 0.5;
		
		protected var _primaryStrokeThickness:Number = 1;
		
		protected var _secondaryStrokeColor:uint = 0;
		
		protected var _secondaryStrokeAlpha:Number = 0.2;
		
		protected var _secondaryStrokeThickness:Number = 1;
		
		protected var _paddingTop:Number = 0;
		
		protected var _paddingRight:Number = 0;
		
		protected var _paddingBottom:Number = 0;
		
		protected var _paddingLeft:Number = 0;
		
		public function SeparatorBase()
		{
			super();
			mouseChildren = mouseEnabled = false;
		}
		
		override protected function createChildren() : void
		{
			super.createChildren();
			this.stylesDirty = true;
		}
		

		 /**
		 * 
		 */
		override protected function commitProperties() : void
		{
			super.commitProperties();
			if(this.stylesDirty)
			{
				this.stylesDirty = false;
				this._primaryStrokeColor = getStyle("primaryStrokeColor");
				this._primaryStrokeAlpha = getStyle("primaryStrokeAlpha");
				this._primaryStrokeThickness = getStyle("primaryStrokeThickness");
				this._secondaryStrokeColor = getStyle("secondaryStrokeColor");
				this._secondaryStrokeAlpha = getStyle("secondaryStrokeAlpha");
				this._secondaryStrokeThickness = getStyle("secondaryStrokeThickness");
				this._paddingTop = getStyle("paddingTop");
				this._paddingRight = getStyle("paddingRight");
				this._paddingBottom = getStyle("paddingBottom");
				this._paddingLeft = getStyle("paddingLeft");
				invalidateSize();
				invalidateParentSizeAndDisplayList();
			}
		}
		
		override protected function measure() : void
		{
			super.measure();
			var thick:Number = this._primaryStrokeThickness + this._secondaryStrokeThickness;
			minHeight = measuredHeight = thick + this._paddingTop + this._paddingBottom;
			minWidth = measuredWidth = thick + this._paddingLeft + this._paddingRight;
		}
		
		override public function styleChanged(styleProp:String) : void
		{
			super.styleChanged(styleProp);
			this.stylesDirty = true;
			invalidateProperties();
		}
	}
}