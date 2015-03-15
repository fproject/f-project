package testdata.di
{
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.DropDownList;
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	
	import testdata.TestUser;

	[EventHandling(event="initialize",handler="view_initialize")]
	public class Injector_bindProperties_027 extends SkinnableContainer
	{
		[Bindable]
		public var employees:ArrayCollection;
		
		[Bindable]
		public var selectedEmployee:TestUser;
		
		[SkinPart(required="true")]
		//[PropertyBinding(dataProvider="employees@", labelField="{name}")]
		[PropertyBinding(dataProvider="employees@")]
		[EventHandling(event="change",handler="dropDownList_change")]
		public var dropDownList:DropDownList;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="dropDownList.selectedItem.id@")]
		public var idTextInput:TextInput;
		
		[SkinPart(required="true")]
		//[PropertyBinding(text="selectedEmployee.name@")]
		public var nameTextInput:TextInput;
		
		public function Injector_bindProperties_027()
		{
			this.setStyle("skinClass", Injector_bindProperties_027Skin);
		}
		
		public function view_initialize(e:Event):void
		{
			employees = new ArrayCollection([
				new TestUser({id:1,username:"Peter Pan",age:10,phone:"0123456789"}),
				new TestUser({id:2,username:"Jesus Christ",age:20,phone:"8888888888"}),
				new TestUser({id:3,username:"Robin Hood",age:30,phone:"1111111111"}),
			]);
		}
		
		public function dropDownList_change(e:Event):void
		{
			selectedEmployee = dropDownList.selectedItem;
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}