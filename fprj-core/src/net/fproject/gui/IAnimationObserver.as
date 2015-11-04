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
package net.fproject.gui
{

	/**
	 * <p>
	 * The <code>IAnimationObserver</code> interface defines the interface for objects that want to observe the 
	 * start and end of an animation. 
	 * This interface for example can allow a renderer to configure itself before and after a given animation. 
	 * The renderer can for example hide some of its children, or render in a different way, 
	 * to make rendering lighter in order to smooth an animation action that just started.
	 * </p><p>
	 * This class is designed using <i>Action Observer design pattern</i>.
	 * </p>
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */	
    public interface IAnimationObserver
    {

        public function IAnimationObserver();

		/**
		 * Method that is called when an animation has started. 
		 * @param value An optional string describing the performed animation.
		 * 
		 */
        function startAnimation(value:String) : void;

		/**
		 * Method that is called when an animation has ended. 
		 * @param value An optional string describing the performed animation.
		 * 
		 */
        function endAnimation(value:String) : void;

    }
}
