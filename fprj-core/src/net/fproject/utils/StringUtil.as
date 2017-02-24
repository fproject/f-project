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
	import mx.utils.StringUtil;
	
	import net.fproject.core.TimeUnit;

	[ResourceBundle("fprjcore")]
	public class StringUtil
	{
		/**
		 * Tests if this string starts with the specified prefix.
		 * @param s the source string to test
		 * @param prefix the prefix.
		 * @param caseSensitive if <code>true</code>, the search will use case-sensitive in string comparison
		 * @param localeComparison if <code>true</code>, the search will use <code>characterCompareMethod</code>
		 * to compare strings during the search.
		 * @param characterCompareMethod the locale comparison method.
		 * Default is <code>null</code>, which means a character comparison method will use
		 * the character variations defined by the key <code>character.variations</code> 
		 * of resource bundle fprjcore.properties. This allows you use "so sánh tiếng Việt không dấu".
		 * 
		 * @return <code>true</code> if the character sequence represented by the argument is a prefix of 
		 * the character sequence represented by this string; <code>false</code> otherwise. 
		 * Note also that true will be returned if the argument is an empty string or 
		 * is equal to <code>s</code> as determined by the <code>characterCompareMethod</code> method.
		 * 
		 */
		public static function startsWith(s:String, prefix:String, caseSensitive:Boolean = false, 
										  localeComparison:Boolean = false, characterCompareMethod:Function=null):Boolean
		{
			if (s == null || prefix == null)
				return false;
			
			if(prefix == "")
				return true;
			
			if (!caseSensitive)
			{
				s = s.toLowerCase();
				prefix = prefix.toLowerCase();
			}
			
			var p:String = s.substr(0, prefix.length);
			if(!localeComparison)
				return p == prefix;
			else
				return localeEquals(p, prefix, characterCompareMethod);
		}
		
		/**
		 * Tests if this string ends with the specified prefix.
		 * @param s the source string to test
		 * @param prefix the prefix.
		 * @param caseSensitive if <code>true</code>, the search will use case-sensitive in string comparison
		 * @param localeComparison if <code>true</code>, the search will use <code>characterCompareMethod</code>
		 * to compare strings during the search.
		 * @param characterCompareMethod the locale comparison method.
		 * Default is <code>null</code>, which means a character comparison method will use
		 * the character variations defined by the key <code>character.variations</code> 
		 * of resource bundle fprjcore.properties. This allows you use "so sánh tiếng Việt không dấu".
		 * 
		 * @return <code>true</code> if the character sequence represented by the argument is a prefix of 
		 * the character sequence represented by this string; <code>false</code> otherwise. 
		 * Note also that true will be returned if the argument is an empty string or 
		 * is equal to <code>s</code> as determined by the <code>characterCompareMethod</code> method.
		 * 
		 */
		public static function endsWith(s:String, suffix:String, caseSensitive:Boolean = false,
										localeComparison:Boolean = false, characterCompareMethod:Function=null):Boolean
		{
			if (s == null || suffix == null)
				return false;
			
			if(suffix == "")
				return true;
			
			if (!caseSensitive)
			{
				s = s.toLowerCase();
				suffix = suffix.toLowerCase();
			}
			
			var suf:String = s.substr(-suffix.length);
			if(!localeComparison)
				return suf == suffix;
			else
				return localeEquals(suf, suffix, characterCompareMethod);   
		}
		
		/**
		 * Splits the specified string using the delimiters.
		 */
		public static function splitEx(value:String, delims:String):Array
		{
			var array:Array = [];
			var start:int = -1;
			for (var i:int = 0; i < value.length; ++i)
			{
				if (delims.search(value.charAt(i)) == -1)
				{
					// It's not a delimiter
					if (start == -1)
						start = i;
				} 
				else
				{
					if (start != -1)
						array.push(value.substring(start, i));
					start = -1;
				}
			}
			if (start != -1)
				array.push(value.substring(start, value.length));
			return array;
		}
		
		/**
		 * Check if the string is blank (null or empty)
		 * */
		public static function isBlank(s:String) : Boolean
		{
			return s == null || s.length == 0;
		}
		
		/**
		 * Returns the index within this string of the first occurrence of the specified 
		 * substring, starting at the specified index.
		 * The searching use locale comparison method
		 * @param source the characters being searched.
		 * @param target  the characters being searched for.
		 * @param fromIndex the index to begin searching from.
		 * @param characterCompareMethod the locale comparison method.
		 * Default is <code>null</code>, which means a character comparison method will use
		 * the character variations defined by the key <code>character.variations</code> 
		 * of resource bundle fprjcore.properties. This allows you use "so sánh tiếng Việt không dấu".
		 * 
		 * @return the index within this string of the first occurrence of the specified 
		 * substring, starting at the specified index.
		 * 
		 */
		public static function localeIndexOf(source:String, target:String, fromIndex:int=0,
											 characterCompareMethod:Function=null):int
		{
			/*
			* Check arguments; return immediately where possible. For
			* consistency, don't check for null str.
			*/
			
			if(characterCompareMethod == null)
				characterCompareMethod = defaultCharacterCompareMethod;
			
			if(characterCompareMethod == null)
				return source.indexOf(target, fromIndex);
			
			if((fromIndex > source.length || target == null) && source != null)
				return -1;
			
			if(fromIndex < 0)
				fromIndex = 0;
			
			/* Empty string always matches. */
			if(target == '')
				return fromIndex;
			
			var first:String = target.charAt(0);
			
			var max:int = source.length - target.length;
			
			for (var i:int = fromIndex; i <= max; i++)
			{
				while(!characterCompareMethod(source.charAt(i), first) && i <= max)
					i++;
				
				/* Found first character, now look at the rest of target */
				if(i <= max)
				{
					var j:int = i + 1;
					var end:int = j + target.length - 1;
					for(var k:int = 1; j < end && characterCompareMethod(source.charAt(j), target.charAt(k)); k++)
						j++;
					
					if (j == end)
						/* Found whole string. */
						return i;
				}
			}
			
			return -1;
		}
		
		/**
		 * Returns the last index within this string of the first occurrence of the specified 
		 * substring, starting at the specified index.
		 * The searching use locale comparison method
		 * @param source the characters being searched.
		 * @param target  the characters being searched for.
		 * @param fromIndex the index to begin searching from.
		 * @param characterCompareMethod the locale comparison method.
		 * Default is <code>null</code>, which means a character comparison method will use
		 * the character variations defined by the key <code>character.variations</code> 
		 * of resource bundle fprjcore.properties. This allows you use "so sánh tiếng Việt không dấu".
		 * 
		 * @return the index within this string of the first occurrence of the specified 
		 * substring, starting at the specified index.
		 * 
		 */
		public static function localeLastIndexOf(source:String, target:String, fromIndex:int=int.MAX_VALUE,
												 characterCompareMethod:Function=null):int
		{
			/*
			* Check arguments; return immediately where possible. For
			* consistency, don't check for null str.
			*/
			
			if(characterCompareMethod == null)
				characterCompareMethod = defaultCharacterCompareMethod;
			
			if(characterCompareMethod == null)
				return source.lastIndexOf(target, fromIndex);
			
			if((fromIndex < 0 || target == null)&& source != null)
				return -1;
			
			var rightIndex:int = source.length - target.length;
			
			if(fromIndex > rightIndex)
				fromIndex = rightIndex;
			
			/* Empty string always matches. */
			if(target == '')
				return fromIndex;
			
			var lastIndex:int = target.length - 1;			
			var lastChar:String = target.charAt(lastIndex);
			var min:int = target.length - 1;
			var i:int = min + fromIndex;
			
			startSearchForLastChar:
			while (true) {
				while (i >= min && !characterCompareMethod(source.charAt(i), lastChar))
					i--;

				if (i < min)
					return -1;

				var j:int = i - 1;
				var start:int = j - (target.length - 1);
				var k:int = lastIndex - 1;
				
				while (j > start) {
					if (!characterCompareMethod(source.charAt(j--), target.charAt(k--))) {
						i--;
						continue startSearchForLastChar;
					}
				}
				return start + 1;
			}
			
			return -1;
		}
		
		/**
		 * Check if the two strings are equal in locale comparison method
		 * @param s1 the first string to compare
		 * @param s2 the second string to compare
		 * @param characterCompareMethod the locale comparison method.
		 * Default is <code>null</code>, which means a character comparison method will use
		 * the character variations defined by the key <code>character.variations</code> 
		 * of resource bundle fprjcore.properties. This allows you use "so sánh tiếng Việt không dấu".
		 * @return true if the two strings are equal in locale comparison method
		 * 
		 */
		public static function localeEquals(s1:String, s2:String, characterCompareMethod:Function=null):Boolean
		{
			if (s1 == s2)
				return true;
			else if(s1 == null || s2 == null)
				return false;
			
			if(characterCompareMethod == null)
				characterCompareMethod = defaultCharacterCompareMethod;
			
			if(characterCompareMethod == null)
				return false;				
			
			if(s1.length != s2.length)
				return false;
			
			for (var i:int = 0; i < s1.length; i++)
			{
				if(!characterCompareMethod(s1.charAt(i), s2.charAt(i)))
					return false;
			}
			return true;
		}
		
		public static function simplifyByLocal(s:String):String
		{
			var characterVariations:String = ResourceUtil.getString("character.variations");
			var inputString:String = s.toLocaleLowerCase();
			var result:String = "";
			if(characterVariations != "character.variations")
			{
				var semicolonStart:int;
				var semicolonEnd:int;
				for (var i:int = 0; i < inputString.length; i++)
				{
					var localChar:String = inputString.charAt(i);
					var index:int = characterVariations.indexOf(localChar);
					var found:Boolean = false;
					if(index != -1)
					{
						semicolonStart = characterVariations.lastIndexOf(";", index);
						semicolonEnd = characterVariations.indexOf(";", index);
						if(semicolonEnd == -1)
							semicolonEnd = characterVariations.length;
						for(var j:int = semicolonStart + 1; j < semicolonEnd; j++)
						{
							if(localChar == characterVariations.charAt(j))
							{
								found = true;
								break;
							}
						}
					}
					
					if (found)
						result += characterVariations.charAt(semicolonStart+1);
					else
						result += localChar;
				}
			}
			else
				result = inputString;
			
			return result;
		}
		
		private static var characterVariations:String;
		private static var _defaultCharacterCompareMethod:Function;
		
		public static function get defaultCharacterCompareMethod():Function
		{
			if(_defaultCharacterCompareMethod == null)
			{
				if(characterVariations == null)
					characterVariations = ResourceUtil.getString("character.variations");
				if(characterVariations != "character.variations")
				{
					_defaultCharacterCompareMethod = function(c1:String, c2:String):Boolean
					{
						if(c1 == c2)
							return true;
						
						var i:int = characterVariations.indexOf(c1);
						if(i != -1)
						{
							var semicolonStart:int = characterVariations.lastIndexOf(";", i);
							var semicolonEnd:int = characterVariations.indexOf(";", i);
							if(semicolonEnd == -1)
								semicolonEnd = characterVariations.length;
							for(i = semicolonStart + 1; i < semicolonEnd; i++)
							{
								if(c2 == characterVariations.charAt(i))
									return true;
							}
						}
						
						return false;
					};
				}				
			}
			
			return _defaultCharacterCompareMethod;
		}
		
		public static function set defaultCharacterCompareMethod(value:Function):void
		{
			_defaultCharacterCompareMethod = value;
			characterVariations = null;
		}
		
		public static function removeTabAndLineBreak(s:String):String
		{
			if(s == null)
				return null;
			s = s.replace(/(\r|\n|\t)+/g," ");
			s = s.replace(/ +/g, " ");
			return s;
		}
		
		private static const HTML_TAGS:Array = 
			[
				{tag:'<a', ctag:'</a>', closed:false, atts:['target','href']},
				{tag:'<b', ctag:'</b>', closed:false},
				{tag:'<br', closed:true},
				{tag:'<font', ctag:'</font>', closed:false, atts:['color','face','size']},
				{tag:'<img', ctag:'</img>', closed:false, atts:['src','width','height','align','hspace','vspace','id','checkPolicyFile']},
				{tag:'<i', ctag:'</i>', closed:false},
				{tag:'<li', ctag:'</li>', closed:false},
				{tag:'<ol', ctag:'</ol>', closed:false},
				{tag:'<ul', ctag:'</ul>', closed:false},
				{tag:'<p', ctag:'</p>', closed:false, atts:['align','class']},
				{tag:'<span', ctag:'</span>', closed:false, atts:['class']},
				{tag:'<textformat', ctag:'</textformat>', closed:false, atts:['blockindent','indent','leading','leftmargin','rightmargin','tabstops']},
				{tag:'<u', ctag:'</u>', closed:false}
			];
		
		private static function hasNoMoreTag(s:String, i:int):Boolean
		{
			var a:Array = s.substr(i).match(/(<|>| |\t|\r|\n)+.*/);
			return a == null || a.length == 0;
		}
		
		private static function findNextTag(s:String, from:int):Object
		{
			var original:String = s;
			s = s.toLowerCase();
			while (from < s.length)
			{
				var startOpen:int = s.indexOf("<", from);;
				var startClose:int
				var startFound:Boolean = false;
				
				if(startOpen < 0)
					return null;
				
				for each(var t:Object in HTML_TAGS)
				{
					if(s.substr(startOpen, t.tag.length) != t.tag)
						continue;
					
					if(startOpen < 0 || (!t.closed && hasNoMoreTag(s, startOpen + 1)))
						continue;
					startClose = s.indexOf('>', startOpen + t.tag.length);
					if(startClose < 0)
						continue;
					var attDec:String = s.substring(startOpen + 1, startClose);
					var a:Array = attDec.match(/^[a-z0-9_ -\+"'\/]*$/);
					if(a == null || a.length == 0)
						continue;
					
					startFound = true;
					
					if(t.closed || s.charAt(startClose - 1) == "/")
					{
						return {tag:t.tag,
							contentStart:startClose + 1, contentEnd:startClose,
							text:original.substring(startOpen, startClose + 1),
							start:startOpen, end:startClose};
					}
					var end:int = s.indexOf(t.ctag, startClose + 1);
					if(end > 0)
					{
						return {tag:t.tag,
							contentStart:startClose + 1, contentEnd:end - 1,
							startText:original.substring(startOpen, startClose + 1),
							contentText:original.substring(startClose + 1, end),
							endText:original.substring(end, end + t.ctag.length),
							start:startOpen, end:end + t.ctag.length -1};
					}
				}
				
				if(startFound)
					from = startClose + 1;
				else
					from = startOpen + 1;
			}
			
			return null;
		}
		
		public static function escapeForHtmlText(s:String):String
		{
			if(s == null)
				return null;
			var ret:String ='';
			var i:int = 0;

			do
			{
				var tag:Object = findNextTag(s, i);
				if(tag != null)
				{
					if(tag.start > i)
					{
						ret += s.substring(i, tag.start).replace(/</g,'&lt;').replace(/>/g,'&gt;');
					}
					
					if(tag.contentStart <= tag.contentEnd)
					{
						ret += tag.startText + escapeForHtmlText(tag.contentText) + tag.endText;
					}
					else
					{
						ret += tag.text;
					}
					i = tag.end + 1;
				}
				else
				{
					ret += s.substr(i).replace(/</g,'&lt;').replace(/>/g,'&gt;');
				}
			}
			while (tag != null);
			
			return ret;
		}
		
		public static function formatPassedDuration(date:Date):String
		{
			var n:Number = (new Date()).time - date.time;
			if(n >= TimeUnit.DAY.milliseconds)
			{
				n = Math.round(n / TimeUnit.DAY.milliseconds);
				return (n == 1 ? ResourceUtil.getString("one.day.ago") :
					ResourceUtil.getString("pass.time.days", null, [n]));
			}
			else if(n >= TimeUnit.HOUR.milliseconds)
			{
				n = Math.round(n / TimeUnit.HOUR.milliseconds);
				return (n == 1 ? ResourceUtil.getString("one.hour.ago") :
					ResourceUtil.getString("pass.time.hours", null, [n]));
			}
			else if(n >= TimeUnit.MINUTE.milliseconds)
			{
				n = Math.round(n / TimeUnit.MINUTE.milliseconds);
				return (n == 1 ? ResourceUtil.getString("one.minute.ago") :
					ResourceUtil.getString("pass.time.minutes", null, [n]));
			}
			else
				return ResourceUtil.getString("one.minute.less");
		}
		
		public static function padStringWithLeadingZeros(value:String,
													paddedLength:Number):String
		{
			if (value.length >= paddedLength)
			{
				return value;
			}
			return createZerosPadding(paddedLength - value.length) + value;
		} // end function
		
		private static function createZerosPadding(count:int):String
		{
			var s:String = "";
			var i:int = 0;
			while (i < count)
			{
				s = s + "0";
				i++;
			}
			return s;
		} // end function
		
		/**
		 *  Removes all whitespace characters from the beginning and end
		 *  of the specified string.
		 *
		 *  @param str The String whose whitespace should be trimmed. 
		 *  @param removingChars the string contains removing character
		 *
		 *  @return Updated String where whitespace was removed from the 
		 *  beginning and end. 
		 *  
		 */
		public static function trim(str:String, removingChars:String=null):String
		{
			if(str == null || str.length == 0)
				return str;
			if (removingChars == null) return mx.utils.StringUtil.trim(str);
			var lent:int = str.length;
			var startIndex:int = 0;
			while (startIndex < lent && isRemovingChar(str.charAt(startIndex), removingChars))
				++startIndex;
			
			var endIndex:int = str.length - 1;
			while (endIndex >=0 && isRemovingChar(str.charAt(endIndex), removingChars))
				--endIndex;
			
			if (endIndex >= startIndex)
				return str.slice(startIndex, endIndex + 1);
			else
				return "";
		}
		
		private static function isRemovingChar(character:String, removingChars:String):Boolean
		{
			return removingChars.indexOf(character) != -1;
			return character == "" ? false: removingChars.indexOf(character) != -1;
		}
		
		public static function validateEmail(s:String):Boolean
		{
			var re:RegExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return re.test(s);
		}
		
		/**
		 * HTML encoding for safe display
		 */
		public static function htmlEncode(s:String):String
		{
			s = s.replace("&", "&amp;");
			s = s.replace("<", "&lt;");
			s = s.replace(">", "&gt;");
			s = s.replace("™", '&trade;');
			s = s.replace("®", '&reg;');
			s = s.replace("©", '&copy;');
			s = s.replace("€", "&euro;");
			s = s.replace("£", "&pound;");
			s = s.replace("—", "&mdash;");
			s = s.replace("–", "&ndash;");
			s = s.replace("…", "&hellip;");
			s = s.replace("†", "&dagger;");
			s = s.replace("·", "&middot;");
			s = s.replace("µ", "&micro;");
			s = s.replace("«", "&laquo;");
			s = s.replace("»", "&raquo;");
			s = s.replace("•", "&bull;");
			s = s.replace("°", "&deg;");
			s = s.replace('"', "&quot;");
			return s;
		}
	}
}