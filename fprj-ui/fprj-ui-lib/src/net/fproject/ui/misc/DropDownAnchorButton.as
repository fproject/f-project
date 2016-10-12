package net.fproject.ui.misc
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.collections.IList;
	import mx.events.MenuEvent;
	
	import spark.components.Button;
	
	import net.fproject.gui.component.IDataProviderOwner;
	import net.fproject.ui.menu.Menu;
	
	/**
	 *  Dispatched when a menu item is selected. 
	 *
	 *  @eventType mx.events.MenuEvent.ITEM_CLICK
	 *  
	 */
	[Event(name="itemClick", type="mx.events.MenuEvent")]
	public class DropDownAnchorButton extends Button implements IDataProviderOwner
	{
		public var menu:Menu;
		
		/**
		 * Prototype:
		 * <pre>function myDropDownPointFunction(button:DropDownAnchorButton):Point</pre> 
		 */
		public var dropDownPointFunction:Function;
		
		public function DropDownAnchorButton()
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		protected function onMouseDown(e:MouseEvent):void
		{
			showDropDownMenu();
		}
		
		public function showDropDownMenu(x:Number=NaN, y:Number=NaN):void
		{
			if(isNaN(x) || isNaN(y))
			{
				if(dropDownPointFunction != null)
				{
					var p:Point = dropDownPointFunction(this);
				}				
				else
				{
					// Calculate position of Menu in Application's coordinates. 
					p = new Point(0, this.height);
					p = this.localToGlobal(p);
				}
				x = p.x;
				y = p.y;
			}			
			
			this.callLater(menu.show,[x, y]);
		}
		
		protected var _dataProvider:IList;
		
		public function get dataProvider():IList
		{
			return _dataProvider;
		}
		
		private var dataProviderChanged:Boolean
		public function set dataProvider(value:IList):void
		{
			if(_dataProvider !== value)
			{
				_dataProvider = value;
				dataProviderChanged = true;
				invalidateProperties();
			}
		}
		
		protected var _labelField:String;
		
		public function get labelField():String
		{
			return _labelField;
		}
		
		private var labelFieldChanged:Boolean
		public function set labelField(value:String):void
		{
			if(_labelField !== value)
			{
				_labelField = value;
				labelFieldChanged = true;
				invalidateProperties();
			}
		}
		
		/**
		 *  @private
		 *  Storage for labelFunction property.
		 */
		private var _labelFunction:Function;
		
		/**
		 *  A user-supplied function to run on each item to determine its label.  
		 *  By default, the list looks for a property named <code>label</code> 
		 *  on each data provider item and displays it.
		 *  However, some data sets do not have a <code>label</code> property
		 *  nor do they have another property that can be used for displaying.
		 *  An example is a data set that has lastName and firstName fields
		 *  but you want to display full names.
		 *
		 *  <p>You can supply a <code>labelFunction</code> that finds the 
		 *  appropriate fields and returns a displayable string. The 
		 *  <code>labelFunction</code> is also good for handling formatting and 
		 *  localization. </p>
		 *
		 *  <p>For most components, the label function takes a single argument
		 *  which is the item in the data provider and returns a String.</p>
		 *  <pre>
		 *  myLabelFunction(item:Object):String</pre>
		 *
		 *  <p>The method signature for the DataGrid and DataGridColumn classes is:</p>
		 *  <pre>
		 *  myLabelFunction(item:Object, column:DataGridColumn):String</pre>
		 * 
		 *  <p>where <code>item</code> contains the DataGrid item object, and
		 *  <code>column</code> specifies the DataGrid column.</p>
		 *
		 *  @default null
		 *  
		 */
		public function get labelFunction():Function
		{
			return _labelFunction;
		}
		
		private var labelFunctionChanged:Boolean;
		
		/**
		 *  @private
		 */
		public function set labelFunction(value:Function):void
		{
			_labelFunction = value;
			
			labelFunctionChanged = true;
			
			invalidateProperties();
		}
		
		protected var _menuParent:DisplayObjectContainer;
		
		public function get menuParent():DisplayObjectContainer
		{
			return _menuParent;
		}
		
		private var menuParentChanged:Boolean
		public function set menuParent(value:DisplayObjectContainer):void
		{
			if(_menuParent !== value)
			{
				_menuParent = value;
				menuParentChanged = true;
				invalidateProperties();
			}
		}
		
		protected function buildMenu():void
		{
			if(menu == null)
			{
				menu = Menu.createMenu(this.menuParent, this.dataProvider);
				menu.addEventListener(MenuEvent.ITEM_CLICK, 
					function(e:MenuEvent):void
					{
						dispatchEvent(e);
					});
			}
			if(this.labelFunction != null)
				menu.labelField = this.labelField;
			else if(this.labelField != null)
				menu.labelField = this.labelField;
			else
				menu.labelFunction = defaultLabelFunction;
		}
		
		protected function defaultLabelFunction(item:Object):String
		{
			if(item != null)
			{
				if(item.hasOwnProperty("label"))
					return item["label"];
				if(item.hasOwnProperty("name"))
					return item["name"];
				if(item.hasOwnProperty("text"))
					return item["text"];
				if(item.hasOwnProperty("title"))
					return item["title"];
			}
			return null;
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if(this.menu != null)
			{
				if(labelFieldChanged)
				{
					labelFieldChanged = false;
					menu.labelField = this.labelField;
				}
				
				if(labelFunctionChanged)
				{
					labelFunctionChanged = false;
					menu.labelFunction = this.labelFunction;
				}
				
				if(menuParentChanged)
				{
					menuParentChanged = false;
					menu.owner = this.menuParent;
				}
			}
			
			if(dataProviderChanged)
			{
				dataProviderChanged = false;
				buildMenu();
			}
		}
	}
}