package net.fproject.calendar.recurrence.supportClasses
{
    import mx.resources.*;
    
    import net.fproject.calendar.recurrence.*;
    import net.fproject.utils.GregorianCalendar;
    import net.fproject.utils.LoggingUtil;
    import net.fproject.utils.ResourceUtil;

    final public class RecurrenceGeneratorFactory
    {
        public static function createRecurrenceGenerator(calendar:GregorianCalendar, item:Object, 
														 startDate:Date, endDate:Date, inclusionRule:Vector.<RRule>, 
														 exclusionRule:Vector.<RRule> = null,
														 inclusionDates:Vector.<Date> = null, 
														 exclusionDates:Vector.<Date> = null) : IRecurrenceGenerator
        {
            var inclusions:Vector.<IRecurrenceGenerator> = new Vector.<IRecurrenceGenerator>;
            var exclusions:Vector.<IRecurrenceGenerator> = new Vector.<IRecurrenceGenerator>;
            for each (var rule:RRule in inclusionRule)
            {                
				var generator:IRecurrenceGenerator = createRecurrenceGeneratorImpl(calendar, item, startDate, endDate, rule);
                if (generator != null)
                {
                    inclusions.push(generator);
                }
            }
            if (inclusionDates != null && inclusionDates.length > 0)
            {
                generator = createRecurrenceGeneratorImpl(calendar, item, startDate, endDate, inclusionDates);
                inclusions.push(generator);
            }
            for each (rule in exclusionRule)
            {                
                generator = createRecurrenceGeneratorImpl(calendar, item, startDate, endDate, rule);
                if (generator != null)
                {
                    exclusions.push(generator);
                }
            }
            if (exclusionDates != null && exclusionDates.length > 0)
            {
                generator = createRecurrenceGeneratorImpl(calendar, item, startDate, endDate, exclusionDates);
                exclusions.push(generator);
            }
            return new RecurrenceGenerator(inclusions, exclusions);
        }

		internal static function createRecurrenceGeneratorImpl(calendar:GregorianCalendar, item:Object, startDate:Date, endDate:Date, object:Object) : IRecurrenceGenerator
        {
            if (object is RRule)
            {
                return createRuleRecurrenceGenerator(calendar, item, startDate, endDate, object as RRule);
            }
            if (object is Date)
            {
				return createDateListGenerator(startDate, new <Date>[object as Date]);
            }
            if (object is Vector.<Date>)
            {
                return createDateListGenerator(startDate, object as Vector.<Date>);
            }
			LoggingUtil.logAndThrowError(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 9, 
				ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, "illegal.object.type");
			return null;
        }

        private static function createDateListGenerator(startDate:Date, dates:Vector.<Date>) : IRecurrenceGenerator
        {
            return new ListRecurrenceGenererator(startDate, dates);
        }

        private static function validateRecurrenceRule(rule:RRule) : Boolean
        {
            if (rule.weekStart != null)
            {
                LoggingUtil.logWarn(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 17, 
					ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, "wkst.not.supported");
            }
            if (rule.bySetPos.length != 0)
            {
				LoggingUtil.logAndThrowError(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 13, 
					ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
					"bysetpos.not.supported", [rule.toString()]);
                return false;
            }
            if (rule.until != null && rule.count != 0)
            {
				rule.count = 0;//20130507 move up to invoke before throw
				LoggingUtil.logAndThrowError(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 
					16, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
					"count.and.until.in.same.rule", [rule.toString()]);
            }
            return true;
        }

        private static function createRuleRecurrenceGenerator(calendar:GregorianCalendar, item:Object, 
															  startDate:Date, endDate:Date, rule:RRule) : IRecurrenceGenerator
        {
            var yearGenerator:IGenerator = null;
            var monthGenerator:IGenerator = null;
            var dayGenerator:IGenerator = null;
            var condition:IRecurrenceCondition = null;
            var filter:IDateFilter = null;
			
            if (rule.interval <= 0)
                rule.interval = 1;
			
            if (!validateRecurrenceRule(rule))
                return null;
			
            yearGenerator = new YearGenerator(calendar, startDate, rule.freq == RRule.YEARLY ? rule.interval : 1);
            var filters:Vector.<IDateFilter> = new Vector.<IDateFilter>;
            switch(rule.freq)
            {
                case RRule.DAILY:
                {
                    if (rule.byMonthDay.length == 0)
                    {
                        dayGenerator = new DayGenerator(calendar, startDate, rule.interval);
                    }
                    else
                    {
                        dayGenerator = new ByMonthDayGenerator(calendar, startDate, rule.byMonthDay);
                    }
                    if (rule.byDay.length != 0)
                    {
                        filters.push(new ByDayFilter(calendar, startDate, rule.byDay, true));
                    }
                    break;
                }
                case RRule.WEEKLY:
                {
                    if (rule.byDay.length != 0)
                    {
                        dayGenerator = new ByDayGenerator(calendar, startDate, rule.byDay, false);
                        if (rule.interval > 1)
                        {
                            filters.push(new WeekIntervalFilter(calendar, startDate, rule.interval));
                        }
                    }
                    else
                    {
                        dayGenerator = new DayGenerator(calendar, startDate, rule.interval * 7);
                    }
                    if (rule.byMonthDay.length != 0)
                    {
                        filters.push(new ByMonthDayFilter(calendar, startDate, rule.byMonthDay));
                    }
                    break;
                }
                case RRule.YEARLY:
                {
                    if (rule.byYearDay.length != 0)
                    {
                        dayGenerator = new ByYearDayGenerator(calendar, startDate, rule.byYearDay);
                        if (rule.byWeekNo.length != 0)
                        {
                            filters.push(new ByWeekNoFilter(calendar, startDate, rule.byWeekNo));
                        }
                        if (rule.byDay.length != 0)
                        {
                            filters.push(new ByDayFilter(calendar, startDate, rule.byDay, true));
                        }
                        if (rule.byMonthDay.length != 0)
                        {
                            filters.push(new ByMonthDayFilter(calendar, startDate, rule.byMonthDay));
                        }
                        break;
                    }
                }
                case RRule.MONTHLY:
                {
                    if (rule.byMonthDay.length != 0)
                    {
                        dayGenerator = new ByMonthDayGenerator(calendar, startDate, rule.byMonthDay);
                        if (rule.byWeekNo.length != 0)
                        {
                            filters.push(new ByWeekNoFilter(calendar, startDate, rule.byWeekNo));
                        }
                        if (rule.byDay.length != 0)
                        {
                            filters.push(new ByDayFilter(calendar, startDate, rule.byDay, rule.freq == RRule.YEARLY));
                        }
                    }
                    else if (rule.byWeekNo.length != 0 && rule.freq == RRule.YEARLY)
                    {
                        dayGenerator = new ByWeekNoGenerator(calendar, startDate, rule.byWeekNo);
                        filters.push(new ByDayFilter(calendar, startDate, rule.byDay, true));
                    }
                    else if (rule.byDay.length != 0)
                    {
                        dayGenerator = new ByDayGenerator(calendar, startDate, rule.byDay, rule.byMonth.length == 0 && rule.freq == RRule.YEARLY);
                    }
                    else
                    {
                        if (rule.freq == RRule.YEARLY)
                        {
                            monthGenerator = new ByMonthGenerator(calendar, startDate, [startDate.month]);
                        }
                        dayGenerator = new ByMonthDayGenerator(calendar, startDate, [startDate.date]);
                    }
                    break;
                }
                case RRule.HOURLY:
                case RRule.MINUTELY:
                case RRule.SECONDLY:
                {
					LoggingUtil.logAndThrowError(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 
						20, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
						"frequencies.lower.than.daily");
                }
                default:
                {
					LoggingUtil.logAndThrowError(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 
						22, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
						"frequency.not.valid", [rule.freq]);
                    break;
                }
            }
            if (rule.byMonth.length != 0)
            {
                monthGenerator = new ByMonthGenerator(calendar, startDate, rule.byMonth);
            }
            else if (monthGenerator == null)
            {
                monthGenerator = new MonthGenerator(calendar, startDate, rule.freq == RRule.MONTHLY ? (rule.interval) : (1));
            }
            if (rule.count != 0)
            {
                condition = new CountCondition(rule.count);
            }
            else if (rule.until != null)
            {
                if (isNaN(rule.until.date))
                {
					LoggingUtil.logAndThrowError(RecurrenceGeneratorFactory, ResourceUtil.FPRJ_CALENDAR, 
						18, ResourceManager.getInstance(), ResourceUtil.FPRJ_CALENDAR_BUNDLE, 
						"until.date.condition.not.valid", [rule.toString()]);
                }
                condition = new UntilCondition(rule.until);
            }
            else
            {
                condition = new AlwaysTrue();
            }
            switch(filters.length)
            {
                case 0:
                {
                    filter = new AlwaysTrue();
                    break;
                }
                case 1:
                {
                    filter = filters[0];
                    break;
                }
                default:
                {
                    filter = new UnionDateFilter(filters);
                    break;
                }
            }
            var instanceGenerator:SerialInstanceGenerator = 
				new SerialInstanceGenerator(yearGenerator, monthGenerator, dayGenerator, filter);
            return new RuleRecurrenceGenerator(item, startDate, endDate, instanceGenerator, condition);
        }

    }
}
