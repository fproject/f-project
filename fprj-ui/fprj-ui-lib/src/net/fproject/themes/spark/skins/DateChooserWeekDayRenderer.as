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
package net.fproject.themes.spark.skins
{
	import spark.components.IItemRenderer;
	import spark.components.Label;
	
	public class DateChooserWeekDayRenderer extends Label implements IItemRenderer
	{
		public function DateChooserWeekDayRenderer()
		{
			horizontalCenter = 0;
			verticalCenter = 0;
		}
		
		private var _itemIndex:int;
		public function get itemIndex():int
		{
			return _itemIndex;
		}
		
		public function set itemIndex(value:int):void
		{
			_itemIndex = value;
		}
		
		public function get dragging():Boolean
		{
			return false;
		}
		
		public function set dragging(value:Boolean):void
		{
		}
		
		public function get label():String
		{
			return null;
		}
		
		public function set label(value:String):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get showsCaret():Boolean
		{
			return false;
		}
		
		public function set showsCaret(value:Boolean):void
		{
		}
		
		private var _data:Object;
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
			this.text = value as String;
		}
	}
}