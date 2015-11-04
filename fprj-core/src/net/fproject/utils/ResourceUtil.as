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
package net.fproject.utils
{
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.StringUtil;
	
	import net.fproject.fproject_internal;
	
	/**
	 *  Helper class of locale Strings and Images, such as <code>[ "en_US" ]</code>,
	 *  which specifies one or more locales to be searched for resources.
	 *  
	 *  <p>When you call the ResourceUtils methods
	 *  <code>getString()</code>, <code>getStrings()</code>,
	 *  <code>getMstString()</code>, <code>getImage()</code>
	 *  to get the value of a resource,
	 *  you specify a bundle name and a resource name,
	 *  but not a locale.
	 *  The ResourceUtils starts with the first locale in the
	 *  <code>localeChain</code> and looks for a ResourceBundle
	 *  with the specified bundle name for that locale.
	 *  If such a ResourceBundle exists, and the specified resource
	 *  exists in it, then the value of that resource is returned.
	 *  Otherwise, the ResourceUtils proceeds on to the other
	 *  locales in the <code>localeChain</code>.</p>
	 *
	 *  <p>This scheme makes it possible to have locales that do not
	 *  necessarily contain a complete set of localized resources.
	 *  For example, if you are localizing your application for
	 *  Indian English rather than U.S. English, you need only
	 *  supply resources for the <code>en_IN</code> locale in which the
	 *  Indian spelling or usage differs from that in the U.S.,
	 *  and then set the <code>localeChain</code> property
	 *  to <code>[ "en_IN", "en_US" ]</code>.</p>
	 *
	 *  @see mx.resources.ResourceManager
	 *  @see mx.resources.IResourceManager
	 * 
	 *  @author Bui Sy Nguyen
	 * */
	public class ResourceUtil
	{		
		/*----------------------------------------------------
		|
		| ResourceBundle for fproject library 
		|
		------------------------------------------------------*/
		public static const FPRJ_CORE_BUNDLE:String = "fprjcore";
		public static const FPRJ_GANTT_BUNDLE:String = "fprjgantt";
		public static const FPRJ_UTILS_BUNDLE:String = "fprjutils";
		public static const FPRJ_CONTROLS_BUNDLE:String = "controls";
		public static const FPRJ_CALENDAR_BUNDLE:String = "calendar";
		public static const FPRJ_MVC_BUNDLE:String = "fprjmvc";
		public static const FPRJ_ORG_BUNDLE:String = "fprjorg";
		
		/**
		 * Module ID for fprj-core 
		 */
		public static const FPRJ_CORE:String = "FPRJ0";
		
		/**
		 * Module ID for fprj-cal 
		 */
		public static const FPRJ_CALENDAR:String = "FPRJ1";
		
		/**
		 * Module ID for fprj-gantt 
		 */
		public static const FPRJ_GANTT:String = "FPRJ2";
		
		/**
		 * Module ID for fprj-chart 
		 */
		public static const FPRJ_CHART:String = "FPRJ3";
		
		/**
		 * Module ID for fprj-org 
		 */
		public static const FPRJ_ORG:String = "FPRJ5";
		
		
		/**
		 * Module ID for fprj-vmc 
		 */
		public static const FPRJ_MVC:String = "FPRJ8";
		
		/**
		 * Module ID for fprj-util 
		 */
		public static const FPRJ_UTILITIES:String = "FPRJ9";	
		
		/**
		 * Default ResourceBundle.<br/>
		 * When you call getString(), getStrings() or getImage method
		 * without specifying the <code>resourceBundle</code> parameter, 
		 * this default resource bundle will be used.
		 * @default "fprjcore"
		 */
		public static var defaultResourceBundle:String = "fprjcore";
	
		/**
		 *  Gets the value of a specified resource as a String,
		 *  after substituting specified values for placeholders.
		 *	
		 *  <p>If a <code>parameters</code> Array is passed to this method,
		 *  the parameters in it are converted to Strings
		 *  and then substituted, in order, for the placeholders
		 *  <code>"{0}"</code>, <code>"{1}"</code>, and so on, in the String
		 *  before it is returned.</p>
		 *
		 *  <p>If the specified resource is not found,
		 *  this method returns <code>null</code>.</p>
		 *
		 *  @param key The name of a resource in the resource bundle.
		 *
		 *  @param resourceBundle The name of a resource bundle.
		 *
		 *  @param parameters An Array of parameters that are
		 *  substituted for the placeholders.
		 *  Each parameter is converted to a String with the <code>toString()</code> method
		 *  before being substituted.
		 *
		 *  @param locale A specific locale to be used for the lookup,
		 *  or <code>null</code> to search all locales
		 *  in the <code>localeChain</code>.
		 *  This parameter is optional and defaults to <code>null</code>;
		 *  you should seldom need to specify it.
		 *
		 *  @return The resource value, as a String,
		 *  or the <code>key</code> itself if the resource bundle is not found.		
		 * */
		public static function getString(key:String, resourceBundle:String = null,
										 parameters:Array = null,
										 locale:String = null):String 
		{
			var s:String;
			try
			{
				if (resourceBundle == null){
					resourceBundle = defaultResourceBundle;
				}
				s = ResourceManager.getInstance().getString(resourceBundle,key,parameters,locale);
			} 
			catch (e:Error) 
			{
				s = null;
			}
			return s == null ? key : s;
		}
		
		/**
		 *  Gets the value of a specified resource as an Array of Strings.
		 *
		 *  <p>This method assumes that the resource value is a String
		 *  containing a comma-separated list of items.
		 *  It calls the <code>getString()</code> method, splits the String
		 *  into items at the commas, and trims white space
		 *  before and after each item.
		 *  It is useful if you have written a line such as:</p>
		 *
		 *  <pre>
		 *  COUNTRIES=India, China, Japan
		 *  </pre>
		 *
		 *  <p>in a properties file and you want to obtain the value
		 *  <code>[ "India", "China", "Japan" ]</code>
		 *  rather than the value <code>"India, China, Japan"</code>.</p> 
		 *
		 *  <p>If the specified resource is not found,
		 *  this method returns <code>null</code>.</p>
		 *
		 *  @param bundleName The name of a resource bundle.
		 *
		 *  @param resourceName The name of a resource in the resource bundle.
		 *
		 *  @param locale A specific locale to be used for the lookup,
		 *  or <code>null</code> to search all locales
		 *  in the <code>localeChain</code>.
		 *  This parameter is optional and defaults to <code>null</code>;
		 *  you should seldom need to specify it.
		 *
		 *  @return The resource value, as an Array of Strings,
		 *  or <code>null</code> if it is not found.
		 *  
		 */
		public static function getStringArray(key:String, resourceBundle:String = null,
										 locale:String = null):Array 
		{
			var a:Array;
			try
			{
				if (resourceBundle == null){
					resourceBundle = defaultResourceBundle;
				}
				a = ResourceManager.getInstance().getStringArray(resourceBundle, key, locale);
			} 
			catch (e:Error) 
			{
				a = null;
			}
			return a;
		}
		
		/**
		 *  Gets the value of a specified resource as a Boolean.
		 *
		 *  <p>This method first calls <code>getString()</code>
		 *  and converts the result to lowercase.
		 *  It then returns <code>true</code>
		 *  if the result was <code>"true"</code>.
		 *  and <code>false</code> otherwise.</p>
		 *
		 *  <p>If the specified resource is not found,
		 *  this method returns <code>false</code>.</p>
		 *
		 *  @param key The name of a resource in the resource bundle.
		 *
		 *  @param resourceBundle The name of a resource bundle.
		 *
		 *  @param locale A specific locale to be used for the lookup,
		 *  or <code>null</code> to search all locales
		 *  in the <code>localeChain</code>.
		 *  This parameter is optional and defaults to <code>null</code>;
		 *  you should seldom need to specify it.
		 *
		 *  @return The resource value, as a Boolean,
		 *  or <code>false</code> if it is not found.
		 *  
		 */
		public static function getBoolean(key:String, resourceBundle:String = null,
										  locale:String = null):Boolean 
		{
			var b:Boolean;
			try
			{
				if (resourceBundle == null){
					resourceBundle = defaultResourceBundle;
				}
				b = ResourceManager.getInstance().getBoolean(resourceBundle, key, locale);
			} 
			catch (e:Error) 
			{
				b = false;
			}
			return b;
		}
		
		
		/**
		 *  Gets the value of a specified resource as an Image object.
		 *
		 *  <p>This method calls <code>getObject()</code>
		 *  and coerces it to type Image using the <code>as</code> operator.
		 *  The result will be <code>null</code> if the resource value
		 *  was not a class reference.
		 *  It is useful if you have written in a properties file a lines such as</p>
		 *  myresourcefile.properties<br/>
		 *  <pre>
		 *  myImage=Embed("image.jpg")
		 *  </pre>
		 *
		 *  <p>and want to obtain the Image that the <code>Embed()</code>
		 *  directive produced.</p> 
		 *
		 *  <p>If the specified resource is not found,
		 *  this method returns <code>null</code>.</p>
		 *
		 *  @param key The name of a resource in the resource bundle.
		 * 
		 *  @param resourceBundle The name of a resource bundle.
		 *
		 *  @param locale A specific locale to be used for the lookup,
		 *  or <code>null</code> to search all locales
		 *  in the <code>localeChain</code>.
		 *  This parameter is optional and defaults to <code>null</code>;
		 *  you should seldom need to specify it.
		 *
		 *  @return The <code>Class</code> object of the resource image,
		 *  or <code>null</code> if it is not found.
		 */
		public static function getImage(key: String,resourceBundle : String = null, locale:String = null):Class 
		{
			var image:Class = null;
			try
			{
				if (resourceBundle == null){
					resourceBundle = defaultResourceBundle;
				}
				image = ResourceManager.getInstance().getClass(resourceBundle,key,locale);
			} 
			catch (e:Error)
			{				
			}
			return image;
		}
			
		/**
		 * Get a label, using resource bundle if need 
		 * @param s the input value. If this value starts with "@Resource(" then
		 * the resource bundle will be used to get the label string.<br/>
		 * Example:<br/><pre>
		 * "@Resource(bundle='task', key='button.tip.GotoBar')"
		 * "@Resource(key='button.tip.GotoBar')"
		 * "@Resource(button.tip.GotoBar)"
		 * </pre>
		 * @param defaultBundle the defaule bundle
		 * 
		 */
		public static function getLabel(s:String, defaultBundle:String=null):String 
		{
			if(s == null)
				return null;
			
			if(s.substr(0, 10) != "@Resource(")
				return s;
			
			s = mx.utils.StringUtil.trim(s.substr(10));
			if(s.charAt(s.length - 1) == ')')
				s = s.substr(0, s.length - 1);
			
			var a:Array = s.split(",");
			if(a.length > 1)
			{
				var i:int = a.length - 1;
				var key:String = getLabelParam(a[i]);
				if(key.charAt(0) == '[' && key.charAt(key.length - 1) == ']')
				{
					var params:Array = evaluateParams(key);
					i--;
					key = getLabelParam(a[i]);					
				}
				i--;
				if(i >= 0)
					defaultBundle = getLabelParam(a[i]);
			}
			else
			{
				key = getLabelParam(a[0]);
			}
				
			return getString(key, defaultBundle, params);
		}
		
		private static function evaluateParams(sParams:String):Array
		{
			sParams = sParams.substring(1, sParams.length - 1);
			var sarr:Array = sParams.split(",");
			var params:Array = [];
			for each (var s:String in sarr)
			{
				params.push(DataUtil.evaluateChainValue(s));
			}
			return params;
		}
		
		/**
		 * Get a resource string for logging at INFO level according to the specified arguments
		 * 
		 * @param module
		 * @param messageNumber
		 * @param resourceManager
		 * @param resourceBundle
		 * @param bundleKey
		 * @param parameters
		 * @return The a resource string.
		 * 
		 */
		public static function getInfo(module:String, messageNumber:uint, 
									   resourceManager:IResourceManager, resourceBundle:String, 
									   bundleKey:String, parameters:Array = null) : String
		{
			var msgUid:String = getMessageUniqueID(module, messageNumber, "I");
			return msgUid + ": " + getMessage(resourceManager, resourceBundle, bundleKey + "." + msgUid, parameters);
		}
		
		/**
		 * Get a resource string for logging at INFO level according to the specified arguments
		 * 
		 * @param messageNumber
		 * @param bundleKey
		 * @param parameters
		 * @return 
		 * 
		 */
		fproject_internal static function getInfo(messageNumber:uint, bundleKey:String, parameters:Array = null) : String
		{
			return getInfo(FPRJ_CORE, messageNumber, null, FPRJ_CORE_BUNDLE, bundleKey, parameters);
		}
		
		/**
		 * Get a resource string for logging at WARN level according to the specified arguments
		 * 
		 * @param module
		 * @param messageNumber
		 * @param resourceManager
		 * @param resourceBundle
		 * @param bundleKey
		 * @param parameters
		 * @return 
		 * 
		 */
		public static function getWarn(module:String, messageNumber:uint, 
										  resourceManager:IResourceManager, resourceBundle:String, 
										  bundleKey:String, parameters:Array = null) : String
		{
			var msgUid:String = getMessageUniqueID(module, messageNumber, "W");
			return msgUid + ": " + getMessage(resourceManager, resourceBundle, bundleKey + "." + msgUid, parameters);
		}
		
		/**
		 * Get a resource string for logging at WARN level according to the specified arguments
		 * 
		 * @param messageNumber
		 * @param bundleKey
		 * @param parameters
		 * @return 
		 * 
		 */
		fproject_internal static function getWarn(messageNumber:uint, bundleKey:String, parameters:Array = null) : String
		{
			return getWarn(FPRJ_CORE, messageNumber, null, FPRJ_CORE_BUNDLE, bundleKey, parameters);
		}
		
		/**
		 * Get a resource string for logging at ERROR level according to the specified arguments
		 * 
		 * @param module
		 * @param messageNumber
		 * @param resourceManager
		 * @param resourceBundle
		 * @param bundleKey
		 * @param parameters
		 * @return 
		 * 
		 */
		public static function getError(module:String, messageNumber:uint, 
										resourceManager:IResourceManager, resourceBundle:String, 
										bundleKey:String, parameters:Array = null) : String
		{
			var msgUid:String = getMessageUniqueID(module, messageNumber, "E");
			return msgUid + ": " + getMessage(resourceManager, resourceBundle, bundleKey + "." + msgUid, parameters);
			
		}
		
		/**
		 * Get a resource string for logging at ERROR level according to the specified arguments
		 * 
		 * @param messageNumber
		 * @param bundleKey
		 * @param parameters
		 * @return 
		 * 
		 */
		fproject_internal static function getError(messageNumber:uint, bundleKey:String, parameters:Array = null) : String
		{
			return getError(FPRJ_CORE, messageNumber, null, FPRJ_CORE_BUNDLE, bundleKey, parameters);
		}
		
		private static function getMessage(resourceManager:IResourceManager, resourceBundle:String, 
										   bundleKey:String, parameters:Array = null) : String
		{
			if (resourceManager == null)
				resourceManager = ResourceManager.getInstance();
			return resourceManager.getString(resourceBundle, bundleKey, parameters);
		}
		
		private static function getMessageUniqueID(module:String, messageNumber:uint, type:String) : String
		{
			return module + paddingZero(messageNumber) + type;
		}
		
		private static function paddingZero(messageNumber:uint) : String
		{
			var msgUid:String = messageNumber.toString();
			while (msgUid.length < 3)
				msgUid = "0" + msgUid;
			return msgUid;
		}
		
		//Example: getLabelParam("bundle='abc', key='cde'")
		private static function getLabelParam(s:String):String
		{
			var i:int = s.search('=');
			if(i !=- 1)
				s = s.substr(i + 1);
			s = mx.utils.StringUtil.trim(s);
			if(s.charAt(0) == "'")
				s = s.substr(1);
			if(s.charAt(s.length -1) == "'")
				s = s.substr(0, s.length - 1);
			
			return s;
		}
	}
}