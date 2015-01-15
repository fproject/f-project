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
	 * Represents a doubly linked list
	 *
	 */
	public class LinkedList
	{
		private var _count:uint;
		private var _last:LinkedListNode;
		private var _first:LinkedListNode;

		/**
		 *
		 * Gets the number of nodes actually contained in the LinkedList
		 *
		 */
		public function get count():uint
		{
			return this._count;
		} // end function

		
		/**
		 * 
		 * Gets the first node of the LinkedList<br/> 
		 * Retrieving the value of this property is an O(1) operation.
		 */
		public function get first():LinkedListNode
		{
			return this._first;
		} // end function

		
		/**
		 * 
		 * Gets the last node of the LinkedList 
		 * 
		 */
		public function get last():LinkedListNode
		{
			return this._last;
		} // end function

		/**
		 * 
		 * Appends a new node containing the specified value at the end of the LinkedList 
		 * 
		 */
		public function append(value:Object):LinkedListNode
		{
			var newNode:LinkedListNode=new LinkedListNode(value);
			this.appendNode(newNode);
			return newNode;
		} // end function

		/**
		 * 
		 * Adds the specified new node at the end of the LinkedList
		 * 
		 */
		public function appendNode(node:LinkedListNode):void
		{
			if (this._first == null)
			{
				this._first=node;
			}
			else
			{
				this._last.next=node;
				node.previous=this._last;
			}
			this._last=node;

			this._count++;
		} // end function

		public function removeNode(node:LinkedListNode):void
		{
			var previousNode:LinkedListNode=node.previous;
			var nextNode:LinkedListNode=node.next;
			if (node == this._first && node == this._last)
			{
				this._last=null;
				this._first=null;
			}
			else if (node == this._first)
			{
				this._first=nextNode;
				this._first.previous=null;
			}
			else if (node == this._last)
			{
				this._last=previousNode;
				this._last.next=null;
			}
			else
			{
				nextNode.previous=previousNode;
				previousNode.next=nextNode;
			}
			node.next=null;
			node.previous=null;
			this._count--;
		} // end function
	}
}
