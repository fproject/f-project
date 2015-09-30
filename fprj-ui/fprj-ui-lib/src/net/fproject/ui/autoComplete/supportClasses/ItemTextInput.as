package net.fproject.ui.autoComplete.supportClasses
{
	import flash.events.FocusEvent;
	import flash.text.TextLineMetrics;
	
	import spark.components.TextInput;

	public class ItemTextInput extends TextInput
	{
		/**
		 * Here's the problem. The DEFAULT_MEASURED_MIN_HEIGHT constant has a value of 22, which is the height
		 * of the TextInput at a font size of 10px. The issue is we draw the border on the FlowBox so it adds
		 * padding which means at smaller font size the AutoComplete component is taller than a TextInput
		 * at the same font size. To resolve this we're overriding the measure function and changing the
		 * min height to 18
		 */
		override protected function measure():void
		{
			super.measure();
			
			var pt:Number = getStyle('paddingTop');
			if(isNaN(pt))
				pt = 0;
			var pb:Number = getStyle('paddingBottom');
			if(isNaN(pb))
				pb = 0;
			var tn:Number = getStyle('borderThickness');
			if(isNaN(tn))
				tn = 0;
			
			var lineMetrics:TextLineMetrics = (!text || text == "") ? measureText(" ") : measureText(text);
			
			var h:Number = lineMetrics.height + pt + pb;
			
			measuredHeight = Math.max(h - 2*tn, DEFAULT_MEASURED_MIN_HEIGHT);
			measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
		}	
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			// prevent the border from beeing drawn
		}
	}
}