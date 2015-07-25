package testdata.di
{
	import spark.components.Label;
	
	public class ReflectionUtil_findMemberMetadataValue_001
	{
		[Abc(a="A",b="b",c="c")]
		[Def("def")]
		[Ghi]
		public var label:Label;
		
		public function ReflectionUtil_findMemberMetadataValue_001()
		{
			label = new Label();
			label.id = 'label';
		}
	}
}