package net.fproject.calendar.recurrence
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.PropertyChangeEvent;
	
	import net.fproject.calendar.Period;
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
			this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
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
				firePropertyChange('name', oldValue, value);
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
				firePropertyChange('isWorking', oldValue, value);
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
				firePropertyChange('start', oldValue, value);
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
				firePropertyChange('end', oldValue, value);
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
				firePropertyChange('iCalRule', oldValue, value);
				
				if(!StringUtil.isBlank(_iCalRule))
				{
					oldValue = _rrule;
					_rrule = new RRule(_iCalRule);
					firePropertyChange('rrule', oldValue, _rrule);
				}
			}
		}
		
		[Transient]
		public function get rrule():RRule
		{
			return _rrule;
		}
		
		private var _bindingEventDispatcher:EventDispatcher
		
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
		
		private function firePropertyChange(prop:String, oldValue:*, value:*):void
		{
			if(hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, prop, oldValue, value));
		}
	}
}