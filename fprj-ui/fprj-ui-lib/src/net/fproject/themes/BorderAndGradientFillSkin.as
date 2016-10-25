package net.fproject.themes
{
	import mx.core.mx_internal;
	import mx.graphics.GradientEntry;
	import mx.graphics.IFill;
	import mx.graphics.LinearGradient;
	
	public class BorderAndGradientFillSkin extends AdvancedBorderSkin
	{
		protected var _backgroundFillColors:Array;
		
		protected var _verticalBackground:Boolean;
		
		protected var backgroundFillColorsChanged:Boolean;
		
		protected var verticalBackgroundChanged:Boolean;
		
		private function parseColorArray(colors:Object):Array
		{
			if(!(colors is Array))
			{
				if(colors is Number)
				{
					colors = [colors];
				}
				else
				{
					var s:String = colors as String;
					if(s)
					{
						var a:Array = s.split(",");
						var b:Array = [];
						for each (s in a)
						{
							if(s.charAt(0) == "#")
								b.push(parseInt(s.substr(1), 16));
							else
								b.push(parseInt(s, 10));
						}
						colors = b;
					}
				}				
			}
			return colors as Array;
		}
		
		override protected function commitProperties() : void
		{
			var b:* = mx_internal::invalidateDisplayListFlag;
			mx_internal::invalidateDisplayListFlag = true;
			super.commitProperties();
			mx_internal::invalidateDisplayListFlag = b;
			
			var dirty:Boolean = false;
			
			if(backgroundFillColorsChanged)
			{
				backgroundFillColorsChanged = false;
				this._backgroundFillColors = parseColorArray(getStyle("backgroundFillColors"));
				dirty = true;
			}
			
			if(verticalBackgroundChanged)
			{
				verticalBackgroundChanged = false;
				this._verticalBackground = getStyle("verticalBackground");
				dirty = true;
			}
			
			if(dirty)
			{
				invalidateDisplayList();
			}
		}
		
		override public function styleChanged(styleProp:String) : void
		{
			if(styleProp == null || styleProp == "backgroundFillColors")
				backgroundFillColorsChanged = true;
			if(styleProp == null || styleProp == "verticalBackground")
				verticalBackgroundChanged = true;
			
			var b:* = mx_internal::invalidatePropertiesFlag;
			mx_internal::invalidatePropertiesFlag = true;
			super.styleChanged(styleProp);
			mx_internal::invalidatePropertiesFlag = b;
			
			invalidateProperties();
		}
		
		override protected function createBackgroundFill() : IFill
		{
			var f:LinearGradient = new LinearGradient();
			f.rotation = 90;
			this.backgroundFill = f;
			updateBackgroundFillEntries();
			return super.createBackgroundFill();;
		}
		
		protected function updateBackgroundFillEntries():void
		{
			if(_backgroundFillColors == null)
				_backgroundFillColors = [0xEDEDED, 0xC6C6C6];
			var entries:Array = LinearGradient(backgroundFill).entries;
			var i:int = 0;
			for each(var c:uint in _backgroundFillColors)
			{
				if(i == entries.length)
				{
					var e:GradientEntry = new GradientEntry();
					if(_backgroundFillColors.length > 1)
						e.ratio = i / (_backgroundFillColors.length - 1);
					else
						e.ratio = 1;
					entries.push(e);
				}
				else
					e = entries[i];
				e.color = c;
				e.alpha = isNaN(_backgroundAlpha) ? 1 : _backgroundAlpha;
				
				i++;
			}
			if(i > 0 && i < entries.length)
				entries = entries.slice(0, i - 1);
			LinearGradient(backgroundFill).entries = entries;
		}
		
		override protected function updateDisplayList(uw:Number, uh:Number) : void
		{
			if(this.background)
			{
				if(this.backgroundFill)
					updateBackgroundFillEntries();
				
				if(_verticalBackground)
					this.background.rotation = 270;
				else
					this.background.rotation = 0;
			}
			
			super.updateDisplayList(uw,uh);
		}
	}
}