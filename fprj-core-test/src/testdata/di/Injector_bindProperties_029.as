package testdata.di
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	
	import testdata.TestUser;

	[EventHandling(event="initialize",handler="view_initialize")]
	public class Injector_bindProperties_029 extends SkinnableContainer
	{
		[Bindable]
		public var employee:TestUser;
		
		[Bindable]
		public var employee2:TestUser;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="!employee.activated@")]
		public var activatedTextInput:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="!employee2.activated")]
		public var activatedTextInput2:TextInput;
		
		public function Injector_bindProperties_029()
		{
			employee2 = new TestUser({activated:true});
			this.setStyle("skinClass", Injector_bindProperties_029Skin);
		}
		
		public function view_initialize(e:Event):void
		{
			employee = new TestUser({activated:true});
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}