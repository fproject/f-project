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
package net.fproject.html5
{
    import flash.events.EventDispatcher;
    import flash.external.ExternalInterface;
    
    import net.fproject.event.WebStorageEvent;
    import net.fproject.serialize.Deserializer;
    import net.fproject.serialize.Serializer;

	/**
	 * The <code>storage</code> event is fired on a Document's Window object when a (session or local) storage area changes.
	 * 
	 * @eventType net.fproject.event.WebStorageEvent.STORAGE
	 * */
	[Event(name="storage", type="net.fproject.event.WebStorageEvent")]
	
	/**
	 * This is a proxy class that provides methods to access HTML5 Web Storage API.
	 * 
	 * For more details, see: <a href="https://html.spec.whatwg.org/multipage/webstorage.html">W3C Web Storage Specification</a>
	 * 
	 * @see net.fproject.event.WebStorageEvent
	 * 
	 * @author Bui Sy Nguyen
	 */
    public class WebStorage extends EventDispatcher
    {
		/**
		 * The type of storage. Must be one of the two values: <code>"local"</code> or <code>"session"</code> 
		 */
		public var type:String;
		
		/**
		 * The number of key/value pairs currently present in the list associated with the <code>WebStorage</code> object.
		 * 
		 * @return The number of key/value pairs
		 */
        public function get length():uint
        {
            return ExternalInterface.call("function() { return " + type + "Storage.length; }");
        }

		/**
		 * <p>Returns the name of the n-th key in the list. The order of keys is user-agent defined, but must be 
		 * consistent within an object so long as the number of keys doesn't change. (Thus, adding or removing
		 * a key may change the order of the keys, but merely changing the value of an existing key must not.)
		 * If n is greater than or equal to the number of key/value pairs in the object, then this method returns null.</p>
		 * 
		 * <p>The supported property names on a Storage object are the keys of each key/value pair currently present
		 * in the list associated with the object, in the order that the keys were last added to the storage area.</p>
		 * 
		 * @param n The N-th index
		 * @return The key
		 * 
		 * @see #setItem()
		 */
        public function key(n:uint):*
        {
            return ExternalInterface.call(type + "Storage.key", n);
        }

		/**
		 * Returns the current value associated with the given key. If the given key does not exist
		 * in the list associated with the <code>WebStorage</code> then this method returns <code>null</code>.
		 * 
		 * @param key The key
		 * @return The value associated with the given key.
		 */
        public function getItem(key:String):*
        {
			var s:String = ExternalInterface.call(type + "Storage.getItem", key);
            return Deserializer.getInstance().fromBase64AMF(s);
        }

		/**
		 * <p>Set a value to WebStorage using the given key.</p>
		 * 
		 * <p>Firstly it checks if a key/value pair with the given key already exists in the list associated with the <code>WebStorage</code>.</p>
		 * <p>If it does not, then a new key/value pair must be added to the list, with the given key and with its value set to value.</p>
		 * <p>If the given key does exist in the list, and its value is not equal to value, then it will have its value updated to value.
		 * If its previous value is equal to value, then the method must do nothing.</p>
		 * 
		 * @param key The key to set
		 * @param value The value to set
		 */
        public function setItem(key:String, value:*):void
        {
            ExternalInterface.call(type + "Storage.setItem", key, Serializer.getInstance().toBase64AMF(value));
        }

		/**
		 * This method cause the key/value pair with the given key to be removed from the list associated with
		 * the <code>WebStorage</code>, if it exists.
		 * If no item with that key exists, the method does nothing.
		 * 
		 * @param key The key to remove
		 */
        public function removeItem(key:String):void
        {
            ExternalInterface.call(type + "Storage.removeItem", key);
        }

		/**
		 * Atomically cause the list associated with the <code>WebStorage</code> to be emptied of all
		 * key/value pairs, if there are any. If there are none, then the method does nothing.
		 */
        public function clear():void
        {
            ExternalInterface.call(type + "Storage.clear");
        }
		
		/**
		 * Check if the <code>WebStorage</code> is available
		 * 
		 * @return <code>true</code> if the <code>WebStorage</code> is available, <code>false</code> if otherwise
		 */
		public function available():Boolean
		{
			return ExternalInterface.available && ExternalInterface.call("function() { return typeof " + type + "Storage != 'undefined'; }");
		}
		
		private static var _listenerRegistered:Boolean;
		
		/**
		 * Init event listerner for "storage" event of Web Storage
		 */
		private function addStorageEventListener():void
		{
			var js:String = "function(swfId,useCapture){window.addEventListener('storage',function(event){var returnObject={'key':event.key,'oldValue':event.oldValue,'newValue':event.newValue,'uri': event.uri,'storageArea':event.storageArea===localStorage?'localStorage':'sessionStorage'};document.getElementById(swfId).as3WebStorageCallback(returnObject);},useCapture);}";
			ExternalInterface.addCallback("as3WebStorageCallback", onStorageChanged);
			ExternalInterface.call(js, ExternalInterface.objectID, false);
		}
		
		private function onStorageChanged(event:*=null):void
		{
			dispatchEvent(new WebStorageEvent(WebStorageEvent.STORAGE, event));
		}
		
		/**
		 * Constructor 
		 * @param type The web storage type. This can be 'local' or 'session'
		 * 
		 */
		public function WebStorage(type:String)
		{
			this.type = type;
			if(!_listenerRegistered)
			{
				addStorageEventListener();
				_listenerRegistered = true;
			}
		}
		
		private static var _localStorage:WebStorage;

		public static function get localStorage():WebStorage
		{
			if(_localStorage == null)
			{
				_localStorage = new WebStorage("local");
			}
			return _localStorage;
		}

		private static var _sessionStorage:WebStorage;
		
		public static function get sessionStorage():WebStorage
		{
			if(_sessionStorage == null)
			{
				_sessionStorage = new WebStorage("session");
			}
			return _sessionStorage;
		}
    }
}