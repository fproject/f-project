///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
	
	/**
	 * A spark.primitives.Rect that is filled with a solid color specified by styles
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
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
			if(styleDec == null)
			{
				trace("Style name not found: " + _styleName);
				return;
			}
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