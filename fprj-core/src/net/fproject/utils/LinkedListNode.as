///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{

	/**
	 * 
	 * Represents a node of linked list.
	 * 
	 */
    public class LinkedListNode
    {
        public var value:Object;
        public var next:LinkedListNode;
        public var previous:LinkedListNode;

        public function LinkedListNode(value:Object)
        {
            this.next = null;
			this.previous = null;
            this.value = value;
        }// end function
    }
}
