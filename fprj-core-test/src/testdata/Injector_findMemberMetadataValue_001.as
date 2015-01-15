package testdata
{
	import spark.components.Label;
	
	public class Injector_findMemberMetadataValue_001
	{
		[Abc(a="A",b="b",c="c")]
		[Def("def")]
		[Ghi]
		public var label:Label;
		
		public function Injector_findMemberMetadataValue_001()
		{
			label = new Label();
			label.id = 'label';
		}
	}
}