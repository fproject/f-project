///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	public class NumberUtil
	{
		/**
		 * Zero padding before a number.
		 * @param number The number of any object converting to number.
		 * @param width The desired length of the returned string with zero padded.
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
		public static function isNumber(value:*):Boolean {
			return value != null && !isNaN(Number(value));
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