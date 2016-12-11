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
package net.fproject.ui.autoComplete.supportClasses
{
	import flash.display.DisplayObject;
	
	import mx.core.IVisualElement;
	
	public interface IFlowBoxItem extends IVisualElement
	{
		function setFocus():void;
		function setTextFocus():void;
		function contains( x:DisplayObject ):Boolean;
		function isCursorAtBeginning():Boolean;
		function isCursorAtEnd():Boolean;
		function isEditable():Boolean;	
		function get text():String;
		function get item():Object;
		function get minWidth():Number;
	}
}