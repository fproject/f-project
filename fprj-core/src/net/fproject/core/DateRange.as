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
package net.fproject.core
{
	/**
	 * 
	 * A DateRange represents a range of dates from a start to an end date.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class DateRange
	{
		protected var _start:Date;
		protected var _end:Date;
		
		/**
		 * 
		 * Constructor.
		 *  
		 * @param start
		 * @param end
		 * 
		 */
		public function DateRange(start:Date = null, end:Date = null)
		{
			_start = start;
			_end = end;
		}
		
		/**
		 * 
		 * The end date
		 * 
		 */
		public function get end():Date
		{
			return _end;
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function set end(value:Date):void
		{
			_end = value;
		}

		/**
		 * 
		 * The start date
		 * 
		 */
		public function get start():Date
		{
			return _start;
		}

		/**
		 * 
		 * @private
		 * 
		 */
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
		
		/**
		 * 
		 * Clone the date range.
		 * 
		 * @param target the target that properties of this objet will be copied to
		 * 
		 * @return the cloned date range object. 
		 * 
		 */
		public function clone(target:DateRange=null):DateRange
		{		
			if(target == null)
			{
				target = new DateRange(_start != null ? new Date(_start.time) : null, _end != null ? new Date(_end.time) : null);
			}
			else
			{
				target._start = _start != null ? new Date(_start.time) : null;
				target._end = _end != null ? new Date(_end.time) : null;
			}
			
			return target;
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
		
		/**
		 * Check if this date range is intersected to another range 
		 * @param r the range to check
		 * @return true if the two range are intersected.
		 * 
		 */
		public function isIntersected(r:DateRange):Boolean
		{
			return r!= null && getIntersectedRange(r.start, r.end) != null;
		}
	}
}