package testdata
{
	public class Serializer_toJSON_001
	{
		public var field1:String;
		public var field2:int;
		public var field3:Boolean;
		public var field4:Date;
		public var field5:XML;
		
		public function Serializer_toJSON_001(source:Object=null)
		{
			if(source != null)
			{
				field1 = source.field1;
				field2 = source.field2;
				field3 = source.field3;
				field4 = source.field4;
				field5 = source.field5;
			}
		}
	}
}