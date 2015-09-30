///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of ProjectKit
//
// Copyright © 2014 ProjectKit. All Rights Reserved.
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