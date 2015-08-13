package net.fproject.calendar.recurrence.supportClasses
{

    final public class RecurrenceUtil
    {
        private function sortAndUniquifyInts(ints:Array) : Array
        {
            var i:int = 0;
            var a:Array = [];
            ints.sort(Array.NUMERIC);
            
            for (var j:uint = 0; j < ints.length; j++)
            {                
                if (j == 0 || i != ints[j])
                {
                    a.push(ints[j]);
                    i = ints[j];
                }
            }
            return a;
        }

        public static function COMPARE_FUNCTION(d1:Date, d2:Date) : int
        {
            if (d1.time == d2.time)
            {
                return 0;
            }
            return d1 > d2 ? (1) : (-1);
        }

        public static function sortAndUniquifyInts(ints:Array) : Array
        {
            var i:int = 0;
            var a:Array = [];
            ints.sort(Array.NUMERIC);
            
            for (var j:uint = 0; j < ints.length; j++)
            {                
                if (j == 0 || i != ints[j])
                {
                    a.push(ints[j]);
                    i = ints[j];
                }
            }
            return a;
        }

    }
}
