///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;

	public class MathUtil
	{
		public static function xor(arr1:ArrayCollection, arr2:ArrayCollection):ArrayCollection
		{
			if (arr2 == null) 
				return null;
			
			if (arr1 == null)
			{
				arr1 = new ArrayCollection();
				for each (var bit:Boolean in arr2)
				{
					arr1.addItem(bit);
				}
			}
			else
			{
			
				var bit1:Boolean;
				var bit2:Boolean;
				
				for (var index:int =0;index< Math.max(arr2.length,arr1.length);index++)
				{
				
					if (index < arr2.length)
					{
						bit2 = arr2.getItemAt(index);
					}
					else
					{
						bit2 = false;
					}
					
					if (index < arr1.length)
					{
						bit1 = arr1.getItemAt(index);
						arr1.setItemAt(bit1 || bit2,index);
					}
					else
					{
						bit1 = false;
						arr1.addItem(bit1 || bit2);
					}
					
				}		
			}
			return arr1;
		}
		
		public static function byArrayToArrayCollection(byteArray:ByteArray):ArrayCollection
		{
			if 	(byteArray == null) return null;
			var ret:ArrayCollection = new ArrayCollection();
			
			var byArrString:String = byteArray.toString();
		
			for (var index:int =0; index < byArrString.length;index++)
			{
				ret.addItem(byArrString.charAt(index) == '1' ? true:false);
			}
			return ret;
		}
		
/*		public static function setBit(data:ByteArray , pos:int ,val:int):ByteArray
		{
			var posByte:int = pos/8; 
			var posBit:int = pos%8;
			var ret:ByteArray = new ByteArray();
			data.readBytes(ret,posByte,1);
			var oldByte:int = ret.readByte();
			oldByte = (((0xFF7F>>posBit) & oldByte) & 0x00FF);
			var newByte:int = ((val<<(8-(posBit+1))) | oldByte);
			ret.clear();
			ret.writeByte(newByte);
			data.writeBytes(ret);
			return data;
		}*/
		
		public static function sign(n:Number) : int
		{
			if (n < 0)
			{
				return -1;
			}
			if (n > 0)
			{
				return 1;
			}
			return 0;
		}// end function
	}
}