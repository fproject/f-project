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
package net.fproject.ui.autoComplete.supportClasses
{
	import net.fproject.utils.StringUtil;

	public class AutoCompleteUtil
	{
		public static function contains(string:String, searchStr:String):Boolean
		{
			var s1:String = StringUtil.simplifyByLocal(string);
			var s2:String = StringUtil.simplifyByLocal(searchStr);
			var regExp:RegExp = new RegExp(regexEscape(s2), "i");
			return regExp.test(s1);	
		}
				
		public static function anyWordBeginsWith(string:String, pattern:String):Boolean
		{
			if (!string)
			{
				return false;
			}
			
			if (StringUtil.startsWith(string, pattern))
			{
				return true;
			}
			
			// check to see if one of the words in the string is a match
			var words:Array = string.split(" ");
			
			for each (var word:String in words)
			{
				if (StringUtil.startsWith(word, pattern))
				{
					return true;
				}
			}
			
			return false;
		}
				
		public static function capitalize(string:String):String
		{
			return string.charAt(0).toUpperCase() + string.substring(1, string.length);
		}
		
		public static function capitalizeWords(string:String):String
		{
			var origWords:Array = string.split(" ");
			var newWords:Array = [];
			
			for each (var word:String in origWords)
			{
				newWords.push(capitalize(word)); 
			}

			return newWords.join(" "); 
		}
				
		public static function unCapitalize(string:String):String
		{
			return string.charAt(0).toLowerCase() + string.substring(1, string.length);
		}
		
		
		/**
		 * This will convert a string to const upper case (ie, ringGroup becomes RING_GROUP)
		 */
		public static function toConstUpperCase(string:String):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt(x);
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					newString += "_";
				}
				
				newString += char;
				
			}
			
			return newString.toUpperCase();
		}
		
		public static function getFirstWord(string:String):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt(x);
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					return newString;
				}
				
				newString += char;
				
			}
			
			return newString;			
		}
		
		/**
		 * This will separate the words in a camel caps string (ie, ringGroup becomes Ring Group)
		 */
		public static function seperateWords(string:String):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt(x);
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					newString += " ";
				}
				
				newString += char;
				
			}
			
			return capitalizeWords(newString.toLowerCase());
		}		
		
		public static function toCamelCaps(string:String):String
		{
			var returnStr:String = "";
			var words:Array = string.split("_");
			
			for (var index:uint = 0; index < words.length; index++)
			{	
				var word:String = words[index];
				word = word.toLowerCase();
				
				if (index > 0)
				{
					word = capitalize(word);
				}
				
				returnStr += word;
			}
			
			return returnStr;		
		}
		
		public static function highlightMatch(string:String, searchStr:String):String
		{
			var s1:String = StringUtil.simplifyByLocal(string);
			var s2:String = StringUtil.simplifyByLocal(searchStr);
			var returnStr:String = string;
			var index:int = s1.indexOf(s2);
			
			if (StringUtil.isBlank(s2))
				return s1;
			
			var addCharCount:int = 0;
			while (index != -1)
			{
				returnStr  = returnStr.slice(0, index) + "<b><u>" +  returnStr.slice(index, index+s2.length) + "</u></b>" + returnStr.slice(index + s2.length);
				s1  = s1.slice(0, index) + "<b><u>" +  s2 + "</u></b>" + s1.slice(index + s2.length);
				index += 14;
				index = s1.indexOf(s2,index);
			}
			
			return returnStr;
			/*var returnStr:String = string;
			
			if(!StringUtil.isBlank(searchStr))
			{
				// solution by Jan Reges, 2009-07-17
				var searchStrPattern:String = "(" + regexEscape(searchStr) + ")";
				var regExp:RegExp = new RegExp(searchStrPattern, "igm");
				returnStr = returnStr.replace(regExp, "<b><u>$1</u></b>");
			}
			
			return returnStr;*/
        }

        /**
         * Escape special characters in the input string so that the output
         * string, when used as part of a regular expression, will match
         * the input string only.
         */
        public static function regexEscape(string:String):String
        {
            if (!string)
            {
                return string;
            }

            return string.replace(/[.*+?|(){}\[\]\\^$]/g, "\\$&");
        }
	}
}