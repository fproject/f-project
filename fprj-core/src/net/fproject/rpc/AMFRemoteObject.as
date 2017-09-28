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
package net.fproject.rpc
{
	import mx.rpc.remoting.RemoteObject;
	
	import net.fproject.core.AppContext;
	import net.fproject.event.AppContextEvent;
	
	/**
	 * AMFRemoteObject extends from RemoteObject with OAuth 2.0 and some additional supports
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public dynamic class AMFRemoteObject extends RemoteObject implements IRemoteObject
	{
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setAuthToken(token:String):void
		{
			this.setCredentials('', token);
			AppContext.instance.addEventListener(AppContextEvent.ACCESS_TOKEN_CHANGE,
				function(e:AppContextEvent):void
				{
					setCredentials('', e.data as String);
				});
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setConvertParametersHandler(value:Function):void
		{
			convertParametersHandler = value;
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		public function setConvertResultHandler(value:Function):void
		{
			convertResultHandler = value;
		}
		
		public function AMFRemoteObject(destination:String=null)
		{
			super(destination);
		}
	}
}