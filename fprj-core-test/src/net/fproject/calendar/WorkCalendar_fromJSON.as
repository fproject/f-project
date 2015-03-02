package net.fproject.calendar
{
	import net.fproject.core.TimeUnit;
	import net.fproject.serialize.Deserializer;
	import net.fproject.serialize.Serializer;
	
	import org.flexunit.asserts.assertTrue;

	/**
	 * FlexUnit test case class for method<br/>
	 * <code>public function toJSON():String</code><br/>
	 * of class<br/>
	 * net.fproject.calendar.WorkCalendar
	 */
	public class WorkCalendar_fromJSON
	{
		private var workcalendar:WorkCalendar;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			workcalendar = new WorkCalendar();
			//Your test data initialization
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			workcalendar = null;
			//Your test data cleaning
		}
		
		[Test (description="Normal case: []")]
		/**
		 * Test Case Type: Normal<br/>
		 * <br/>
		 * INPUT VALUES:<br/>
		 * <br/>
		 * OUTPUT EXPECTED:<br/>
		 * ---- expectations ----
		 *
		 */
		public function testCase001():void
		{
			var start:Date = new Date;
			var end:Date = new Date(start.time + 10 * TimeUnit.DAY.milliseconds);
			var shifts:Vector.<WorkShift> = new <WorkShift>[];
			var sh:WorkShift = new WorkShift;
			sh.start = "08:00";
			sh.end = "12:00";
			shifts.push(sh);
			sh = sh.clone();
			sh.start = "13:00";
			sh.end = "17:00";
			shifts.push(sh);
			workcalendar.exceptions = new <WorkCalendarException>
				[
					new WorkCalendarException(start, end, true, shifts)
				];
			
			var json:String = Serializer.getInstance().toJSON(workcalendar);
			
			var returnTestValue:WorkCalendar = 
				Deserializer.getInstance().fromJSON(json, WorkCalendar) as WorkCalendar;
			
			assertTrue(workcalendar.equals(returnTestValue));
		}
		
	}
}