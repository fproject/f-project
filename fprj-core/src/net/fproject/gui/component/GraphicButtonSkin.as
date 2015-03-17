///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;
	
	import spark.skins.spark.ButtonSkin;
	
	public class GraphicButtonSkin extends ButtonSkin
	{
		public function GraphicButtonSkin()
		{
			super();
			this.addEventListener(FlexEvent.CREATION_COMPLETE, skin_creationComplete);
		}
		
		protected function skin_creationComplete(e:FlexEvent):void
		{
			if(iconDisplay != null && iconDisplay.source is Class)
			{
				var cls:Class = iconDisplay.source as Class;
				var value:Object = new cls();
				if(value is IVisualElement)
				{
					var ve:IVisualElement = IVisualElement(value);
					ve.horizontalCenter = iconDisplay.x - (iconDisplay.parent.width - iconDisplay.width)/2;
					ve.verticalCenter = iconDisplay.y - (iconDisplay.parent.height - iconDisplay.height)/2;
					this.addElement(ve);
				}
			}
		}
	}
}