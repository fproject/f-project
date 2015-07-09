///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2013 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.collection
{
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mx.collections.ICollectionView;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.PropertyChangeEvent;

	/**
	 * 
	 * The <code>CollectionChangeManager</code> class manages the set of editing items on a 
	 * <code>ICollectionView</code> so that these sets can be retrieved after a period of time 
	 * inwhich user has made several interactions to the <code>ICollectionView</code>.
	 * 
	 * @see #getSaveItems()
	 * @see #getDeleteItems()
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class CollectionChangeManager
	{
		private static var _instance:CollectionChangeManager;
		
		/**
		 * Singleton of collection change manager.<br/>
		 * At a time, there is only one instance of <code>CollectionChangeManager</code> to be used.
		 * @return An unique instance of <code>CollectionChangeManager</code>
		 * 
		 */		
		public static function getInstance():CollectionChangeManager
		{
			if(_instance == null)
				_instance = new CollectionChangeManager();
			return _instance;
		}
		
		private var _collectionToChangeItems:Dictionary = new Dictionary(true);
		
		/**
		 * Get all saved (inserted or updated) items
		 * @param collection the collection to check.
		 * @return an array of saved items. <code>null</code> if nothing found.
		 * 
		 */
		public function getSaveItems(collection:ICollectionView):Array
		{
			if(_collectionToChangeItems[collection] !== undefined)
			{
				var items:Array = _collectionToChangeItems[collection].insertItems;
				for each (var o:Object in _collectionToChangeItems[collection].updateItems)
				{
					if(items.indexOf(o) == -1)
						items.push(o);
				}
				return items;
			}
			else
				return null;
		}
		
		/**
		 * Get all inserted items
		 * @param collection the collection to check.
		 * @return an array of inserted items. <code>null</code> if nothing found.
		 * 
		 */
		public function getInsertItems(collection:ICollectionView):Array
		{
			if(_collectionToChangeItems[collection] !== undefined)
				return _collectionToChangeItems[collection].insertItems;
			else
				return null;
		}
		
		/**
		 * Get all updated items
		 * @param collection the collection to check.
		 * @return an array of updated items. <code>null</code> if nothing found.
		 * 
		 */
		public function getUpdateItems(collection:ICollectionView):Array
		{
			if(_collectionToChangeItems[collection] !== undefined)
				return _collectionToChangeItems[collection].updateItems;
			else
				return null;
		}
		
		/**
		 * Get all deleted items
		 * @param collection the collection to check.
		 * @return an array of deleted items. <code>null</code> if nothing found.
		 * 
		 */
		public function getDeleteItems(collection:ICollectionView):Array
		{
			if(_collectionToChangeItems[collection] !== undefined)
				return _collectionToChangeItems[collection].deleteItems;
			else
				return null;
		}
		
		public function resetCollectionChange(collection:Object):void
		{
			_collectionToChangeItems[collection] = {deleteItems:[], insertItems:[], updateItems:[], paused: false};
		}
		
		/**
		 * Register a collection to change manager. After this, all change events of
		 * collection will be recorded. 
		 * @param collection the collection to start listening.
		 * 
		 */
		public function registerCollection(collection:ICollectionView):void
		{
			if(collection)
			{
				unregisterCollection(collection);
				resetCollectionChange(collection);
				collection.addEventListener(CollectionEvent.COLLECTION_CHANGE,
					collection_collectionChangeHandler, false, 0, true);
			}
		}
		
		/**
		 * Unregister a collection from this change manager. 
		 * @param collection the collection to be removed.
		 * 
		 */
		public function unregisterCollection(collection:ICollectionView):void
		{
			if(collection && _collectionToChangeItems[collection] !== undefined)
			{
				collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE, 
					collection_collectionChangeHandler);
				delete _collectionToChangeItems[collection];
			}
		}	
		
		/**
		 * Check for register a collection from this change manager. 
		 * @param collection the collection want to check.
		 * return true if the collection had registed
		 * return false if the collection hadn't registed
		 * 
		 */
		public function isRegister(collection:ICollectionView):Boolean
		{
			if(collection && _collectionToChangeItems[collection] !== undefined)
				return true;
			return false;
		}
		
		/**
		 * Temporarily stop listening to COLLECTION_CHANGE event
		 * 
		 * @see #resume()
		 * 
		 */
		public function pause(collection:ICollectionView):void
		{
			if (_collectionToChangeItems[collection]!== undefined)
				_collectionToChangeItems[collection].paused = true;
		}
		
		/**
		 * Resume listening to COLLECTION_CHANGE event
		 * 
		 * @see #pause()
		 */
		public function resume(collection:ICollectionView):void
		{
			if (_collectionToChangeItems[collection] !== undefined)
				_collectionToChangeItems[collection].paused = false;
		}
		
		private function collection_collectionChangeHandler(event:Event):void
		{
			var ce:CollectionEvent = event as CollectionEvent;
			
			if(_collectionToChangeItems[ce.currentTarget].paused)
				return;
			
			if (ce == null || _collectionToChangeItems[ce.currentTarget] == undefined)
			{
				return;
			}
			
			var items:Array;
			var propName:String;
			if (ce.kind == CollectionEventKind.ADD || ce.kind == CE_KIND_ADD_ITEM)
			{
				items = _collectionToChangeItems[ce.currentTarget].insertItems;
				propName = "insertItems";
			}
			else if (ce.kind == CollectionEventKind.UPDATE)
			{
				items = _collectionToChangeItems[ce.currentTarget].updateItems;
				propName = "updateItems";
			}
			else if (ce.kind == CollectionEventKind.REMOVE)
			{
				items = _collectionToChangeItems[ce.currentTarget].deleteItems;
				propName = "deleteItems";
			}
			else if (ce.kind == CollectionEventKind.RESET ||
				ce.kind == CollectionEventKind.REFRESH)
			{
				delete _collectionToChangeItems[ce.currentTarget];
				resetCollectionChange(ce.currentTarget);
				return;
			}
			else if (ce.kind == CollectionEventKind.REPLACE)
			{
				items = _collectionToChangeItems[ce.currentTarget].insertItems;
				var delItems:Array = _collectionToChangeItems[ce.currentTarget].deleteItems;
				for each (var item:Object in ce.items)
				{
					if(item is PropertyChangeEvent)
					{
						var oldItem:Object = PropertyChangeEvent(item).oldValue;
						var newItem:Object = PropertyChangeEvent(item).newValue;
						
						if (delItems.indexOf(oldItem) == -1)
							delItems.push(oldItem);
						
						if (items.indexOf(newItem) == -1)
						{
							if(newItem.hasOwnProperty('_isInserting'))
								newItem._isInserting = true;
							items.push(newItem);
						}
					}
					else					
					{
						if (items.indexOf(item) == -1)
							items.push(item);
					}
				}
				return;				
			}
			
			var inserting:Boolean = propName == "insertItems";
			
			for each (item in ce.items)
			{
				if(item is PropertyChangeEvent)
				{
					item = item.source;
				}
				
				if (items.indexOf(item) == -1)
				{
					if(item.hasOwnProperty('_isInserting') && inserting)
						item._isInserting = true;
					items.push(item);
				}
			}
			
			_collectionToChangeItems[ce.currentTarget][propName] = items;			
		}
		
		public static const CE_KIND_ADD_ITEM:String = "addItem";
	}
}