package testdata.serialize
{
	public class Deserializer_fromJSON_14
	{
		public var field1:String;
		public var field2:int;
		public var field3:Boolean;
		public function Deserializer_fromJSON_14(source:Object=null)
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