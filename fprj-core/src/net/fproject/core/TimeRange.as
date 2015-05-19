///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	/**
	 * 
	 * A <code>TimeRange</code> represents a period of time of a day.
	 * <p>To specify the start of the <code>TimeRange</code>, use the <code>start</code> property.
	 * To specify the end of the <code>TimeRange</code>, use the <code>end</code> property.</p>
	 * 
	 * @see net.fproject.core.Time
	 * 
	 */
	public class TimeRange
	{
		protected var _start:Time;
		protected var _end:Time;
		
		/**
		 * 
		 * Constructor.
		 *  
		 * @param start
		 * @param end
		 * 
		 */
		public function TimeRange(start:Time = null, end:Time = null)
		{
			_start = start;
			_end = end;
		}
		
		/**
		 * 
		 * The end time of time range
		 * 
		 */
		public function get end():Time
		{
			return _end;
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function set end(value:Time):void
		{
			_end = value;
		}

		/**
		 * 
		 * The start time of time range
		 * 
		 */
		public function get start():Time
		{
			return _start;
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function set start(value:Time):void
		{
			_start = value;
		}

	}
}