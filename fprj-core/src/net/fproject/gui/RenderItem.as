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
package net.fproject.gui
{
    import flash.events.*;
    
    import mx.core.*;
    import mx.events.FlexEvent;
    
    import net.fproject.utils.DataUtil;

	/**
	 * A <code>RenderItem</code> represents an object that can be set on the data 
	 * property of an <code>IDataRenderer</code> interface.<br/><br/>
	 * It is used when the <code>IDataRenderer</code> implementation needs more
	 * information than just the raw data from the <code>dataProvider</code>. 
	 * */
    public class RenderItem extends EventDispatcher
    {
        private var _owner:IUIComponent;
        private var _data:Object;

        public function RenderItem(owner:IUIComponent, data:Object)
        {
            this._owner = owner;
            this._data = data;
        }

        /**
		 * The <code>IUIComponent</code> instance that is in charge of rendering 
		 * the <code>IDataRenderer</code> interface.
		 * */
		public function get owner() : IUIComponent
        {
            return this._owner;
        }
				
		/**
		 * The raw data coming from the <code>dataProvider</code>.
		 * */
		[Bindable(event="dataChanged")]
        public function get data() : Object
        {
            return this._data;
        }
		
		public function set data(value:Object):void
		{
			if (_data != value)
			{
				this._data = value;
				dispatchEvent(new FlexEvent("dataChanged"));
			}			
		}
			
		/**
		 * Returns the value of the data object field associated with this 
		 * <code>RenderItem</code> class.<br/><br/>
		 * If the <code>fieldFunction</code> is provided, it is used to compute 
		 * the returned value. The <code>fieldFunction</code> must obey to the 
		 * following signature:<br/><br/>
		 * <pre>fieldFunction(data:Object):Object</pre>
		 * It returns the value.<br/><br/>
		 * If no <code>fieldFunction</code> is provided, the field attribute is 
		 * used to query the value. If the data object is an <code>XML</code> 
		 * element, the field is the name of an attribute of the 
		 * <code>XML</code> element and should start with &#64;. 
		 * Otherwise, field is an attribute of the object.
		 * 
		 * @param field The field object.
		 * @param defaultValue The default value when the object does not 
		 * hold the field. Defaults to <code>null</code>.
		 * @param fieldFunction A function that returns the value of the field.
		 * @return The value of the object field or the <code>defaultValue</code>, 
		 * if the object does not have such a field.
		 * 
		 * */
        public function getFieldValue(field:Object, defaultValue:Object = null, fieldFunction:Function = null) : Object
        {
            return DataUtil.getFieldValue(this._data, field, defaultValue, fieldFunction);
        }

    }
}
