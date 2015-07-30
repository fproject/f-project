package net.fproject.themes.spark.skins
{
	import spark.components.Button;
	import spark.skins.spark.ComboBoxSkin;
	
	public class TimeFieldSkin extends ComboBoxSkin
	{
		override public function set openButton(value:Button):void
		{
			super.openButton = value;
			if(value)
				value.setStyle("skinClass", TimeFieldOpenButtonSkin);
		}
	}
}