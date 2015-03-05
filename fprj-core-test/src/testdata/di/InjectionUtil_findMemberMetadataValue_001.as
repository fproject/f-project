package testdata.di
{
	import spark.components.Label;
	
	public class InjectionUtil_findMemberMetadataValue_001
	{
		[Abc(a="A",b="b",c="c")]
		[Def("def")]
		[Ghi]
		public var label:Label;
		
		public function InjectionUtil_findMemberMetadataValue_001()
		{
			label = new Label();
			label.id = 'label';
		}
	}
}