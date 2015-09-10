///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.flatspark.mobile
{
	import com.flextras.mobile.autoCompleteComboBox.skins.AutoCompleteComboBoxMobileSkin_Default;
	
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	import spark.components.Button;
	import spark.components.DataGroup;
	import spark.components.Group;
	import spark.components.PopUpAnchor;
	import spark.components.PopUpPosition;
	import spark.components.Scroller;
	import spark.components.TextInput;
	import spark.layouts.VerticalLayout;

	public class FlextrasAutoCompleteComboBoxSkin extends AutoCompleteComboBoxMobileSkin_Default
	{
		public function FlextrasAutoCompleteComboBoxSkin()
		{
			openButtonSkin = FlextrasDownArrowSkin; 
		}
		
		/**
		 * @private 
		 */
		override protected function createChildren():void{
			super.createChildren();
			// Globally in this method; some of the properties are copied from the ComboBoxSkin approach
			// but modified for this usage.
			
			// create the open button
			this.openButton = new Button();
			this.openButton.focusEnabled = false;
			this.openButton.right = 0;
			this.openButton.top = 0;
			this.openButton.bottom = 0;
			this.openButton.setStyle('skinClass',openButtonSkin);
			this.addChild(this.openButton);
			
			// create the textInput
			this.textInput = new TextInput();
			this.textInput.left = 0;
			this.textInput.top = 0;
			this.textInput.bottom = 0;
			var styleDec:CSSStyleDeclaration = StyleManager.getStyleManager(null).getStyleDeclaration('flextrasAutoCompleteTextInput');
			if(styleDec)
			{
				this.textInput.setStyle('skinClass', styleDec.getStyle('textInputSkinClass'));
			}
			
			this.addChild(this.textInput);
			
			
			// create the pop up anchor for the drop down
			this.popUp = new PopUpAnchor();
			this.popUp.left = 0;
			this.popUp.right = 0;
			this.popUp.top = 0;
			this.popUp.bottom = 0;
			this.popUp.setStyle('itemDestructionPolicy','auto');
			this.popUp.popUpPosition = PopUpPosition.TOP_LEFT;
			this.popUp.popUpWidthMatchesAnchorWidth = true;
			
			// create the drop down; this is just a container for other children such as the scroller and data group
			this.dropDown = new Group();
			
			// create the scroller from the drop down
			this.scroller = new Scroller();
			this.scroller.left = 0;
			this.scroller.top = 0;
			this.scroller.right = 0;
			this.scroller.bottom = 0;
			this.scroller.hasFocusableChildren = false;
			this.scroller.minViewportInset = 1;
			
			// create the dataGroup which contains the list elements of the drop down
			this.dataGroup = new DataGroup();
			var dgLayout : VerticalLayout = new VerticalLayout();
			dgLayout.gap = 0;
			dgLayout.horizontalAlign = 'contentJustify';
			dgLayout.requestedRowCount = this.getStyle('requestedRowCount');
			
			this.dataGroup.layout = dgLayout;
			this.scroller.viewport = this.dataGroup;
			
			this.dropDown.addElement(this.scroller);
			
			this.popUp.popUp =  this.dropDown;
			this.addChild(this.popUp);
			
		}
	}
}