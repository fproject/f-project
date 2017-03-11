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
package net.fproject.themes.flat.skins
{
	import flash.display.Graphics;
	
	import mx.skins.ProgrammaticSkin;

	public class DataGridHeaderBackgroundSkin extends ProgrammaticSkin
	{
		/**
		 *  @private
		 */
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			var g:Graphics = graphics;
			g.clear();
			
			var cls:Array = getStyle("alternatingItemColors");
			if(cls != null && cls.length > 1)
				var c:uint = cls[1];
			else
				c = 16250871;
			var bc:* = getStyle("verticalGridLineColor");
			if(bc === undefined)
				bc = 13421772;
			
			g.beginFill(c, 1);
			g.lineStyle(0, c, 0);
			g.moveTo(0, 0);
			g.lineTo(w, 0);
			g.lineTo(w, h - 0.5);
			g.lineStyle(0, bc, 100);
			g.lineTo(0, h - 0.5);
			g.lineStyle(0, c, 0);
			g.endFill();
		}
	}
}