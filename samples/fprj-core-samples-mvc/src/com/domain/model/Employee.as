package com.domain.model
{
	import net.fproject.mvc.model.LocalUID;

	public class Employee extends LocalUID
	{
		[Bindable]
		public var id:String;
		[Bindable]
		public var name:String;
		[Bindable]
		public var age:Number;
		[Bindable]
		public var phone:String;
		public function Employee(src:Object=null)
		{
			if(src != null)
			{
				this.id = src.id;
				this.name = src.name;
				this.age = src.age;
				this.phone = src.phone;
			}
		}
	}
}