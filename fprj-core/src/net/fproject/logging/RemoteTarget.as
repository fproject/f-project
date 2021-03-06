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

package net.fproject.logging
{
	import flash.utils.getDefinitionByName;
	
	import mx.core.mx_internal;
	import mx.logging.LogEventLevel;
	import mx.logging.targets.LineFormattedTarget;
	
	import net.fproject.html5.WebStorage;
	import net.fproject.rpc.IRemoteObject;
	import net.fproject.rpc.RemoteObjectFactory;
	import net.fproject.service.ServiceBase;
	import net.fproject.utils.ResourceUtil;

	use namespace mx_internal;
	/**
	 *  Provides a logger target that uses the remote service to output log messages.
	 *  
	 *  <p>To view logging output, you must config a F-Project Logging Server.</p>
	 *  
	 */
	public class RemoteTarget extends LineFormattedTarget implements IRemoteTarget
	{
		public var itemNumberLimit:Number;
		
		public var remoteConfig:Object;
		
		private const KEYSET_ID:String = "flog_keys";
		
		public function RemoteTarget(args:*)
		{
			var o:Object = args;
			if(o == null)
			{
				// Log all log levels.
				this.level = LogEventLevel.ALL;
				
				// By default, we log only messages for the classes in the net.fproject*
				this.filters=ResourceUtil.getString("common.log.target.filters", ResourceUtil.FPRJ_CORE_BUNDLE).split(",");
				// Add date, time, category, and log level to the output.
				this.includeDate = new Boolean(ResourceUtil.getString("common.log.target.includeDate"));
				this.includeTime = new Boolean(ResourceUtil.getString("common.log.target.includeTime"));
				this.includeCategory = new Boolean(ResourceUtil.getString("common.log.target.includeCategory"));
				this.includeLevel = new Boolean(ResourceUtil.getString("common.log.target.includeLevel"));
			}
			else
			{
				if(o is Array && (o as Array).length > 0)
					o = o[0];
				if(o.hasOwnProperty("level"))
					this.level = o["level"];			
				if(o.hasOwnProperty("includeDate"))
					this.includeDate = o["includeDate"];
				if(o.hasOwnProperty("includeTime"))
					this.includeTime = o["includeTime"];
				if(o.hasOwnProperty("includeCategory"))
					this.includeCategory = o["includeCategory"];
				if(o.hasOwnProperty("includeLevel"))
					this.includeLevel = o["includeLevel"];
				if(o.hasOwnProperty("itemNumberLimit"))
					this.itemNumberLimit = o["itemNumberLimit"];
				if(o.hasOwnProperty("remoteConfig"))
					this.remoteConfig = o["remoteConfig"];
				
				if(o.hasOwnProperty("filters"))
				{
					if(o["filters"] is Array)
						this.filters = o["filters"];
					else
						this.filters = String(o["filters"]).split(",");
				}
			}
			
			if(isNaN(itemNumberLimit) || itemNumberLimit <= 0)
				itemNumberLimit = 4096;
			
			keySet = WebStorage.localStorage.getItem(KEYSET_ID, false);
			if(keySet == null)
				keySet = [];
			truncate();
		}
		
		private var keySet:Array;
		
		/**
		 *  @private
		 *  This method outputs the specified message directly to 
		 *  <code>trace()</code>.
		 *  All output will be directed to flashlog.txt by default.
		 *
		 *  @param message String containing preprocessed log message which may
		 *  include time, date, category, etc. based on property settings,
		 *  such as <code>includeDate</code>, <code>includeCategory</code>, etc.
		 */
		override mx_internal function internalLog(message:String):void
		{
			trace(message);
			var d:Date = new Date();
			var key:String = getKey(d.time);
			WebStorage.localStorage.setItem(key, message, false);
			keySet.push(d.time);
			WebStorage.localStorage.setItem(KEYSET_ID, JSON.stringify(keySet), false);
		}
		
		/**
		 * 
		 * Returns log data by joining all log items
		 * 
		 */
		public function getLogData():String
		{
			var s:String = "";
			for each (var idx:Number in keySet)
			{
				if(s != "")
					s += "\n";
				s += WebStorage.localStorage.getItem(getKey(idx));
			}
			
			return s;
		}
		
		private var _logService:ServiceBase;
		
		public function get logService():ServiceBase
		{
			if (_logService == null)
			{
				if (remoteConfig != null)
				{
					var ro:IRemoteObject = RemoteObjectFactory.getInstance(remoteConfig);
					if(ro != null)
						_logService = new ServiceBase(ro);
				}
			}
			
			return _logService;
		}
		
		/**
		 * 
		 * Report log data to a F-Project Server
		 * 
		 */
		public function reportLogData(logData:*):void
		{
			if(logService != null)
				logService.remoteObject.reportLogData(logData);
		}
		
		private function getKey(idx:Number):String
		{
			return "flog_" + idx;
		}
		
		private function truncate():void
		{
			if(keySet.length > itemNumberLimit)
			{
				var removing:Array = keySet.splice(0, keySet.length - itemNumberLimit);
				for each (var idx:Number in removing)
				{
					WebStorage.localStorage.removeItem(getKey(idx));
				}
			}
		}
	}
}