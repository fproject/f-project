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
	 * Selection mode constants.
	 * This class defines the item selection modes in a control.
	 * @see net.fproject.gantt.GanttSheet#selectionMode
	 */
    final public class SelectionMode
    {
		/**
		 * Do not allow item selection 
		 */
        public static const NONE:String = "none";
		
		/**
		 * Allow single selection 
		 */
        public static const SINGLE:String = "single";
		
		/**
		 * Allow multiple selection 
		 */
        public static const MULTIPLE:String = "multiple";
    }
}
