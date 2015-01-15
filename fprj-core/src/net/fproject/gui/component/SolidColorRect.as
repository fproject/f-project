///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	import flash.filters.BitmapFilterQuality;
	
	import mx.graphics.SolidColor;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	import spark.filters.GlowFilter;
	import spark.primitives.Rect;
	
	public class SolidColorRect extends Rect
	{
		private var _styleName:String;

		public function get styleName():String
		{
			return _styleName;
		}

		public function set styleName(value:String):void
		{
			_styleName = value;
			if(_styleName == null)
				return;
			if(_styleName.substr(0,1) != ".")
				_styleName = "." + _styleName;
			var styleDec:CSSStyleDeclaration =StyleManager.getStyleManager(null).getStyleDeclaration(_styleName);
			var styleValue:* = styleDec.getStyle("fillAlpha");
			if (styleValue == undefined)
				styleValue = 1.0;
			this.fill = new SolidColor(styleDec.getStyle("fillColor"), styleValue);
			
			styleValue = styleDec.getStyle("radiusX");
			if (styleValue != undefined)
				this.radiusX = styleValue;
			
			styleValue = styleDec.getStyle("radiusY");
			if (styleValue != undefined)
				this.radiusY = styleValue;
			
			var b:Boolean = styleDec.getStyle("useFilter");
			if(b)
			{
				var glowFilter: GlowFilter = new GlowFilter(); 
				glowFilter.color = styleDec.getStyle("filterColor");
				styleValue = styleDec.getStyle("filterAlpha");
				if (styleValue == undefined)
					styleValue = 1.0;
				glowFilter.alpha = styleValue;
				glowFilter.blurX = styleDec.getStyle("filterBlurX");
				glowFilter.blurY = styleDec.getStyle("filterBlurY");
				glowFilter.quality = BitmapFilterQuality.HIGH;				
				this.filters = [glowFilter];
			}		
		}
	}
}