package net.fproject.mypackage
{
	public final class Orientation extends Object
	{
		public function Orientation() {
			super();
			return;
		}
		
		public static const LTR:String = "ltr";
		
		public static const RTL:String = "rtl";
		
		public static const TTB:String = "ttb";
		
		public static const BTT:String = "btt";
		
		public static function isValid(value:String) : Boolean {
			return (value==LTR)||(value==RTL)||(value==TTB)||(value==BTT);
		}
		
		public static function isHorizontal(value:String) : Boolean {
			return (value==LTR)||(value==RTL);
		}
		
		public static function isVertical(value:String) : Boolean {
			return (value==TTB)||(value==BTT);
		}
	}
}