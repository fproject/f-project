package net.fproject.core
{
	import mx.core.ClassFactory;
	
	import org.as3commons.lang.ClassUtils;

	public class ClassFactory extends mx.core.ClassFactory
	{
		public var constructorArgs:Array;
		
		public function ClassFactory(generator:Class = null, constructorArgs:Array=null)
		{
			super(generator);			
			this.constructorArgs = constructorArgs;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override public function newInstance():*
		{
			var instance:Object = ClassUtils.newInstance(generator, constructorArgs);
			
			if (properties != null)
			{
				for (var p:String in properties)
				{
					instance[p] = properties[p];
				}
			}
			
			return instance;
		}
	}
}