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
package net.fproject.utils
{
	import mx.core.*;
	import mx.styles.*;
	
	/**
	 * Cursor utilities 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class Cursor
	{
		private var _target:UIComponent;
		private var _styleProperty:String;
		private var _offsetStyleProperty:String;
		private var _class:Class;
		private var _xOffset:Number;
		private var _yOffset:Number;
		private var _isValid:Boolean;
		private var _id:int = -1;
						
		public function Cursor(target:UIComponent, styleProperty:String, 
							   offsetStyleProperty:String=null, cursorClass:Class=null)
		{
			this._target = target;
			this._styleProperty = styleProperty;
			this._offsetStyleProperty = offsetStyleProperty;
			this._isValid = false;
			this._class = cursorClass;
		}
		
		public function get isInstalled() : Boolean
		{
			return this._id != -1;
		}
		
		public function setCursor(priority:int = 2) : void
		{
			if (this.isInstalled)
			{
				return;
			}
			this.validate();
			if (this._class)
			{
				this._id = this._target.cursorManager.setCursor(this._class, priority, this._xOffset, this._yOffset);
			}
		}
		
		public function removeCursor() : void
		{
			if (!this.isInstalled)
			{
				return;
			}
			this._target.cursorManager.removeCursor(this._id);
			this._id = -1;
		}
		
		public function styleChanged(styleProp:String, allStyles:Boolean = false) : void
		{
			if (!styleProp || allStyles || styleProp == this._styleProperty
				|| styleProp == this._offsetStyleProperty)
			{
				this._isValid = false;
			}
		}
		
		private function validate() : void
		{
			if (this._isValid)
			{
				return;
			}
			this._isValid = true;
			var styleClient:IStyleClient = IStyleClient(this._target);
			if (this._styleProperty != null)
			{
				this._class = styleClient.getStyle(this._styleProperty);
			}
			
			this._xOffset = 0;
			this._yOffset = 0;
			if (!this._class)
			{
				return;
			}
			var styleOffsets:Object = this._offsetStyleProperty ? 
				styleClient.getStyle(this._offsetStyleProperty) : null;
			if (styleOffsets)
			{
				this._xOffset = styleOffsets[0];
				this._yOffset = styleOffsets[1];
			}
			else
			{				
				var cursorInstance:Object = new this._class();
				if (cursorInstance is IFlexDisplayObject)
				{
					var dispObj:IFlexDisplayObject = IFlexDisplayObject(cursorInstance);
					this._xOffset = (-dispObj.width) / 2;
					this._yOffset = (-dispObj.height) / 2;
				}
			}
		}
		
	}
}
