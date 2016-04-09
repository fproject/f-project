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
package net.fproject.event
{
	import flash.events.Event;
	
	import net.fproject.fproject_internal;
	import net.fproject.html5.WebStorage;

	public class WebStorageEvent extends Event
	{
		/**
		 * The key being changed 
		 */
		public var key:String;
		
		/**
		 * The old value of the key being changed 
		 */		
		public var oldValue:*;
		
		/**
		 * The new value of the key being changed 
		 */	
		public var newValue:*;
		
		/**
		 * The address of the document whose key changed 
		 */
		public var uri:String;
		
		/**
		 * Name of the Storage object that was affected. This can be 'localStorage' or 'sessionStorage' 
		 */		
		public var storageArea:String;
		
		/**
		 * Constructor 
		 * 
		 */
		public function WebStorageEvent(type:String, base64Source:Object=null)
		{
			super(type);
			if(base64Source != null)
			{
				for (var s:String in base64Source)
				{
					if(this.hasOwnProperty(s))
						this[s] = base64Source[s];
				}
				this.oldValue = WebStorage.fproject_internal::fromBase64AMF(this.oldValue);
				this.newValue = WebStorage.fproject_internal::fromBase64AMF(this.newValue);
			}
		}
		
		/**
		 * <p>The <code>WebStorageEvent.STORAGE</code> constant defines the value of the
		 * <code>type</code> property of the event object for an <code>storage</code> event.</p>
		 *
		 * <p>The <code>storage</code> event is fired on a Document's Window object when a (session or local) storage area changes.</p>
		 * 
		 * <p>The properties of the event object have the following values:</p>
		 * <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The storage object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>WebStorage.localStorage.addEventListener()</code> to register an event listener,
		 *       localStorage is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>key</code></td><td>The key being changed.</td></tr>
		 *     <tr><td><code>oldValue</code></td><td>The old value of the key being changed.</td></tr>
		 *     <tr><td><code>newValue</code></td><td>The new value of the key being changed.</td></tr>
		 *     <tr><td><code>uri</code></td><td>The address of the document whose key changed.</td></tr>
		 *     <tr><td><code>uri</code></td><td>Name of the Storage object that was affected. This can be 'localStorage' or 'sessionStorage'</td></tr>
		 * </table>
		 *
		 * @eventType storage
		 *  
		 */
		public static const STORAGE:String = "storage";
	}
}