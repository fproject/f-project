///////////////////////////////////////////////////////////////////////////////
//
// © Copyright f-project.net 2010-present.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.gui.component
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	
	import net.fproject.reflect.ReflectionUtil;
	import net.fproject.utils.DataUtil;
	
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.Type;

	/**
	 * <p>
	 * The HotKey component helps to define hotkeys in you UI applications by using <code>[HotKeyDispatcher]</code> metadata.
	 * </p>
	 * 
	 * Example of Usage:
	 * <pre>
	 * SkinPart(required="true",type="static")]
	 * [HostKeyDispatcher(keyCode="flash.ui.Keyboard.INSERT",handler="addButton_click")]
	 * public var addButton:Button;</pre>
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class HotKey
	{
		public var host:IEventDispatcher;
		public var keyCode:uint;
		public var ctrlKey:Boolean;
		public var shiftKey:Boolean;
		public var altKey:Boolean;
		public var handler:Function;
		
		public var eventName:String;
		
		private static const HOT_KEY_DISPATCHER:String = "hostkeydispatcher";
		
		public static function attachHost(host:IEventDispatcher):void
		{
			var type:Type = Type.forInstance(host);
			
			var medaArr:Array = ReflectionUtil.getAllMembersMetadata(host, HOT_KEY_DISPATCHER);
			for each (var metaMember:Object in medaArr)
			{
				var hotKey:HotKey = new HotKey(host, metaMember);
				hotKey.attach();
			}			
		}
		
		protected function attach():void
		{
			host.addEventListener(eventName, onHotKeyEvent);
		}
		
		protected function onHotKeyEvent(e:Event):void
		{
			if(checkEvent(e))
				handler(e);
		}
		
		protected function checkEvent(e:Event):Boolean
		{
			if(e is KeyboardEvent)
			{
				var kbe:KeyboardEvent = KeyboardEvent(e);
				if(kbe.keyCode == this.keyCode && kbe.ctrlKey == this.ctrlKey && 
					kbe.shiftKey == this.shiftKey && kbe.altKey == this.altKey)
					return true;
			}
			return false;
		}
		
		public function HotKey(host:IEventDispatcher, metaMember:Object)
		{
			this.host = host;
			var firstMeta:Metadata = metaMember.metadata[0];
			if(!firstMeta.hasArgumentWithKey("keyCode"))
				throwMetaDefinitionError(metaMember);
			this.keyCode = DataUtil.evaluateChainValue(firstMeta.getArgument("keyCode").value, host)as uint;
			
			if(!firstMeta.hasArgumentWithKey("handler"))
				throwMetaDefinitionError(metaMember);
			this.handler = DataUtil.evaluateChainValue(firstMeta.getArgument("handler").value, host)as Function;
			
			if(firstMeta.hasArgumentWithKey("ctrlKey"))
				this.ctrlKey = DataUtil.evaluateChainValue(firstMeta.getArgument("ctrlKey").value, host)as Boolean;
			if(firstMeta.hasArgumentWithKey("shiftKey"))
				this.shiftKey = DataUtil.evaluateChainValue(firstMeta.getArgument("shiftKey").value, host)as Boolean;
			if(firstMeta.hasArgumentWithKey("altKey"))
				this.altKey = DataUtil.evaluateChainValue(firstMeta.getArgument("altKey").value, host)as Boolean;
			if(firstMeta.hasArgumentWithKey("eventName"))
				this.eventName = DataUtil.evaluateChainValue(firstMeta.getArgument("eventName").value, host)as String;
			else
				this.eventName = KeyboardEvent.KEY_UP;
		}
		
		private function throwMetaDefinitionError(metaMember:Object):void
		{
			throw new Error("Invalid [HotKeyDispatcher] definition for " + metaMember.name);
		}
	}
}