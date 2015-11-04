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
package net.fproject.di
{
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.binding.utils.BindingUtils;
	import mx.events.PropertyChangeEvent;
	import mx.utils.UIDUtil;
	
	import spark.events.SkinPartEvent;
	
	import net.fproject.fproject_internal;
	import net.fproject.di.supportClasses.PropertyBindingHandler;
	import net.fproject.reflect.ReflectionUtil;
	import net.fproject.utils.DataUtil;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.Field;
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.MetadataArgument;
	import org.as3commons.reflect.Type;
	
	/**
	 * 
	 * Dependency Injection utility class
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class Injector
	{
		/**
		 * The <code>[AutoInstance]</code> metadata 
		 */
		public static const AUTO_INSTANCE:String = "autoinstance";
		
		/**
		 * The <code>[EventHandling]</code> metadata 
		 */
		public static const EVENT_HANDLING:String = "eventhandling";
		
		/**
		 * The <code>[PropertyBinding]</code> metadata 
		 */
		public static const PROPERTY_BINDING:String = "propertybinding";
		
		/**
		 * The <code>[SkinPart]</code> metadata 
		 */
		public static const SKIN_PART:String = "skinpart";
		
		/**
		 * The <code>[Bindable]</code> metadata 
		 */
		public static const BINDABLE:String = "bindable";
		
		/**
		 * Initialize dependency injection for a container object 
		 * @param container the object that will be injected.
		 * @param constructorParam the paramameter for constructor.
		 * If you pass a <code>Class</code> for this parameter, a new instance of the class 
		 * will be created and passed to the constructor.
		 * 
		 */
		public static function inject(container:Object):void
		{
			var injector:Injector = getInstance(container);
			injector.fproject_internal::instantiateMembers(container, true);
			injector.fproject_internal::attachEventListeners(container);
			injector.fproject_internal::bindProperties(container);
		}
		
		/**
		 * <p>Instantiate member variables of an container object by dependency injection.</p>
		 * In order to inject, the member must be declared by [AutoInstance] metatdata, follows
		 * this syntax:
		 * <pre>[AutoInstance(factory="interface implementation class")]</pre>
		 * Examples:<br/>
		 * <pre>
		 * [AutoInstance("net.projectkit.service.TaskService")]
		 * public var taskService:ITaskService;
		 * </pre>
		 * @param container the object that contains member variables to instantiate.
		 * @param constructorParam the paramameter for constructor.
		 * If you pass a <code>Class</code> for this parameter, a new instance of the class 
		 * will be created and passed to the constructor.
		 * 
		 */
		public static function instantiateMembers(container:Object, recursive:Boolean=true):void
		{
			var injector:Injector = getInstance(container);
			injector.fproject_internal::instantiateMembers(container, recursive);
		}
		
		/**
		 * The <code>factory</code> argument of <code>[AutoInstance]</code>  metadata 
		 */
		public static const FACTORY_KEY:String = "factory";
		
		private static var instantiatedContainer:Dictionary = new Dictionary(true);
		
		/**
		 * @private
		 * 
		 */
		fproject_internal function instantiateMembers(container:Object, recursive:Boolean):void
		{
			if(instantiatedContainer[container] != undefined)
				return;
			instantiatedContainer[container] = true;
			
			var type:Type = Type.forInstance(container);
			
			var members:Array = type.variables.concat(type.accessors);
			
			for each (var member:AbstractMember in members)
			{ 
				for each (var metadata:Metadata in member.metadata)
				{
					if (metadata.name == AUTO_INSTANCE)
					{
						var implClassName:String = getMetadataArgument(metadata, FACTORY_KEY, 0);
						if(implClassName == null)
							var cls:Class = member.type.clazz as Class;
						else
							cls = getDefinitionByName(implClassName) as Class;
						
						if(cls != null)
						{
							var instance:Object = container[member.name] = InstanceFactory.getInstance(cls);
							if(recursive)
								this.fproject_internal::instantiateMembers(instance, recursive);
						}
						
						break;
					}
				}
			}
			
		}
		
		/**
		 * <p>Attach event handler (listener) for member variables of an container object by dependency injection.</p>
		 * In order to inject, the member must be declared by [EventHandling] metatdata, follows
		 * this syntax:
		 * <pre>[EventHandling(event="event name", "event handler method")]</pre>
		 * Examples:<br/>
		 * <pre>
		 * [EventHandling(event="mx.events.FlexEvent.VALUE_COMMIT",handler="tab_valueCommit")]
		 * public var tab:TabNavigator;
		 * </pre>
		 * 
		 * @param container the object that contains member variables to inject.
		 * 
		 * @param constructorParam the paramameter for constructor. Each interface implementation
		 * must has constructor with at most one parameter.
		 * 
		 */
		public static function attachEventListeners(container:Object):void
		{
			var injector:Injector = getInstance(container);
			injector.fproject_internal::attachEventListeners(container);
		}
		
		/**
		 * @private
		 */
		fproject_internal function attachEventListeners(container:Object):void
		{
			var type:Type = Type.forInstance(container);
			
			var members:Array = type.variables.concat(type.accessors);
			
			var nameToMemberInfo:Object = {};
			var handlingMemberInfoArr:Array = [];
			
			var thisInfo:Object = getMemberEventHandlingInfo(container,
				{name:THIS, metadata:ReflectionUtil.getAllExtendsClassMetadata(type)});
			
			if(thisInfo != null)
			{
				for each (var evt:Object in thisInfo.eventInfo)
				{
					if(evt.chain.length > 0)
					{
						var memberInfo:* = nameToMemberInfo[evt.chain[0]];
						if (memberInfo == undefined)
							nameToMemberInfo[evt.chain[0]] = memberInfo = {eventInfo:[], isBindable:false, isSkinPart:false};
						(memberInfo.eventInfo as Array).push(evt);
					}
					else if(container is IEventDispatcher)
						IEventDispatcher(container).addEventListener(
							evt.listenerInfo.event, evt.listenerInfo.handler, evt.listenerInfo.useCapture);
					else
						LoggingUtil.fproject_internal::error(Injector, 4, "invalid.dispatcher.error", [container]);
				}
			}			
			
			for each (var member:AbstractMember in members)
			{ 
				var mi:Object = getMemberEventHandlingInfo(container, member);
				
				memberInfo = nameToMemberInfo[member.name];
				
				if(memberInfo == undefined && mi == null)
					continue;
				
				if(memberInfo == undefined)
					nameToMemberInfo[member.name] = memberInfo = mi;
				else if(mi != null)
				{
					if(mi.isBindable)
						memberInfo.isBindable = true;
					if(mi.isSkinPart)
						memberInfo.isSkinPart = true;
					memberInfo.eventInfo =
						(memberInfo.eventInfo as Array).concat(mi.eventInfo);
				}
				
				if(memberInfo != undefined && memberInfo.eventInfo.length > 0)
					handlingMemberInfoArr.push(memberInfo);
			}
			
			for each (memberInfo in handlingMemberInfoArr)
			{ 
				for each (evt in memberInfo.eventInfo)
				{
					addEventListerner(evt.listenerInfo, container, evt.chain, memberInfo.isSkinPart,
						memberInfo.isBindable || memberInfo.isSkinPart);
				}				
			}
		}
		
		/**
		 * The <code>event</code> argument of <code>[EventHandling]</code> metadata 
		 */
		public static const EVENT_KEY:String = "event";
		
		/**
		 * The <code>handler</code> argument of <code>[EventHandling]</code> metadata 
		 */
		public static const HANDLER_KEY:String = "handler";
		
		/**
		 * The <code>dispatcher</code> argument of <code>[EventHandling]</code> metadata 
		 */
		public static const DISPATCHER_KEY:String = "dispatcher";
		
		/**
		 * The <code>useCapture</code> argument of <code>[EventHandling]</code> metadata 
		 */
		public static const USE_CAPTURE_KEY:String = "usecapture";
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function getMemberEventHandlingInfo(container:Object, member:Object):Object
		{
			var eventInfo:Array = [];
			var isBindable:Boolean = false;
			var isSkinPart:Boolean = false;
			
			for each (var metadata:Metadata in member.metadata)
			{
				if (metadata.name == BINDABLE)
					isBindable = true;
				if (metadata.name == SKIN_PART)
					isSkinPart = true;
				
				if (metadata.name == EVENT_HANDLING && metadata.arguments.length > 1)
				{
					if(metadata.arguments.length == 4)
					{
						var defaultIndex:int = 0;
					}
					else if(metadata.arguments.length == 3)
					{
						var useCapture:String = getMetadataArgument(metadata, USE_CAPTURE_KEY, 2);
						if(useCapture.toLowerCase() == "true" || useCapture.toLowerCase() == "false")
						{
							defaultIndex = int.MAX_VALUE;
						}
						else
						{
							defaultIndex = 2;
							useCapture = null;
						}
					}
					else
					{
						defaultIndex = int.MAX_VALUE;
					}
					
					var dispatcherChain:String = getMetadataArgument(metadata, DISPATCHER_KEY, defaultIndex);
					
					var chain:Array = StringUtil.isBlank(dispatcherChain) ? [] : dispatcherChain.split(".");
					
					if(member.name != THIS)
						chain = [member.name].concat(chain);
					
					var i:int = metadata.arguments.length == 2 || (metadata.arguments.length == 3 && !StringUtil.isBlank(useCapture)) ? 0 : 1;
					
					var event:String = getMetadataArgument(metadata, EVENT_KEY, i);
					event = DataUtil.evaluateChainValue(event);
					var handlerName:String = getMetadataArgument(metadata, HANDLER_KEY, i + 1);
					var handler:Function = DataUtil.evaluateChainValue(handlerName, container);
					if(StringUtil.isBlank(useCapture))
						useCapture = getMetadataArgument(metadata, USE_CAPTURE_KEY, i + 2);
					eventInfo.push({listenerInfo:{event:event, handler:handler, useCapture:DataUtil.toBoolean(useCapture)}, chain:chain});
				}
			}
			
			if(isBindable || isSkinPart || eventInfo.length > 0)
				return {eventInfo:eventInfo, isBindable:isBindable, isSkinPart:isSkinPart};
			return null;
		}
		
		private var idToListenerInfo:Object = {};
		private var targetPartAddedListenerMap:Object = {};
		private var targetPropertyChangeListenerMap:Object = {};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function addEventListerner(listenerInfo:Object, target:Object, chain:Array, 
										   isSkinPart:Boolean, deferred:Boolean):void
		{
			if(deferred && target is IEventDispatcher && chain.length > 0)
			{
				var targetUid:String = UIDUtil.getUID(target);
				var id:String = targetUid + "." + chain[0];
				if(idToListenerInfo[id] == undefined)
					idToListenerInfo[id] = [];
				(idToListenerInfo[id] as Array).push({listenerInfo:listenerInfo, chain:chain.slice(1)});
				if(isSkinPart)
				{
					if(targetPartAddedListenerMap[targetUid] == undefined)
					{
						IEventDispatcher(target).addEventListener(SkinPartEvent.PART_ADDED,
							function(e:SkinPartEvent):void
							{
								var id:String = UIDUtil.getUID(e.currentTarget) + "." + e.partName;
								if(idToListenerInfo[id] != undefined)
								{
									for each (var o:Object in idToListenerInfo[id])
									{
										addEventListerner(o.listenerInfo, e.instance, o.chain, false, true);
									}	
									delete targetPartAddedListenerMap[UIDUtil.getUID(e.currentTarget)];
								}
								
							});
						
						IEventDispatcher(target).addEventListener(SkinPartEvent.PART_REMOVED,
							function(e:SkinPartEvent):void
							{
								var id:String = UIDUtil.getUID(e.currentTarget) + "." + e.partName;
								
								//Free memory
								if(idToListenerInfo[id] != undefined)
								{
									for each (var o:Object in idToListenerInfo[id])
									{
										var childId:String = id;
										for(var i:int = 0; i < o.chain.length; i++)
										{
											childId += "." + o.chain[i];
											if(idToListenerInfo[childId] != undefined)
												delete idToListenerInfo[childId];
										}
									}
								}							
							});
						
						targetPartAddedListenerMap[targetUid] = true;
					}				
				}
				else
				{
					if(targetPropertyChangeListenerMap[targetUid] == undefined)
					{
						IEventDispatcher(target).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,
							function(e:PropertyChangeEvent):void
							{
								var id:String = UIDUtil.getUID(e.source) + "." + e.property;
								
								//Free memory
								if(idToListenerInfo[id] != undefined && e.oldValue != null)
								{
									for each (var o:Object in idToListenerInfo[id])
									{
										var childId:String = id;
										for(var i:int = 0; i < o.chain.length; i++)
										{
											childId += "." + o.chain[i];
											if(idToListenerInfo[childId] != undefined)
												delete idToListenerInfo[childId];
										}
									}
								}
								
								if(idToListenerInfo[id] != undefined && e.newValue != null)
								{
									for each (o in idToListenerInfo[id])
									{
										addEventListerner(o.listenerInfo, e.newValue, o.chain, false, true);
									}
								}
							});
						
						targetPropertyChangeListenerMap[targetUid] = true;
					}
				}
				
			}
			
			for(var i:int = 0; i < chain.length; i++)
			{
				if(target != null)
					target = target[chain[i]];
				else
					return;
			}
			
			if(target is IEventDispatcher)
				IEventDispatcher(target).addEventListener(listenerInfo.event, listenerInfo.handler, listenerInfo.useCapture);
			else if(target != null)
				LoggingUtil.fproject_internal::error(Injector, 4, "invalid.dispatcher.error", [target]);
		}
		
		/**
		 * <p>Late binding properties for member variables of an container object by dependency injection.</p>
		 * In order to inject, the member must be declared by [PropertyBinding] metatdata, follows
		 * this syntax:
		 * <pre>[PropertyBinding(property1="value1", property2="value2")]</pre>
		 * Examples:<br/>
		 * <pre>
		 * [PropertyBinding(dataProvider="allResourceTypes", labelFunction="resourceTypeLabelFunction")]
		 * public var typeDropDown:DropDownList;
		 * </pre>
		 * 
		 * @param container the object that contains member variables to inject.
		 * 
		 */
		public static function bindProperties(container:Object):void
		{
			var injector:Injector = getInstance(container);
			injector.fproject_internal::bindProperties(container);
		}
		
		/**
		 * The keyword <code>this</code> represents current container object.
		 */
		public static const THIS:String = "this";
		
		/**
		 * The <code>hostChain</code> argument of <code>[PropertyBinding]</code> metadata 
		 */
		private static const HOST_CHAIN:String = "hostChain";
		
		
		/**
		 * @private
		 */
		fproject_internal function bindProperties(container:Object):void
		{
			if(container == null)
				LoggingUtil.fproject_internal::error(Injector, 6, "property.binding.null.object");
			
			var type:Type = Type.forInstance(container);
			
			var members:Array = type.variables.concat(type.accessors);
			members = members.concat(type.methods);
			
			var containerMember:Object = {name:THIS, metadata:ReflectionUtil.getAllExtendsClassMetadata(type)};
			members.push(containerMember);
			
			var additionalMetadataMap:Object = {};
			var skinPartMap:Object = {};
			var memberMetaInfoArray:Array = [];
			
			for each (var member:Object in members)
			{ 
				var memberMetaInfo:Object = getMemberPropBindingInfo(member);
				
				if(memberMetaInfo.metaArray.length > 0)
					memberMetaInfoArray.push(memberMetaInfo);
				else if(memberMetaInfo.isSkinPart || memberMetaInfo.isBindable)
					additionalMetadataMap[member.name] = 
						{isSkinPart:memberMetaInfo.isSkinPart, isBindable:memberMetaInfo.isBindable};
				
				if(memberMetaInfo.isSkinPart)
					skinPartMap[member.name] = true;
			}
			
			for each(memberMetaInfo in memberMetaInfoArray)
			{ 
				for each (var bindingMeta:Object in memberMetaInfo.metaArray)
				{
					var chain:Array = (bindingMeta.hostChain == null || bindingMeta.hostChain == "") ? 
						[] : String(bindingMeta.hostChain).split(".");
					
					var isSkinPart:Boolean = memberMetaInfo.isSkinPart;
					var isBindable:Boolean = memberMetaInfo.isBindable;
					
					if(memberMetaInfo.name != THIS)
						chain = [memberMetaInfo.name].concat(chain);
					
					if(additionalMetadataMap[chain[0]] != undefined)
					{
						isSkinPart = additionalMetadataMap[chain[0]].isSkinPart;
						isBindable = additionalMetadataMap[chain[0]].isBindable;
					}
					
					executeBinding(container, bindingMeta.args, container, chain, isSkinPart, isBindable, skinPartMap);
				}
			}
		}
		
		/**
		 * The <code>sourceEvent</code> argument of <code>[PropertyBinding]</code> metadata 
		 */
		public static const SOURCE_EVENT:String = "sourceEvent";
		
		/**
		 * The type of target field 
		 */
		private static const FIELD_TYPE:String = "fieldType";
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function getMemberPropBindingInfo(member:Object):Object
		{
			var memberName:String = member.name;
			var bindingMetaInfo:Object = {name:memberName, metaArray:[], isSkinPart:false, isBindable:false};
			
			for each (var metadata:Metadata in member.metadata)
			{
				if (metadata.name == PROPERTY_BINDING && metadata.arguments.length > 0)
				{					
					var bindingMeta:Object = {args:[], hostChain:null};
					
					bindingMetaInfo.metaArray.push(bindingMeta);
					
					for each (var metaArg:MetadataArgument in metadata.arguments)
					{
						if(metaArg.key == SOURCE_EVENT)
						{
							//Do nothing
						}
						else if(metaArg.key == HOST_CHAIN)
							bindingMeta.hostChain = metaArg.value;
						else
						{
							var arg:Object = {key:metaArg.key, value:metaArg.value};
							if(member.hasOwnProperty('type'))
							{
								var t:Type = member['type'] as Type;
								if(t != null)
								{
									var f:Field = t.getField(arg.key);
									if(f != null)
										arg[FIELD_TYPE] = f.type.fullName;
								}
							}
							(bindingMeta.args as Array).push(arg);
						}
					}
				}
				
				if (metadata.name == SKIN_PART)
					bindingMetaInfo.isSkinPart = true;
				
				if (metadata.name == BINDABLE)
					bindingMetaInfo.isBindable = true;
			}
			
			return bindingMetaInfo;
		}
		
		private var idToHostChainInfo:Object = {};
		private var objectPartAddedListenerMap:Object = {};
		private var objectPropertyChangeListenerMap:Object = {};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function executeBinding(object:Object, metadataArgs:Array, container:Object, chain:Array,
										isSkinPart:Boolean, isBindable:Boolean, skinPartMap:Object):void
		{
			if(object is IEventDispatcher && chain.length > 0)
			{
				var id:String = UIDUtil.getUID(object) + "." + chain[0];
				if(idToHostChainInfo[id] == undefined)
					idToHostChainInfo[id] = [];
				(idToHostChainInfo[id] as Array).push({container:container, args:metadataArgs, chain:chain.slice(1), 
					isSkinPart:isSkinPart, isBindable:isBindable, skinPartMap:skinPartMap});
				if(isSkinPart)
				{
					var addedHandler:Function = function(e:SkinPartEvent, dispatcher:Object=null):void
					{
						if(dispatcher == null)
							dispatcher = e.currentTarget;
						var id:String = UIDUtil.getUID(dispatcher) + "." + e.partName;
						if(idToHostChainInfo[id] != undefined && e.instance != null)
						{
							for each (var o:Object in idToHostChainInfo[id])
							{
								executeBinding(e.instance, o.args, o.container, o.chain, false, 
									o.isBindable, o.skinPartMap);
							}
							delete objectPartAddedListenerMap[UIDUtil.getUID(dispatcher)];
						}
					};
					
					if(objectPartAddedListenerMap[UIDUtil.getUID(object)] == undefined)
					{	
						IEventDispatcher(object).addEventListener(SkinPartEvent.PART_ADDED, addedHandler);
						
						var removedHandler:Function = function(e:SkinPartEvent):void
						{
							var id:String = UIDUtil.getUID(e.currentTarget) + "." + e.partName;
							
							//Free memory
							if(idToHostChainInfo[id] != undefined)
							{
								for each (var o:Object in idToHostChainInfo[id])
								{
									var childId:String = id;
									for(var i:int = 0; i < o.chain.length; i++)
									{
										childId += "." + o.chain[i];
										if(idToHostChainInfo[childId] != undefined)
											delete idToHostChainInfo[childId];
									}
								}
								delete idToHostChainInfo[id];
							}							
						};
							
						IEventDispatcher(object).addEventListener(SkinPartEvent.PART_REMOVED, removedHandler);
						
						objectPartAddedListenerMap[UIDUtil.getUID(object)] = true;
					}
					
					//Bind the first-time value
					addedHandler(new SkinPartEvent("", false, false, chain[0], object[chain[0]]), object);
				}
				else if(objectPropertyChangeListenerMap[UIDUtil.getUID(object)] == undefined)
				{
					IEventDispatcher(object).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,
						function(e:PropertyChangeEvent):void
						{
							var id:String = UIDUtil.getUID(e.source) + "." + e.property;
							
							if(idToHostChainInfo[id] != undefined && e.oldValue != null)
							{
								//Free memory
								for each (var o:Object in idToHostChainInfo[id])
								{
									var childId:String = id;
									for(var i:int = 0; i < o.chain.length; i++)
									{
										childId += "." + o.chain[i];
										if(idToHostChainInfo[childId] != undefined)
											delete idToHostChainInfo[childId];
									}
								}
								
							}							
							
							if(idToHostChainInfo[id] != undefined && e.newValue != null)
							{
								for each (o in idToHostChainInfo[id])
								{
									executeBinding(e.newValue, o.args, o.container, o.chain, false, 
										o.isBindable, o.skinPartMap);
								}
							}								
							
						});
					
					objectPropertyChangeListenerMap[UIDUtil.getUID(object)] = true;
					
				}					
			}
			else if (isBindable && chain.length > 0)
			{
				id = chain[0];
				idToHostChainInfo[id] = {container:container, args:metadataArgs, chain:chain.slice(1), 
					isSkinPart:isSkinPart, isBindable:isBindable};
				
				BindingUtils.bindSetter(
					function(value:Object):void
					{
						if(value != null)
						{
							var chainInfo:Object = idToHostChainInfo[UIDUtil.getUID(value)];
							if (chainInfo != null)
								executeBinding(value, chainInfo.args, chainInfo.container, chainInfo.chain,
									chainInfo.isSkinPart, chainInfo.isBindable, chainInfo.skinPartMap);
						}
						
					}, object, id);
			}
			
			//Bind first value of chain
			if(chain.length > 0)
			{
				for(var i:int = 0; i < chain.length; i++)
				{
					if(object != null)
						object = object[chain[i]];
					else
						return;
				}				
			}
			
			if (object != null)
				bindMetadataArgs(object, metadataArgs, container, isSkinPart, skinPartMap);
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function bindMetadataArgs(object:Object, metadataArgs:Array, container:Object, 
										  isSkinPart:Boolean, skinPartMap:Object):void
		{
			var inverseDeferredArgs:Array = [];
			for each (var ma:Object in metadataArgs)
			{
				if(ma.value.charAt(0) == "@")
				{
					if(ma.value.charAt(ma.value.length - 1) != "@")
					{
						//Inverse binding
						bindInverseValue(object, ma.key, ma.value, container, isSkinPart, skinPartMap);
					}
					else
					{
						inverseDeferredArgs.push(ma);
					}
				}
				else
				{
					var bindingInfo:Object = parseSimpleExpressionBinding(ma.value);
					var expression:Object = bindingInfo.expression;
					if(bindingInfo.type == 0)
					{
						expression.targetField = ma.key;
						//Deferred binding
						bindDeferredValue(object, expression, container, skinPartMap);
					}
					else
					{
						//Direct binding
						bindDirectValue(object, ma, container, expression);
					}	
				}
													
			}
			
			if(inverseDeferredArgs.length > 0)
				bindInverseDeferredArgs(object, inverseDeferredArgs, container, isSkinPart, skinPartMap);
		}
		
		private function parseSimpleExpressionBinding(spec:String):Object
		{
			var expression:Object = {negation:false, chain:spec, methodChain:null};
			
			if(spec.charAt(0) == "!")
			{
				expression.negation = true;
				expression.chain = spec = spec.substring(1);
			}
			
			var end:int = spec.length - 1;
			
			if(spec.charAt(end) == ")")
			{
				var i:int = spec.lastIndexOf("(");
				if(i != -1)
				{
					var argChain:String = StringUtil.trim(spec.substring(i + 1, end), " \t");
					expression.methodChain = spec.substring(0, i);
					expression.chain = spec = argChain;
					end = spec.length - 1;
				}
			}
			
			if(spec.charAt(end) == "@")
				return {type:0, expression: expression};
			else
				return {type:1, expression: expression};
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function bindDirectValue(targetObj:Object, metaArg:Object, container:Object, simpleExpressionInfo:Object):void
		{
			var targetFieldType:String = metaArg.hasOwnProperty(FIELD_TYPE) ?  metaArg[FIELD_TYPE] : null;
			if(targetObj != null)
				targetObj[metaArg.key] = DataUtil.evaluateSimpleExpression(container, simpleExpressionInfo, targetFieldType);
		}
		
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function bindInverseValue(sourceObj:Object, sourceField:String, targetChain:String, 
										  container:Object, isSkinPart:Boolean, skinPartMap:Object):void
		{
			var srcValue:* = (sourceField == null || sourceField == "") ? sourceObj : sourceObj[sourceField];
			
			//Remove the '@' character at left most
			targetChain = targetChain.substr(1);
			var i:int = targetChain.lastIndexOf(".");
			if(i > 0)
			{
				var targetClassName:String = targetChain.substring(0, i);
				var c:Class = getDefinitionByName(targetClassName) as Class;
				c[targetChain.substr(i + 1)] = srcValue;
			}
			else
				container[targetChain] = srcValue;
		}
		
		/**
		 * The prefix 'this.' 
		 */
		public static const THIS_DOT:String = "this.";
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function bindDeferredValue(targetObj:Object, simpleExpressionInfo:Object, container:Object, skinPartMap:Object):void
		{
			if(targetObj == null)
				return;
			var targetField:String = simpleExpressionInfo.targetField
			var sourceChain:String = simpleExpressionInfo.chain;
			
			//Remove the '@' character at right most
			sourceChain = sourceChain.substring(0, sourceChain.length - 1);
			if(sourceChain.substr(0,5) == THIS_DOT)
				sourceChain = sourceChain.substr(5);
			
			var i:int = sourceChain.indexOf(".");
			var sourceObject:Object = container;
			var srcChain:Array = [];
			
			if(i > 0)
			{
				var srcField:String = sourceChain.substring(0, i);
				srcChain = sourceChain.split(".");
			}
			else
			{
				srcField = sourceChain;
				srcChain = [srcField]
			}
			
			if(skinPartMap[srcField] != undefined)
				var isSourceSkinPart:Boolean = true;
			
			if(sourceObject is IEventDispatcher)
			{
				if(isSourceSkinPart)
					PropertyBindingHandler.addEventsToCache(sourceObject, srcField, [SkinPartEvent.PART_ADDED]);
				if(simpleExpressionInfo.methodChain != null)
					var bindingMethod:Function = DataUtil.evaluateChainValue(simpleExpressionInfo.methodChain, sourceObject) as Function;
				setDeferredSourceChain(null, sourceObject, srcChain, targetObj, targetField, bindingMethod, simpleExpressionInfo.negation);
			}
			else
			{
				LoggingUtil.fproject_internal::error(Injector, 5, "property.binding.not.dispatcher");
			}
		}
		
		private var deferredSourcePropertyChangeListenerMap:Object = {};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function setDeferredSourceChain(oldSource:Object, newSource:Object, srcChain:Array, target:Object, targetField:String,
												bindingMethod:Function, negation:Boolean):void
		{
			if(srcChain.length > 0)
			{
				var targetId:String =  UIDUtil.getUID(target);
				var i:int = 0;
				var newSrc:Object = newSource;
				var oldSrc:Object = oldSource;
				
				while(i < srcChain.length)
				{
					if(oldSrc != null)
					{
						var oldSrcId:String = UIDUtil.getUID(oldSrc) + "." + srcChain[i];
						var oldHandler:PropertyBindingHandler = deferredSourcePropertyChangeListenerMap[oldSrcId];
						delete deferredSourcePropertyChangeListenerMap[oldSrcId];
						oldSrc = oldSrc[srcChain[i]];
					}
					
					if(newSrc != null)
					{
						if (newSrc is IEventDispatcher)
						{
							var newSrcId:String = UIDUtil.getUID(newSrc) + "." + srcChain[i];
							var handler:PropertyBindingHandler = deferredSourcePropertyChangeListenerMap[newSrcId];
							if(handler == null)
							{
								if(oldHandler != null)
									handler = oldHandler;
								else
									handler = new PropertyBindingHandler(srcChain[i], this.setDeferredSourceChain);
								handler.start(IEventDispatcher(newSrc));
								deferredSourcePropertyChangeListenerMap[newSrcId] = handler;
							}
							
							handler.addBindingInfo(targetId, srcChain.slice(i + 1), target, targetField, bindingMethod, negation);
						}
						
						newSrc = newSrc[srcChain[i]];
					}					
					
					i++;
				}
				
			}
			
			//Bind first-time value
			if(srcChain.length > 0)
			{
				for(i = 0; i < srcChain.length; i++)
				{
					if(newSource != null)
						newSource = newSource[srcChain[i]];
					else
						return;
				}				
			}
			
			if(bindingMethod != null)
				newSource = bindingMethod(newSource);
			if(negation)
				newSource = !Boolean(newSource);
			
			target[targetField] = newSource;
		}
		
		private var idToBindingInfo:Object = {};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function bindInverseDeferredArgs(sourceObj:Object, args:Array , 
												 container:Object, isSkinPart:Boolean, skinPartMap:Object):void
		{
			if(sourceObj == null)
				return;
			if(!(container is IEventDispatcher))
			{
				LoggingUtil.fproject_internal::error(Injector, 5, "property.binding.not.dispatcher");
			}
			var tailMap:Object = {};
			var roots:Object = {};
			for each (var arg:Object in args)
			{
				var source:Object = (arg.key == "" || arg.key == null) ? sourceObj : sourceObj[arg.key];
				
				//Remove '@' at start and end of string
				var targetChain:String = arg.value.substring(1, arg.value.length - 1);
				var i:int = 0;
				var mapKey:String = "";
				
				var tail:Array = [];
				var tailIdx:int = 0;
				var depth:int = 0;
				while(i < targetChain.length)
				{
					var j:int = targetChain.indexOf(".", i);
					if(j < 0)
						j = targetChain.length;
					mapKey = targetChain.substring(0, j);
					var field:String = targetChain.substring(i, j);
					depth ++;
					if(tailMap[mapKey] != undefined)
					{
						tail = tailMap[mapKey] as Array;
						tailIdx++;
					}
					else
					{
						if(tailIdx < tail.length)
						{
							var node:Object = tail[tailIdx];
							if(node is String)
							{
								var s:String = node as String;
								var a:Array = tail.splice(tailIdx);;
								node = {};
								node[s] = a;
								a = [field];
								node[field] = a;
								tail[tailIdx] = node;
								tail = a;
							}
							else
							{
								tail = node[field] = [field];
							}
							tailIdx = 0;
						}
						else
						{
							tail.push(field);
							tailIdx++;
						}
						tailMap[mapKey] = tail;
					}
					
					if(depth == 1 && roots[field] == undefined)
						roots[field] = tail;
					
					i = j + 1;
				}
			}
			
			for(s in roots)
			{
				a = roots[s];
				isSkinPart = skinPartMap[a[0]];
				setDeferredTargetChain(source, container, a, isSkinPart);
			}				
		}
		
		private var deferredTargetPartAddedListenerMap:Object = {};
		private var deferredTargetPropertyChangeListenerMap:Object = {};
		
		/**
		 * 
		 * @private
		 * 
		 */
		private function setDeferredTargetChain(source:Object, target:Object, chainObj:Object, isSkinPart:Boolean):void
		{
			if(!(chainObj is Array))
			{
				for(var c:String in chainObj)
				{
					setDeferredTargetChain(source, target, chainObj[c], isSkinPart);
				}
				return;
			}
			
			var chain:Array = chainObj as Array;			
			var isBindable:Boolean = true;
			
			if(!isSkinPart)
			{
				var meta:Object = ReflectionUtil.findMemberMetadataValue(target,chain[0],'bindable');
				if(meta is String)
				{
					if(meta != "propertyChange")
					{
						LoggingUtil.fproject_internal::warn(Injector, 3, "property.binding.invalid.event", [chain[0], meta]);
						isBindable = false;
					}
				}
				else if(meta != null)
				{
					var args:Array = Metadata(meta[0]).arguments;
					if(args != null && args.length > 0)
					{
						var bindEvent:String = MetadataArgument(args[0]).value;
						if(bindEvent != "propertyChange")
						{
							LoggingUtil.fproject_internal::warn(Injector, 3, "property.binding.invalid.event", [chain[0], bindEvent]);
							isBindable = false;
						}
					}
					
				}
				else
					isBindable = false;
			}
			
			if(isBindable && target is IEventDispatcher && chain.length > 1)
			{
				var id:String = UIDUtil.getUID(target) + "." + chain[0];
				idToBindingInfo[id] = {source:source, chain:chain.slice(1), isSkinPart:isSkinPart};
				if(isSkinPart)
				{
					var partAddedHandler:Function = function(e:SkinPartEvent, dispatcher:Object=null):void
					{
						if(dispatcher == null)
							dispatcher = e.currentTarget;
						var id:String = UIDUtil.getUID(dispatcher) + "." + e.partName;
						if(idToBindingInfo[id] != undefined && e.instance != null)
							setDeferredTargetChain(idToBindingInfo[id].source, e.instance, idToBindingInfo[id].chain, false);
					};
					
					if(deferredTargetPartAddedListenerMap[UIDUtil.getUID(target)] == undefined)
					{
						var partRemovedHandler:Function = function(e:SkinPartEvent):void
						{
							var id:String = UIDUtil.getUID(e.currentTarget) + "." + e.partName;
							
							//Free memory
							if(idToBindingInfo[id] != undefined)
							{
								var childId:String = id;
								for(var i:int = 0; i < idToBindingInfo[id].chain.length; i++)
								{
									childId += "." + idToBindingInfo[id].chain[i];
									if(idToBindingInfo[childId] != undefined)
										delete idToBindingInfo[childId];
								}
							}
						};
						
						IEventDispatcher(target).addEventListener(SkinPartEvent.PART_ADDED, partAddedHandler);
						
						IEventDispatcher(target).addEventListener(SkinPartEvent.PART_REMOVED, partRemovedHandler);
						
						deferredTargetPartAddedListenerMap[UIDUtil.getUID(target)] = true;
					}
					
					//Bind the first-time value
					if(target[chain[0]] != null)
						partAddedHandler(new SkinPartEvent("", false, false, chain[0], target[chain[0]]), target);
				}
				else
				{
					if (deferredTargetPropertyChangeListenerMap[UIDUtil.getUID(target)] == undefined)
					{
						var propertyChangeHandler:Function = function(e:PropertyChangeEvent):void
						{
							var id:String = UIDUtil.getUID(e.source) + "." + e.property;
							
							//Free memory
							if(idToBindingInfo[id] != undefined && e.oldValue != null)
							{
								var childId:String = id;
								for(var i:int = 0; i < idToBindingInfo[id].chain.length; i++)
								{
									childId += "." + idToBindingInfo[id].chain[i];
									if(idToBindingInfo[childId] != undefined)
										delete idToBindingInfo[childId];
								}
							}
							
							if(idToBindingInfo[id] != undefined && e.newValue != null)
								setDeferredTargetChain(idToBindingInfo[id].source, e.newValue, idToBindingInfo[id].chain,
									idToBindingInfo[id].isSkinPart);
						};
						
						IEventDispatcher(target).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
						
						deferredTargetPropertyChangeListenerMap[UIDUtil.getUID(target)] = true;
						
						//Bind the first-time value
						if(idToBindingInfo[id] != undefined && target[chain[0]] != null)
							setDeferredTargetChain(idToBindingInfo[id].source, target[chain[0]], idToBindingInfo[id].chain, false);
					}
				}
			}
			else
			{
				var stack:Array = [];
				stack.push({target:target, chain:chain});
				
				while (stack.length > 0)
				{
					var node:Object = stack.pop();
					chain = node.chain;
					target = node.target;
					var i:int = 0;
					var elt:Object = chain[i];
					while(i < chain.length && elt is String)
					{
						if(i < chain.length - 1)
						{
							if(target != null)
								target = target[elt];
							else
								break;
						}
						else
							target[elt] = source;
						i++;
						if(i < chain.length)
							elt = chain[i];
					}
					
					if(i < chain.length && target != null && !(elt is String))
					{
						for(var s:String in elt)
						{
							stack.push({target:target, chain:elt[s]});
						}
					}
				}
				
			}			
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		private static function getMetadataArgument(metadata:Metadata, key:String, 
											 defaultIndex:int=int.MAX_VALUE):String
		{			
			var arg:MetadataArgument = metadata.getArgument(key);
			if(arg != null)
				return arg.value;
			else
				return defaultIndex < metadata.arguments.length? metadata.arguments[defaultIndex].value : null;
		}
		
		/**
		 * The instance cache 
		 */
		private static var instanceCache:Dictionary = new Dictionary(true);
		
		/**
		 * 
		 * @private
		 * 
		 */
		private static function getInstance(container:Object):Injector
		{
			if(container == null)
			{
				LoggingUtil.fproject_internal::error(Injector, 8, "cannot.inject.null");
			}
			else if(!instanceCache[container])
			{
				instanceCache[container] = true;
				return new Injector;
			}
			else
			{
				LoggingUtil.fproject_internal::error(Injector, 7, "container.injected", [container]);
			}
			return null;
		}
	}
}