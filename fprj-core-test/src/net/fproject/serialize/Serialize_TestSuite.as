package net.fproject.serialize
{
	import net.fproject.rpc.Deserializer_getInstance;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class Serialize_TestSuite
	{
		public var jsondatautilGetinstance:Deserializer_getInstance;
		public var jsondatautilObjecttojson:Serializer_toJSON;
		public var jsondatautilObjectfromjson:Deserializer_fromJSON;
	}
}