package com.domain.gui.components
{
	import com.domain.model.Employee;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DropDownList;
	import spark.components.TextInput;

	[EventHandling(event="initialize",handler="view_initialize")]//Event handling of class instance
	public class FirstSubView extends SkinnableViewBase
	{
		[Bindable]
		public var employees:ArrayCollection;
		
		[Bindable]
		[PropertyBinding(phone="@phoneTextInput.text@")]//Inverse deffered binding
		public var selectedEmployee:Employee;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="employees@", labelField="{name}")]//dataProvider: defferd binding, labelField: literal binding
		[EventHandling(event="change",handler="dropDownList_change")]//Event handling of member variable
		public var dropDownList:DropDownList;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="selectedEmployee.age@")]
		public var ageTextInput:TextInput;
		
		[SkinPart(required="true")]
		public var phoneTextInput:TextInput;
		
		public function view_initialize(e:Event):void
		{
			employees = new ArrayCollection([
				new Employee({id:1,name:"Peter Pan",age:10,phone:"0123456789"}),
				new Employee({id:1,name:"Jesus Christ",age:20,phone:"8888888888"}),
				new Employee({id:1,name:"Robin Hood",age:30,phone:"1111111111"}),
			]);
		}
		
		public function dropDownList_change(e:Event):void
		{
			selectedEmployee = dropDownList.selectedItem;
		}
	}
}