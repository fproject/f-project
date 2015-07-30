package net.fproject.themes.spark.skins
{
	import mx.core.ClassFactory;
	
	import spark.components.Button;
	import spark.components.DataGroup;
	import spark.skins.spark.ComboBoxSkin;
	
	public class TimeFieldSkin extends ComboBoxSkin
	{
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