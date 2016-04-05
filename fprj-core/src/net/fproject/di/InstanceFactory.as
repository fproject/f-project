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
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	import net.fproject.reflect.ReflectionUtil;
	import net.fproject.utils.DataUtil;
	import net.fproject.utils.StringUtil;
	
	import org.as3commons.lang.ClassUtils;
	import org.as3commons.reflect.Type;
	
	public class InstanceFactory
	{
		private static var classToImpl:Dictionary = new Dictionary(true);
		private static var implToInstance:Dictionary = new Dictionary(true);
		
		/**
		 * @see #setInstanceFactoryConfig()
		 */
		private static var factoryConfig:XML
		
		/**
		 * Set InstanceFactory configuration 
		 * @param config the InstanceFactory configuration, using the following sample format:
		 * <pre>
		 *   &lt;ImplementationConfig&gt;
		 *    	&lt;Implementation abstractor="net.fproject.rpc.IRemoteObject" impl="net.fproject.rpc.JSONRemoteObject"/&gt;
		 * 	&lt;Implementation abstractor="com.myorg.IMyService" impl="com.myorg.MyServiceImpl"/&gt;
		 *   &lt;/ImplementationConfig&gt;
		 *</pre>
		 * 
		 */
		public static function setFactoryConfig(config:XML):void
		{
			factoryConfig = config;
		}
		
		/**
		 * Add an implementation definition 
		 * @param impl the implementation to add.
		 * 
		 */
		public static function addImplementation(impl:XML):void
		{
			factoryConfig = DataUtil.addXmlChild(factoryConfig, impl, <ImplementationConfig/>);
		}
		
		/**
		 * Instantiate a class using singleton and dependency injection.
		 * @param abstractor The class, abstract class or interface to instantiate
		 * @param constructorArgs The constructor argument list (if any)
		 * @param singleton indicate whether the instance is created using singleton or not
		 * @return The singleton instance
		 * 
		 */
		public static function getInstance(abstractor:Class, constructorArgs:*=undefined, singleton:Boolean=true):*
		{
			if(singleton && implToInstance[abstractor] != undefined)
				return implToInstance[abstractor];
			
			if(classToImpl[abstractor] != undefined)
			{
				var impl:Class = classToImpl[abstractor];
				return getInstanceByImpl(abstractor, impl, constructorArgs, singleton);
			}
			
			for each (var i:Object in ImplementationConfig.instance.impls)
			{
				if(i is Implementation)
				{
					if(Implementation(i).abstractor == abstractor)
					{
						impl = Implementation(i).impl;
						break;
					}
				}
			}
			
			if(impl == null)
			{
				var abstractorName:String = getQualifiedClassName(abstractor).replace("::",".");
				
				if(factoryConfig != null)
				{
					for each (var implXml:XML in factoryConfig.ImplementationConfig.Implementation)
					{
						var implAbs:String = implXml.@abstractor;
						if(implAbs.replace("::",".") == abstractorName)
						{
							var implName:String = implXml.@impl as String;
							if(implName != null)
								impl = getDefinitionByName(implName) as Class;
							break;
						}
					}
				}
				
				if(impl == null && (abstractor == Object || getQualifiedSuperclassName(abstractor) != null))
					impl = abstractor;
				else if(impl == null)
					impl = getImplFromMetadata(abstractor);
			}
			
			
			return getInstanceByImpl(abstractor, impl, constructorArgs, singleton);
		}
		
		private static function getInstanceByImpl(abstractor:Class, impl:Class, constructorArgs:*, singleton:Boolean):*
		{
			if(impl != null)
			{
				if(singleton && implToInstance[impl] != undefined)
					return implToInstance[impl];
				
				if(constructorArgs == undefined)
				{
					var instance:Object = new impl();
				}
				else
				{
					if(!(constructorArgs is Array))
						constructorArgs = [constructorArgs];
					instance = ClassUtils.newInstance(impl, constructorArgs);
				}
				
				if(singleton)
				{
					implToInstance[impl] = instance;
					if(impl !== abstractor)
						implToInstance[abstractor] == instance;
				}
				
				classToImpl[abstractor] = impl;
				return instance;
			}
			else
			{
				return null;
			}
		}
		
		private static const IMPLEMENTATION:String = "Implementation";
		
		private static function getImplFromMetadata(intf:Class):Class
		{
			var type:Type = Type.forClass(intf);
			var implName:String = ReflectionUtil.findClassMetadataValue(type, IMPLEMENTATION) as String;
			if(!StringUtil.isBlank(implName))
				return getDefinitionByName(implName) as Class;
			return null;
		}
	}
}