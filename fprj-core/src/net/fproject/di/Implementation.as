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
	/**
	 * 
	 * The implementation config for an interface or an abstract class.
	 * 
	 */
	public class Implementation
	{
		/**
		 * The the abstractor class
		 */
		public var abstractor:Class;
		
		/**
		 * The implementation class
		 */
		public var impl:Class;
		
		public function Implementation(abstractor:Class=null, impl:Class=null)
		{
			this.abstractor = abstractor;
			this.impl = impl;
		}
	}
}