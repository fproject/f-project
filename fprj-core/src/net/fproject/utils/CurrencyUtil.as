///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
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