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

	import mx.core.mx_internal;
	import mx.formatters.DateBase;
	import mx.formatters.Formatter;
	import mx.utils.StringUtil;
	
	import net.fproject.fproject_internal;
	import net.fproject.core.TimeUnit;
	import net.fproject.di.InstanceFactory;

	use namespace mx_internal;

	/**
	 * A date formatter that supports date format patterns from
	 * the unicode Common Locale Data Repository (CLDR), version 1.9.
	 * The date formats for CLDR are specified in
	 * <a href="http://www.unicode.org/reports/tr35/#Date_Format_Patterns">
	 * http://www.unicode.org/reports/tr35/#Date_Format_Patterns</a>.
	 * <p>Note: This implementation relies on the abbreviated names of day in week
	 * and months from the <code>mx.formatters.DateBase</code> class. In
	 * Flex the abbreviated names are three characters long while in CLDR they are four
	 * characters longs. If you need the four-character strings, you should provide
	 * your own resources for the Flex SDK as described in the Flex
	 * documentation: Localization / Editing framework resource properties.</p>
	 *
	 *
	 * <p>Some additional custom patterns are supported. A few CLDR patterns are
	 * not supported. See <code>formatString</code> for details.</p>
	 *
	 * <b>MXML Syntax</b><br/><br/>
	 * <p>The <code>&lt;utils:DateFormatter&gt;</code> tag formats date and
	 * time <code>String</code>s from a <code>Date</code> object.</p>
	 *
	 * <p>The <code>&lt;utils:DateFormatter&gt;</code> tag inherits all of
	 * the tag attributes of its superclass, and adds the following tag
	 * attributes:</p>
	 *
	 * <pre>   &lt;utils:DateFormatter
	 * formatString="y|R|Q|M|w|d|D|E|e|a|U|h|H|K|k|m|s|S|b|Z|%|#|+"
	 * referenceDate="<i>A Date</i>"
	 * startOfYear="<i>A Date</i>"
	 * /&gt;
	 *
	 * @see net.projectkit.gui.component.WorkCalendarDateField
	 * @see #formatString
	 * 
	 * @author Bui Sy Nguyen
	 * */
	public class AdvancedDateFormatter extends Formatter
	{
		private const VALID_PATTERN_LETTERS:String = "yRQMwdDEeaUhHKkmsSbZ";
		private const VALID_ELAPSED_PATTERN_LETTERS:String = "yRQMwdDEehHKkmsb";
		private const VALID_ALTERNATE_START_OF_YEAR_PATTERN_LETTERS:String =
			"yRQMwdDaUhHKkmsSbZ";
		private var _calendar:GregorianCalendar;
		private var _explicitDayNamesNarrow:Array;
		private var _defaultDayNamesNarrow:Array;
		private var _explicitMonthNamesNarrow:Array;
		private var _defaultMonthNamesNarrow:Array;
		private var _explicitFormatString:String;
		private var _defaultFormatString:String;
		private var _referenceDate:Date;
		private var _startOfYear:Date;
		private var _halfyearAbbreviatedFormat:String;
		private var _quarterAbbreviatedFormat:String;
		private var _periodAMStandaloneText:String;
		private var _periodPMStandaloneText:String;
		private var _gmtFormat:String;
		private var _positiveSign:String;
		private var _negativeSign:String;

		/**
		 * The GregorianCalendar used to perform computations on Dates
		 * @default null
		 */
		public function get gregorianCalendar():GregorianCalendar
		{
			if (!this._calendar)
			{
				this._calendar = InstanceFactory.getInstance(GregorianCalendar);
			}
			return this._calendar;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set gregorianCalendar(value:GregorianCalendar):void
		{
			this._calendar = value;
		}

		/**
		 *
		 * The narrow names for days of the week.
		 * <p>The first element is the narrow name for Sunday.</p>
		 * <p>The default value is <code>["S","M","T","W","T","F","S"];</code>.</p>
		 *
		 */
		public function get dayNamesNarrow():Array
		{
			if (this._explicitDayNamesNarrow)
			{
				return this._explicitDayNamesNarrow;
			}
			return this._defaultDayNamesNarrow;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set dayNamesNarrow(value:Array):void
		{
			this._explicitDayNamesNarrow = value;
		}

		/**
		 *
		 * The narrow names for months used with the format pattern "MMMMM".
		 * <p>The first element is the narrow name for January.</p>
		 * <p> The default value is
		 * <code>["J","F","M","A","M","J","J","A","S","O","N","D"];</code>.</p>
		 *
		 */
		public function get monthNamesNarrow():Array
		{
			if (this._explicitMonthNamesNarrow)
			{
				return this._explicitMonthNamesNarrow;
			}
			return this._defaultMonthNamesNarrow;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set monthNamesNarrow(value:Array):void
		{
			this._explicitMonthNamesNarrow = value;
		}

		/**
		 *
		 * The mask pattern.
		 * <p>This formatter supports date format patterns from the unicode
		 *  Common Locale Data Repository (CLDR). Some CLDR patterns are not
		 *  supported. Some additional patterns are supported.</p>
		 *
		 *  <p>The following are supported additions to the CLDR date format
		 *  patterns:
		 *  </p><ul>
		 *  <li><code>R</code> -- half-year or semester.</li>
		 *  <li><code>b</code> -- milliseconds in second.</li>
		 *  <li><code>U</code> -- standalone period.</li>
		 *  <li><code>#</code> -- prefix for elapsed units. Example:
		 *  <code>#mmm</code> produces the number of minutes elapsed since the
		 *  <code>referenceDate</code>. The number is padded with zeros to the
		 *  length of the pattern. Negative numbers are prefixed with the
		 *  negative sign <code>-</code>. Positive numbers are not
		 *  prefixed.</li>
		 *  <li><code>#+</code> -- prefix for elapsed units with positive sign.
		 *  The output is the same as with the <code>#</code> prefix, except
		 *  that positive number are prefixed with the positive sign
		 *  <code>+</code>.</li>
		 *  <li><code>%</code> -- prefix for units with a custom start of year.
		 *  <code>startOfYearSample</code> defines a sample for the start of
		 *  the year.  Example: <code>%yyyy</code> produces the year number for
		 *  a year that starts at the <code>startOfYearSample</code>.
		 *  Typically used to represent fiscal years, quarters and weeks.</li>
		 *  </ul>
		 *  <p>The following table lists the supported pattern letters. Format
		 *  pattern letters not listed here are not supported.
		 *
		 *  </p><table><tbody><tr><td><b>Pattern letter</b></td><td><b>
		 * Description</b></td><td><b>Examples</b></td></tr><tr><td>y</td>
		 * <td>Year. The value is padded with zeroes to the length of the pattern.
		 *  Two pattern letters (<code>yy</code>) produces the two least
		 *  significant digits.</td><td><ul>
		 *  <li>y: 2010</li>
		 *  <li>yy: 10</li>
		 *
		 *  <li>yyy: 2010</li>
		 *  <li>yyyy: 2010</li>
		 *  <li>yyyyy: 02010</li>
		 *  </ul>
		 *  </td></tr><tr><td>R</td><td>Half year or semester. The numerical half-year is in the range
		 *  [1-2]. This is an addition to the CLDR date format patterns.</td><td><ul>
		 *  <li>R: 1</li>
		 *
		 *  <li>RR: 01</li>
		 *  <li>RRR: H1 -- abbreviated</li>
		 *  </ul>
		 *  </td></tr><tr><td>Q</td><td>Quarter. The numerical quarter is in the range [1-4].</td><td><ul>
		 *  <li>Q: 1</li>
		 *  <li>QQ: 01</li>
		 *
		 *  <li>QQQ: Q1 -- abbreviated</li>
		 *  </ul>
		 *  </td></tr><tr><td>M</td><td>Month. The numerical month is in the range [1-12].</td><td><ul>
		 *  <li>M: 9</li>
		 *  <li>MM: 09</li>
		 *  <li>MMM: Sep -- abbreviated</li>
		 *
		 *  <li>MMMM: September -- wide</li>
		 *  <li>MMMMM: S -- narrow</li>
		 *  </ul>
		 *  </td></tr><tr><td>w</td><td>Week of year. The numerical week is in the range [1-53]. The
		 *  numbering of weeks is defined by the properties
		 *  <code>firstDayOfWeek</code> and <code>minimalDaysInFirstWeek</code> of
		 *  the <code>calendar</code>.</td><td><ul>
		 *
		 *  <li>w: 9</li>
		 *  <li>ww: 09</li>
		 *  </ul>
		 *  </td></tr><tr><td>d</td><td>Date or day of the month. The numerical date is in the range
		 *  [1-31].</td><td><ul>
		 *  <li>d: 9</li>
		 *  <li>dd: 09</li>
		 *
		 *  </ul>
		 *  </td></tr><tr><td>D</td><td>Date of year. The numerical date is in the range [1-366].</td><td><ul>
		 *  <li>D: 9</li>
		 *  <li>DD: 09</li>
		 *  <li>DDD: 009</li>
		 *  </ul>
		 *
		 *  </td></tr><tr><td>E</td><td>Day of the week.</td><td><ul>
		 *  <li>E: Tue -- abbreviated</li>
		 *  <li>EE: Tue -- abbreviated</li>
		 *  <li>EEE: Tue -- abbreviated</li>
		 *  <li>EEEE: Tuesday -- wide</li>
		 *  <li>EEEEE: T -- narrow</li>
		 *
		 *  </ul>
		 *  </td></tr><tr><td>e</td><td>Local day of the week. Same as <code>E</code> except for one and
		 *  two-pattern letters that produce a numerical representation based on the
		 *  first day of week for the locale. In the example below the first day
		 *  of the week is Monday. Numerical values are in the range [1-7]. The
		 *  first day of the week is defined by the property
		 *  <code>firstDayOfWeek</code> of the <code>calendar</code>.</td><td><ul>
		 *  <li>e: 2 -- numerical</li>
		 *
		 *  <li>ee: 02 -- numerical</li>
		 *  <li>eee: Tue -- abbreviated</li>
		 *  <li>eeee: Tuesday -- wide</li>
		 *  <li>eeeee: T -- narrow</li>
		 *  </ul>
		 *  </td></tr><tr><td>a</td><td>Period or am/pm indicator.</td><td><ul>
		 *
		 *  <li>a: AM</li>
		 *  </ul>
		 *  </td></tr><tr><td>U</td><td>Standalone period. This is an addition to the CLDR date format
		 *  patterns.</td><td><ul>
		 *  <li>U: AM</li>
		 *  </ul>
		 *  </td></tr><tr><td>h</td><td>Hour [1-12].</td><td><ul>
		 *
		 *  <li>h: 12</li>
		 *  <li>hh: 12</li>
		 *  </ul>
		 *  </td></tr><tr><td>H</td><td>Hour [0-23].</td><td><ul>
		 *  <li>H: 23</li>
		 *  <li>HH: 23</li>
		 *
		 *  </ul>
		 *  </td></tr><tr><td>K</td><td>Hour [0-11].</td><td><ul>
		 *  <li>K: 0</li>
		 *  <li>KK: 00</li>
		 *  </ul>
		 *  </td></tr><tr><td>k</td><td>Hour [1-24].</td><td><ul>
		 *
		 *  <li>k: 24</li>
		 *  <li>kk: 24</li>
		 *  </ul>
		 *  </td></tr><tr><td>m</td><td>Minute.</td><td><ul>
		 *  <li>m: 9</li>
		 *  <li>mm: 09</li>
		 *
		 *  </ul>
		 *  </td></tr><tr><td>s</td><td>Second.</td><td><ul>
		 *  <li>s: 9</li>
		 *  <li>ss: 09</li>
		 *  </ul>
		 *  </td></tr><tr><td>S</td><td>Fractional seconds. Produces the most significant digits of the
		 *  fractional seconds. The behavior deviates from CLDR which rounds the
		 *  value.</td><td>
		 * <ul>
		 *  <li>S: 1</li>
		 *  <li>SS: 12</li>
		 *  <li>SSS: 125</li>
		 *  </ul>
		 *  </td></tr><tr><td>b</td><td>Milliseconds. This is an addition to the CLDR date format
		 *  patterns.</td><td><ul>
		 *  <li>b: 1</li>
		 *
		 *  <li>bb: 01</li>
		 *  <li>bbb: 001</li>
		 *  </ul>
		 *  </td></tr><tr><td>Z</td><td>Time zone.
		 *  </td><td><ul>
		 *  <li>Z: +0100 -- RFC 822 format</li>
		 *  <li>ZZ: +0100 -- RFC 822 format</li>
		 *
		 *  <li>ZZZ: +0100 -- RFC 822 format</li>
		 *  <li>ZZZZ: GMT+0100 -- localized GMT format</li>
		 *  </ul>
		 *  </td></tr></tbody></table>
		 *
		 *
		 *  <p>Text that must not be interpreted as a pattern should be enclosed in
		 *  single quotes. To produce a single quote in the format string use two
		 *  single quotes in a row.</p>
		 *
		 *  <p>Examples:</p><ul>
		 *  <li>The <code>formatString</code> <code>"mm 'in' hh"</code> produces
		 *  <code>59 in 10</code>.</li>
		 *
		 *  <li>The <code>formatString</code> <code>"MMM ''yy"</code> produces
		 *  <code>Jan '10</code>.</li>
		 *  <li>The <code>formatString</code> <code>"hh 'o''clock'"</code> produces
		 *  <code>10 o'clock</code>.</li>
		 *  </ul>
		 *
		 *  <p><b>Localization:</b>
		 *  This class uses resources from the following resource bundles:</p><ul>
		 *  <li>Adobe Flex SDK <code>SharedResources</code>:
		 *  <code>dayNamesLong</code>, <code>dayNamesShort</code>,
		 *  <code>monthNamesLong</code>, <code>monthNamesShort</code>.</li>
		 *  <li>FPROJECT_CORE framework <code>FPROJECT_CORE</code>:
		 *  <code>dayNamesShortest</code>, <code>firstDayOfWeek</code></li>
		 *  <li>Adobe Flex SDK <code>formatters</code>:
		 *  <code>am</code>, <code>pm</code></li>
		 *  </ul>
		 *  <p> The default value is <code>"MM/dd/yyyy"</code>.</p>
		 *
		 *  */
		public function get formatString():String
		{
			if (this._explicitFormatString != null)
			{
				return this._explicitFormatString;
			}
			return this._defaultFormatString;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set formatString(value:String):void
		{
			this._explicitFormatString = value;
			_compiledPattern = null;
		}

		/**
		 *
		 * The reference date used for the determination of elapsed units.
		 * <p>Elapsed units are the number of elapsed units since the
		 * reference date specified by this property. For example when specifying
		 * a <code>formatString</code> of <code>#mmm</code> and a
		 * <code>referenceDate</code> of <code>2000-01-01 00:00:00</code>, the
		 * formatted date for <code>2000-01-01 02:00:00</code> is <code>120</code>,
		 * which is the number of minutes elapsed between the reference date and
		 * the value.</p>
		 * <p>The default value is <code>"2000-01-01 00:00:00"</code>.</p>
		 *
		 */
		public function get referenceDate():Date
		{
			if (this._referenceDate == null)
			{
				this._referenceDate = GregorianCalendar.fproject_internal::getDefaultReferenceDate();
			}
			return this._referenceDate;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set referenceDate(value:Date):void
		{
			this._referenceDate = value;
		}

		/**
		 *
		 * <p>A sample date for the definition of the start of the year.
		 *  </p><p>By default the year starts on the 1st of January,
		 * and format patterns with the prefix <code>%</code> output the same
		 * value as patterns with no prefix. In cases where you want to represent
		 * fiscal year, quarter and week, or more generally time units for an
		 * alternate start of year, you have to specify the start of the year.
		 * This is achieved by setting the <code>startOfYear</code> property with
		 * a sample date used to define the start of the year.
		 * So for example:</p>
		 * <pre>&lt;CLDRDateFormatter id="formatter" startOfYear="{new Date(2000,9,1)}" formatString="%yyyy"/&gt;
		 *  </pre>
		 *  Indicates that the alternate start of year is on 1st October, and outputs
		 *  the year using the alternate start of year. So:<pre>     formatter.format(new Date(2000, 0, 1)); // outputs: 1999
		 *  formatter.format(new Date(2000, 9, 1)); // outputs: 2000
		 *  formatter.format(new Date(2001, 0, 1)); // outputs: 2000
		 *  </pre>
		 *  <p>When <code>null</code> the year starts on the 1st of January, and format
		 *  patterns with the prefix <code>%</code> output the same value as the
		 *  patterns with no prefix.</p>
		 *
		 * @default null
		 */
		public function get startOfYear():Date
		{
			return this._startOfYear;
		}

		/**
		 *
		 * @private
		 *
		 */
		public function set startOfYear(value:Date):void
		{
			this._startOfYear = value;
		}

		/**
		 *
		 * <p>Formats a value and returns a String containing the new,
		 * formatted, value.
		 *  </p><p>When an error occurs during formatting, the value of the
		 *  <code>error</code> property describes the type of error:</p>
		 * <ul>
		 *  <li><code>mx.formatters.Formatter#defaultInvalidFormatError</code>
		 *  indicates that the <code>formatString</code> is empty or
		 *  contains no pattern letter or it contains several occurences
		 *  of a field.</li>
		 *  <li><code>mx.formatters.Formatter#defaultInvalidValueError</code>
		 *  indicates that the <code>value</code> parameter passed to the
		 *  <code>format()</code> method is either null or an an invalid date
		 *  or an empty <code>String</code> or a <code>String</code> that cannot
		 *  be parsed as a <code>Date</code>.</li>
		 *  </ul>
		 *
		 * @param value The value to be formatted. It is either a <code>Date</code>
		 * object or the <code>String</code> representation of a date.
		 * A <code>String</code> representation is parsed with
		 * <code>DateFormatter.parseDateString()</code> and must
		 * conform to its requirements.
		 *
		 * @return The date formatted according to the <code>formatString</code>,
		 * or an empty <code>String</code> if an error occured.
		 *
		 * @see #parse()
		 * */
		override public function format(value:Object):String
		{
			error = null;
			if (value == null || value == "")
			{
				return this.formatWithInvalidValue();
			}
			if (value is String)
			{
				value =
					mx.formatters.DateFormatter.parseDateString(String(value));
				if (value == null)
				{
					return this.formatWithInvalidValue();
				}
			}
			else
			{
				if (!(value is Date))
				{
					return this.formatWithInvalidValue();
				}
				if (value is Date && isNaN((value as Date).time))
				{
					return this.formatWithInvalidValue();
				}
			}
			var copyingString:String = "";
			var charMarker:String = null;
			var formartStringLength:int = this.formatString.length;
			var i:int = 0;
			var j:int = 0;
			while (i < formartStringLength)
			{
				var currentChar:String = this.formatString.charAt(i);
				if (currentChar == "\'")
				{
					if (charMarker != null)
					{
						return this.formatWithInvalidFormat();
					}
					var nextIdx:int = this.formatString.indexOf("\'", (i + 1));
					if (nextIdx == -1)
					{
						return this.formatWithInvalidFormat();
					}
					i = nextIdx;
				}
				else
				{
					if (currentChar == "%" || currentChar == "#")
					{
						charMarker = currentChar;
					}
					else if (currentChar == "+")
					{
						if (charMarker != "#")
						{
							return this.formatWithInvalidFormat();
						}
					}
					else if (this.VALID_PATTERN_LETTERS.indexOf(currentChar) != -1)
					{
						if (copyingString.indexOf(currentChar) != -1)
						{
							if (this.formatString.charAt((i - 1)) != currentChar)
							{
								return this.formatWithInvalidFormat();
							}
						}
						else
						{
							if (charMarker == "#" &&
								this.VALID_ELAPSED_PATTERN_LETTERS.indexOf(currentChar) == -1)
							{
								return this.formatWithInvalidFormat();
							}
							if (charMarker == "%" &&
								this.VALID_ALTERNATE_START_OF_YEAR_PATTERN_LETTERS.indexOf(currentChar) == -1)
							{
								return this.formatWithInvalidFormat();
							}
							copyingString = copyingString + currentChar;
							j = j + 1;
						}
						charMarker = null;
					}
					else if (charMarker != null)
					{
						return this.formatWithInvalidFormat();
					}
				}
				i = i + 1;
			}
			if (charMarker != null)
			{
				return this.formatWithInvalidFormat();
			}
			if (j == 0)
			{
				return this.formatWithInvalidFormat();
			}
			return this.doFormat(value as Date);
		}

		/**
		 * Returns the date formatted using the <code>formatString</code>
		 * @param value
		 * @return
		 *
		 */
		protected function doFormat(value:Date):String
		{
			var currentFormatterChar:String = null;
			var i:int = 0;
			var timeValuePiece:Number = NaN;
			var usePositiveSign:Boolean = false;
			var tmpInt:int = 0;
			var formattingResult:String = "";
			var numberSignOrPercentage:String = null;
			var formatterLength:uint = this.formatString.length;
			var idx:int = 0;
			while (idx < formatterLength)
			{
				currentFormatterChar = this.formatString.charAt(idx);
				i = 1;
				while (idx + i < formatterLength &&
					this.formatString.charAt(idx + i) == currentFormatterChar)
				{
					i = i + 1;
				}
				idx = idx + (i - 1);
				switch (currentFormatterChar)
				{
					case "\'":
					{
						while (i > 1)
						{
							formattingResult = formattingResult + "\'";
							i = i - 2;
						}
						while (i > 0)
						{
							tmpInt = this.formatString.indexOf("\'", (idx + 1));
							formattingResult =
								formattingResult + this.formatString.substring((idx + 1),
								tmpInt);
							idx = tmpInt;
							tmpInt = 1;
							while (idx + tmpInt < formatterLength &&
								this.formatString.charAt(idx + tmpInt) == "\'")
							{
								tmpInt = tmpInt + 1;
							}
							idx = idx + (tmpInt - 1);
							while (tmpInt > 1)
							{
								formattingResult = formattingResult + "\'";
								tmpInt = tmpInt - 2;
							}
							i = i - tmpInt;
						}
						break;
					}
					case "#":
					{
						numberSignOrPercentage = currentFormatterChar;
						break;
					}
					case "%":
					{
						numberSignOrPercentage = currentFormatterChar;
						usePositiveSign = false;
						break;
					}
					case "+":
					{
						usePositiveSign = true;
						break;
					}
					case "y":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedYears(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getUnitValue(value,
									TimeUnit.YEAR, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.fullYear;
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece);
							}
							else if (i == 2)
							{
								formattingResult =
									formattingResult + net.fproject.utils.StringUtil.padStringWithLeadingZeros(String(timeValuePiece).substr(-2,
									2), 2);
							}
							else
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
									i);
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "R":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedHalfYears(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getUnitValue(value,
									TimeUnit.HALF_YEAR, this.startOfYear);
							}
							else
							{
								timeValuePiece =
									this.gregorianCalendar.getHalfYear(value);
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece);
							}
							else if (i == 2)
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
									i);
							}
							else
							{
								formattingResult =
									formattingResult + mx.utils.StringUtil.substitute(this._halfyearAbbreviatedFormat,
									timeValuePiece);
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "Q":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedQuarters(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getUnitValue(value,
									TimeUnit.QUARTER, this.startOfYear);
							}
							else
							{
								timeValuePiece =
									this.gregorianCalendar.getQuarter(value);
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece);
							}
							else if (i == 2)
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
									i);
							}
							else if (i == 3)
							{
								formattingResult =
									formattingResult + mx.utils.StringUtil.substitute(this._quarterAbbreviatedFormat,
									timeValuePiece);
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "M":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedMonths(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getUnitValue(value,
									TimeUnit.MONTH, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.month;
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String((timeValuePiece + 1));
							}
							else if (i == 2)
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros((timeValuePiece + 1),
									i);
							}
							else if (i == 3)
							{
								formattingResult =
									formattingResult + DateBase.monthNamesShort[timeValuePiece];
							}
							else if (i == 4)
							{
								formattingResult =
									formattingResult + DateBase.monthNamesLong[timeValuePiece];
							}
							else if (i == 5)
							{
								formattingResult =
									formattingResult + this.monthNamesNarrow[timeValuePiece];
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "w":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedWeeks(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getUnitValue(value,
									TimeUnit.WEEK, this.startOfYear);
							}
							else
							{
								timeValuePiece =
									this.gregorianCalendar.getWeek(value);
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
									i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "d":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedDays(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getUnitValue(value,
									TimeUnit.DAY, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.date;
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
									i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "D":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedDays(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece =
									this.gregorianCalendar.getDayOfYear(value);
							}
							else
							{
								timeValuePiece =
									this.gregorianCalendar.getDayOfYear(value);
							}
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
									i > 3 ? (3) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "E":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedDays(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							timeValuePiece = value.day;
							if (i < 4)
							{
								formattingResult =
									formattingResult + DateBase.dayNamesShort[timeValuePiece];
							}
							else if (i == 4)
							{
								formattingResult =
									formattingResult + DateBase.dayNamesLong[timeValuePiece];
							}
							else if (i == 5)
							{
								formattingResult =
									formattingResult + this.dayNamesNarrow[timeValuePiece];
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "e":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedDays(this.referenceDate,
								value);
							formattingResult =
								formattingResult + this.padNumberWithLeadingZeros(timeValuePiece,
								i, usePositiveSign);
						}
						else
						{
							timeValuePiece = value.day;
							if (i == 1)
							{
								formattingResult =
									formattingResult + String(timeValuePiece + this.gregorianCalendar.firstDayOfWeek + 1);
							}
							else if (i == 2)
							{
								formattingResult =
									formattingResult + this.padNumberWithLeadingZeros(timeValuePiece + this.gregorianCalendar.firstDayOfWeek + 1,
									2);
							}
							else if (i == 3)
							{
								formattingResult =
									formattingResult + DateBase.dayNamesShort[timeValuePiece];
							}
							else if (i == 4)
							{
								formattingResult =
									formattingResult + DateBase.dayNamesLong[timeValuePiece];
							}
							else if (i == 5)
							{
								formattingResult =
									formattingResult + this.dayNamesNarrow[timeValuePiece];
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "a":
					{
						if (numberSignOrPercentage == "%")
						{
							timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.CALENDAR_HOUR, this.startOfYear);
						}
						else
						{
							timeValuePiece = value.hours;
						}
						timeValuePiece = timeValuePiece < 12 ? (0) : (1);
						formattingResult = formattingResult + DateBase.timeOfDay[timeValuePiece];
						numberSignOrPercentage = null;
						break;
					}
					case "U":
					{
						if (numberSignOrPercentage == "%")
						{
							timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.CALENDAR_HOUR, this.startOfYear);
						}
						else
						{
							timeValuePiece = value.hours;
						}
						formattingResult = formattingResult + (timeValuePiece < 12 ? (this._periodAMStandaloneText) : (this._periodPMStandaloneText));
						numberSignOrPercentage = null;
						break;
					}
					case "h":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedHours(this.referenceDate,
								value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.HOUR, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.hours;
							}
							timeValuePiece = timeValuePiece % 12;
							if (timeValuePiece == 0)
							{
								timeValuePiece = 12;
							}
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "H":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece = this.gregorianCalendar.getElapsedHours(this.referenceDate, value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.HOUR, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.hours;
							}
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "K":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece =
								this.gregorianCalendar.getElapsedHours(this.referenceDate,
								value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.HOUR, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.hours;
							}
							timeValuePiece = timeValuePiece % 12;
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "k":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece = this.gregorianCalendar.getElapsedHours(this.referenceDate, value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.HOUR, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.hours;
							}
							if (timeValuePiece == 0)
							{
								timeValuePiece = 24;
							}
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "m":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece = this.gregorianCalendar.getElapsedMinutes(this.referenceDate, value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.MINUTE, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.minutes;
							}
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "s":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece = this.gregorianCalendar.getElapsedSeconds(this.referenceDate, value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.SECOND, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.seconds;
							}
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 2 ? (2) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "S":
					{
						if (numberSignOrPercentage == "%")
						{
							timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.MILLISECOND, this.startOfYear);
						}
						else
						{
							timeValuePiece = value.milliseconds;
						}
						if (i == 1)
						{
							timeValuePiece = Math.floor(timeValuePiece / 100);
						}
						else if (i == 2)
						{
							timeValuePiece = Math.floor(timeValuePiece / 10);
						}
						if (i == 1)
						{
							formattingResult = formattingResult + String(timeValuePiece);
						}
						else
						{
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 3 ? (3) : (i));
						}
						numberSignOrPercentage = null;
						break;
					}
					case "b":
					{
						if (numberSignOrPercentage == "#")
						{
							timeValuePiece = this.gregorianCalendar.getElapsedMilliseconds(this.referenceDate, value);
							formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i, usePositiveSign);
						}
						else
						{
							if (numberSignOrPercentage == "%")
							{
								timeValuePiece = this.gregorianCalendar.getUnitValue(value, TimeUnit.MILLISECOND, this.startOfYear);
							}
							else
							{
								timeValuePiece = value.milliseconds;
							}
							if (i == 1)
							{
								formattingResult = formattingResult + String(timeValuePiece);
							}
							else
							{
								formattingResult = formattingResult + this.padNumberWithLeadingZeros(timeValuePiece, i > 3 ? (3) : (i));
							}
						}
						numberSignOrPercentage = null;
						break;
					}
					case "Z":
					{
						timeValuePiece = -value.timezoneOffset;
						var isNegativeTimeValue:Boolean = timeValuePiece < 0;
						if (isNegativeTimeValue)
						{
							timeValuePiece = -timeValuePiece;
						}
						var offsetInHours:Number =
							Math.floor(timeValuePiece / 60);
						var hours:String = null;
						var minutes:String = null;
						var paddingMinutes:Number = timeValuePiece - offsetInHours * 60;
						hours = this.padNumberWithLeadingZeros(isNegativeTimeValue ? (-offsetInHours) : (offsetInHours), 2, true);
						minutes = this.padNumberWithLeadingZeros(paddingMinutes, 2);
						if (i <= 3)
						{
							formattingResult = formattingResult + (hours + minutes);
						}
						else if (i == 4)
						{
							formattingResult = formattingResult + mx.utils.StringUtil.substitute(this._gmtFormat, hours, minutes);
						}
						numberSignOrPercentage = null;
						break;
					}
					default:
					{
						for (tmpInt = 0; tmpInt < i; tmpInt++)
						{
							formattingResult = formattingResult + currentFormatterChar;
						}
						break;
					}
				}
				idx = idx + 1;
			}

			return formattingResult;
		}

		internal function padNumberWithLeadingZeros(value:Number,
			paddedLength:Number, usePositiveSign:Boolean = false):String
		{
			var isNegativeValue:Boolean = value < 0;
			if (isNegativeValue)
			{
				value = -value;
			}
			var paddingValue:String =
				net.fproject.utils.StringUtil.padStringWithLeadingZeros(String(value), paddedLength);
			if (isNegativeValue)
			{
				return this._negativeSign + paddingValue;
			}
			if (usePositiveSign && value != 0)
			{
				return this._positiveSign + paddingValue;
			}
			return paddingValue;
		}

		private function formatWithInvalidFormat():String
		{
			error = defaultInvalidFormatError;
			return "";
		}

		private function formatWithInvalidValue():String
		{
			error = defaultInvalidValueError;
			return "";
		}

		override protected function resourcesChanged():void
		{
			super.resourcesChanged();
			this._halfyearAbbreviatedFormat =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"halfyear.abbreviated.format", "H{0}");
			this._quarterAbbreviatedFormat =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"quarter.abbreviated.format", "Q{0}");
			this._periodAMStandaloneText =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"period.am.standalone.text", "AM");
			this._periodPMStandaloneText =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"period.pm.standalone.text", "PM");
			this._gmtFormat =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE, "gmt.format",
				"GMT{0}{1}");
			this._positiveSign =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"positive.sign.text", "+");
			this._negativeSign =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"negative.sign.text", "-");
			this._defaultFormatString =
				this.getPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"default.date.format", "MM/dd/yyyy");
			this._defaultDayNamesNarrow =
				this.getStringArrayPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"dayNamesShortest", ["S", "M", "T", "W", "T", "F", "S"]);
			this._defaultMonthNamesNarrow =
				this.getStringArrayPropertyValue(ResourceUtil.FPRJ_CORE_BUNDLE,
				"month.names.narrow",
				["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]);
		}

		private function getPropertyValue(bundleName:String,
			propertyName:String, defaultValue:String):String
		{
			var value:String =
				resourceManager.getString(bundleName, propertyName);
			if (value != null)
			{
				return value;
			}
			return defaultValue;
		}

		private function getStringArrayPropertyValue(bundleName:String,
			propertyName:String, defaultValue:Array):Array
		{
			var value:Array =
				resourceManager.getStringArray(bundleName, propertyName);
			if (value != null)
			{
				return value;
			}
			return defaultValue;
		}

		/**
		 *  Converts a date that is formatted as a String into a Date object.
		 *  Month and day names must match the names in mx.formatters.DateBase.
		 *
		 *  The hour value in the String must be between 0 and 23, inclusive.
		 *  The minutes and seconds value must be between 0 and 59, inclusive.
		 *  The following example uses this method to create a Date object:
		 *
		 *  <pre>
		 * var myDate:Date = advDateFormatter.parse("2010-12-02 12:34:56");
		 * var myDate1:Date = advDateFormatter.parse("02-Dec-2010 12:34:56");
		 * var myDate2:Date = advDateFormatter.parse("02-Dec-2010 12:34:56.789");
		 * var myDate3:Date = advDateFormatter.parse("20101227215959UTC");
		 *  </pre>
		 *
		 *  @see mx.formatters.DateBase
		 *
		 *  @param str Date that is formatted as a String.
		 *
		 *  @return Date object.
		 *
		 */
		public function parse(valueString:String):Date
		{
			return fproject_internal::parse(valueString, new ParsePosition(0));
		}
		
		/**
		 * Tags for the compiled pattern.
		 */
		private static const TAG_QUOTE_ASCII_CHAR:int       = 100;
		private static const TAG_QUOTE_CHARS:int            = 101;
		
		private var _compiledPattern:Vector.<uint>;

		public function get compiledPattern():Vector.<uint>
		{
			if(_compiledPattern == null)
				_compiledPattern = compilePattern(this.formatString);
			return _compiledPattern;
		}

		/**
		 * The minus sign to be used with format and parse.
		 */
		private var minusSign:String = '-';
		
		/**
		 * True when a negative sign follows a number.
		 * (True as default in Arabic.)
		 */
		private var hasFollowingMinusSign:Boolean = false;
		
		/**
		 * True if standalone form needs to be used.
		 */
		private var forceStandaloneForm:Boolean = false;
		
		fproject_internal function parse(text:String, pos:ParsePosition):Date
		{
			if(text == null)
				return null;
			
			var start:int = pos.index;
			var oldStart:int = start;
			var textLength:int = text.length;
			var minusSignCode:uint = minusSign.charCodeAt(0);
			var ambiguousYear:Array = [false];
			
			var builder:DateBuilder = new DateBuilder;
			
			for (var i:int = 0; i < compiledPattern.length; ) {
				var tag:int = compiledPattern[i] >>> 8;
				var count:int = compiledPattern[i++] & 0xff;
				if (count == 255) {
					count = compiledPattern[i++] << 16;
					count |= compiledPattern[i++];
				}
				
				switch (tag) {
					case TAG_QUOTE_ASCII_CHAR:
						if (start >= textLength || text.charCodeAt(start) != count) {
							pos.index = oldStart;
							pos.errorIndex = start;
							return null;
						}
						start++;
						break;
					
					case TAG_QUOTE_CHARS:
						while (count-- > 0) {
							if (start >= textLength || text.charCodeAt(start) != compiledPattern[i++]) {
								pos.index = oldStart;
								pos.errorIndex = start;
								return null;
							}
							start++;
						}
						break;
					
					default:
						// Peek the next pattern to determine if we need to
						// obey the number of pattern letters for
						// parsing. It's required when parsing contiguous
						// digit text (e.g., "20010704") with a pattern which
						// has no delimiters between fields, like "yyyyMMdd".
						var obeyCount:Boolean = false;
						
						// In Arabic, a minus sign for a negative number is put after
						// the number. Even in another locale, a minus sign can be
						// put after a number using DateFormat.setNumberFormat().
						// If both the minus sign and the field-delimiter are '-',
						// subParse() needs to determine whether a '-' after a number
						// in the given text is a delimiter or is a minus sign for the
						// preceding number. We give subParse() a clue based on the
						// information in compiledPattern.
						var useFollowingMinusSignAsDelimiter:Boolean = false;
						
						if (i < compiledPattern.length) {
							var nextTag:int = compiledPattern[i] >>> 8;
							if (!(nextTag == TAG_QUOTE_ASCII_CHAR ||
								nextTag == TAG_QUOTE_CHARS)) {
								obeyCount = true;
							}
							
							if (hasFollowingMinusSign &&
								(nextTag == TAG_QUOTE_ASCII_CHAR ||
									nextTag == TAG_QUOTE_CHARS)) {
								var c:uint;
								if (nextTag == TAG_QUOTE_ASCII_CHAR) {
									c = compiledPattern[i] & 0xff;
								} else {
									c = compiledPattern[i+1];
								}
								
								if (c == minusSignCode) {
									useFollowingMinusSignAsDelimiter = true;
								}
							}
						}
						start = subParse(text, start, tag, count, obeyCount,
							ambiguousYear, pos,
							useFollowingMinusSignAsDelimiter, builder);
						if (start < 0) {
							pos.index = oldStart;
							return null;
						}
				}
			}
			
			// At this point the fields of Calendar have been set.  Calendar
			// will fill in default values for missing fields when the time
			// is computed.
			
			pos.index = start;
			
			var parsedDate:Date;
			try {
				parsedDate = builder.getDate();
				// If the year value is ambiguous,
				// then the two-digit year == the default start year
				if (ambiguousYear[0]) {
					if (parsedDate.getTime() < Consts.defaultCenturyStart.getTime()) {
						parsedDate = builder.addYear(100).getDate();
					}
				}
			}
			// An IllegalArgumentException will be thrown by Calendar.getTime()
			// if any fields are out of range, e.g., MONTH == 17.
			catch (e:Error) {
				pos.errorIndex = start;
				pos.index = oldStart;
				return null;
			}
			
			return parsedDate;
		}

		
		private const PATTERN_INDEX_TO_CALENDAR_FIELD:Array = [0,1,2,5,11,11,12,13,14,7,6,8,3,4,9,10,10,15,15,17,1000,15,2];
		
		private function matchString(text:String, start:int, field:int, data:Object, builder:DateBuilder):int
		{
			return 0;
		}
		
		private function getDisplayNamesMap(field:int/*, locale:String*/):Object {
			return {};
		}
		
		private function subParseNumericZone(text:String, start:int, sign:int, count:int,
											 colon:Boolean, builder:DateBuilder):int {
			return 0;
		}
		
		private function subParseZoneString(text:String, start:int, builder:DateBuilder):int {
			return 0;
		}
		
		/**
		 * Tell whether date/time parsing is to be lenient.
		 *
		 */
		public function get isLenient():Boolean
		{
			return true;
		}
		
		private var formatData:DateFormatSymbols;
		
		private var  useDateFormatSymbols:Boolean;
		
		private function getDisplayNames(field:int, style:int):Object
		{
			return {};
		}
		
		/**
		 * Returns the compiled form of the given pattern. The syntax of
		 * the compiled pattern is:
		 * <blockquote>
		 * CompiledPattern:
		 *     EntryList
		 * EntryList:
		 *     Entry
		 *     EntryList Entry
		 * Entry:
		 *     TagField
		 *     TagField data
		 * TagField:
		 *     Tag Length
		 *     TaggedData
		 * Tag:
		 *     pattern_char_index
		 *     TAG_QUOTE_CHARS
		 * Length:
		 *     short_length
		 *     long_length
		 * TaggedData:
		 *     TAG_QUOTE_ASCII_CHAR ascii_char
		 *
		 * </blockquote>
		 *
		 * where `short_length' is an 8-bit unsigned integer between 0 and
		 * 254.  `long_length' is a sequence of an 8-bit integer 255 and a
		 * 32-bit signed integer value which is split into upper and lower
		 * 16-bit fields in two char's. `pattern_char_index' is an 8-bit
		 * integer between 0 and 18. `ascii_char' is an 7-bit ASCII
		 * character value. `data' depends on its Tag value.
		 * <p>
		 * If Length is short_length, Tag and short_length are packed in a
		 * single char, as illustrated below.
		 * <blockquote>
		 *     char[0] = (Tag << 8) | short_length;
		 * </blockquote>
		 *
		 * If Length is long_length, Tag and 255 are packed in the first
		 * char and a 32-bit integer, as illustrated below.
		 * <blockquote>
		 *     char[0] = (Tag << 8) | 255;
		 *     char[1] = (char) (long_length >>> 16);
		 *     char[2] = (char) (long_length & 0xffff);
		 * </blockquote>
		 * <p>
		 * If Tag is a pattern_char_index, its Length is the number of
		 * pattern characters. For example, if the given pattern is
		 * "yyyy", Tag is 1 and Length is 4, followed by no data.
		 * <p>
		 * If Tag is TAG_QUOTE_CHARS, its Length is the number of char's
		 * following the TagField. For example, if the given pattern is
		 * "'o''clock'", Length is 7 followed by a char sequence of
		 * <code>o&nbs;'&nbs;c&nbs;l&nbs;o&nbs;c&nbs;k</code>.
		 * <p>
		 * TAG_QUOTE_ASCII_CHAR is a special tag and has an ASCII
		 * character in place of Length. For example, if the given pattern
		 * is "'o'", the TaggedData entry is
		 * <code>((TAG_QUOTE_ASCII_CHAR&nbs;<<&nbs;8)&nbs;|&nbs;'o')</code>.
		 *
		 */
		private function compilePattern(pattern:String):Vector.<uint> 
		{
			var length:int = pattern.length;
			var inQuote:Boolean = false;
			var compiledCode:Vector.<uint> = new Vector.<uint>;
			var tmpBuffer:Vector.<uint> = null;
			var count:int = 0, tagcount:int = 0;
			var lastTag:int = -1, prevTag:int = -1;
			
			for (var i:int = 0; i < length; i++) {
				var c:String = pattern.charAt(i);
				
				if (c == "'") {
					// '' is treated as a single quote regardless of being
					// in a quoted section.
					if ((i + 1) < length) {
						c = pattern.charAt(i + 1);
						if (c == "'") {
							i++;
							if (count != 0) {
								encode(lastTag, count, compiledCode);
								tagcount++;
								prevTag = lastTag;
								lastTag = -1;
								count = 0;
							}
							if (inQuote) {
								tmpBuffer.push(c.charCodeAt(0));
							} else {
								compiledCode.push((TAG_QUOTE_ASCII_CHAR << 8 | c.charCodeAt(0)));
							}
							continue;
						}
					}
					if (!inQuote) {
						if (count != 0) {
							encode(lastTag, count, compiledCode);
							tagcount++;
							prevTag = lastTag;
							lastTag = -1;
							count = 0;
						}
						tmpBuffer = new Vector.<uint>;
						inQuote = true;
					} else {
						var len:int = tmpBuffer.length;
						if (len == 1) {
							var ch:uint = tmpBuffer[0];
							if (ch < 128) {
								compiledCode.push(TAG_QUOTE_ASCII_CHAR << 8 | ch);
							} else {
								compiledCode.push(TAG_QUOTE_CHARS << 8 | 1);
								compiledCode.push(ch);
							}
						} else {
							encode(TAG_QUOTE_CHARS, len, compiledCode);
							compiledCode = compiledCode.concat(tmpBuffer);//compiledCode.append(tmpBuffer);
						}
						inQuote = false;
					}
					continue;
				}
				if (inQuote) {
					tmpBuffer.push(c.charCodeAt(0));
					continue;
				}
				if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z')) {
					if (count != 0) {
						encode(lastTag, count, compiledCode);
						tagcount++;
						prevTag = lastTag;
						lastTag = -1;
						count = 0;
					}
					if (c.charCodeAt(0) < 128) {
						// In most cases, c would be a delimiter, such as ':'.
						compiledCode.push(TAG_QUOTE_ASCII_CHAR << 8 | c.charCodeAt(0));
					} else {
						// Take any contiguous non-ASCII alphabet characters and
						// put them in a single TAG_QUOTE_CHARS.
						var j:int;
						for (j = i + 1; j < length; j++) {
							var d:String = pattern.charAt(j);
							if (d == "'" || (d >= 'a' && d <= 'z' || d >= 'A' && d <= 'Z')) {
								break;
							}
						}
						compiledCode.push(TAG_QUOTE_CHARS << 8 | (j - i));
						for (; i < j; i++) {
							compiledCode.push(pattern.charCodeAt(i));
						}
						i--;
					}
					continue;
				}
				
				var tag:int;
				if ((tag = DateFormatSymbols.patternChars.indexOf(c)) == -1) {
					throw new Error("Illegal pattern character " +
						"'" + c + "'");
				}
				if (lastTag == -1 || lastTag == tag) {
					lastTag = tag;
					count++;
					continue;
				}
				encode(lastTag, count, compiledCode);
				tagcount++;
				prevTag = lastTag;
				lastTag = tag;
				count = 1;
			}
			
			if (inQuote) {
				throw new Error("Unterminated quote");
			}
			
			if (count != 0) {
				encode(lastTag, count, compiledCode);
				tagcount++;
				prevTag = lastTag;
			}
			
			forceStandaloneForm = (tagcount == 1 && prevTag == Consts.PATTERN_MONTH);
			
			// Copy the compiled pattern to a char array
			//var len:String = compiledCode.length;
			//char[] r = new char[len];
			//compiledCode.getChars(0, len, r, 0);
			//return r;
			return compiledCode;
		}

		/**
		 * Encodes the given tag and length and puts encoded char(s) into buffer.
		 */
		private static function encode(tag:int, length:int, buffer:Vector.<uint>):void {
			if (tag == Consts.PATTERN_ISO_ZONE && length >= 4) {
				throw new Error("invalid ISO 8601 format: length=" + length);
			}
			if (length < 255) {
				buffer.push(tag << 8 | length);
			} else {
				buffer.push((tag << 8) | 0xff);
				buffer.push(length >>> 16);
				buffer.push(length & 0xffff);
			}
		}
		
		private static function parseNumber(s:String, pos:ParsePosition):Number
		{
			for (var i:int = pos.index; i <= s.length; i++)
			{
				if(i == s.length || !net.fproject.utils.StringUtil.isDigit(s.charCodeAt(i)))
				{
					if(i > pos.index)
					{
						var start:int = pos.index;
						pos.index = i;
						return Number(s.substring(start, i));
					}
					break;
				}
			}
			return NaN;
		}
		
		/**
		 * Private member function that converts the parsed date strings into
		 * timeFields. Returns -start (for ParsePosition) if failed.
		 * @param text the time text to be parsed.
		 * @param start where to start parsing.
		 * @param patternCharIndex the index of the pattern character.
		 * @param count the count of a pattern character.
		 * @param obeyCount if true, then the next field directly abuts this one,
		 * and we should use the count to know when to stop parsing.
		 * @param ambiguousYear return parameter; upon return, if ambiguousYear[0]
		 * is true, then a two-digit year was parsed and may need to be readjusted.
		 * @param origPos origPos.errorIndex is used to return an error index
		 * at which a parse error occurred, if matching failure occurs.
		 * @return the new start position if matching succeeded; -1 indicating
		 * matching failure, otherwise. In case matching failure occurred,
		 * an error index is set to origPos.errorIndex.
		 */
		private function subParse(text:String, start:int, patternCharIndex:int, count:int,
								  obeyCount:Boolean, ambiguousYear:Array, origPos:ParsePosition,
								  useFollowingMinusSignAsDelimiter:Boolean, builder:DateBuilder) : int
		{
			var number:Number;
			var value:int = 0;
			var pos:ParsePosition = new ParsePosition(0);
			pos.index = start;
			var field:int = PATTERN_INDEX_TO_CALENDAR_FIELD[patternCharIndex];
			
			// If there are any spaces here, skip over them.  If we hit the end
			// of the string, then fail.
			for (;;) {
				if (pos.index >= text.length) {
					origPos.errorIndex = start;
					return -1;
				}
				var c:String = text.charAt(pos.index);
				if (c != ' ' && c != "\t") {
					break;
				}
				++pos.index;
			}
			// Remember the actual start index
			var actualStart:int = pos.index;
			
			parsing:
			{
				// We handle a few special cases here where we need to parse
				// a number value.  We handle further, more generic cases below.  We need
				// to handle some of them here because some fields require extra processing on
				// the parsed value.
				if (patternCharIndex == Consts.PATTERN_HOUR_OF_DAY1 ||
					patternCharIndex == Consts.PATTERN_HOUR1 ||
					(patternCharIndex == Consts.PATTERN_MONTH && count <= 2) ||
					patternCharIndex == Consts.PATTERN_YEAR ||
					patternCharIndex == Consts.PATTERN_WEEK_YEAR) {
					// It would be good to unify this with the obeyCount logic below,
					// but that's going to be difficult.
					if (obeyCount) {
						if ((start+count) > text.length) {
							break parsing;
						}
						//number = numberFormat.parse(text.substring(0, start+count), pos);
						number = parseNumber(text.substring(0, start+count), pos);
					} else {
						number = parseNumber(text, pos);
					}
					if (isNaN(number)) {
						break parsing;
					} else {
						value = int(number);
						
						if (useFollowingMinusSignAsDelimiter && (value < 0) &&
							(((pos.index < text.length) &&
								(text.charAt(pos.index) != minusSign)) ||
								((pos.index == text.length) &&
									(text.charAt(pos.index-1) == minusSign)))) {
							value = -value;
							pos.index--;
						}
					}
				}
				
				var index:int;
				switch (patternCharIndex) {
					case Consts.PATTERN_WEEK_YEAR: // 'Y'
					case Consts.PATTERN_YEAR:      // 'y'
						
						// If there are 3 or more YEAR pattern characters, this indicates
						// that the year value is to be treated literally, without any
						// two-digit year adjustments (e.g., from "01" to 2001).  Otherwise
						// we made adjustments to place the 2-digit year in the proper
						// century, for parsed strings from "00" to "99".  Any other string
						// is treated literally:  "2250", "-1", "1", "002".
						if (count <= 2 && (pos.index - actualStart) == 2
							&& net.fproject.utils.StringUtil.isDigit(text.charCodeAt(actualStart))
							&& net.fproject.utils.StringUtil.isDigit(text.charCodeAt(actualStart + 1))) {
							// Assume for example that the defaultCenturyStart is 6/18/1903.
							// This means that two-digit years will be forced into the range
							// 6/18/1903 to 6/17/2003.  As a result, years 00, 01, and 02
							// correspond to 2000, 2001, and 2002.  Years 04, 05, etc. correspond
							// to 1904, 1905, etc.  If the year is 03, then it is 2003 if the
							// other fields specify a date before 6/18, or 1903 if they specify a
							// date afterwards.  As a result, 03 is an ambiguous year.  All other
							// two-digit years are unambiguous.
							var ambiguousTwoDigitYear:int = Consts.defaultCenturyStartYear % 100;
							ambiguousYear[0] = value == ambiguousTwoDigitYear;
							value += int(Consts.defaultCenturyStartYear/100)*100 +
								(value < ambiguousTwoDigitYear ? 100 : 0);
						}
						builder.setFieldValue(field, value);
						return pos.index;
						
					case Consts.PATTERN_MONTH: // 'M'
						if (count <= 2) // i.e., M or MM.
						{
							// Don't want to parse the month if it is a string
							// while pattern uses numeric style: M or MM.
							// [We computed 'value' above.]
							builder.setFieldValue(2, value - 1);//Calendar.MONTH
							return pos.index;
						}
						
						if (useDateFormatSymbols) {
							// count >= 3 // i.e., MMM or MMMM
							// Want to be able to parse both short and long forms.
							// Try count == 4 first:
							var newStart:int;
							if ((newStart = matchString(text, start, 2,// 2: Calendar.MONTH
								formatData.months, builder)) > 0) {
								return newStart;
							}
							// count == 4 failed, now try count == 3
							if ((index = matchString(text, start, 2,// 2: Calendar.MONTH
								formatData.shortMonths, builder)) > 0) {
								return index;
							}
						} else {
							/*Map<String, Integer>*/var map:Object = getDisplayNamesMap(field);
							if ((index = matchString(text, start, field, map, builder)) > 0) {
								return index;
							}
						}
						break parsing;
					
					case Consts.PATTERN_HOUR_OF_DAY1: // 'k' 1-based.  eg, 23:59 + 1 hour =>> 24:59
						if (!isLenient) {
							// Validate the hour value in non-lenient
							if (value < 1 || value > 24) {
								break parsing;
							}
						}
						// [We computed 'value' above.]
						if (value == 24) {//24:calendar.getMaximum(Calendar.HOUR_OF_DAY) + 1)
							value = 0;
						}
						builder.setFieldValue(11, value);//11:Calendar.HOUR_OF_DAY
						return pos.index;
						
					case Consts.PATTERN_DAY_OF_WEEK:  // 'E'
					{
						if (useDateFormatSymbols) {
							// Want to be able to parse both short and long forms.
							// Try count == 4 (DDDD) first:
							if ((newStart=matchString(text, start, 7,//7: Calendar.DAY_OF_WEEK
								formatData.weekdays, builder)) > 0) {
								return newStart;
							}
							// DDDD failed, now try DDD
							if ((index = matchString(text, start, 7,//7: Calendar.DAY_OF_WEEK
								formatData.shortWeekdays, builder)) > 0) {
								return index;
							}
						} else {
							var styles:Array = [ 2, 1 ];//2: Calendar.LONG, 1: Calendar.SHORT
							for each(var style:int in styles) {
								map = getDisplayNames(field, style);
								if ((index = matchString(text, start, field, map, builder)) > 0) {
									return index;
								}
							}
						}
					}
						
						break parsing;
					
					case Consts.PATTERN_AM_PM:    // 'a'
						if (useDateFormatSymbols) {
							if ((index = matchString(text, start, 9,//9: Calendar.AM_PM
								formatData.ampms, builder)) > 0) {
								return index;
							}
						} else {
							map = getDisplayNamesMap(field);
							if ((index = matchString(text, start, field, map, builder)) > 0) {
								return index;
							}
						}
						break parsing;
					
					case Consts.PATTERN_HOUR1: // 'h' 1-based.  eg, 11PM + 1 hour =>> 12 AM
						if (!isLenient) {
							// Validate the hour value in non-lenient
							if (value < 1 || value > 12) {
								break parsing;
							}
						}
						// [We computed 'value' above.]
						if (value == 12) {//12: calendar.getLeastMaximum(Calendar.HOUR) + 1
							value = 0;
						}
						builder.setFieldValue(10, value);//10:Calendar.HOUR
						return pos.index;
						
					case Consts.PATTERN_ZONE_NAME:  // 'z'
					case Consts.PATTERN_ZONE_VALUE: // 'Z'
					{
						var sign:int = 0;
						try {
							c = text.charAt(pos.index);
							if (c == '+') {
								sign = 1;
							} else if (c == '-') {
								sign = -1;
							}
							if (sign == 0) {
								// Try parsing a custom time zone "GMT+hh:mm" or "GMT".
								if ((c == 'G' || c == 'g')
									&& (text.length - start) >= 3
									&& text.substr(start,3).toUpperCase() == "GMT") {
									pos.index = start + 3;
									
									if ((text.length - pos.index) > 0) {
										c = text.charAt(pos.index);
										if (c == '+') {
											sign = 1;
										} else if (c == '-') {
											sign = -1;
										}
									}
									
									if (sign == 0) {    /* "GMT" without offset */
										builder.setFieldValue(15, 0)//15: Calendar.ZONE_OFFSET
											.setFieldValue(16, 0);//16: Calendar.DST_OFFSET
										return pos.index;
									}
									
									// Parse the rest as "hh:mm"
									var i:int = subParseNumericZone(text, ++pos.index,
										sign, 0, true, builder);
									if (i > 0) {
										return i;
									}
									pos.index = -i;
								} else {
									// Try parsing the text as a time zone
									// name or abbreviation.
									i = subParseZoneString(text, pos.index, builder);
									if (i > 0) {
										return i;
									}
									pos.index = -i;
								}
							} else {
								// Parse the rest as "hhmm" (RFC 822)
								i = subParseNumericZone(text, ++pos.index,
									sign, 0, false, builder);
								if (i > 0) {
									return i;
								}
								pos.index = -i;
							}
						} catch (e:Error) {
						}
					}
						break parsing;
					
					case Consts.PATTERN_ISO_ZONE:   // 'X'
					{
						if ((text.length - pos.index) <= 0) {
							break parsing;
						}
						
						sign = 0;
						c = text.charAt(pos.index);
						if (c == 'Z') {
							builder.setFieldValue(15, 0).setFieldValue(16, 0);//15: Calendar.ZONE_OFFSET, 16: Calendar.DST_OFFSET
							return ++pos.index;
						}
						
						// parse text as "+/-hh[[:]mm]" based on count
						if (c == '+') {
							sign = 1;
						} else if (c == '-') {
							sign = -1;
						} else {
							++pos.index;
							break parsing;
						}
						i = subParseNumericZone(text, ++pos.index, sign, count,
							count == 3, builder);
						if (i > 0) {
							return i;
						}
						pos.index = -i;
					}
						break parsing;
					
					default:
						// case PATTERN_DAY_OF_MONTH:         // 'd'
						// case PATTERN_HOUR_OF_DAY0:         // 'H' 0-based.  eg, 23:59 + 1 hour =>> 00:59
						// case PATTERN_MINUTE:               // 'm'
						// case PATTERN_SECOND:               // 's'
						// case PATTERN_MILLISECOND:          // 'S'
						// case PATTERN_DAY_OF_YEAR:          // 'D'
						// case PATTERN_DAY_OF_WEEK_IN_MONTH: // 'F'
						// case PATTERN_WEEK_OF_YEAR:         // 'w'
						// case PATTERN_WEEK_OF_MONTH:        // 'W'
						// case PATTERN_HOUR0:                // 'K' 0-based.  eg, 11PM + 1 hour =>> 0 AM
						// case PATTERN_ISO_DAY_OF_WEEK:      // 'u' (pseudo field);
						
						// Handle "generic" fields
						if (obeyCount) {
							if ((start+count) > text.length) {
								break parsing;
							}
							number = parseNumber(text.substring(0, start+count), pos);
						} else {
							number = parseNumber(text, pos);
						}
						if (!isNaN(number)) {
							value = int(number);
							
							if (useFollowingMinusSignAsDelimiter && (value < 0) &&
								(((pos.index < text.length) &&
									(text.charAt(pos.index) != minusSign)) ||
									((pos.index == text.length) &&
										(text.charAt(pos.index-1) == minusSign)))) {
								value = -value;
								pos.index--;
							}
							
							builder.setFieldValue(field, value);
							return pos.index;
						}
						break parsing;
				}
			}
			
			// Parsing failed.
			origPos.errorIndex = pos.index;
			return -1;
		}
	}
	
}
import net.fproject.core.TimeUnit;

class ParsePosition {
	/**
	 * Input: the place you start parsing.
	 * <br>Output: position where the parse stopped.
	 * This is designed to be used serially,
	 * with each call setting index up for the next one.
	 */
	public var index:int;
	public var errorIndex:int;
	
	public function ParsePosition(index:int) 
	{
		this.index = index;
		this.errorIndex = -1;
	}
	
	public function equals(obj:ParsePosition):Boolean
	{
		if (obj == null) return false;
		return (index == obj.index && errorIndex == obj.errorIndex);
	}
}

class DateBuilder {
	private static const MAX_FIELD:int = 18;//FIELD_COUNT + 1
	
	public static const WEEK_YEAR:int = 17;//FIELD_COUNT
	public static const ISO_DAY_OF_WEEK:int = 1000; // pseudo field index
	
	// stamp[] (lower half) and field[] (upper half) combined
	private var field:Vector.<int>;
	private var nextStamp:int;
	private var maxFieldIndex:int;
	
	public function DateBuilder() {
		field = new Vector.<int>(MAX_FIELD * 2);
		nextStamp = 2;//2: MINIMUM_USER_STAMP
		maxFieldIndex = -1;
	}
	
	public function setFieldValue(index:int, value:int):DateBuilder {
		if (index == ISO_DAY_OF_WEEK) {
			index = 7;//DAY_OF_WEEK
			value = toCalendarDayOfWeek(value);
		}
		field[index] = nextStamp++;
		field[MAX_FIELD + index] = value;
		if (index > maxFieldIndex && index < 17) {//17: FIELD_COUNT
			maxFieldIndex = index;
		}
		return this;
	}
	
	public function addYear(value:int):DateBuilder {
		field[MAX_FIELD + 1] += value;//1: YEAR
		field[MAX_FIELD + WEEK_YEAR] += value;
		return this;
	}
	
	public function isSet(index:int):Boolean {
		if (index == ISO_DAY_OF_WEEK) {
			index = 7;//DAY_OF_WEEK;
		}
		return field[index] > 0;//0: UNSET
	}
	
	public function clear(index:int):DateBuilder {
		if (index == ISO_DAY_OF_WEEK) {
			index = 7;//DAY_OF_WEEK;
		}
		field[index] = 0;//0: UNSET
		field[MAX_FIELD + index] = 0;
		return this;
	}
	
	public function getDate():Date
	{
		var y:int = field[MAX_FIELD + 1];//1: YEAR
		var mo:int = field[MAX_FIELD + 2];//2: MONTH
		var d:int = field[MAX_FIELD + 5];//5: DAY_OF_MONTH
		var h:int = field[MAX_FIELD + 10];//10: HOUR
		var mi:int = field[MAX_FIELD + 12];//12: MINUTE
		var s:int = field[MAX_FIELD + 13];//13: SECOND
		var ms:int = field[MAX_FIELD + 14];//14: MILLISECOND
		return new Date(y, mo, d, h, mi, s, ms);
	}
	
	private static function toCalendarDayOfWeek(isoDayOfWeek:int):int {
		if (isoDayOfWeek < 0 || isoDayOfWeek > 7) {
			// adjust later for lenient mode
			return isoDayOfWeek;
		}
		return isoDayOfWeek == 7 ? 1 : isoDayOfWeek + 1;
	}
}

class Consts {
	public static const PATTERN_ERA:int                  =  0; // G
	public static const PATTERN_YEAR:int                 =  1; // y
	public static const PATTERN_MONTH:int                =  2; // M
	public static const PATTERN_DAY_OF_MONTH:int         =  3; // d
	public static const PATTERN_HOUR_OF_DAY1:int         =  4; // k
	public static const PATTERN_HOUR_OF_DAY0:int         =  5; // H
	public static const PATTERN_MINUTE:int               =  6; // m
	public static const PATTERN_SECOND:int               =  7; // s
	public static const PATTERN_MILLISECOND:int          =  8; // S
	public static const PATTERN_DAY_OF_WEEK:int          =  9; // E
	public static const PATTERN_DAY_OF_YEAR:int          = 10; // D
	public static const PATTERN_DAY_OF_WEEK_IN_MONTH:int = 11; // F
	public static const PATTERN_WEEK_OF_YEAR:int         = 12; // w
	public static const PATTERN_WEEK_OF_MONTH:int        = 13; // W
	public static const PATTERN_AM_PM:int                = 14; // a
	public static const PATTERN_HOUR1:int                = 15; // h
	public static const PATTERN_HOUR0:int                = 16; // K
	public static const PATTERN_ZONE_NAME:int            = 17; // z
	public static const PATTERN_ZONE_VALUE:int           = 18; // Z
	public static const PATTERN_WEEK_YEAR:int            = 19; // Y
	public static const PATTERN_ISO_DAY_OF_WEEK:int      = 20; // u
	public static const PATTERN_ISO_ZONE:int             = 21; // X
	public static const PATTERN_MONTH_STANDALONE:int     = 22; // L
	
	public static const defaultCenturyStart:Date = getDefaultCenturyStart();
	public static const defaultCenturyStartYear:int = getDefaultCenturyStart().fullYear;
	
	private static function getDefaultCenturyStart():Date
	{
		if(defaultCenturyStart != null)
			return defaultCenturyStart;
		var d:Date = new Date;
		d.setTime(d.getTime() - TimeUnit.YEAR.milliseconds * 80);
		return d;
	}
}

class DateFormatSymbols {
	/**
	 * Era strings. For example: "AD" and "BC".  An array of 2 strings,
	 * indexed by <code>Calendar.BC</code> and <code>Calendar.AD</code>.
	 */
	//public var eras:Vector.<String> = null;
	
	/**
	 * Month strings. For example: "January", "February", etc.  An array
	 * of 13 strings (some calendars have 13 months), indexed by
	 * <code>Calendar.JANUARY</code>, <code>Calendar.FEBRUARY</code>, etc.
	 */
	public var months:Vector.<String> = null;
	
	/**
	 * Short month strings. For example: "Jan", "Feb", etc.  An array of
	 * 13 strings (some calendars have 13 months), indexed by
	 * <code>Calendar.JANUARY</code>, <code>Calendar.FEBRUARY</code>, etc.
	 */
	public var shortMonths:Vector.<String> = null;
	
	/**
	 * Weekday strings. For example: "Sunday", "Monday", etc.  An array
	 * of 8 strings, indexed by <code>Calendar.SUNDAY</code>,
	 * <code>Calendar.MONDAY</code>, etc.
	 * The element <code>weekdays[0]</code> is ignored.
	 */
	public var weekdays:Vector.<String> = null;
	
	/**
	 * Short weekday strings. For example: "Sun", "Mon", etc.  An array
	 * of 8 strings, indexed by <code>Calendar.SUNDAY</code>,
	 * <code>Calendar.MONDAY</code>, etc.
	 * The element <code>shortWeekdays[0]</code> is ignored.
	 */
	public var shortWeekdays:Vector.<String> = null;
	
	/**
	 * AM and PM strings. For example: "AM" and "PM".  An array of
	 * 2 strings, indexed by <code>Calendar.AM</code> and
	 * <code>Calendar.PM</code>.
	 */
	public var ampms:Vector.<String> = null;
	
	/**
	 * Localized names of time zones in this locale.  This is a
	 * two-dimensional array of strings of size <em>n</em> by <em>m</em>,
	 * where <em>m</em> is at least 5.  Each of the <em>n</em> rows is an
	 * entry containing the localized names for a single <code>TimeZone</code>.
	 * Each such row contains (with <code>i</code> ranging from
	 * 0..<em>n</em>-1):
	 * <ul>
	 * <li><code>zoneStrings[i][0]</code> - time zone ID</li>
	 * <li><code>zoneStrings[i][1]</code> - long name of zone in standard
	 * time</li>
	 * <li><code>zoneStrings[i][2]</code> - short name of zone in
	 * standard time</li>
	 * <li><code>zoneStrings[i][3]</code> - long name of zone in daylight
	 * saving time</li>
	 * <li><code>zoneStrings[i][4]</code> - short name of zone in daylight
	 * saving time</li>
	 * </ul>
	 */
	public var zoneStrings:Array = null;
	
	/**
	 * Unlocalized date-time pattern characters. For example: 'y', 'd', etc.
	 * All locales use the same these unlocalized pattern characters.
	 */
	public static const patternChars:String = "GyMdkHmsSEDFwWahKzZYuXL";
}