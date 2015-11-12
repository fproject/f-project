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
	import flash.system.ApplicationDomain;
	
	import mx.binding.utils.BindingUtils;
	
	import spark.events.SkinPartEvent;
	
	import net.fproject.di.Injector;
	import net.fproject.reflect.ReflectionUtil;
	import net.fproject.utils.DataUtil;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.Metadata;
	
	/**
	 * <p>
	 * The HotKey component helps to define hotkeys in you UI applications by using <code>[HotKeyDispatcher]</code> metadata.
	 * </p>
	 * 
	 * Example of Usage:
	 * <pre>
	 * SkinPart(required="true",type="static")]
	 * [HotKeyDispatcher(keyCode="flash.ui.Keyboard.INSERT",handler="addButton_click")]
	 * public var addButton:Button;</pre>
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class HotKey
	{
		/**
		 * The host (container) object 
		 */
		public var host:IEventDispatcher;
		
		/**
		 * Specify value for the <code>keyCode</code> field of <code>KeyboardEvent</code>
		 */
		public var keyCode:uint;
		
		/**
		 * Specify value for the <code>ctrlKey</code> field of <code>KeyboardEvent</code>
		 */
		public var ctrlKey:Boolean;
		
		/**
		 * Specify value for the <code>shiftKey</code> field of <code>KeyboardEvent</code>
		 */
		public var shiftKey:Boolean;
		
		/**
		 * Specify value for the <code>altKey</code> field of <code>KeyboardEvent</code>
		 */
		public var altKey:Boolean;
		
		/**
		 * The event handler of dispatcher member object's event.
		 * 
		 */
		public var handler:Function;
		
		/**
		 * The type of event that dispatcher member object will dispatch.
		 * If value for this field is set, the <code>handler</code> field will be ignored.
		 */		
		public var event:String;
		
		/**
		 * The type of event that will be listened from host object
		 */
		public var sourceEvent:String;
		
		/**
		 * The member of <code>host</code> that dispatchs hot key event when the <code>host</code>
		 * received keyboard event from user interaction
		 */
		public var dispatcher:IEventDispatcher;
		
		/**
		 * The member name of <code>dispatcher</code>.
		 */
		public var dispatcherName:String;
		
		/**
		 * Whether <code>dispatcher</code> is a member of <code>host</code> that has [Bindable] metadata 
		 */		
		protected var isBindable:Boolean;
		
		/**
		 * Whether <code>dispatcher</code> is a member of <code>host</code> that has [SkinPart] metadata 
		 */
		protected var isSkinPart:Boolean;
		
		/**
		 * The metadata name for [HotKeyDispatcher]
		 */
		private static const HOT_KEY_DISPATCHER:String = "hotkeydispatcher";
		
		public static function attachHost(host:IEventDispatcher):void
		{
			var medaArr:Array = ReflectionUtil.getAllMembersMetadata(host, HOT_KEY_DISPATCHER, 
				function(m:AbstractMember, metaMember:Object):void
				{
					for each(var meta:Metadata in m.metadata)
					{
						if(meta.name.toLowerCase() == Injector.SKIN_PART)
							metaMember.isSkinPart = true;
						else if(meta.name.toLowerCase() == Injector.BINDABLE)
							metaMember.isBindable = true;
					}
				});
			
			for each (var metaMember:Object in medaArr)
			{
				var hotKey:HotKey = new HotKey(host, metaMember);
				
				hotKey.attach();
			}			
		}
		
		protected function attach():void
		{
			host.addEventListener(sourceEvent, onHotKeyEvent);
			dispatcher = host[dispatcherName];
			if(this.isSkinPart)
			{
				host.addEventListener(SkinPartEvent.PART_ADDED, onHostPartAdded);
			}
			else if(this.isBindable)
			{
				BindingUtils.bindSetter(onDispatcherSet, host, dispatcherName);
			}
		}
		
		protected function onHostPartAdded(e:SkinPartEvent):void
		{
			if(e.partName == this.dispatcherName)
				dispatcher = e.instance as IEventDispatcher;
		}
		
		protected function onDispatcherSet(v:Object):void
		{
			dispatcher = v as IEventDispatcher;
		}
		
		private var eventInfo:Object;
		
		protected function onHotKeyEvent(e:Event):void
		{
			if(checkEvent(e))
			{
				if(eventInfo == null)
				{
					if (!StringUtil.isBlank(event))
					{
						var lastDotPos:int = event.lastIndexOf(".");
						if(lastDotPos > 0 && lastDotPos < event.length - 1)
						{
							var eventClassName:String = event.substring(0, lastDotPos);
							if(ApplicationDomain.currentDomain.hasDefinition(eventClassName))
							{
								eventInfo = {eventClass:ApplicationDomain.currentDomain.getDefinition(eventClassName) as Class};
								eventInfo.eventType = eventClass[event.substring(lastDotPos + 1)];
							}
						}
					}
				}
				
				if(eventInfo != null)
				{
					var eventClass:Class = eventInfo.eventClass;
					var evtType:String = eventInfo.eventType;
					var evt:Event = new eventClass(evtType);
					dispatcher.dispatchEvent(evt);
				}
				
				else handler(e);
			}
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
			this.dispatcherName = metaMember.name;
			
			if(metaMember.hasOwnProperty("isBindable"))
				this.isBindable = metaMember.isBindable;
			if(metaMember.hasOwnProperty("isSkinPart"))
				this.isSkinPart = metaMember.isSkinPart;
			
			var firstMeta:Metadata = metaMember.metadata[0];
			if(!firstMeta.hasArgumentWithKey("keyCode"))
				throwMetaDefinitionError(metaMember);
			this.keyCode = DataUtil.evaluateChainValue(firstMeta.getArgument("keyCode").value, host)as uint;
			
			if(firstMeta.hasArgumentWithKey("handler"))
				this.handler = DataUtil.evaluateChainValue(firstMeta.getArgument("handler").value, host)as Function;
			if(firstMeta.hasArgumentWithKey("event"))
				this.event = firstMeta.getArgument("event").value;
			
			if(this.handler == null && this.event == null)
				throwMetaDefinitionError(metaMember);
			
			if(firstMeta.hasArgumentWithKey("ctrlKey"))
				this.ctrlKey = DataUtil.evaluateChainValue(firstMeta.getArgument("ctrlKey").value, host)as Boolean;
			if(firstMeta.hasArgumentWithKey("shiftKey"))
				this.shiftKey = DataUtil.evaluateChainValue(firstMeta.getArgument("shiftKey").value, host)as Boolean;
			if(firstMeta.hasArgumentWithKey("altKey"))
				this.altKey = DataUtil.evaluateChainValue(firstMeta.getArgument("altKey").value, host)as Boolean;
			if(firstMeta.hasArgumentWithKey("sourceEvent"))
				this.sourceEvent = DataUtil.evaluateChainValue(firstMeta.getArgument("sourceEvent").value, host)as String;
			else
				this.sourceEvent = KeyboardEvent.KEY_UP;
		}
		
		private function throwMetaDefinitionError(metaMember:Object):void
		{
			throw new Error("Invalid [HotKeyDispatcher] definition for " + metaMember.name);
		}
	}
}