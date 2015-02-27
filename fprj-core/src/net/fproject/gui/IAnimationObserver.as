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
	 * <p>
	 * The <code>IAnimationObserver</code> interface defines the interface for objects that want to observe the 
	 * start and end of an animation. 
	 * This interface for example can allow a renderer to configure itself before and after a given animation. 
	 * The renderer can for example hide some of its children, or render in a different way, 
	 * to make rendering lighter in order to smooth an animation action that just started.
	 * </p><p>
	 * This class is designed using <i>Action Observer design pattern</i>.
	 * </p>
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */	
    public interface IAnimationObserver
    {

        public function IAnimationObserver();

		/**
		 * Method that is called when an animation has started. 
		 * @param value An optional string describing the performed animation.
		 * 
		 */
        function startAnimation(value:String) : void;

		/**
		 * Method that is called when an animation has ended. 
		 * @param value An optional string describing the performed animation.
		 * 
		 */
        function endAnimation(value:String) : void;

    }
}
