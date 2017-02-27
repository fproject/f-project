package net.fproject.themes.shapes
{
	import mx.graphics.IFill;
	
	import spark.primitives.Path;

	public class AbstractPaths
	{
		protected var _paths:Array;
		
		[Bindable("_none_")]
		public function get paths():Array
		{
			return _paths;
		}
		
		public function set fill(value:IFill):void
		{
			for each (var p:Path in _paths)
			{
				p.fill = value;
			}
		}		
	}
}