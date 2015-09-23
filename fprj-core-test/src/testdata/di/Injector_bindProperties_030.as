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
	public class Injector_bindProperties_030 extends SkinnableContainer
	{
		[Bindable]
		public var employee:TestUser;
		
		[Bindable]
		public var employee2:TestUser;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="!isBefore2000(employee.birthDay@)")]
		public var textInput:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="!isBefore2000(employee2.birthDay)")]
		public var textInput2:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="!mx.utils.ObjectUtil.isSimple(employee.profile@)")]
		public var textInput3:TextInput;
		
		public function Injector_bindProperties_030()
		{
			employee2 = new TestUser({birthDay:new Date(1999,0,1), activated:true});
			this.setStyle("skinClass", Injector_bindProperties_030Skin);
		}
		
		public function isBefore2000(d:Date):Boolean
		{
			return d != null && d.fullYear < 2000;
		}
		
		public function view_initialize(e:Event):void
		{
			employee = new TestUser({birthDay:new Date(2000,0,1), activated:true});
			employee.profile = new TestUserProfile;
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}