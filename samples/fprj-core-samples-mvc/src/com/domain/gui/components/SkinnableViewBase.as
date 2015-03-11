package com.domain.gui.components
{
	import spark.components.SkinnableContainer;
	
	import net.fproject.di.Injector;
	
	public class SkinnableViewBase extends SkinnableContainer
	{
		public function SkinnableViewBase()
		{
			super();
			Injector.inject(this);
		}
	}
}