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
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.engine.FontWeight;
	
	import spark.components.Group;
	import spark.components.ToggleButton;
	
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	
	import net.fproject.ui.autoComplete.AutoComplete;
	import net.fproject.ui.autoComplete.assets.REMOVE;
	import net.fproject.ui.autoComplete.skins.FacebookSelectedButtonSkin;
	import net.fproject.ui.autoComplete.skins.MacMailSelectedButtonSkin;
	import net.fproject.ui.autoComplete.skins.UnderlineSelectedButtonSkin;
	import net.fproject.utils.StringUtil;
	
	[Event(name="removeClick")]
	[Event(name="itemDoubleClick")]
	[Style(name="selectedFontWeight", type="String", inherit="yes")]
	[Style(name="textSelectedColor", type="uint", inherit="yes", format="Color")]
	[Style(name="showComma", type="String", inherit="yes", enumeration="yes,no")]
	public class SelectedItemButton extends ToggleButton
	{
		private var _selectedItemStyle:String;

		private var selectedItemStyleChanged:Boolean;
		
		[Bindable(event="propertyChange")]
		public function get selectedItemStyle():String
		{
			return _selectedItemStyle;
		}

		public function set selectedItemStyle(value:String):void
		{
			if( _selectedItemStyle !== value)
			{
				var oldValue:String = _selectedItemStyle;
				_selectedItemStyle = value;
				dispatchPropertyChangeEvent('selectedItemStyle', oldValue, value);
				selectedItemStyleChanged = true;
			}
		}
		
		private var _allowMultipleSelection:Boolean;
		[Bindable(event="propertyChange")]
		public function get allowMultipleSelection():Boolean
		{
			return _allowMultipleSelection;
		}
		
		public function set allowMultipleSelection(value:Boolean):void
		{
			if(_allowMultipleSelection !== value)
			{
				_allowMultipleSelection = value;
				_showCommaChanged = true;
				dispatchEvent(new Event("propertyChange"));
			}
		}
		
		private var _showRemoveIcon:Boolean;

		[Bindable(event="propertyChange")]
		public function get showRemoveIcon():Boolean
		{
			return _showRemoveIcon;
		}

		private var _showRemoveIconChanged:Boolean;
		public function set showRemoveIcon(value:Boolean):void
		{
			if(_showRemoveIcon !== value)
			{
				var oldVal:Boolean = _showRemoveIcon;
				_showRemoveIcon = value;
				_showRemoveIconChanged = true;
				dispatchPropertyChangeEvent('showRemoveIcon', oldVal, value);
				invalidateProperties();
			}
		}

		private var _skinClassChanged:Boolean;
		
		private function setSkinClass(value:Class):void
		{
			_skinClassChanged = true;
			setStyle('skinClass', value);
		}
		
		private var _showCommaChanged:Boolean;
		
		override public function styleChanged(styleProp:String):void
		{
			super.styleChanged(styleProp);
			
			if (_skinClassChanged)
			{
				_skinClassChanged = false;
				invalidateProperties();
			}
		}
		
		private var iconGroup:Group;
		
		override protected function commitProperties():void
		{
			if (_showRemoveIconChanged)
			{
				_showRemoveIconChanged = false;
				
				if(_showRemoveIcon && this.styleName != AutoComplete.STYLE_UNDERLINE)
				{
					var icon:Class = getStyle("icon");
					if(icon == null)
						icon = REMOVE;
				}
				else
					icon = null;				
	
				setStyle("icon", icon);
			}
			
			if (_showCommaChanged)
			{
				_showCommaChanged = false;
				
				var showComma:String = getStyle("showComma");
				label = StringUtil.trim(label, ',') + (showComma == "yes" && _allowMultipleSelection ? "," : "");
			}
			
			if(selectedItemStyleChanged)
			{
				switch(selectedItemStyle)
				{
					case AutoComplete.STYLE_FACEBOOK:
						this.setSkinClass(FacebookSelectedButtonSkin);
						this.setStyle('iconPlacement', 'right');
						break;
					case AutoComplete.STYLE_MAC_MAIL:
						this.setSkinClass(MacMailSelectedButtonSkin);
						this.setStyle('iconPlacement', 'right');
						break;
					case AutoComplete.STYLE_UNDERLINE:
						this.setSkinClass(UnderlineSelectedButtonSkin);
						break;
					default:
						break;
				}
				selectedItemStyleChanged = false;
			}
			
			super.commitProperties();
			
			if(iconDisplay != null && iconGroup == null)
			{
				iconGroup = Group(iconDisplay.parent);
				if(!this.hasEventListener(MouseEvent.MOUSE_MOVE))
					this.addEventListener(MouseEvent.MOUSE_MOVE, mouseEventHandler);
			}
		}
		
		private var _removeButtonHovered:Boolean;
		
		override protected function mouseEventHandler(event:Event):void
		{
			var mouseEvent:MouseEvent = event as MouseEvent;
			var mouseOver:Boolean = false;
			switch (event.type)
			{
				case MouseEvent.CLICK:
				case MouseEvent.MOUSE_MOVE:
				case MouseEvent.ROLL_OVER:
					mouseOver = true;
					break;
				case MouseEvent.ROLL_OUT:
					mouseOver = false;
					break;
				case MouseEvent.MOUSE_UP:
					if (event.target == this)
						mouseOver = true;
					break;
				default:
					break;
			}
			
			var oldRemoveButtonHovered:Boolean = _removeButtonHovered;
			if(mouseOver)
			{
				if(hitTestIconMousePoint(mouseEvent.stageX, mouseEvent.stageY))
					_removeButtonHovered = true;
				else
					_removeButtonHovered = false;
			}
			else
				_removeButtonHovered = false;
			
			super.mouseEventHandler(event);
			
			if(oldRemoveButtonHovered != _removeButtonHovered)
				skin.invalidateDisplayList();
		}
		
		public function get removeButtonHovered():Boolean
		{
			return _removeButtonHovered;
		}
		
		private var lastClickedTime:Number;
		
		override protected function clickHandler(event:MouseEvent):void
		{
			super.clickHandler( event );
			
			if (_showRemoveIcon && iconGroup != null)
			{
				if (hitTestIconMousePoint(event.stageX, event.stageY))
				{
					event.stopImmediatePropagation();
					dispatchEvent(new Event("removeClick"));
				}		    				    	
			}
			
			var curTime:Number = (new Date).time;
			if(!isNaN(lastClickedTime) && curTime - lastClickedTime < 500)
				dispatchEvent(new Event("itemDoubleClick"));
			
			lastClickedTime = curTime;
		}
		
		override public function set label(value:String):void
		{
			super.label = value;
			if(this.styleName == AutoComplete.STYLE_UNDERLINE)
				createTextFlow();
		}
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			// prevent the border from beeing drawn
		}
		
		private function createTextFlow():void
		{
			var tf:TextFlow = new TextFlow;
			tf.color = getStyle("textSelectedColor");
			var para:ParagraphElement = new ParagraphElement;
			var span:SpanElement = new SpanElement;
			span.fontWeight = getStyle("selectedFontWeight") == "bold" ? FontWeight.BOLD : FontWeight.NORMAL;
			var showComma:String = getStyle("showComma");
			if (showComma == "yes" && this.allowMultipleSelection && this.label != null && this.label.length > 1)
				span.text = this.label.substr(0, this.label.length - 1);
			else
				span.text = this.label;
			para.addChild(span);
			tf.addChild(para);
			this.labelTextFlow = tf;
		}

		[Bindable]
		public var labelTextFlow:TextFlow;
		
		private function hitTestIconMousePoint(x:Number, y:Number):Boolean
		{
			if (iconGroup != null && iconDisplay != null)
			{
				var topLeft:Point = iconGroup.localToGlobal(new Point(iconDisplay.x, iconDisplay.y));
				var b:Boolean = topLeft.x <= x && (topLeft.x + iconDisplay.width) >= x &&
					topLeft.y <= y && (topLeft.y + iconDisplay.height) >= y;
			}
			
			return b;
		}
	}
}