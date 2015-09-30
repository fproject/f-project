package net.fproject.ui.autoComplete.supportClasses
{
	import spark.components.RichText;
	
	import flashx.textLayout.conversion.TextConverter;
	
	public class HtmlLabel extends RichText
	{
		public function set htmlText(value:String):void
		{
			this.textFlow = value == null ? null : TextConverter.importToFlow(value, TextConverter.TEXT_FIELD_HTML_FORMAT);
		}
	}
}