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
	import mx.graphics.SolidColorStroke;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	import spark.primitives.Line;
	
	/**
	 * 
	 * Base class for separator using spark.primitives.Line.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
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