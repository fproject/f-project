package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

	internal class UnionDateFilter implements IDateFilter
    {
        private var _filters:Vector.<IDateFilter>;

        function UnionDateFilter(filters:Vector.<IDateFilter>)
        {
            this._filters = filters;
        }

        public function reset() : void
        {
            for each (var filter:IDateFilter in this._filters)
            {                
                filter.reset();
            }
        }

        public function apply(date:Date) : Boolean
        {
            for each (var filter:IDateFilter in this._filters)
            {
                
                if (!filter.apply(date))
                {
                    return false;
                }
            }
            return true;
        }

    }
}
