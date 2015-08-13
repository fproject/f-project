package net.fproject.calendar.recurrence.supportClasses
{
    import net.fproject.calendar.recurrence.supportClasses.*;

	internal class SerialInstanceGenerator implements IGenerator
    {
        public var yearGenerator:IGenerator;
        public var monthGenerator:IGenerator;
        public var dayGenerator:IGenerator;
        public var filter:IDateFilter;

        function SerialInstanceGenerator(yearGenerator:IGenerator, monthGenerator:IGenerator, 
										 dayGenerator:IGenerator, filter:IDateFilter)
        {
            this.yearGenerator = yearGenerator;
            this.monthGenerator = monthGenerator;
            this.dayGenerator = dayGenerator;
            this.filter = filter;
        }

		public function reset():void
		{
			this.yearGenerator.reset();
			this.monthGenerator.reset();
			this.dayGenerator.reset();
			this.filter.reset();
		}

        public function generate(date:Date) : Boolean
        {
            do
            {                
                while (!this.dayGenerator.generate(date))
                {                    
                    while (!this.monthGenerator.generate(date))
                    {                        
                        while (!this.yearGenerator.generate(date))
                        {                            
                            return false;
                        }
                    }
                }
            }while (!this.filter.apply(date))
            return true;
        }

    }
}
