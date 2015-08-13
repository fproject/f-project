package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;
    import net.fproject.utils.LoggingUtil;
    import net.fproject.utils.ResourceUtil;

	internal class RuleRecurrenceGenerator implements IRecurrenceGenerator
    {
        private var _item:Object;
        private var _dtStart:Date;
        private var _dtEnd:Date;
        private var _instanceGenerator:IGenerator;
        private var _condition:IRecurrenceCondition;
        private var _duration:Number;

        function RuleRecurrenceGenerator(item:Object, startDate:Date, endDate:Date, instanceGenerator:IGenerator, condition:IRecurrenceCondition)
        {
            this._item = item;
            this._dtStart = startDate;
            this._dtEnd = endDate;
            this._duration = endDate.time - startDate.time;
            this._instanceGenerator = instanceGenerator;
            this._condition = condition;
        }

		//Copy from Trillix
        public function reset() : void
        {
			this._instanceGenerator.reset();
			this._condition.reset();
        }

        public function get item() : Object
        {
            return this._item;
        }

        private function isInRange(d:Date, start:Date, end:Date) : Boolean
        {
            var dd:Date = new Date(d.time + this._duration);
            return new Date(d.time + this._duration).time != d.time && d.time != end.time && d <= end && start <= dd;
        }

        public function getRecurrenceInstances(start:Date, end:Date) : Vector.<Date>
        {
			var instances:Vector.<Date> = new Vector.<Date>;
			var d:Date = new Date(this._dtStart);
            if (this._dtStart > end)
            {
                return instances;
            }
            if (this._condition is UntilCondition)
            {
				var untilDate:Date = UntilCondition(this._condition).untilDate;
                if (untilDate < start)
                {
                    return new Vector.<Date>;
                }
            }
            if (this._instanceGenerator is SerialInstanceGenerator)
            {
				var siGenerator:SerialInstanceGenerator = this._instanceGenerator as SerialInstanceGenerator;
                if (siGenerator.monthGenerator is ByMonthGenerator)
                {
                    siGenerator.monthGenerator.generate(d);
                }
            }
			
            var tmpDate:Date = new Date(d.time);
            var count:int = 0;
			var b:Boolean = false;
			var i:uint = 0;
			
            do
            {                
                b = !this._instanceGenerator.generate(d);
                d.hours = this._dtStart.hours;
                d.minutes = this._dtStart.minutes;
                d.seconds = this._dtStart.seconds;
                d.milliseconds = this._dtStart.milliseconds;
                if (tmpDate.time == d.time)
                {
                    count++;
                    if (count > 10)
                    {
                        break;
                    }
                }
                if (isNaN(d.date))
                {
					LoggingUtil.logAndThrowError(RuleRecurrenceGenerator, ResourceUtil.FPRJ_CALENDAR,
						7, null, ResourceUtil.FPRJ_CALENDAR_BUNDLE, "invalid.date.drop.recurrence");
                }
                tmpDate = new Date(d.time);
                if (i == 0 && d.time != this._dtStart.time)
                {
					var dstart:Date = new Date(this._dtStart.time);
                    this._condition.apply(dstart);
					instances = new <Date>[dstart];
                }
                i = i + 1;
                if (d >= this._dtStart)
                {
                    b = b || !this._condition.apply(d);
                }
                if (d == null || d > end || b)
                {
                    b = true;
                }
				else if (d >= this._dtStart && this.isInRange(d, start, end))
                {
                    instances.push(new Date(d.time));
                }
            }while (!b)
            return instances;
        }

    }
}
