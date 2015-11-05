package testdata
{
	public class UserDepartmentAssignment
	{
		public function UserDepartmentAssignment(src:Object=null)
		{
			if(src != null)
			{
				for (var s:String in src)
				{
					if(this.hasOwnProperty(s))
						this[s] = src[s];
				}
			}
		}
		
		[Bindable]
		public var userId:String;
		[Bindable]
		public var departmentId:String;
		[Bindable]
		public var _isInserting:Boolean;
	}
}