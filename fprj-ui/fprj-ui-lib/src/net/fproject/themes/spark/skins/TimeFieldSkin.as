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
	import flash.text.TextLineMetrics;
	
	import mx.core.ClassFactory;
	
	import spark.components.Button;
	import spark.components.DataGroup;
	import spark.skins.spark.ComboBoxSkin;
	
	/**
	 *
	 * The default skin class for the TimeField component. 
	 * The skin for the open button for a TimeField component 
	 * is defined by the TimeFieldOpenButtonSkin class.  The skin for the text input
	 * is defined by the ComboBoxTextInputSkin class.
	 * @see net.fproject.ui.datetime.TimeField
	 * @see net.fproject.themes.spark.skins.TimeFieldOpenButtonSkin
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class TimeFieldSkin extends ComboBoxSkin
	{
		override protected function measure():void
		{
			if(textInput)
			{
				var metric:TextLineMetrics = measureText("00:00am");
				textInput.width = metric.width + 7;
			}
			super.measure();
			
		}
		
		override public function set openButton(value:Button):void
		{
			super.openButton = value;
			if(value)
				value.setStyle("skinClass", TimeFieldOpenButtonSkin);
		}
		
		override public function set dataGroup(value:DataGroup):void
		{
			super.dataGroup = value;
			if(value)
				value.itemRenderer = new ClassFactory(TimeFieldItemRenderer);
		}
	}
}