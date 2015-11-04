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
package net.fproject.calendar.recurrence
{
	import net.fproject.utils.GregorianCalendar;

	[Implementation('net.fproject.calendar.recurrence.supportClasses.RecurrenceGeneratorFactory')]
    public interface IRecurrenceGeneratorFactory
    {
        function createRecurrenceGenerator(calendar:GregorianCalendar, item:Object, 
														 startDate:Date, endDate:Date, inclusionRule:Vector.<RRule>, 
														 exclusionRule:Vector.<RRule> = null,
														 inclusionDates:Vector.<Date> = null, 
														 exclusionDates:Vector.<Date> = null) : IRecurrenceGenerator;
    }
}
