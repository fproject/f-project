///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2014 ProjectKit. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.event
{
	import flash.events.Event;
	
	/**
	 * 
	 * The AppContextEvent class represents the event object passed to
	 * the event listener for many Flex events that dispatched from current AppContext.
	 * 
	 */
	public class AppContextEvent extends Event
	{
		private var _data:Object

		/**
		 * 
		 * The data attached to this event.
		 * 
		 */
		public function get data():Object
		{
			return _data;
		}

		/**
		 * 
		 * Constructor.
		 * 
		 * @param type
		 * @param data
		 * 
		 */
		public function AppContextEvent(type:String, data:Object=null)
		{
			super(type);
			_data = data;
		}
		
		/**
		 *  The <code>AppContextEvent.INITIALIZED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>initialized</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the context information initialization is completed.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType initialized
		 *  
		 */
		public static const INITIALIZED:String = "initialized";
		
		/**
		 *  The <code>AppContextEvent.INITIALIZE_FAILED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>initializeFailed</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the context information initialization is failed.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType initializeFailed
		 *  
		 */
		public static const INITIALIZE_FAILED:String = "initializeFailed";
		
		/**
		 *  The <code>AppContextEvent.LOADED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>loaded</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the context data is loaded (from server or local storage).</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType loaded
		 *  
		 */
		public static const LOADED:String = "loaded";
		
		/**
		 *  The <code>AppContextEvent.LOAD_FAILED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>loadFailed</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the context data loading is failed.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType loadFailed
		 *  
		 */
		public static const LOAD_FAILED:String = "loadFailed";
		
		/**
		 *  The <code>AppContextEvent.SAVED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>saved</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the context data is saved (to server or external storage).</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType saved
		 *  
		 */
		public static const SAVED:String = "saved";		
		
		/**
		 *  The <code>AppContextEvent.NETWORK_AVAILABILITY_CHANGE</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>networkAvailabilityChange</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the system network availability is changed.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType networkAvailabilityChange
		 *  
		 */
		public static const NETWORK_AVAILABILITY_CHANGE:String = "networkAvailabilityChange";
		
		/**
		 *  The <code>AppContextEvent.ACCESS_TOKEN_CHANGE</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>accessTokenChange</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the access token of current login user is changed.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType accessTokenChange
		 *  
		 */
		public static const ACCESS_TOKEN_CHANGE:String = "accessTokenChange";
		
		/**
		 *  The <code>AppContextEvent.LOGGED_IN</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>loggedIn</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the current user is logged in successfully.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType loggedIn
		 *  
		 */
		public static const LOGGED_IN:String = "loggedIn";
		
		/**
		 *  The <code>AppContextEvent.LOGIN_FAILED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>loginFailed</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the current user is failed to login.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType loginFailed
		 *  
		 */
		public static const LOGIN_FAILED:String = "loginFailed";
		
		/**
		 *  The <code>AppContextEvent.LOGGED_OUT</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>loggedOut</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * the current user is logged out successfully.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType loggedOut
		 *  
		 */
		public static const LOGGED_OUT:String = "loggedOut";
		
		/**
		 *  The <code>AppContextEvent.SERVICE_CALL_STARTED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>serviceCallStarted</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * a service call is started.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType serviceCallStarted
		 *  
		 */
		public static const SERVICE_CALL_STARTED:String = "serviceCallStarted";
		
		/**
		 *  The <code>AppContextEvent.SERVICE_CALL_COMPLETED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>serviceCallCompleted</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * a service call is completed successfully.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType serviceCallCompleted
		 *  
		 */
		public static const SERVICE_CALL_COMPLETED:String = "serviceCallCompleted";
		
		/**
		 *  The <code>AppContextEvent.SERVICE_CALL_FAILED</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>serviceCallFailed</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * a service call is failed.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType serviceCallFailed
		 *  
		 */
		public static const SERVICE_CALL_FAILED:String = "serviceCallFailed";
		
		/**
		 *  The <code>AppContextEvent.ENTER_BUSY_STATE</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>enterBusyState</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * application enters busy state.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType enterBusyState
		 *  
		 */
		public static const ENTER_BUSY_STATE:String = "enterBusyState";
		
		/**
		 *  The <code>AppContextEvent.ENTER_BUSY_STATE</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>enterBusyState</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * application exists busy state.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType enterBusyState
		 *  
		 */
		public static const EXIT_BUSY_STATE:String = "exitBusyState";
		
		/**
		 *  The <code>AppContextEvent.APP_ERROR</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>appError</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * 	an application error occurred.</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType appError
		 *  
		 */
		public static const APP_ERROR:String = "appError";
		
		/**
		 *  The <code>AppContextEvent.APP_ERROR</code> constant defines the value of the
		 *  <code>type</code> property of the event object for an <code>appError</code> event.
		 *
		 * <p>This event is dispatched from the current AppContext when
		 * 	a module is loaded</p>
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>data</code></td><td>The data attached to this event.</td></tr>
		 *  </table>
		 *
		 *  @eventType appError
		 *  
		 */
		public static const MODULE_LOADED:String = "moduleLoaded";
	}
}