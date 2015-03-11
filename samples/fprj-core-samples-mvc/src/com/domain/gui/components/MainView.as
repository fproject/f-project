package com.domain.gui.components
{
	public class MainView extends SkinnableViewBase
	{
		[SkinPart(required="true")]
		public var firstSubView:FirstSubView;
		
		[SkinPart(required="true")]
		public var secondSubView:SecondSubView;
	}
}