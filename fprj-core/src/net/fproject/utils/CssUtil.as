///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import mx.graphics.*;
	import mx.styles.*;

	public class CssUtil
	{
		public static const DEFAULT_COLORS:Array =
			[0xE48701, 0xA5BC4E, 0x1B95D9, 0xCACA9E, 0x6693B0, 0xF05E27, 0x86D1E4,
			0xE4F9A0, 0xFFD512, 0x75B000, 0x418480, 0x0662B0, 0xCC3300, 0xD1DFE7,
			0x52D4CA, 0xC5E05D, 0xE7C174, 0xFFF797, 0xC5F68F, 0xBDF1E6, 0x9E987D,
			0xEB988D, 0x91C9E5, 0x93DC4A, 0xFFB900, 0x9EBBCD, 0x009797, 0x0DB2C2];

		public static function createSelector(selectorName:String, packageName:String =
			null, styleManager:IStyleManager2 = null):CSSStyleDeclaration
		{
			var styleDecl:CSSStyleDeclaration = null;
			if (packageName != null)
			{
				selectorName = packageName + "." + selectorName;
			}
			if (styleManager == null)
			{
				//This used for old Flex version (deprecated)
				/*styleDecl = StyleManager.getStyleDeclaration(selectorName);
				if (styleDecl == null)
				{
					styleDecl = new CSSStyleDeclaration();
					StyleManager.setStyleDeclaration(selectorName, styleDecl, false);
				}*/
				throw new Error(ResourceUtil.getString("invalidStyleManagerParameter",
					ResourceUtil.FPRJ_CORE_BUNDLE));
			}
			else
			{
				//From Flex version 4.0, we should always use IStyleManager2
				// instead of StyleManager
				styleDecl = styleManager.getStyleDeclaration(selectorName);
				if (styleDecl == null)
				{
					styleDecl = new CSSStyleDeclaration();
					styleManager.setStyleDeclaration(selectorName, styleDecl, false);
				}
			}
			return styleDecl;
		} // end function

		public static function fillFromStyle(v:Object):IFill
		{
			if (v is IFill)
			{
				return IFill(v);
			}
			if (v != null)
			{
				return IFill(new SolidColor(uint(v)));
			}
			return null;
		} // end function

	}
}
