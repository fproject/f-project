package net.fproject.gui.component
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	
	public interface IDataProviderOwner extends IEventDispatcher
	{
		function get dataProvider():IList;
		function set dataProvider(value:IList):void;
	}
}