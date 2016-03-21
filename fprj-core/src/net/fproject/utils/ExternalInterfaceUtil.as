package net.fproject.utils
{
	import flash.external.ExternalInterface;
	
	public class ExternalInterfaceUtil
	{
		public static function invokeExternalCall(functionSpec:String, ...args:Array):*
		{
			try
			{
				if(args == null || args.length == 0)
					return ExternalInterface.call(functionSpec);
				var s:String = "";
				for (var i:int=0; i<args.length; i++)
				{
					args[i] = DataUtil.characterEscape(args[i]);
				}
				if(args.length == 1)
					var o:* = ExternalInterface.call(functionSpec, args[0]);
				else if(args.length == 2)
					o = ExternalInterface.call(functionSpec, args[0], args[1]);
				else if(args.length == 3)
					o = ExternalInterface.call(functionSpec, args[0], args[1], args[2]);
				else if(args.length == 4)
					o = ExternalInterface.call(functionSpec, args[0], args[1], args[2], args[3]);
				else if(args.length == 5)
					o = ExternalInterface.call(functionSpec, args[0], args[1], args[2], args[3], args[4]);
			}
			catch (e:Error)
			{
				LoggingUtil.logWarn(ExternalInterfaceUtil, ResourceUtil.FPRJ_CORE, 11, null,
					ResourceUtil.FPRJ_CORE_BUNDLE, "external.method.failed") + "\n" + MessageUtil.shortenMsg(e.getStackTrace());
			}
			
			return o;
		}
	}
}