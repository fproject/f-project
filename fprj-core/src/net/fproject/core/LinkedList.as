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
package net.fproject.core
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
		 * Get the number of nodes actually contained in the LinkedList
		 *
		 */
		public function get count():uint
		{
			return this._count;
		} // end function

		
		/**
		 * 
		 * Get the first node of the LinkedList<br/> 
		 * Retrieving the value of this property is an O(1) operation.
		 */
		public function get first():LinkedListNode
		{
			return this._first;
		} // end function

		
		/**
		 * 
		 * Get the last node of the LinkedList 
		 * 
		 */
		public function get last():LinkedListNode
		{
			return this._last;
		} // end function

		/**
		 * 
		 * Append a new node containing the specified value at the end of the LinkedList 
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
		 * Add the specified new node at the end of the LinkedList
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

		/**
		 * 
		 * Remove the specified node from the LinkedList
		 * 
		 */
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
