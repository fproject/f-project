package testdata.serialize
{
	public class Deserializer_fromJSON_15
	{
		public var field1:Date;
		public var field2:Date;
		public var field3:XML;
		public function Deserializer_fromJSON_15(source:Object=null)
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