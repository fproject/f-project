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
package net.fproject.calendar.recurrence
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import net.fproject.calendar.Period;
	import net.fproject.core.PropertyChangeDispatcher;
	import net.fproject.utils.StringUtil;
	
	/**
	 * The RecurrencePeriod represents a working period that has reccurence rule specified.
	 * 
	 * @author Bui Sy Nguyen.
	 * 
	 */
	public class RecurrencePeriod extends Period implements IEventDispatcher
	{
		/**
		 * 
		 * Constructor 
		 * @param startTime
		 * @param endTime
		 * @param rrule
		 * 
		 */
		public function RecurrencePeriod(startTime:Date=null, endTime:Date=null, rrule:String=null)
		{
			super(startTime, endTime);
			this._bindingEventDispatcher = new PropertyChangeDispatcher(IEventDispatcher(this));
		}
		
		protected var _name:String;
		
		[Bindable(event="propertyChange")]
		/**
		 * Name of the period
		 */
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			if( _name !== value)
			{
				var oldValue:String = _name;
				_name = value;
				_bindingEventDispatcher.dispatchChangeEvent('name', oldValue, value);
			}
		}
		
		[Bindable(event="propertyChange")]
		/**
		 * @inheritDoc
		 */
		override public function get isWorking():Boolean
		{
			return _isWorking;
		}
		
		override public function set isWorking(value:Boolean):void
		{
			if(_isWorking != value)
			{
				var oldValue:Boolean = _isWorking;
				_isWorking = value;
				_bindingEventDispatcher.dispatchChangeEvent('isWorking', oldValue, value);
			}
		}
		
		[Bindable(event="propertyChange")]
		/**
		 * @inheritDoc 
		 */
		override public function get start():Date
		{
			return _start;
		}
		
		override public function set start(value:Date):void
		{
			if(_start !== value)
			{
				var oldValue:Date = _start;
				_start = value;
				_bindingEventDispatcher.dispatchChangeEvent('start', oldValue, value);
			}
		}
		
		[Bindable(event="propertyChange")]
		/**
		 * @inheritDoc 
		 */
		override public function get end():Date
		{
			return _end;
		}
		
		override public function set end(value:Date):void
		{
			if(_end !== value)
			{
				var oldValue:Date = _end;
				_end = value;
				_bindingEventDispatcher.dispatchChangeEvent('end', oldValue, value);
			}
		}
			
		protected var _iCalRule:String;
		
		protected var _rrule:RRule;

		[Bindable(event="propertyChange")]
		/**
		 * The recurrence rule 
		 */
		public function get iCalRule():String
		{
			return _iCalRule;
		}

		public function set iCalRule(value:String):void
		{
			if( _iCalRule !== value)
			{
				var oldValue:* = _iCalRule;
				_iCalRule = value;
				_bindingEventDispatcher.dispatchChangeEvent('iCalRule', oldValue, value);
				
				if(!StringUtil.isBlank(_iCalRule))
				{
					oldValue = _rrule;
					_rrule = new RRule(_iCalRule);
					_bindingEventDispatcher.dispatchChangeEvent('rrule', oldValue, _rrule);
				}
			}
		}
		
		[Transient]
		public function get rrule():RRule
		{
			return _rrule;
		}
		
		private var _bindingEventDispatcher:PropertyChangeDispatcher
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false) : void
		{
			this._bindingEventDispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function dispatchEvent(event:Event) : Boolean
		{
			return this._bindingEventDispatcher.dispatchEvent(event);
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function hasEventListener(type:String) : Boolean
		{
			return this._bindingEventDispatcher.hasEventListener(type);
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
		{
			this._bindingEventDispatcher.removeEventListener(type,listener,useCapture);
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function willTrigger(type:String) : Boolean
		{
			return this._bindingEventDispatcher.willTrigger(type);
		}
	}
}