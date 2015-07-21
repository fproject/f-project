///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
    import flash.utils.*;
    import net.fproject.core.LinkedList;
    import net.fproject.core.LinkedListNode;

	/**
	 * A Dictionary implementing a cache using an LRU cache-replacement algorithm.
	 * */
    public class LruCache
    {		
        private var _dictionary:Dictionary;
        private var _list:LinkedList;
        private var _size:uint;
		private static const DEFAULT_CACHE_SIZE:uint = 256;
		/**
		 * Constructs an LRUCache that holds no more than <code>size</code> nodes.
		 * @param size The cache size.
		 * 
		 */
        public function LruCache(size:uint = DEFAULT_CACHE_SIZE)
        {
            this._dictionary = new Dictionary(true);
            this._list = new LinkedList();
            this._size = size;
        }

        public function getData(key:Object) : Object
        {
            var node:LinkedListNode = this._dictionary[key] as LinkedListNode;
            if (node == null)
            {
                return null;
            }
            this._list.removeNode(node);
            this._list.appendNode(node);
            return node.value.value;
        }

        public function add(key:Object, value:Object) : void
        {
            if (this._list.count > this._size)
            {
                this._dictionary[this._list.first.value.key] = null;
                this._list.removeNode(this._list.first);
            }
            this._dictionary[key] = this._list.append({key:key, value:value});
        }

    }
}
