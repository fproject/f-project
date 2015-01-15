///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import mx.formatters.NumberBaseRoundType;
	import mx.formatters.NumberFormatter;

	public class NumberUtil
	{
		public static const NUMBER_PRECISION:int = 2;

		public static function gridColumnNumberFomatter():NumberFormatter
		{
			var formatter:NumberFormatter = new NumberFormatter;
			formatter.precision = NUMBER_PRECISION;
			formatter.rounding = NumberBaseRoundType.NEAREST;
			return formatter;
		}

		public static function zeroPad(number:int, width:int):String
		{
			var prefix:String;
			if (number < 0)
			{
				prefix = "-";
				number = -number;
			}
			else
			{
				prefix = "";
			}

			var ret:String = "" + number;
			while (ret.length < width)
				ret = "0" + ret;
			return prefix + ret;
		}
		
		/**
		 * To check a string to be a number
		 */ 
		public static function isNumber(value:String):Boolean {
			return !isNaN(Number(value));
		}
		
		
		public static function parseInts(value:Object):Vector.<int>
		{
			var v:Vector.<int>;
			if (value is Vector.<int>)
				v = value as Vector.<int>;
			else if (value is Array)
				v = Vector.<int>(value);
			if (v == null && value != null)
			{		
				if (value is Number)
					v = new <int>[int(value)];
				else if (value is String && value != "")
				{
					var s:String = value as String;
					if (s != null)
					{
						var a:Array = s.split(",");
						v = new Vector.<int>; 
						for each (var i:String in a)
						{
							if (isNumber(i))
								v.push(int(i));
							else
								return null;
						}
					}
				}
				
			}
			return v;
		}
		
	}
}