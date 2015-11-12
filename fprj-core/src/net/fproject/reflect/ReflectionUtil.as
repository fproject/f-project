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
package net.fproject.reflect
{
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.Metadata;
	import org.as3commons.reflect.Type;

	/**
	 * 
	 * AS3 Refection utility class.
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class ReflectionUtil
	{
		
		/**
		 * Search metadata value for a member of a class by its <code>name</code> or <code>argument key</code>.
		 * @param source the metadata source to search. This can be a class, an instance object of a class
		 * or an instance of org.as3commons.reflect.Type
		 * @param member the member name/id or the member object.
		 * If this value is the member itself, them member must have an <code>id</code> property.
		 * @param metadataName the metadata name to search, should be in lower-case
		 * @param argumentName the metadata argument name to search, should be in lower-case
		 * @return The returned value follows this rule:
		 * <ul>
		 * <li>If no metadata found, <code>null</code> is returned.</li>
		 * <li>If only one metadata found and the metadata has only one argument or <code>argumentName</code> is not null,
		 * the value of that argument is returned.</li>
		 * <li>If only one metadata found and the metadata has more than one argument,
		 * an instance of <code>org.as3commons.reflect.Metadata</code> is returned.</li>
		 * <li>If several metadata found and <code>argumentName</code> is not specified,
		 * an array of <code>org.as3commons.reflect.Metadata</code> objects is returned</li>
		 * <li>If several metadata found and <code>argumentName</code> is specified,
		 * an array of values associated with that argument is returned
		 * </ul>
		 */
		public static function findMemberMetadataValue(source:*, member:Object, 
													   metadataName:String, argumentName:String=null):Object
		{
			if(member is String)
				var memberId:String = member as String;
			else if(member != null && member.hasOwnProperty("id"))
				memberId = member.id;
			if(memberId == null)
				return null;
			
			if(source is Type)
				var type:Type = Type(source);
			else if(source is Class)
				type = Type.forClass(source);
			else
				type = Type.forInstance(source);
			
			var members:Array = type.variables.concat(type.accessors);
			var a:Array = [];
			for each (var m:AbstractMember in members)
			{ 
				if(m.name == memberId)
				{
					for each (var metadata:Metadata in m.metadata)
					{
						if(metadata.name == metadataName.toLowerCase())
						{
							if(argumentName == null)
								a.push(metadata);
							else if(metadata.hasArgumentWithKey(argumentName))
								a.push(metadata.getArgument(argumentName).value);
						}
					}
					break;
				}
			}
			
			if(a.length == 0)
				return null;
			
			if(a.length == 1)
			{
				if(a[0] is Metadata && Metadata(a[0]).arguments.length == 1)
					return Metadata(a[0]).arguments[0].value;
				else
					return a[0];
			}
			
			return a;
		}
		
		/**
		 * Search metadata value for a class by its <code>name</code> or <code>argument key</code>.
		 * @param source the metadata source to search. This can be a class, an instance object of a class
		 * or an instance of <code>org.as3commons.reflect.Type</code>
		 * @param metadataName the metadata name to search, should be in lower-case
		 * @param argumentName the metadata argument name to search, should be in lower-case
		 * @return The returned value follows this rule:
		 * <ul>
		 * <li>If no metadata found, <code>null</code> is returned.</li>
		 * <li>If only one metadata found and the metadata has only one argument or <code>argumentName</code> is not null,
		 * the value of that argument is returned.</li>
		 * <li>If only one metadata found and the metadata has more than one argument,
		 * an instance of <code>org.as3commons.reflect.Metadata</code> is returned.</li>
		 * <li>If several metadata found and <code>argumentName</code> is not specified,
		 * an array of <code>org.as3commons.reflect.Metadata</code> objects is returned</li>
		 * <li>If several metadata found and <code>argumentName</code> is specified,
		 * an array of values associated with that argument is returned
		 * </ul>
		 */
		public static function findClassMetadataValue(source:*, metadataName:String, argumentName:String=null):Object
		{
			if(source is Type)
				var type:Type = Type(source);
			else if(source is Class)
				type = Type.forClass(source);
			else
				type = Type.forInstance(source);
			
			var metaArray:Array = getAllExtendsClassMetadata(type);
			var a:Array = [];
			for each (var metadata:Metadata in metaArray)
			{
				if(metadata.name == metadataName.toLowerCase())
				{
					if(argumentName == null)
						a.push(metadata);
					else if(metadata.hasArgumentWithKey(argumentName))
						a.push(metadata.getArgument(argumentName).value);
				}
			}
			
			if(a.length == 0)
				return null;
			
			if(a.length == 1)
			{
				if(a[0] is Metadata && Metadata(a[0]).arguments.length == 1)
					return Metadata(a[0]).arguments[0].value;
				else
					return a[0];
			}
			
			return a;
		}
		
		/**
		 * Get all metadata declared in a class and its parent classes 
		 * @param type the type of the class
		 * @return an array of all metadata
		 * 
		 */
		public static function getAllExtendsClassMetadata(type:Type):Array
		{
			var a:Array = type.metadata;
			for each(var c:String in type.extendsClasses)
			{
				var t:Type = Type.forName(c);
				a = a.concat(t.metadata);
			}
			
			return a;
		}
		
		/**
		 * Get all members that has given metadata 
		 * @param container the metadata container or source to search. This can be a class, an instance object of a class
		 * or an instance of <code>org.as3commons.reflect.Type</code>
		 * @param metadataName the metadata name to search, should be in lower-case
		 * @param memberFoundCallback the callback that will be invoked anytime a member with specified metadata was found.
		 * Should have following signature:
		 * <pre>function myMemberFoundCallback(member:AbstractMember, metaMember:Object)</pre>
		 * 
		 * @return array of found members. Each element is a standard object has the following format:
		 * 
		 * <pre>{name:"memberName", metadata:[Metadata_1,Metadata_2,...]}</pre>
		 */
		public static function getAllMembersMetadata(container:Object, metadataName:String, memberFoundCallback:Function=null):Array
		{
			if(container is Type)
				var type:Type = Type(container);
			else
				type = Type.forInstance(container);
			var members:Array = type.variables.concat(type.accessors);
			var metaArr:Array = [];
			for each (var member:AbstractMember in members)
			{
				var m:Object = null;
				for each(var meta:Metadata in member.metadata)
				{
					if(meta.name.toLowerCase() == metadataName.toLowerCase())
					{
						if(m == null)
						{
							m = {name:member.name, metadata:[]};
							metaArr.push(m);
							if(memberFoundCallback != null)
								memberFoundCallback(member, m);
						}
						m.metadata.push(meta);
					}
				}
			}
			return metaArr;
		}
	}
}