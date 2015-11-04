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
package net.fproject.ui.separators
{
	import flash.display.Graphics;
	
	[DefaultProperty("mxmlContent")]

	 /**
	 * Vertical separator class.
	 * @see net.fproject.ui.separators.SeparatorBase
	 */
	public class VSeparator extends SeparatorBase
	{
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			var g:Graphics = graphics;
			g.clear();
			var h:Number = unscaledHeight - _paddingTop - _paddingBottom;
			g.beginFill(_primaryStrokeColor,_primaryStrokeAlpha);
			g.drawRect(_paddingLeft,_paddingTop,_primaryStrokeThickness,h);
			g.endFill();
			g.beginFill(_secondaryStrokeColor,_secondaryStrokeAlpha);
			g.drawRect(_paddingLeft + _primaryStrokeThickness,_paddingTop,_secondaryStrokeThickness,h);
			g.endFill();
		}
	}
}