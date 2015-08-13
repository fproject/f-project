package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

	internal class RecurrenceGenerator implements IRecurrenceGenerator
    {
        private var _inclusions:Vector.<IRecurrenceGenerator>;
        private var _exclusions:Vector.<IRecurrenceGenerator>;

        function RecurrenceGenerator(inclusions:Vector.<IRecurrenceGenerator>, exclusions:Vector.<IRecurrenceGenerator>)
        {
            this._inclusions = inclusions;
            this._exclusions = exclusions;
        }

        public function reset() : void
        {
            for each (var generator:IRecurrenceGenerator in this._inclusions)
            {
                generator.reset();
            }
            for each (generator in this._exclusions)
            {
                generator.reset();
            }
        }

        public function getRecurrenceInstances(start:Date, end:Date) : Vector.<Date>
        {
            if (this._inclusions == null || this._inclusions.length == 0)
            {
                return new Vector.<Date>;
            }
            var idates:Vector.<Date> = null;
            var icount:uint = 0;
            for each (var generator:IRecurrenceGenerator in this._inclusions)
            {
				var tmpDates:Vector.<Date> = generator.getRecurrenceInstances(start, end);
                if (idates == null)
                {
                    idates = tmpDates;
                }
                else
                {
                    idates = idates.concat(tmpDates);
                }
                icount = icount + 1;
            }
            if (icount > 1)
            {
                idates.sort(RecurrenceUtil.COMPARE_FUNCTION);
            }
            var ecount:uint = 0;
			var edates:Vector.<Date> = null;
            for each (generator in this._exclusions)
            {                
                tmpDates = generator.getRecurrenceInstances(start, end);
                if (edates == null)
                {
                    edates = tmpDates;
                }
                else
                {
                    edates = edates.concat(tmpDates);
                }
                ecount = ecount + 1;
            }
            if (ecount > 1)
            {
                edates.sort(RecurrenceUtil.COMPARE_FUNCTION);
            }
            if (icount == 1 && ecount == 0)
            {
                return idates;
            }
            tmpDates = new Vector.<Date>;
            var d:Date = null;
            var idx:uint = 0;
            
            for (var i:uint = 0; i < idates.length; i++)
            {
				var idt:Date = idates[i];
                if (d == null || d != null && d.time != idt.time)
                {
                    if (edates != null)
                    {
                        while (idx < edates.length && edates[idx] < idt)
                        {                            
                            idx = idx + 1;
                        }
                        if (idx >= edates.length || edates[idx].time != idt.time)
                        {
                            tmpDates.push(idt);
                        }
                    }
                    else
                    {
                        tmpDates.push(idt);
                    }
                }
                d = idt;
            }
            return tmpDates;
        }

    }
}
