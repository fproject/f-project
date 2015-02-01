package testdata.serialize
{
	public class Deserializer_fromJSON_16
	{
		public var field1:String;
		public var field2:Number;
		public var field3:Date;
		public var field4:XML;
		
		public var field5:Deserializer_fromJSON_14;
		
		[Transient]
		public var field99:Object;
		
		public function Deserializer_fromJSON_16(source:Object=null)
		{
			if(source != null)
			{
				field1 = source.field1;
				field2 = source.field2;
				field3 = source.field3;
			}
		}
	}
}