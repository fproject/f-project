///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2014 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.ui.autoComplete.supportClasses
{
	import net.fproject.utils.StringUtil;

	public class AutoCompleteUtil
	{
		public static function contains(string:String, searchStr:String):Boolean
		{
			var regExp:RegExp = new RegExp(regexEscape(searchStr), "i");
			
			return regExp.test(string);			
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
			var returnStr:String = string;
			
			if(!StringUtil.isBlank(searchStr))
			{
				// solution by Jan Reges, 2009-07-17
				var searchStrPattern:String = "(" + regexEscape(searchStr) + ")";
				var regExp:RegExp = new RegExp(searchStrPattern, "igm");
				returnStr = returnStr.replace(regExp, "<b><u>$1</u></b>");
			}
			
			return returnStr;
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