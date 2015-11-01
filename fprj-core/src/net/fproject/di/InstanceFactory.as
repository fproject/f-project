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
	
	public class InstanceFactory
	{
		private static var classToImpl:Dictionary = new Dictionary();
		private static var implToInstance:Dictionary = new Dictionary();
		
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
		 * @param clazz the class or interface name to instantiate
		 * @return the service instance
		 * 
		 */
		public static function getInstance(clazz:Class):Object
		{
			if(classToImpl[clazz] != undefined)
			{
				var impl:Class = classToImpl[clazz];
				return implToInstance[impl];
			}
			
			for each (var i:Object in ImplementationConfig.instance.impls)
			{
				if(i is Implementation)
				{
					if(Implementation(i).abstractor == clazz)
					{
						impl = Implementation(i).impl;
						break;
					}
				}
			}
			
			if(impl == null)
			{
				var clsName:String = getQualifiedClassName(clazz).replace("::",".");
				
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
				
				if(impl == null)
				{
					impl = clazz;
				}
			}
			
			classToImpl[clazz] = impl;
			
			implToInstance[impl] = new impl();
			
			return implToInstance[impl];
		}
	}
}