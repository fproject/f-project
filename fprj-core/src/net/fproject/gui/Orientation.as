///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui
{

	/**
	 * 
	 * Orientation constants
	 * 
	 */
    final public class Orientation
    {
        public static const LTR:String = "ltr";
        public static const RTL:String = "rtl";
        public static const TTB:String = "ttb";
        public static const BTT:String = "btt";

        public static function isValid(orientation:String) : Boolean
        {
            return orientation == LTR || orientation == RTL || orientation == TTB || orientation == BTT;
        }// end function

        public static function isHorizontal(orientation:String) : Boolean
        {
            return orientation == LTR || orientation == RTL;
        }// end function

        public static function isVertical(orientation:String) : Boolean
        {
            return orientation == TTB || orientation == BTT;
        }// end function
    }
}
