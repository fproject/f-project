package com.domain.gui.components
{
	import com.domain.model.Employee;
	import com.domain.service.EmployeeService;
	
	import flash.events.Event;
	
	import spark.components.DropDownList;
	import spark.components.TextInput;
	
	import net.fproject.active.ActiveDataProvider;

	[EventHandling(event="initialize",handler="view_initialize")]//Event handling of class instance
	public class FirstSubView extends SkinnableViewBase
	{
		[Bindable]
		public var employees:ActiveDataProvider;
		
		[Bindable]
		public var selectedEmployee:Employee;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="employees@", labelField="'name'")]//dataProvider: deffered binding, labelField: literal binding
		[PropertyBinding(hostChain="selectedItem", phone="@phoneTextInput.text@")]//deffered inverse binding with hostChain specified
		[PropertyBinding(selectedItem='selectedEmployee@')]
		public var dropDownList:DropDownList;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="dropDownList.selectedItem.id@")]
		public var idTextInput:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="dropDownList.selectedItem.name@")]
		public var nameTextInput:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="dropDownList.selectedItem.age@")]
		public var ageTextInput:TextInput;
		
		[SkinPart(required="true")]
		public var phoneTextInput:TextInput;
		
		public function view_initialize(e:Event):void
		{
			employees = EmployeeService.instance.createDataProvider({}) as ActiveDataProvider;
			selectedEmployee = new Employee({id:'1', name:'ABC'});
		}
	}
}