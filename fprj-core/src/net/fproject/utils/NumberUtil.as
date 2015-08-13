///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	public class NumberUtil
	{
		/**
		 * Zero padding before a number.
		 * @param number
		 * @param width
		 * @return a string composed by the number with zero-padding before
		 * 
		 */
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
		
		
		/**
		 * Parse an array of integers or a string contains an array of integers and return a vector of integers 
		 * @param value the input source to pase
		 * @return a vector of int
		 * 
		 */
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
		
		/**
		 * Sort and uniquify an array of integers 
		 * @param ints
		 * @return the uniquified sorted array
		 * 
		 */
		public static function sortAndUniquifyInts(ints:Array) : Array
		{
			var i:int = 0;
			var a:Array = [];
			ints.sort(Array.NUMERIC);
			
			for (var j:uint = 0; j < ints.length; j++)
			{                
				if (j == 0 || i != ints[j])
				{
					a.push(ints[j]);
					i = ints[j];
				}
			}
			return a;
		}
	}
}