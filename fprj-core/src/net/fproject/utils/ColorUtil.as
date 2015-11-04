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

    public class ColorUtil
    {
        public static function getHSBColor(hue:Number, saturation:Number, brightness:Number) : uint
        {
            var r:uint = 0;
            var g:uint = 0;
            var b:uint = 0;
            if (saturation == 0)
            {
				r = g = b = uint(brightness * 255 + 0.5);
            }
            else
            {
				var h:Number = (hue - Math.floor(hue)) * 6;
				var f:Number = h - Math.floor(h);
				var p:Number = brightness * (1 - saturation);
				var q:Number = brightness * (1 - saturation * f);
				var t:Number = brightness * (1 - saturation * (1 - f));
                switch(uint(h))
                {
                    case 0:
                    {
                        r = uint(brightness * 255 + 0.5);
                        g = uint(t * 255 + 0.5);
                        b = uint(p * 255 + 0.5);
                        break;
                    }
                    case 1:
                    {
                        r = uint(q * 255 + 0.5);
                        g = uint(brightness * 255 + 0.5);
                        b = uint(p * 255 + 0.5);
                        break;
                    }
                    case 2:
                    {
                        r = uint(p * 255 + 0.5);
                        g = uint(brightness * 255 + 0.5);
                        b = uint(t * 255 + 0.5);
                        break;
                    }
                    case 3:
                    {
                        r = uint(p * 255 + 0.5);
                        g = uint(q * 255 + 0.5);
                        b = uint(brightness * 255 + 0.5);
                        break;
                    }
                    case 4:
                    {
                        r = uint(t * 255 + 0.5);
                        g = uint(p * 255 + 0.5);
                        b = uint(brightness * 255 + 0.5);
                        break;
                    }
                    case 5:
                    {
                        r = uint(brightness * 255 + 0.5);
                        g = uint(p * 255 + 0.5);
                        b = uint(q * 255 + 0.5);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return r << 16 | g << 8 | b;
        }

        public static function uintToRGB(color:uint) : Object
        {
            return {r:(color & 16711680) >> 16, g:(color & 65280) >> 8, b:color & 255};
        }

		public static function uintToRGBArray(color:uint) : Array
		{
			return [(color & 16711680) >> 16, (color & 65280) >> 8, color & 255];
		}
		
        public static function RGBToUint(color:Object) : uint
        {
            return color.r << 16 | color.g << 8 | color.b;
        }

		public static function RGBValuesToUint(r:uint, g:uint, b:uint) : uint
		{
			return r << 16 | g << 8 | b;
		}
		
		public static function uintToHex(color:uint) : String
		{
			var u:uint = 0;
			var s:String = "";
			var i:int = 0;
			while(i < 24)
			{
				u = color;
				u = u >> i;
				s = (u & 15).toString(16) + s;
				i = i + 4;
			}
			return s;
		}
		
		public static function hexToUint(hex:String) : uint
		{
			return parseInt(hex,16);
		}
		
        public static function addAlpha(color:uint, alpha:Number) : uint
        {
            color = color | (alpha * 255 & 255) << 24;
            return color;
        }
    }
}
