package testdata.di
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	
	import testdata.TestUser;
	import testdata.TestUserProfile;

	[EventHandling(event="initialize",handler="view_initialize")]
	public class Injector_bindProperties_032 extends SkinnableContainer
	{
		[Bindable]
		public var employee:TestUser;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="employee.profile.email@")]
		public var textInput:TextInput;
		
		public function Injector_bindProperties_032()
		{
			employee = new TestUser();
			employee.profile = new TestUserProfile;
			employee.profile.email = "def@xyz.com"
			this.setStyle("skinClass", Injector_bindProperties_032Skin);
		}
		
		public function view_initialize(e:Event):void
		{
			employee = new TestUser();
			employee.profile = new TestUserProfile;
			employee.profile.email = "abc@xyz.com"
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
		
		public function hide():void
		{
			PopUpManager.removePopUp(this);
		}
	}
}