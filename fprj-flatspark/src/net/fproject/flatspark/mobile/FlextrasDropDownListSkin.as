package net.fproject.flatspark.mobile
{
	import com.flextras.mobile.dropDownList.skins.DropDownListMobileSkin_Default;
	
	public class FlextrasDropDownListSkin extends DropDownListMobileSkin_Default
	{
		public function FlextrasDropDownListSkin()
		{
			openButtonSkin  = FlextrasDownArrowSkin;
		}
		
		/**
		 * @private 
		 */
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			super.drawBackground(unscaledWidth, unscaledHeight);
			
			// background creation approach modeled after List Skin
			if(this.popUp){
				this.popUp.graphics.clear();
				this.dropDown.graphics.clear();
				if(this.popUp.displayPopUp == true){
					var borderWidth:int = getStyle("borderVisible") ? 1 : 0;
					
					this.popUp.graphics.beginFill(getStyle("contentBackgroundColor"), getStyle("contentBackgroundAlpha"));
					this.popUp.graphics.drawRect(borderWidth, borderWidth, this.popUp.width - 2 * borderWidth, this.popUp.height - 2 * borderWidth);
					this.popUp.graphics.endFill();
					
					// JH DotComIt 10/29/2011
					// adding this code in an attempt to fix the issue where the background is transparent and stuff "under it" shows through
					this.dropDown.graphics.beginFill(getStyle("contentBackgroundColor"), getStyle("contentBackgroundAlpha"));
					this.dropDown.graphics.drawRect(borderWidth, borderWidth, this.popUp.width - 2 * borderWidth, this.popUp.height - 2 * borderWidth);
					this.dropDown.graphics.endFill();
					
					
					if (getStyle("borderVisible"))
					{
						// changing this code from this.popIp to this.dropDown in order to address issue
						// where border has breaks in it if something is underneath it. (Reported by Jarek S)
						this.dropDown.graphics.lineStyle(1, getStyle("borderColor"), getStyle("borderAlpha"), true); 
						this.dropDown.graphics.drawRect(0, 0, this.popUp.width - 1, this.popUp.height - 1);
					}
					
				}
				
			}
			
		}
	}
}