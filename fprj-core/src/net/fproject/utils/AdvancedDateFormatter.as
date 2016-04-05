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
			if (!valueString || valueString == "")
				return null;

			var year:int = -1;
			var mon:int = -1;
			var day:int = -1;
			var hour:int = -1;
			var min:int = -1;
			var sec:int = -1;
			var ms:int = -1;
			
			var letter:String = "";
			var marker:Object = 0;

			var count:int = 0;
			var len:int = valueString.length;

			// Strip out the Timezone. It is not used by the DateFormatter
			var timezoneRegEx:RegExp = /(GMT|UTC)((\+|-)\d\d\d\d )?/ig;

			valueString = valueString.replace(timezoneRegEx, "");

			while (count < len)
			{
				letter = valueString.charAt(count);
				count++;

				// If the letter is a blank space or a comma,
				// continue to the next character
				if (letter <= " " || letter == ",")
					continue;

				// If the letter is a key punctuation character,
				// cache it for the next time around.
				if (letter == "/" || letter == ":" || letter == "+" ||
					letter == "-")
				{
					marker = letter;
					continue;
				}

				// Scan for groups of numbers and letters
				// and match them to Date parameters
				if ("a" <= letter && letter <= "z" ||
					"A" <= letter && letter <= "Z")
				{
					// Scan for groups of letters
					var word:String = letter;
					while (count < len)
					{
						letter = valueString.charAt(count);
						if (!("a" <= letter && letter <= "z" ||
							"A" <= letter && letter <= "Z"))
						{
							break;
						}
						word += letter;
						count++;
					}

					// Allow for an exact match
					// or a match to the first 3 letters as a prefix.
					var n:int = DateBase.defaultStringKey.length;
					for (var i:int = 0; i < n; i++)
					{
						var s:String = String(DateBase.defaultStringKey[i]);
						if (s.toLowerCase() == word.toLowerCase() ||
							s.toLowerCase().substr(0, 3) == word.toLowerCase())
						{
							if (i == 13)
							{
								// pm
								if (hour > 12 || hour < 1)
									break; // error
								else if (hour < 12)
									hour += 12;
							}
							else if (i == 12)
							{
								// am
								if (hour > 12 || hour < 1)
									break; // error
								else if (hour == 12)
									hour = 0;

							}
							else if (i < 12)
							{
								// month
								if (mon < 0)
									mon = i;
								else
									break; // error
							}
							break;
						}
					}
					marker = 0;
				}

				else if ("0" <= letter && letter <= "9")
				{
					// Scan for groups of digits
					var digits:String = letter;

					var midBreak:Boolean = false;

					while (count < len && "0" <= (letter = valueString.charAt(count)) &&
						letter <= "9")
					{
						if (count >= formatString.length ||
							(formatString.charAt(count - 1) != formatString.charAt(count)))
						{
							midBreak = true;
							break;
						}

						digits += letter;
						count++;
					}
					var num:int = int(digits);
					var formatLetter:String = count < formatString.length + 1 ? formatString.charAt(count - 1) : "";
					
					// If num is a number greater than 70 and current letter is not at millisecond part, assign num to year.
					if (num >= 70 && formatLetter != "b")
					{
						if (year != -1)
						{
							break; // error
						}
						else if (letter.charCodeAt(0) <= 0xA0 ||
							letter == "," || letter == "." || letter == "/" ||
							letter == "-" || count >= len)
						{
							year = num;
						}
						else
						{
							break; //error
						}
					}
					
					// If current letter is at millisecond part, assign num to ms
					else if (formatLetter == "b" && ms < 0)
					{
						ms = int(1000 * Number("0." + digits));
						break;
					}
					// If the current letter is a slash or a dash,
					// assign num to month or day.
					else if (midBreak || letter == "/" || letter == "-" ||
						letter == ".")
					{
						if (mon < 0 &&
							(formatLetter == "M" || formatLetter == ""))
							mon = num - 1;
						else if (day < 0 &&
							(formatLetter == "d" || formatLetter == ""))
							day = num;
						else if (hour < 0 &&
							(formatLetter == "h" || formatLetter == ""))
							hour = num;
						else if (min < 0 &&
							(formatLetter == "m" || formatLetter == ""))
							min = num;
						else if (sec < 0 &&
							(formatLetter == "s" || formatLetter == ""))
							sec = num;
						else if (sec < 0 &&
							(formatLetter == "b" || formatLetter == ""))
							ms = num;
						else
							break; //error
					}

					// If the current letter is a colon,
					// assign num to hour or minute.
					else if (letter == ":")
					{
						if (hour < 0)
							hour = num;
						else if (min < 0)
							min = num;
						else
							break; //error
					}

					// If hours are defined and minutes are not,
					// assign num to minutes.
					else if (hour >= 0 && min < 0)
					{
						min = num;
					}

					// If minutes are defined and seconds are not,
					// assign num to seconds.
					else if (min >= 0 && sec < 0)
					{
						sec = num;
					}

					// If day is not defined, assign num to day.
					else if (day < 0)
					{
						day = num;
					}

					// If month and day are defined and year is not,
					// assign num to year.
					else if (year < 0 && mon >= 0 && day >= 0)
					{
						year = 2000 + num;
					}

					// Otherwise, break the loop
					else
					{
						break; //error
					}

					marker = 0
				}
			}

			if (year < 0 || mon < 0 || mon > 11 || day < 1 || day > 31)
				return null; // error - needs to be a date

			// Time is set to 0 if null.
			if (ms < 0)
				ms = 0;
			if (sec < 0)
				sec = 0;
			if (min < 0)
				min = 0;
			if (hour < 0)
				hour = 0;

			// create a date object and check the validity of the input date
			// by comparing the result with input values.
			var newDate:Date = new Date(year, mon, day, hour, min, sec, ms);
			if (day != newDate.getDate() || mon != newDate.getMonth())
				return null;

			return newDate;
		}

	}
}
