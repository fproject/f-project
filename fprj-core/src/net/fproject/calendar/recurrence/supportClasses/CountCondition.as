package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

	internal class CountCondition implements IRecurrenceCondition
    {
        private var _count:int;
        private var _init:int;

        function CountCondition(init:int)
        {
			this._count = this._init = init;
        }

		public function apply(date:Date):Boolean
		{
			this._count--;
			return this._count >= 0;
		}

        public function reset() : void
        {
            this._count = this._init;
        }

    }
}
