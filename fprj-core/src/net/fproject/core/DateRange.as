///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.core
{
	public class DateRange
	{
		protected var _start:Date;
		protected var _end:Date;
		
		public function DateRange(start:Date = null, end:Date = null)
		{
			_start = start;
			_end = end;
		}
		
		public function get end():Date
		{
			return _end;
		}

		public function set end(value:Date):void
		{
			_end = value;
		}

		public function get start():Date
		{
			return _start;
		}

		public function set start(value:Date):void
		{
			_start = value;
		}

		/**
		 * Compare the current date range to another. 
		 * @param dr the <code>DateRange</code> to compare.
		 * @return <code>true</code> if both of the two date ranges have <code>start</code>
		 * and <code>end</code> fields are not <code>null</code> and their <code>time</code> 
		 * values are not <code>null</code>. It returns <code>false</code> if otherwise.
		 * 
		 */		
		public function equals(dr:DateRange):Boolean
		{
			if (dr != null)
			{
				if (this._start != null && dr._start != null
					&& this._end != null && dr._end != null)
				{
					if (this._start.time == dr._start.time
						&& this._end.time == dr._end.time)
						return true;
				}
			}
			return false;
		}
		
		public function clone():DateRange
		{			
			return new DateRange(_start != null ? new Date(_start.time) : null,
				_end != null ? new Date(_end.time) : null);
		}
		
		/**
		 * Get intersected range of another range with this period. 
		 * @param start the start date of date range to check intersection
		 * @param end the end date of date range to check intersection
		 * @return the intersected range or <code>null</code> 
		 * if the two date ranges are not intersected.
		 * 
		 */
		public function getIntersectedRange(start:Date, end:Date):DateRange
		{
			var r:DateRange = null;
			if((this.end == null || start <= this.end) && (this.start == null || end >= this.start))
			{
				var s:Date = (this.start == null || this.start < start) ? start : this.start;
				var e:Date = (this.end == null || this.end > end) ? end : this.end;
				r = new DateRange(s, e);
			}
			return r;
		}
	}
}