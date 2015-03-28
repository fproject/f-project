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
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="employees@", labelField="{name}")]//dataProvider: deffered binding, labelField: literal binding
		[PropertyBinding(hostChain="selectedItem", selectedItem="@phoneTextInput.text@")]//deffered inverse binding with hostChain specified
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
			this.employees = new ArrayCollection([
				new Employee({id:1,name:"Peter Pan",age:10,phone:"0123456789"}),
				new Employee({id:2,name:"Jesus Christ",age:20,phone:"8888888888"}),
				new Employee({id:3,name:"Robin Hood",age:30,phone:"1111111111"}),
			]);
		}
	}
}