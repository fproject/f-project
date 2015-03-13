package testdata.di
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	
	import testdata.rpc.TestUser;

	[EventHandling(event="initialize",handler="view_initialize")]//Event handling of class instance
	public class Injector_bindProperties_021 extends SkinnableContainer
	{
		[Bindable]
		public var selectedUser:TestUser = new TestUser({id:1,username:"Peter Pan"});
		
		[SkinPart(required="true")]
		[PropertyBinding(text="selectedUser.id@")]
		public var idTextInput:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="selectedUser.username@")]
		public var nameTextInput:TextInput;
		
		public function Injector_bindProperties_021()
		{
			this.setStyle("skinClass", Injector_bindProperties_021Skin);
		}
		
		public function view_initialize(e:Event):void
		{
			selectedUser = new TestUser({id:2,username:"Robin Hood"});
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}