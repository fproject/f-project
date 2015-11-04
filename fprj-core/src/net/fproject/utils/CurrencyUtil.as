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
	import spark.formatters.CurrencyFormatter;

	public class CurrencyUtil
	{
		private static var _currencyFormatter:CurrencyFormatter;
		public static function get currencyFormatter():CurrencyFormatter
		{
			if(_currencyFormatter == null)
			{
				_currencyFormatter = new CurrencyFormatter;
				_currencyFormatter.leadingZero = true;
			}
			return _currencyFormatter;
		}
		
		public static function formatCurrency(value:Object):String
		{
			if(isNaN(Number(value)))
				return null;
			return currencyFormatter.format(value);
		}
		
		public static function parseCurrency(s:String):Number
		{
			if(s == null || s == '')
				return NaN;
			return currencyFormatter.parse(s).value;
		}
	}
}