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
package net.fproject.ui.misc {
	import flash.display.Sprite;
	import flash.events.EventPhase;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.core.FlexGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModule;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.managers.IActiveWindowManager;
	import mx.managers.ISystemManager;
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Panel;
	import spark.components.supportClasses.TextBase;
	
	import net.fproject.util.FprjuiUtil;
	
	//--------------------------------------
	//  Styles
	//--------------------------------------
	
	/**
	 *  Name of the CSS style declaration that specifies
	 *  styles for the Alert buttons.
	 *
	 *  @default "alertButtonStyle"
	 *
	 */
	[Style(name="buttonStyleName", type="String", inherit="no")]
	
	/**
	 *  Name of the CSS style declaration that specifies
	 *  styles for the Alert message text.
	 *
	 *  <p>You only set this style by using a type selector, which sets the style
	 *  for all Alert controls in your application.
	 *  If you set it on a specific instance of the Alert control, it can cause the control to
	 *  size itself incorrectly.</p>
	 *
	 *  @default undefined
	 *
	 */
	[Style(name="messageStyleName", type="String", inherit="no")]
	
	//--------------------------------------
	//  Other metadata
	//--------------------------------------
	
	[RequiresDataBinding(true)]
	
	[ResourceBundle("alert")]
	
	/**
	 *  The Alert control is a pop-up dialog box that can contain a message,
	 *  a title, buttons (any combination of OK, Cancel, Yes, and No) and an icon.
	 *  The Alert control is modal, which means it will retain focus until the user closes it.
	 *
	 *  <p>Import the spark.components.spark.components.alert.Alert class into your application,
	 *  and then call the static <code>show()</code> method in ActionScript to display
	 *  an Alert control. You cannot create an Alert control in MXML.</p>
	 *
	 *  <p>The Alert control closes when you select a button in the control,
	 *  or press the Escape key.</p>
	 *
	 */
	
	[ResourceBundle("fprjui")]
	public class Alert extends Panel {
		[SkinPart(required="false")]
		public var messageDisplay:TextBase;
		
		[SkinPart(required="false")]
		public var buttonGroup:Group;
		
		[SkinPart(required="false")]
		public var iconGroup:Group;
		
		//----------------------------------
		//  buttonHeight
		//----------------------------------
		
		[Inspectable(category="Size")]
		
		/**
		 *  Height of each Alert button, in pixels.
		 *  All buttons must be the same height.
		 *
		 *  @default 24
		 *
		 */ public static var buttonHeight:Number = 24;
		
		//----------------------------------
		//  buttonWidth
		//----------------------------------
		
		[Inspectable(category="Size")]
		
		/**
		 *  Width of each Alert button, in pixels.
		 *  All buttons must be the same width.
		 *
		 *  @default 65
		 *
		 */ public static var buttonWidth:Number = 65;
		
		/**
		 *  Value that enables a Yes button on the Alert control when passed
		 *  as the <code>flags</code> parameter of the <code>show()</code> method.
		 *  You can use the | operator to combine this bitflag
		 *  with the <code>OK</code>, <code>CANCEL</code>,
		 *  <code>NO</code>, and <code>NONMODAL</code> flags.
		 *
		 */
		public static const YES:uint = 0x0001;
		
		/**
		 *  Value that enables a No button on the Alert control when passed
		 *  as the <code>flags</code> parameter of the <code>show()</code> method.
		 *  You can use the | operator to combine this bitflag
		 *  with the <code>OK</code>, <code>CANCEL</code>,
		 *  <code>YES</code>, and <code>NONMODAL</code> flags.
		 *
		 */
		public static const NO:uint = 0x0002;
		
		/**
		 *  Value that enables an OK button on the Alert control when passed
		 *  as the <code>flags</code> parameter of the <code>show()</code> method.
		 *  You can use the | operator to combine this bitflag
		 *  with the <code>CANCEL</code>, <code>YES</code>,
		 *  <code>NO</code>, and <code>NONMODAL</code> flags.
		 *
		 */
		public static const OK:uint = 0x0004;
		
		/**
		 *  Value that enables a Cancel button on the Alert control when passed
		 *  as the <code>flags</code> parameter of the <code>show()</code> method.
		 *  You can use the | operator to combine this bitflag
		 *  with the <code>OK</code>, <code>YES</code>,
		 *  <code>NO</code>, and <code>NONMODAL</code> flags.
		 *
		 */
		public static const CANCEL:uint = 0x0008;
		
		/**
		 *  Value that makes an Alert nonmodal when passed as the
		 *  <code>flags</code> parameter of the <code>show()</code> method.
		 *  You can use the | operator to combine this bitflag
		 *  with the <code>OK</code>, <code>CANCEL</code>,
		 *  <code>YES</code>, and <code>NO</code> flags.
		 *
		 */
		public static const NONMODAL:uint = 0x8000;
		
		/**
		 *  The label for the YES|NO|OK|CANCEL button.
		 *
		 *  <p>If you use a different label, you may need to adjust the
		 *  <code>buttonWidth</code> property to fully display the label.</p>
		 *
		 */
		protected function getLabel(buttonFlag:uint):String {
			var msgId:String;
			switch (buttonFlag)
			{
				case YES:
					msgId = "Yes";
					break;
				case NO:
					msgId = "No";
					break;
				case OK:
					msgId = "Ok";
					break;
				case CANCEL:
					msgId = "Cancel";
					break;
				default:
					msgId = "Others";
					break;
			}
			if(buttonLabels != null)
			{
				var key:String = msgId.charAt(0).toLowerCase() + msgId.substr(1) + "Label";
				if (buttonLabels.hasOwnProperty(key))
					return buttonLabels[key];
			}
			return FprjuiUtil.getString('alert.Button.' + msgId);
		}
		
		private var _message:String;
		private var _defaultButtonFlag:uint;
		private var _buttons:Vector.<Button>;
		private var bitFlagToButton:Object;
		private var buttonLabels:Object;
		
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Static method that pops up the Alert control. The Alert control
		 *  closes when you select a button in the control, or press the Escape key.
		 *
		 *  @param message Text string that appears in the Alert control.
		 *  This text is centered in the alert dialog box.
		 *
		 *  @param title Text string that appears in the title bar.
		 *  This text is left justified.
		 *
		 *  @param flags Which buttons to place in the Alert control.
		 *  Valid values are <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, and <code>Alert.NO</code>.
		 *  The default value is <code>Alert.OK</code>.
		 *  Use the bitwise OR operator to display more than one button.
		 *  For example, passing <code>(Alert.YES | Alert.NO)</code>
		 *  displays Yes and No buttons.
		 *  Regardless of the order that you specify buttons,
		 *  they always appear in the following order from left to right:
		 *  OK, Yes, No, Cancel.
		 *
		 *  @param parent Object upon which the Alert control centers itself.
		 *
		 *  @param closeHandler Event handler that is called when any button
		 *  on the Alert control is pressed.
		 *  The event object passed to this handler is an instance of CloseEvent;
		 *  the <code>detail</code> property of this object contains the value
		 *  <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, or <code>Alert.NO</code>.
		 *
		 *  @param iconClass Class of the icon that is placed to the left
		 *  of the text in the Alert control.
		 *
		 *  @param defaultButtonFlag A bitflag that specifies the default button.
		 *  You can specify one and only one of
		 *  <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, or <code>Alert.NO</code>.
		 *  The default value is <code>Alert.OK</code>.
		 *  Pressing the Enter key triggers the default button
		 *  just as if you clicked it. Pressing Escape triggers the Cancel
		 *  or No button just as if you selected it.
		 *
		 *  @param moduleFactory The moduleFactory where this Alert should look for
		 *  its embedded fonts and style manager.
		 *  
		 *  @param labels A standard object that contains button label definitions.
		 *  Example:
		 *  <pre>{okLabel:"OK", cancelLabel:"Cancel", yesLabel:"Yes", noLabel:"No"}</pre>
		 *
		 *  @return A reference to the Alert control.
		 *
		 *  @see mx.events.CloseEvent
		 *
		 */
		public static function show(message:String = "", title:String = "", flags:uint = OK, parent:Sprite = null, closeHandler:Function = null,
									iconClass:Class = null, defaultButtonFlag:uint = Alert.OK, moduleFactory:IFlexModuleFactory = null,
									labels:Object = null):Alert {
			
			var modal:Boolean = (flags & Alert.NONMODAL) ? false : true;
			
			if (!parent) {
				var sm:ISystemManager = ISystemManager(FlexGlobals.topLevelApplication.systemManager);
				// no types so no dependencies
				var mp:Object = sm.getImplementation("mx.managers.IMarshallPlanSystemManager");
				if (mp && mp.useSWFBridge()) {
					parent = Sprite(sm.getSandboxRoot());
				} else {
					parent = Sprite(FlexGlobals.topLevelApplication);
				}
			}
			
			var alert:Alert = new Alert();
			alert.buttonsFlag = flags;
			alert.defaultButtonFlag = defaultButtonFlag;
			alert.buttonLabels = labels;
			
			alert.message = message;
			alert.title = title;
			alert.iconClass = iconClass;
			
			if (closeHandler != null) {
				alert.addEventListener(CloseEvent.CLOSE, closeHandler);
			}
			
			// Setting a module factory allows the correct embedded font to be found.
			if (moduleFactory) {
				alert.moduleFactory = moduleFactory;
			} else if (parent is IFlexModule) {
				alert.moduleFactory = IFlexModule(parent).moduleFactory;
			} else {
				if (parent is IFlexModuleFactory) {
					alert.moduleFactory = IFlexModuleFactory(parent);
				} else {
					alert.moduleFactory = FlexGlobals.topLevelApplication.moduleFactory;
				}
				
				// also set document if parent isn't a UIComponent
				if (!parent is UIComponent) {
					alert.document = FlexGlobals.topLevelApplication.document;
				}
			}
			
			alert.addEventListener(FlexEvent.CREATION_COMPLETE, staticCreationComplete);
			PopUpManager.addPopUp(alert, parent, modal);
			
			return alert;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Class event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		private static function staticCreationComplete(event:FlexEvent):void {
			if (event.target is IFlexDisplayObject && event.eventPhase == EventPhase.AT_TARGET) {
				var alert:Alert = Alert(event.target);
				alert.removeEventListener(FlexEvent.CREATION_COMPLETE, staticCreationComplete);
				alert.setActualSize(alert.getExplicitOrMeasuredWidth(), alert.getExplicitOrMeasuredHeight());
				PopUpManager.centerPopUp(alert);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 *
		 */
		public function Alert() {
			super();
			title = "";
			message = "";
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden properties
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  buttonFlags
		//----------------------------------
		
		private var _buttonsFlag:uint;
		
		/**
		 *  A bitmask that contains <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, and/or <code>Alert.NO</code> indicating
		 *  the buttons available in the Alert control.
		 *
		 *  @default Alert.OK
		 *
		 */
		public function get buttonsFlag():uint {
			return _buttonsFlag;
		}
		
		public function set buttonsFlag(flags:uint):void {
			_buttonsFlag = flags;
		}
		
		//----------------------------------
		//  defaultButtonFlag
		//----------------------------------
		
		
		
		/**
		 *  A bitflag that contains either <code>Alert.OK</code>,
		 *  <code>Alert.CANCEL</code>, <code>Alert.YES</code>,
		 *  or <code>Alert.NO</code> to specify the default button.
		 *
		 *  @default Alert.OK
		 *
		 */ 
		public function get defaultButtonFlag():int {
			 return _defaultButtonFlag;
		 }
		
		public function set defaultButtonFlag(value:int):void {
			_defaultButtonFlag = value;
		}
		
		//----------------------------------
		//  iconClass
		//----------------------------------
		private var _iconClass:Class;
		
		[Inspectable(category="Other")]
		
		/**
		 *  The class of the icon to display.
		 *  You typically embed an asset, such as a JPEG or GIF file,
		 *  and then use the variable associated with the embedded asset
		 *  to specify the value of this property.
		 *
		 *  @default null
		 *
		 */ 
		public function get iconClass():Class {
			 return _iconClass;
		 }
		
		public function set iconClass(value:Class):void {
			_iconClass = value;
		}
		
		//----------------------------------
		//  text
		//----------------------------------
		
		/**
		 *  The text to display in this alert dialog box.
		 *
		 *  @default ""
		 *
		 */ 
		public function get message():String {
			 return _message;
		 }
		
		public function set message(value:String):void {
			if (_message == value) {
				return;
			}
			_message = value;
			if (messageDisplay) {
				messageDisplay.text = _message;
				messageDisplay.maxHeight = 99;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		override public function styleChanged(styleProp:String):void {
			super.styleChanged(styleProp);
			var all:Boolean = ( !styleProp || styleProp == "styleName" );
			if (( all || styleProp == "buttonStyleName" ) && _buttons) {
				var buttonStyleName:String = getStyle("buttonStyleName");
				var n:int = _buttons.length;
				for (var i:int = 0; i < n; i++) {
					_buttons[ i ].styleName = buttonStyleName;
				}
			}
			if (( all || styleProp == "messageStyleName" ) && messageDisplay) {
				messageDisplay.styleName = getStyle("messageStyleName");
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			if (partName == "buttonGroup") {
				createButtons(Group(instance));
			}
			if (partName == "messageDisplay") {
				messageDisplay.text = message;
				messageDisplay.styleName = getStyle("messageStyleName");
			}
			if (partName == "iconGroup") {
				createIcon(Group(instance));
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void {
			super.partRemoved(partName, instance);
			if (partName == "buttonGroup") {
				destroyButtons(Group(instance));
			}
		}
		
		override public function set initialized(value:Boolean):void {
			super.initialized = value;
			setButtonFocus();
		}
		
		//--------------------------------------------------------------------------
		//
		//  private methods
		//
		//--------------------------------------------------------------------------
		/**
		 *  @private
		 */
		private function createIcon(container:Group):void {
			if (!container || !_iconClass) {
				return;
			}
			var iconHolder:UIComponent = new UIComponent();
			iconHolder.addChild(new _iconClass());
			container.addElement(iconHolder);
		}
		
		/**
		 *  @private
		 */
		private function createButtons(container:Group):void {
			if (!container || !buttonsFlag) {
				return;
			}
			_buttons = new Vector.<Button>();
			
			var btnFlags:Array = [YES,NO,OK,CANCEL];
			var buttonStyleName:String = getStyle("buttonStyleName");
			var button:Button;
			var numButtons:int = 0;
			
			bitFlagToButton = {};
			
			for each (var flag:uint in btnFlags)
			{
				if (Boolean(_buttonsFlag & flag)) {
					numButtons ++;
					button = new Button();
					if (buttonStyleName) {
						button.styleName = buttonStyleName;
					}
					button.label = getLabel(flag);
					button.useHandCursor = true;
					button.mouseChildren = false;
					button.buttonMode = true;
					button.width = buttonWidth;
					button.height = buttonHeight;
					button.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
					container.addElement(button);
					_buttons.push(button);
					bitFlagToButton[flag] = button;
				}
			}
			
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			setButtonFocus();
		}
		
		/**
		 *  @private
		 */
		private function destroyButtons(container:Group):void {
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			var button:Button;
			var numButtons:int = _buttons.length;
			for (var i:int = 0; i < numButtons; i++) {
				button = _buttons[ i ];
				button.removeEventListener(MouseEvent.CLICK, onButtonClick, false);
				if (container) {
					container.removeElement(button);
				}
			}
			_buttons = null;
			bitFlagToButton = null;
		}
		
		/**
		 *  @private
		 */
		private function getDefaultButton():Button 
		{
			if (bitFlagToButton.hasOwnProperty(_defaultButtonFlag)) 
				return bitFlagToButton[_defaultButtonFlag];
			return null;
		}
		
		/**
		 *  @private
		 */
		private function buttonToBitFlag(btn:Object):uint
		{
			for (var flag:* in bitFlagToButton)
			{
				if(bitFlagToButton[flag] === btn)
				{
					return flag;
				}
			}
			return uint.MAX_VALUE;
		}
		
		/**
		 *  @private
		 */
		private function onButtonClick(event:MouseEvent):void {
			removeAlert(buttonToBitFlag(event.currentTarget));
		}
		
		/**
		 *  @private
		 */
		private function removeAlert(index:int):void {
			visible = false;
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE, false, false, index));
			PopUpManager.removePopUp(this);
			if (_buttons) {
				destroyButtons(buttonGroup);
			}
		}
		
		/**
		 *  @private
		 */
		private function setButtonFocus():void {
			if (!initialized) {
				return;
			}
			var sm:ISystemManager = systemManager;
			var awm:IActiveWindowManager = IActiveWindowManager(sm.getImplementation("mx.managers::IActiveWindowManager"));
			if (awm) {
				awm.activate(this);
			}
			if (_buttons) {
				var button:Button = getDefaultButton();
				if (button) {
					button.setFocus();
					button.drawFocus(true);
				}
			}
		}
		
		private function getFlagForEscapeKey():uint
		{
			if(_buttonsFlag & CANCEL)
				return CANCEL;
			if(_buttonsFlag & NO)
				return NO;
			
			return _defaultButtonFlag;
		}
		
		/**
		 * @private
		 */
		private function onKeyDown(e:KeyboardEvent):void {
			if (e.charCode == Keyboard.ESCAPE) {
				removeAlert(getFlagForEscapeKey());
			}
		}
	}
}