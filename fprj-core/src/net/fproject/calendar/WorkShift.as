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
package net.fproject.calendar
{
	import net.fproject.core.TimeRange;
	import net.fproject.core.TimeUnit;
	
	[RemoteClass(alias="net.fproject.calendar.WorkShift")]
	/**
	 * A work shift is a working interval of time in a day on a <code>WorkCalendar</code>.
	 * 
	 * <p>To specify the start of the working period, use the <code>startTime</code> property.
	 * To specify the end of the working period, use the <code>endTime</code> property.</p>
	 * 
	 * <p>
	 * The following example creates a <code>WorkCalendar</code>, and uses the <code>WorkShift</code> class to
	 * set the working times for Monday to 10AM-12AM and 3PM-8PM:
	 * </p>
	 * 
	 * <pre>
	 * &lt;fprj:WorkCalendar baseCalendar="{WorkCalendar.STANDARD}"&gt;
	 *	&lt;fprj:weekDays&gt;
	 * 	&lt;fprj:WeekDay dayOfWeek="6" isWorking="false" /&gt;
	 * 	&lt;fprj:WeekDay dayOfWeek="1"&gt;
	 * 		&lt;fprj:workShifts&gt;
	 * 			&lt;fprj:WorkShift start="10:00" end="12:00" /&gt;	 
	 * 			&lt;fprj:WorkShift start="15:00" end="20:00" /&gt;
	 * 		&lt;/fprj:workShifts&gt;
	 * 	&lt;/fprj:WeekDay&gt;
	 *	&lt;/fprj:weekDays&gt;
	 * &lt;/fprj:WorkCalendar&gt;
	 * </pre>
	 */
	public class WorkShift extends TimeRange
	{
		/**
		 * <p>Initializes a new instance of the <code>WorkShift</code> class.</p>
		 * The <code>startTime</code> property is set to <code>0</code>, 
		 * and the <code>endTime</code> properties is set
		 * to <code>TimeUnit.Day.milliseconds</code>.
		 */
		public function WorkShift()
		{
			this.startTime = 0;
			this.endTime = TimeUnit.DAY.milliseconds;			
		}
		
		/**
		 * Clone the object
		 * 
		 */
		public function clone() : WorkShift
		{
			return create(this.startTime, this.endTime);
		}
		
		
		/**
		 *  Creates and initializes an instance of the <code>WorkShift</code> class.
		 * 
		 * @param start The start time of the working period, 
		 * in milliseconds from midnight.
		 * @param end The end time of the working period, in milliseconds from midnight.
		 * @return A new instance of the <code>WorkShift</code> class.
		 */
		public static function create(start:Number, end:Number) : WorkShift
		{
			var shift:WorkShift = new WorkShift;
			shift.startTime = start;
			shift.endTime = end == 0 ? TimeUnit.DAY.milliseconds : end;
			shift.validate();
			return shift;
		}
		
		/**
		 * Create a workshift from time serial strings, for example:
		 * <pre>ws = WorkShift.fromTimeSerials('13:00pm', '8:00pm')</pre> 
		 * @param start the start time serial
		 * @param end the end time serial
		 * @return a new instance of WorkShift that contains given input information
		 * 
		 */
		public static function fromTimeSerials(start:String, end:String):WorkShift
		{
			var shift:WorkShift = new WorkShift;
			shift.start = start;
			shift.end = end;
			shift.validate();
			return shift;
		}
		
		/**
		 * Copy a vector of work shifts to another.
		 * @param shifts The vector of input work shifts
		 * @return The copied vector. If the input parameter <code>shifts</code>
		 * is <code>null</code>, an empty vector is returned.
		 *
		 */
		public static function copy(shifts:Vector.<WorkShift>) : Vector.<WorkShift>
		{					
			var len:uint = shifts == null? 0 : shifts.length;
			
			var clonedShifts:Vector.<WorkShift> = new Vector.<WorkShift>(len);			
			
			for (var i:uint = 0; i < len; i++)
			{				
				clonedShifts[i] = shifts[i].clone();
			}
			return clonedShifts;
		}
		
		/**
		 * Check whether the the two vector of workshifts are equal or not.
		 * @param shifts1 The first comparing workshift
		 * @param shifts1 The second comparing workshift
		 * @return <code>true</code> if the two workshifts are equal,
		 * <code>false</code> if otherwise.
		 *
		 */
		public static function vectorCompare(shifts1:Vector.<WorkShift>, shifts2:Vector.<WorkShift>):Boolean
		{
			if (shifts1 == shifts2)
				return true;
			if (shifts1 == null || shifts2 == null)
				return false;
			
			var len:uint = shifts1.length;
			
			if (shifts2.length != len)
				return false;
			
			for (var i:uint = 0; i < len; i++)
			{
				if (shifts1[i] == shifts2[i])
					continue;				
				if (shifts1[i] == null || !shifts1[i].equals(shifts2[i]))
					return false;
			}
			
			return true;
		}
	}
}
