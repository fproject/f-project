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
package net.fproject.gui.component
{
	import flash.events.IEventDispatcher;

	/**
	 * Interface for component that uses menu.<br/>
	 * Use a standard object to declare menu items for a menu
	 * */
	public interface IMenuOwner extends IEventDispatcher
	{
		/**
		 * 
		 * Override this method to set the menu data for views or components.<br>
		 * This data will be used to create menu items when the view/component
		 * is integrated with the application.
		 * Follow the format of the example below:<br/>
		 * <pre>
		 * override public function get menuData() : Object
		 * {
		 *	return {
		 * 		states: ['normal','abnormal'],
		 *		menuItems:[
		 *			{label:"@Resource(project,mainmenu.new)",
		 *			 event:"net.fproject.event.TaskEvent.NEW_TASK",
		 *			 icon:"newproject.png", "icon.abnormal":"existed.png"}
		 *		]
		 *	};
		 * }
		 * </pre>
		 * <br/>
		 * In the example above, the value of label property of <code>menuItem</code> element
		 * is set to <code>"mainmenu.new"</code> that is a resource bundle key defined in 
		 * the <code>project.properties</code> bundle
		 * 
		 */
		function get menuData() : Object;
	}
}