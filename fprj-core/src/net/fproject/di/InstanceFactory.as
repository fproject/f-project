///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of F-Project
//
// Copyright © 2014 F-Project. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	import org.as3commons.lang.ClassUtils;
	
	public class InstanceFactory
	{
		private static var classToImpl:Dictionary = new Dictionary(true);
		private static var implToInstance:Dictionary = new Dictionary(true);
		
		private static var factoryConfig:XML
		/**
		 * Set InstanceFactory configuration 
		 * @param config the InstanceFactory configuration, using the following sample format:
		 * <pre>
		 *&lt;root&gt;
		 *   	&lt;InstanceFactory&gt;
		 *    		&lt;Impl name="net.fproject.rpc.IRemoteObject" impl="net.fproject.rpc.JSONRemoteObject"/&gt;
		 * 		&lt;Impl name="com.myorg.IMyService" impl="com.myorg.MyServiceImpl"/&gt;
		 *   	&lt;/InstanceFactory&gt;
		 *&lt;/root&gt;</pre>
		 * 
		 */
		public static function setInstanceFactoryConfig(config:XML):void
		{
			factoryConfig = config;
		}
		
		/**
		 * Instantiate a class using singleton and dependency injection.
		 * @param abstractor The class, abstract class or interface name to instantiate
		 * @param constructorArgs The constructor argument list (if any)
		 * @return The singleton instance
		 * 
		 */
		public static function getInstance(abstractor:Class, constructorArgs:*=undefined):Object
		{
			if(implToInstance[abstractor] != undefined)
				return implToInstance[abstractor];
			
			if(classToImpl[abstractor] != undefined)
			{
				var impl:Class = classToImpl[abstractor];
				return implToInstance[impl];
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
				var clsName:String = getQualifiedClassName(abstractor).replace("::",".");
				
				if(factoryConfig != null)
				{
					for each (var itfImpl:XML in factoryConfig.InstanceFactory.Impl)
					{
						var itfName:String = itfImpl.@name;
						if(itfName.replace("::",".") == clsName)
						{
							var implName:String = itfImpl.@impl as String;
							if(implName != null)
								impl = getDefinitionByName(implName) as Class;
							break;
						}
					}
				}
				
				if(impl == null && (abstractor == Object || getQualifiedSuperclassName(abstractor) != null))
				{
					impl = abstractor;
				}
			}
			
			if(impl != null)
			{
				if(constructorArgs == undefined)
				{
					var instance:Object = new impl();
				}
				else if(!(constructorArgs is Array))
				{
					constructorArgs = [constructorArgs];
					instance = ClassUtils.newInstance(impl, constructorArgs);
				}
				implToInstance[impl] = instance;
				if(impl !== abstractor)
					implToInstance[abstractor] == instance;
				classToImpl[abstractor] = impl;
				return instance;
			}
			else
			{
				return null;
			}
		}
	}
}