///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	/**
	 * 
	 * Represents a node of linked list.
	 * 
	 */
    public class LinkedListNode
    {
		/**
		 * The data item dedicated to the node 
		 */
        public var value:Object;
		
		/**
		 * The next node.
		 */
        public var next:LinkedListNode;
		
		/**
		 * The previuos node.
		 */
        public var previous:LinkedListNode;

		/**
		 *
		 * Constructor
		 *  
		 * @param value
		 * 
		 */
        public function LinkedListNode(value:Object)
        {
            this.next = null;
			this.previous = null;
            this.value = value;
        }// end function
    }
}
