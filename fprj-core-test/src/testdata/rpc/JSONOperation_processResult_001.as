package testdata.rpc
{
	public class JSONOperation_processResult_001
	{
		public var field1:String;
		public var field2:int;
		public var field3:Boolean;
		public var field4:Date;
		public var field5:Date;
		public var field6:XML;
		public function JSONOperation_processResult_001(src:Object=null)
		{
			if(src != null)
			{
				field1 = src.field1;
				field2 = src.field2;
				field3 = src.field3;
				field4 = src.field4;
				field5 = src.field5;
				field6 = src.field6;
			}
		}
	}
}