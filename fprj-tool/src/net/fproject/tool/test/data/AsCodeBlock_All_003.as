package net.fproject.mypackage
{
	import net.fproject.graphlayout.*;
	import flash.system.*;
	import flash.utils.*;
	
	public interface Orientation
	{
		public function Orientation();
		public static function isValid(value:String) : Boolean;
		
		public static function isHorizontal(value:String) : Boolean;
		
		public static function isVertical(value:String) : Boolean;
	}
}