package testdata
{
	public class Serializer_toJSON_003
	{
		public var field1:String;
		public var field2:int;
		public var field3:Boolean;
		
		[Transient]
		public var field99:Object;
		public function Serializer_toJSON_003(source:Object=null)
		{
			if(source != null)
			{
				field1 = source.field1;
				field2 = source.field2;
				field3 = source.field3;
				field99 = source.field99;
			}
		}
	}
}