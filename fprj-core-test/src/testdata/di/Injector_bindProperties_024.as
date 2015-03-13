package testdata.di
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.events.PropertyChangeEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	
	import testdata.TestUser;
	
	[EventHandling(event="initialize",handler="view_initialize")]//Event handling of class instance
	public class Injector_bindProperties_024 extends SkinnableContainer
	{
		[Bindable]
		public var object:Injector_bindProperties_022_Obj = 
			new Injector_bindProperties_022_Obj(
				{selectedUser: new TestUser({id:1,username:"Peter Pan"})});
		
		[SkinPart(required="true")]
		[PropertyBinding(text="object.selectedUser.id@")]
		public var idTextInput:TextInput;
		
		[SkinPart(required="true")]
		[PropertyBinding(text="object.selectedUser.username@")]
		public var nameTextInput:TextInput;
		
		public function Injector_bindProperties_024()
		{
			this.setStyle("skinClass", Injector_bindProperties_024Skin);
		}
		
		public function view_initialize(e:Event):void
		{
			object = new Injector_bindProperties_022_Obj(
				{selectedUser: new TestUser({id:2,username:"Robin Hood"})});
		}
		
		public function show():void
		{
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject);
		}
	}
}