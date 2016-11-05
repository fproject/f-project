package net.fproject.themes.chrome.skins
{
	import flash.utils.Proxy;
	
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.LinearGradientStroke;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.states.Transition;
	
	import spark.components.Label;
	import spark.effects.AnimateColor;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;
	
	import net.fproject.supportClasses.SkinWatcherSetupUtil;
	
	use namespace mx_internal;
	
	public class EmphasizedButtonSkin extends SparkButtonSkin implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		
		
		public var overToUpAnimate:AnimateColor;
		
		public var upToOverAnimate:AnimateColor;
		
		private var _1581046974borderStrokeEntry1:GradientEntry;
		
		public var borderStrokeEntry2:GradientEntry;
		
		private var _1581046976borderStrokeEntry3:GradientEntry;
		
		private var _1581046979border2Entry1:GradientEntry;
		
		private var _1581046980border2Entry2:GradientEntry;
		
		public var bottomMarkLine:Line;
		
		private var _1924246667borderStroke:LinearGradientStroke;
		
		public var border2:Rect;
		
		private var _border:Rect;
		
		private var _emphasizedFill:SolidColor;
		
		private var _emphasizedOverlay:Rect;
		
		private var _emphasizedStroke:SolidColorStroke;
		
		private var _fillA:GradientEntry;
		
		private var _fillB:GradientEntry;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function EmphasizedButtonSkin()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this.skin_bindingsSetup();
			var watchers:Array = [];
			target = this;
			
			if(_watcherSetupUtil == null)
				SkinWatcherSetupUtil.init(null, EmphasizedButtonSkin,function(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
				{
					param5[0] = new PropertyWatcher("fillA",{"propertyChange":true},[param4[0],param4[1]],param2);
					param5[1] = new PropertyWatcher("fillB",{"propertyChange":true},[param4[0],param4[1]],param2);
					param5[0].updateParent(param1);
					param5[1].updateParent(param1);
				});
			
			_watcherSetupUtil.setup(this,function(field:String):*
			{
				return target[field];
			},function(field:String):*
			{
				return EmphasizedButtonSkin[field];
			},bindings,watchers);
			
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.minWidth = 21;
			this.minHeight = 25;
			this.transitions = [this.createOverToUpTransition(),this.createUpToOverTransition()];
			this.mxmlContent = createMxmlContent();
			this.currentState = "up";
			var borderStrokeEntry2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.createBorderStrokeEntry2);
			var bottomMarkLine_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.createBottomMarkLine);
			states = [new State({
				"name":"up",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":bottomMarkLine_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["border2"]
				})]
			}),new State({
				"name":"over",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":bottomMarkLine_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["border2"]
				}),new SetProperty().initializeFromObject({
					"target":"borderStrokeEntry3",
					"name":"color",
					"value":10066329
				}),new SetProperty().initializeFromObject({
					"target":"fillA",
					"name":"color",
					"value":16185078
				}),new SetProperty().initializeFromObject({
					"target":"fillB",
					"name":"color",
					"value":15856113
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry1",
					"name":"color",
					"value":16777215
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry2",
					"name":"color",
					"value":15395562
				})]
			}),new State({
				"name":"down",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":borderStrokeEntry2_factory,
					"destination":"borderStroke",
					"propertyName":"entries",
					"position":"after",
					"relativeTo":["borderStrokeEntry1"]
				}),new SetProperty().initializeFromObject({
					"target":"borderStrokeEntry1",
					"name":"color",
					"value":8355711
				}),new SetProperty().initializeFromObject({
					"target":"borderStrokeEntry3",
					"name":"color",
					"value":10592673
				}),new SetProperty().initializeFromObject({
					"target":"fillA",
					"name":"color",
					"value":13948116
				}),new SetProperty().initializeFromObject({
					"target":"fillB",
					"name":"color",
					"value":12698049
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry1",
					"name":"alpha",
					"value":0.05
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry1",
					"name":"color",
					"value":0
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry2",
					"name":"alpha",
					"value":0.01
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry2",
					"name":"color",
					"value":0
				})]
			}),new State({
				"name":"disabled",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":bottomMarkLine_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["border2"]
				}),new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
			})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		protected function createMxmlContent():Array
		{
			return [this.createBorder(),this.createBorder2(),
				this.createEmphasizedOverlay(),this.createLabelDisplay()];
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			_watcherSetupUtil = param1;
		}
		
		override protected function updateDisplayList(uw:Number, uh:Number) : void
		{
			super.updateDisplayList(uw,uh);
			var c:uint = getStyle("selectionColor");
			this.emphasizedStroke.color = c;
			this.emphasizedFill.color = c;
		}
		
		protected function createOverToUpTransition() : Transition
		{
			var _loc1_:Transition = new Transition();
			_loc1_.fromState = "over";
			_loc1_.toState = "up";
			_loc1_.effect = this.createOverToUpAnimate();
			return _loc1_;
		}
		
		protected function createOverToUpAnimate() : AnimateColor
		{
			var _loc1_:AnimateColor = new AnimateColor();
			_loc1_.duration = 100;
			this.overToUpAnimate = _loc1_;
			BindingManager.executeBindings(this,"overToUpAnimate",this.overToUpAnimate);
			return _loc1_;
		}
		
		protected function createUpToOverTransition() : Transition
		{
			var _loc1_:Transition = new Transition();
			_loc1_.fromState = "up";
			_loc1_.toState = "over";
			_loc1_.effect = this.createUpToOverAnimate();
			return _loc1_;
		}
		
		protected function createUpToOverAnimate() : AnimateColor
		{
			var _loc1_:AnimateColor = new AnimateColor();
			_loc1_.duration = 100;
			this.upToOverAnimate = _loc1_;
			BindingManager.executeBindings(this,"upToOverAnimate",this.upToOverAnimate);
			return _loc1_;
		}
		
		protected function createBorder() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.stroke = this.createBorderStroke();
			_loc1_.fill = this.createBorderFill();
			_loc1_.initialized(this,"border");
			this.border = _loc1_;
			BindingManager.executeBindings(this,"border",this.border);
			return _loc1_;
		}
		
		protected function createBorderStroke() : LinearGradientStroke
		{
			var _loc1_:LinearGradientStroke = new LinearGradientStroke();
			_loc1_.rotation = 90;
			_loc1_.entries = [this.createBorderStrokeEntry1(),this.createBorderStrokeEntry3()];
			this.borderStroke = _loc1_;
			BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
			return _loc1_;
		}
		
		protected function createBorderStrokeEntry1() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.ratio = 0;
			_loc1_.color = 11250603;
			this.borderStrokeEntry1 = _loc1_;
			BindingManager.executeBindings(this,"borderStrokeEntry1",this.borderStrokeEntry1);
			return _loc1_;
		}
		
		protected function createBorderStrokeEntry2() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.ratio = 0.1;
			_loc1_.color = 11119017;
			this.borderStrokeEntry2 = _loc1_;
			BindingManager.executeBindings(this,"borderStrokeEntry2",this.borderStrokeEntry2);
			return _loc1_;
		}
		
		protected function createBorderStrokeEntry3() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.ratio = 1;
			_loc1_.color = 10066329;
			this.borderStrokeEntry3 = _loc1_;
			BindingManager.executeBindings(this,"borderStrokeEntry3",this.borderStrokeEntry3);
			return _loc1_;
		}
		
		protected function createBorderFill() : LinearGradient
		{
			var _loc1_:LinearGradient = new LinearGradient();
			_loc1_.rotation = 90;
			_loc1_.entries = [this.createFillA(),this.createFillB()];
			return _loc1_;
		}
		
		protected function createFillA() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.color = 15658734;
			_loc1_.ratio = 0;
			this.fillA = _loc1_;
			BindingManager.executeBindings(this,"fillA",this.fillA);
			return _loc1_;
		}
		
		protected function createFillB() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.color = 15132390;
			_loc1_.ratio = 1;
			this.fillB = _loc1_;
			BindingManager.executeBindings(this,"fillB",this.fillB);
			return _loc1_;
		}
		
		protected function createBorder2() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 1;
			_loc1_.right = 1;
			_loc1_.top = 1;
			_loc1_.bottom = 1;
			_loc1_.radiusX = 3;
			_loc1_.stroke = this.createBorder2Stroke();
			_loc1_.initialized(this,"border2");
			this.border2 = _loc1_;
			BindingManager.executeBindings(this,"border2",this.border2);
			return _loc1_;
		}
		
		protected function createBorder2Stroke() : LinearGradientStroke
		{
			var _loc1_:LinearGradientStroke = new LinearGradientStroke();
			_loc1_.rotation = 90;
			_loc1_.entries = [this.createBorder2Entry1(),this.createBorder2Entry2()];
			return _loc1_;
		}
		
		protected function createBorder2Entry1() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.ratio = 0;
			_loc1_.color = 16448250;
			this.border2Entry1 = _loc1_;
			BindingManager.executeBindings(this,"border2Entry1",this.border2Entry1);
			return _loc1_;
		}
		
		protected function createBorder2Entry2() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.ratio = 1;
			_loc1_.color = 15395562;
			this.border2Entry2 = _loc1_;
			BindingManager.executeBindings(this,"border2Entry2",this.border2Entry2);
			return _loc1_;
		}
		
		protected function createBottomMarkLine() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.right = 3;
			_loc1_.bottom = -1;
			_loc1_.left = 3;
			_loc1_.stroke = this.createPressedMarkLineStroke();
			_loc1_.initialized(this,"bottomMarkLine");
			this.bottomMarkLine = _loc1_;
			BindingManager.executeBindings(this,"bottomMarkLine",this.bottomMarkLine);
			return _loc1_;
		}
		
		protected function createPressedMarkLineStroke() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 8026746;
			_loc1_.alpha = 0.2;
			_loc1_.weight = 1;
			_loc1_.caps = "square";
			return _loc1_;
		}
		
		protected function createEmphasizedOverlay() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.stroke = this.createEmphasizedStroke();
			_loc1_.fill = this.createEmphasizedFill();
			_loc1_.initialized(this,"emphasizedOverlay");
			this.emphasizedOverlay = _loc1_;
			BindingManager.executeBindings(this,"emphasizedOverlay",this.emphasizedOverlay);
			return _loc1_;
		}
		
		protected function createEmphasizedStroke() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.alpha = 0.5;
			this.emphasizedStroke = _loc1_;
			BindingManager.executeBindings(this,"emphasizedStroke",this.emphasizedStroke);
			return _loc1_;
		}
		
		protected function createEmphasizedFill() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0.1;
			this.emphasizedFill = _loc1_;
			BindingManager.executeBindings(this,"emphasizedFill",this.emphasizedFill);
			return _loc1_;
		}
		
		protected function createLabelDisplay() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.left = 10;
			_loc1_.right = 10;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 1;
			_loc1_.maxDisplayedLines = 1;
			_loc1_.setStyle("textAlign","center");
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
			return _loc1_;
		}
		
		protected function skin_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Array
			{
				var _loc1_:* = [fillA,fillB];
				return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
			},null,"overToUpAnimate.targets");
			result[1] = new Binding(this,function():Array
			{
				var _loc1_:* = [fillA,fillB];
				return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
			},null,"upToOverAnimate.targets");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get borderStrokeEntry1() : GradientEntry
		{
			return this._1581046974borderStrokeEntry1;
		}
		
		public function set borderStrokeEntry1(param1:GradientEntry) : void
		{
			var _loc2_:Object = this._1581046974borderStrokeEntry1;
			if(_loc2_ !== param1)
			{
				this._1581046974borderStrokeEntry1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStrokeEntry1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get borderStrokeEntry3() : GradientEntry
		{
			return this._1581046976borderStrokeEntry3;
		}
		
		public function set borderStrokeEntry3(param1:GradientEntry) : void
		{
			var _loc2_:Object = this._1581046976borderStrokeEntry3;
			if(_loc2_ !== param1)
			{
				this._1581046976borderStrokeEntry3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStrokeEntry3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get border2Entry1() : GradientEntry
		{
			return this._1581046979border2Entry1;
		}
		
		public function set border2Entry1(param1:GradientEntry) : void
		{
			var _loc2_:Object = this._1581046979border2Entry1;
			if(_loc2_ !== param1)
			{
				this._1581046979border2Entry1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border2Entry1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get border2Entry2() : GradientEntry
		{
			return this._1581046980border2Entry2;
		}
		
		public function set border2Entry2(param1:GradientEntry) : void
		{
			var _loc2_:Object = this._1581046980border2Entry2;
			if(_loc2_ !== param1)
			{
				this._1581046980border2Entry2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border2Entry2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get borderStroke() : LinearGradientStroke
		{
			return this._1924246667borderStroke;
		}
		
		public function set borderStroke(param1:LinearGradientStroke) : void
		{
			var _loc2_:Object = this._1924246667borderStroke;
			if(_loc2_ !== param1)
			{
				this._1924246667borderStroke = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get border() : Rect
		{
			return this._border;
		}
		
		public function set border(param1:Rect) : void
		{
			var _loc2_:Object = this._border;
			if(_loc2_ !== param1)
			{
				this._border = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get emphasizedFill() : SolidColor
		{
			return this._emphasizedFill;
		}
		
		public function set emphasizedFill(param1:SolidColor) : void
		{
			var _loc2_:Object = this._emphasizedFill;
			if(_loc2_ !== param1)
			{
				this._emphasizedFill = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emphasizedFill",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get emphasizedOverlay() : Rect
		{
			return this._emphasizedOverlay;
		}
		
		public function set emphasizedOverlay(param1:Rect) : void
		{
			var _loc2_:Object = this._emphasizedOverlay;
			if(_loc2_ !== param1)
			{
				this._emphasizedOverlay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emphasizedOverlay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get emphasizedStroke() : SolidColorStroke
		{
			return this._emphasizedStroke;
		}
		
		public function set emphasizedStroke(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._emphasizedStroke;
			if(_loc2_ !== param1)
			{
				this._emphasizedStroke = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emphasizedStroke",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fillA() : GradientEntry
		{
			return this._fillA;
		}
		
		public function set fillA(param1:GradientEntry) : void
		{
			var _loc2_:Object = this._fillA;
			if(_loc2_ !== param1)
			{
				this._fillA = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fillA",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fillB() : GradientEntry
		{
			return this._fillB;
		}
		
		public function set fillB(param1:GradientEntry) : void
		{
			var _loc2_:Object = this._fillB;
			if(_loc2_ !== param1)
			{
				this._fillB = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fillB",_loc2_,param1));
				}
			}
		}
	}
}