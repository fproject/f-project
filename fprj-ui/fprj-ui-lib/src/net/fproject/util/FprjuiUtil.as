///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2014 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.util
{
	import net.fproject.utils.ResourceUtil;
	
	public class FprjuiUtil
	{
		/**
		 * Gets the string corresponding to the specified key 
		 * in the 'fprjui.properties' resource bundle
		 * 
		 * @param key The name of a resource in the resource bundle.
		 * 
		 * @param params An Array of parameters that are
		 * substituted for the placeholders.
		 * Each parameter is converted to a String with the <code>toString()</code> method
		 * before being substituted.
		 */
		public static function getString(key:String, params:Array=null):String
		{
			return ResourceUtil.getString(key, "fprjui", params);
		}
	}
}