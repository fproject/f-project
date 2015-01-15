package net.fproject.gui.component
{
	import mx.graphics.SolidColorStroke;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	import spark.primitives.Line;
	
	public class LineSeparatorBase extends Line
	{
		[Bindable]
		public var color:uint;
		[Bindable]
		public var thickness:Number;
		[Bindable]
		public var styleName:String;
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			getStyles();
			this.stroke = new SolidColorStroke(color, thickness);
		}
		
		private function getStyles():void
		{
			var styleDec:CSSStyleDeclaration = StyleManager.getStyleManager(null).getStyleDeclaration(styleName);
			if(styleDec != null)
			{
				this.color = styleDec.getStyle("color");
				this.thickness = styleDec.getStyle("thickness");
				if(isNaN(this.thickness))
					this.thickness = 0.5;
			}
		}
		
		//Workaround for http://bug.f-project.net/view.php?id=93
		public function get document():Object
		{
			return null;
		}
		
		public function set document(value:Object):void
		{			
		}
	}
}