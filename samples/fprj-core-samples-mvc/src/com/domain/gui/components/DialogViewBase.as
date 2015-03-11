package com.domain.gui.components
{
	import spark.components.TitleWindow;
	
	import net.fproject.di.Injector;
	
	public class DialogViewBase extends TitleWindow
	{
		public function DialogViewBase()
		{
			super();
			Injector.inject(this);
		}
	}
}