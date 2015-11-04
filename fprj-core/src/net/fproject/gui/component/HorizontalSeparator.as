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
	/**
	 * HorizontalSeparator is a line separator graphic element used to decorated GUI components
	 * with a horizontal line.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class HorizontalSeparator extends LineSeparatorBase
	{		
		public function HorizontalSeparator()
		{
			super();
			this.yFrom = 0;
			this.yTo = 0;
			this.xFrom = 0;
			this.styleName = ".horizontalSeparator";
		}
		
		/**
		 *  @private
		 */
		override public function set width(value:Number):void
		{
			super.width = value;
			xTo = this.width;
			invalidateParentSizeAndDisplayList();
		}
	}
}