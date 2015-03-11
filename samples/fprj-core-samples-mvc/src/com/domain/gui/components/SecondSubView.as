package com.domain.gui.components
{
	import spark.components.TextArea;

	public class SecondSubView extends SkinnableViewBase
	{
		public const CONSTANT_TEXT:String = "ABCXYS\nDDSDSD\nfdfdfsdfdfs\n\n\nffdsafds afsdafsdaf";
		
		[SkinPart(required="true")]
		[PropertyBinding(text="CONSTANT_TEXT")]
		public var theTextArea:TextArea;
	}
}