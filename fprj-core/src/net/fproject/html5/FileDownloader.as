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
package net.fproject.html5
{
	import flash.external.ExternalInterface;
	
	import mx.core.ByteArrayAsset;
	
	import net.fproject.core.AppContext;
	import net.fproject.utils.LoggingUtil;
	import net.fproject.utils.ResourceUtil;

	/**
	 * This class provides methods to download file using JavaScript.
	 * 
	 * @author Bui Sy Nguyen
	 */
	public class FileDownloader
	{
		[Embed(source="download.js", mimeType="application/octet-stream")]  
		private var JAVASCRIPT:Class;
		
		public function initJavaScript():void
		{
			var byteArray:ByteArrayAsset = ByteArrayAsset(new JAVASCRIPT());  
			var js:String = byteArray.readUTFBytes(byteArray.length);
			ExternalInterface.call(js);
		}
		
		public function download(url:String):void
		{
			ExternalInterface.call("downloadFile", url, AppContext.instance.loginUser.token);
		}
		
		public function FileDownloader(e:SingletonEnforcer)
		{
			if(e == null)
				LoggingUtil.logAndThrowSingletonError(FileDownloader);
			if(!ExternalInterface.available)
			{
				LoggingUtil.logAndThrowError(FileDownloader, ResourceUtil.FPRJ_CORE, 22, null,
					ResourceUtil.FPRJ_CORE_BUNDLE,"external.interface.not.available");
			}
			initJavaScript();
		}
		
		private static var _instance:FileDownloader;
		public static function get instance():FileDownloader
		{
			if(_instance == null)
				_instance = new FileDownloader(new SingletonEnforcer);
			return _instance;
		}
	}
}

class SingletonEnforcer{}