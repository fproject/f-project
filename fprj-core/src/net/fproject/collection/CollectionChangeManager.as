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
package net.fproject.collection
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import mx.collections.ICollectionView;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.fproject.active.ActiveService;
	import net.fproject.event.CollectionChangeEvent;
	import net.fproject.mvc.model.IUpdatableKeyModel;
	
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
		private var _services:Dictionary = new Dictionary(true);
		private var _attributes:Dictionary = new Dictionary(true);
		private var _unregisterPending:Dictionary = new Dictionary(true);
		private var _timer:Dictionary = new Dictionary(true);
		
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
			}
			if (items == null)
				items = [];
			return items;
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
				var items:Array = _collectionToChangeItems[collection].insertItems;
			
			if (items == null)
				items = [];
			return items;
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
				var items:Array = _collectionToChangeItems[collection].updateItems;
			if (items == null)
				items = [];
			return items;
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
				var items:Array = _collectionToChangeItems[collection].deleteItems;
			if (items == null)
				items = [];
			return items;
		}
		
		/**
		 * Check if have the data change on an collection
		 * @param collection the collection to check.
		 * @return true if have data change, false in otherwise
		 * 
		 */
		public function haveChanges(collection:ICollectionView):Boolean
		{
			if(_collectionToChangeItems[collection] === undefined)
				return false;
			return (getInsertItems(collection).length > 0 || getUpdateItems(collection).length > 0 || getDeleteItems(collection).length > 0);
		}
		
		/**
		 * Reset changes history of a collection to the initial value
		 * @param collection the collection want to reset
		 * 
		 */
		public function resetCollectionChange(collection:Object):void
		{
			_collectionToChangeItems[collection] = {deleteItems:[], insertItems:[], updateItems:[], paused: 0};
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
				delete _unregisterPending[collection];
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
				if (isAutoSaveEnabled(collection))
				{
					Timer(_timer[collection]).removeEventListener(TimerEvent.TIMER, onTimerComplete);
					if (haveChanges(collection))
					{
						_unregisterPending[collection] = true;
						return;
					}
					disableSaveAutomation(collection);
				}
				
				collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE, 
					collection_collectionChangeHandler);
				delete _collectionToChangeItems[collection];
			}
		}	
		
		private function onTimerComplete(event:TimerEvent):void
		{
			var timer:Timer = event.currentTarget as Timer;
			var collection:ICollectionView;
			for (var key:Object in _timer){
				if (_timer[key] == timer)
				{
					collection = key as ICollectionView;
					break;
				}
			}
			if (collection == null)
				return;
			if (isAutoSaveEnabled(collection))
			{
				save(collection);
			}
			
			event.stopImmediatePropagation();
			Timer(event.currentTarget).stop();
		}
		
		
		/**
		 * Check if the collection has been enable the save automation features
		 * @param collection the collection to check.
		 * @return true the features has enable, false in otherwise
		 * 
		 */
		public function isAutoSaveEnabled(collection:ICollectionView):Boolean
		{
			return 	_services[collection] !== undefined;
		}
		
		/**
		 * Enable the save automation features
		 * @param collection the collection to enable save automation features
		 * @param service the service use to save data
		 * @param attributes the array attributes of data will be save.
		 * attributes = null to save all attributes
		 * 
		 */
		public function enableAutoSave(collection:ICollectionView, service:ActiveService, attributes:Array=null, delayTime:int = 400):void
		{
			if (!isRegistered(collection))
				registerCollection(collection);
			
			if (_timer[collection])
				Timer(_timer[collection]).removeEventListener(TimerEvent.TIMER, onTimerComplete);
			_timer[collection] = new Timer(delayTime);
			Timer(_timer[collection]).addEventListener(TimerEvent.TIMER, onTimerComplete);
			
			_services[collection] = service;
			_attributes[collection] = attributes;
		}
		
		/**
		 * Disable save automation features'
		 * @param collection the collection to Disable save automation features
		 * 
		 */
		public function disableSaveAutomation(collection:ICollectionView):void
		{
			delete _services[collection];
			delete _attributes[collection];
		}
		
		/**
		 * Check for register a collection from this change manager. 
		 * @param collection the collection want to check.
		 * return true if the collection had registed
		 * return false if the collection hadn't registed
		 * 
		 */
		public function isRegistered(collection:ICollectionView):Boolean
		{
			return collection != null && _collectionToChangeItems[collection] !== undefined;
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
				_collectionToChangeItems[collection].paused++;
		}
		
		/**
		 * Resume listening to COLLECTION_CHANGE event
		 * 
		 * @see #pause()
		 */
		public function resume(collection:ICollectionView):void
		{
			if (_collectionToChangeItems[collection] !== undefined)
				_collectionToChangeItems[collection].paused = _collectionToChangeItems[collection].paused > 0 ? _collectionToChangeItems[collection].paused - 1 : 0;
		}
		
		/**
		 * Insert new values to insertItems array
		 * @param items the list item want to add to insertItems array.
		 * @param collection the collection have data inserrt. 
		 * Use as the key on Dictionary to find insertItems array
		 * 
		 */
		private function insertItems(items:Array, collection:Object):void
		{
			var deletedItems:Array = _collectionToChangeItems[collection].deleteItems;
			var insertedItems:Array = _collectionToChangeItems[collection].insertItems;
			var updatedItems:Array = _collectionToChangeItems[collection].updateItems;
			var deletedItemCollection:AdvancedArrayCollection = new AdvancedArrayCollection;
			deletedItemCollection.source = deletedItems;
			
			for each (var item:Object in items)
			{
				if(item is PropertyChangeEvent)
					item = item.source;
				
				var index:int = deletedItemCollection.getItemIndex(item);
				if (index != -1)
				{
					var oldItem:Object = deletedItemCollection.getItemAt(index);
					if (oldItem is IUpdatableKeyModel && item is IUpdatableKeyModel)
						IUpdatableKeyModel(item).oldKey = IUpdatableKeyModel(oldItem).oldKey;
					deletedItemCollection.removeItemAt(index);
					updatedItems.push(item);
				}
				else if (insertedItems.indexOf(item) == -1)
					insertedItems.push(item);
			}
		}
		
		/**
		 * Insert new values to updateItems array
		 * @param items the list item want to add to updateItems array.
		 * @param collection the collection have data update. 
		 * Use as the key on Dictionary to find updateItems array
		 * 
		 */
		private function updateItems(items:Array, collection:Object):void
		{
			var insertedItems:Array = _collectionToChangeItems[collection].insertItems;
			var updatedItems:Array = _collectionToChangeItems[collection].updateItems;
			
			for each (var item:Object in items)
			{
				if(item is PropertyChangeEvent)
					item = item.source;
				
				if (insertedItems.indexOf(item) == -1 && updatedItems.indexOf(item) == -1)
					updatedItems.push(item);
			}
		}
		
		/**
		 * Insert new values to deleteItems array
		 * @param items the list item want to add to deleteItems array.
		 * @param collection the collection have data update. 
		 * Use as the key on Dictionary to find deleteItems array
		 * 
		 */
		private function deleteItems(items:Array, collection:Object):void
		{
			var deletedItems:Array = _collectionToChangeItems[collection].deleteItems;
			var insertedItems:Array = _collectionToChangeItems[collection].insertItems;
			var updatedItems:Array = _collectionToChangeItems[collection].updateItems;
			
			for each (var item:Object in items)
			{
				if(item is PropertyChangeEvent)
					item = item.source;
				
				var indexInUpdatedItems:int = updatedItems.indexOf(item); 
				if (indexInUpdatedItems != -1)
				{
					updatedItems.splice(indexInUpdatedItems,1);
				}
					
				var indexInInsertedItems:int = insertedItems.indexOf(item); 
				if (indexInInsertedItems != -1)
				{
					insertedItems.splice(indexInInsertedItems,1);
				}
				else
				{
					deletedItems.push(item);
				}
			}
		}
		
		private static var _savingCollection:Dictionary = new Dictionary(true);
		private function isSaving(collection:Object):Boolean
		{
			return _savingCollection[collection] !== undefined;
		}
		
		private function markCollectionSaving(collection:Object):void
		{
			_savingCollection[collection] = (_savingCollection[collection] === undefined) ? 1:_savingCollection[collection]++;
		}
		
		private function unmarkCollectionSaving(collection:Object):void
		{
			if (_savingCollection[collection] !== undefined && _savingCollection[collection] > 1)
				_savingCollection[collection]--;
			else
				delete _savingCollection[collection];
		}
		
		private static var _savingData:Dictionary = new Dictionary(true);
		
		/**
		 * Save data to server
		 * @param collection the collection have data changes. 
		 * Use as the key on Dictionary to find data use to save
		 * 
		 */
		private function save(collection:Object):void
		{
			//Nếu đang lưu dữ liệu trên chính collection này thì sẽ đợi đến khi nào lưu xong mới tiếp tục lưu
			if (isSaving(collection))
				return;
			if (!haveChanges(collection as ICollectionView))
			{
				if (_unregisterPending[collection])
				{
					unregisterCollection(collection as ICollectionView);
				}
				return;
			}
			
			var saveItems:Array = getSaveItems(collection as ICollectionView);
			var deleteItems:Array = getDeleteItems(collection as ICollectionView);
			resetCollectionChange(collection as ICollectionView);
			var service:ActiveService = _services[collection];
			
			if (saveItems.length > 0)
			{
				markCollectionSaving(collection);
				
				var r:CallResponder = service.batchSave(saveItems,null,null,_attributes[collection]);
				_savingData[r] = saveItems;
				r.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void
				{
					dispatchEventAfterSave(SAVE_TYPE,e,collection);
					Timer(_timer[collection]).reset();
					Timer(_timer[collection]).start();
					//save(collection);
				});
				
				r.addEventListener(FaultEvent.FAULT, function(e:FaultEvent):void
				{
					dispatchEventAfterSave(SAVE_TYPE,e,collection);
					Timer(_timer[collection]).reset();
					Timer(_timer[collection]).start();
					//save(collection);
				});
			}
			
			if (deleteItems.length > 0)
			{
				service.batchRemove(deleteItems);
				
				markCollectionSaving(collection);
				
				r = service.batchSave(saveItems,null,null,_attributes[collection]);
				_savingData[r] = deleteItems;
				r.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void
				{
					dispatchEventAfterSave(DELETE_TYPE,e,collection);
					Timer(_timer[collection]).reset();
					Timer(_timer[collection]).start();
					//save(collection);
				});
				
				r.addEventListener(FaultEvent.FAULT, function(e:FaultEvent):void
				{
					dispatchEventAfterSave(DELETE_TYPE,e,collection);
					Timer(_timer[collection]).reset();
					Timer(_timer[collection]).start();
					//save(collection);
				});
			}
			
			return;
		}
		
		private function dispatchEventAfterSave(requestType:String, event:Event, collection:Object):void
		{
			var items:Array = _savingData[event.target];
			delete _savingData[event.target];
			unmarkCollectionSaving(collection);
			
			if (requestType == DELETE_TYPE)
			{
				if (event is ResultEvent)
					ICollectionView(collection).dispatchEvent(new CollectionChangeEvent(CollectionChangeEvent.DELETE_COMPLETE,ResultEvent(event).result,items));
				else if (event is FaultEvent)
					ICollectionView(collection).dispatchEvent(new CollectionChangeEvent(CollectionChangeEvent.DELETE_FAULT,FaultEvent(event).fault,items));
			}
			else if (requestType == SAVE_TYPE)
			{
				if (event is ResultEvent)
					ICollectionView(collection).dispatchEvent(new CollectionChangeEvent(CollectionChangeEvent.SAVE_COMPLETE,ResultEvent(event).result,items));
				else if (event is FaultEvent)
					ICollectionView(collection).dispatchEvent(new CollectionChangeEvent(CollectionChangeEvent.SAVE_FAULT,FaultEvent(event).fault,items));
			}
		}
		
		private function collection_collectionChangeHandler(event:Event):void
		{
			var ce:CollectionEvent = event as CollectionEvent;
			var collection:ICollectionView = ce.currentTarget as ICollectionView;
			
			if (ce == null || _collectionToChangeItems[collection] == undefined || _collectionToChangeItems[collection].paused > 0)
			{
				return;
			}
			
			var items:Array;
			if (ce.kind == CollectionEventKind.ADD || ce.kind == CE_KIND_ADD_ITEM)
			{
				this.insertItems(ce.items,collection);
			}
			else if (ce.kind == CollectionEventKind.UPDATE)
			{
				this.updateItems(ce.items,collection);
			}
			else if (ce.kind == CollectionEventKind.REMOVE)
			{
				this.deleteItems(ce.items,collection);
			}
			else if ((ce.kind == CollectionEventKind.RESET ||
				ce.kind == CollectionEventKind.REFRESH) && !isAutoSaveEnabled(collection))
			{
				delete _collectionToChangeItems[collection];
				resetCollectionChange(collection);
			}
			else if (ce.kind == CollectionEventKind.REPLACE)
			{
				var delItems:Array = _collectionToChangeItems[collection].deleteItems;
				for each (var item:Object in ce.items)
				{
					if(item is PropertyChangeEvent)
					{
						var oldItem:Object = PropertyChangeEvent(item).oldValue;
						var newItem:Object = PropertyChangeEvent(item).newValue;
						
						this.deleteItems([oldItem], collection);
						this.insertItems([newItem], collection);
					}
					else					
					{
						this.insertItems([item],collection);
					}
				}
			}
			
			if (isAutoSaveEnabled(collection))
			{
				Timer(_timer[collection]).reset();
				Timer(_timer[collection]).start();
			}
		}
		
		public static const CE_KIND_ADD_ITEM:String = "addItem";
		private static const SAVE_TYPE:String = "save";
		private static const DELETE_TYPE:String = "delete";
	}
}