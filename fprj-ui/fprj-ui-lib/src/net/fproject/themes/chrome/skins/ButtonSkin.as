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
package net.fproject.themes.chrome.skins
{
	import flash.utils.Proxy;
	
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.binding.utils.BindingUtils;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.LinearGradientStroke;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.states.Transition;
	
	import spark.components.Label;
	import spark.effects.AnimateColor;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	
	import net.fproject.supportClasses.SkinWatcherSetupUtil;
	import net.fproject.themes.SimpleButtonSkin;
	
	public class ButtonSkin extends SimpleButtonSkin
	{
		public function ButtonSkin(properties:Object=null)
		{
			super(properties);
		}
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		
		public var overToUpAnimate:AnimateColor;
		
		public var upToOverAnimate:AnimateColor;
		
		private var _aButtonSkin_GradientEntry1:GradientEntry;
		
		public var borderStrokeEntry2:GradientEntry;
		
		private var _borderStrokeEntry3:GradientEntry;
		
		private var _border2Entry1:GradientEntry;
		
		private var _border2Entry2:GradientEntry;
		
		public var bottomMarkLine:Line;
		
		private var _borderStroke:LinearGradientStroke;
		
		protected var _cornerRadius:Number;

		public function get cornerRadius():Number
		{
			if(isNaN(_cornerRadius))
				_cornerRadius = 0;
			return _cornerRadius;
		}

		public function set cornerRadius(value:Number):void
		{
			_cornerRadius = value;
			invalidateProperties();
		}
		
		public var border2:Rect;
		
		private var _fillA:GradientEntry;
		
		private var _fillB:GradientEntry;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public override function styleChanged(styleProp:String):void
		{
			super.styleChanged(styleProp);
			if(styleProp == null || styleProp=="cornerRadius")
			{
				var s:* = getStyle("cornerRadius");
				if(s !== undefined)
				{
					this.cornerRadius = s;
				}
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if(this.border is Rect)
				Rect(this.border).radiusX = cornerRadius;
			if(this.border2 != null)
				this.border2.radiusX = cornerRadius;
		}
		
		override protected function construct():void
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this.mx_internal::_bindings = [];
			this.mx_internal::_watchers = [];
			this.mx_internal::_bindingsByDestination = {};
			this.mx_internal::_bindingsBeginWithWord = {};
			
			mx_internal::_document = this;
			bindings = this.skin_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				SkinWatcherSetupUtil.init(null, ButtonSkin,
					function (param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
					{
						param5[0] = new PropertyWatcher("fillA",{"propertyChange":true},[param4[0],param4[1]],param2);
						param5[1] = new PropertyWatcher("fillB",{"propertyChange":true},[param4[0],param4[1]],param2);
						param5[0].updateParent(param1);
						param5[1].updateParent(param1);
					});
			}
			_watcherSetupUtil.setup(this,function(field:String):*
			{
				return target[field];
			}, staticPropertyGetter, bindings, watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.minWidth = 21;
			this.minHeight = 25;
			this.transitions = [this.createOverToUpTransition(),this.createUpToOverTransition()];
			this.mxmlContent = this.createMxmlContent();
			this.currentState = "up";
			
			this.states = this.createStates();
			
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		protected function staticPropertyGetter(field:String):*
		{
			return ButtonSkin[field];
		}
		
		protected function createMxmlContent():Array
		{
			var a:Array = [this.createBorder(),this.createBorder2()];
			var l:Label = this.createLabelDisplay();
			if(l != null)
				a.push(l);
			return a;
		}
		
		protected function createStates():Array
		{
			var bottomMarkLineFactory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.createBottomMarkLine);
			var borderStrokeEntry2Factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.createBorderStrokeEntry2);
			return [new State({
				"name":"up",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":bottomMarkLineFactory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["border2"]
				})]
			}),new State({
				"name":"over",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":bottomMarkLineFactory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["border2"]
				}),new SetProperty().initializeFromObject({
					"target":"fillA",
					"name":"color",
					"value":0xF6F6F6
				}),new SetProperty().initializeFromObject({
					"target":"fillB",
					"name":"color",
					"value":0xF1F1F1
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry1",
					"name":"color",
					"value":0xFFFFFF
				}),new SetProperty().initializeFromObject({
					"target":"border2Entry2",
					"name":"color",
					"value":0xEAEAEA
				})]
			}),new State({
				"name":"down",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":borderStrokeEntry2Factory,
					"destination":"borderStroke",
					"propertyName":"entries",
					"position":"after",
					"relativeTo":["borderStrokeEntry1"]
				}),new SetProperty().initializeFromObject({
					"target":"borderStrokeEntry1",
					"name":"color",
					"value":0x7F7F7F
				}),new SetProperty().initializeFromObject({
					"target":"borderStrokeEntry3",
					"name":"color",
					"value":0xA1A1A1
				}),new SetProperty().initializeFromObject({
					"target":"fillA",
					"name":"color",
					"value":0xD4D4D4
				}),new SetProperty().initializeFromObject({
					"target":"fillB",
					"name":"color",
					"value":0xC1C1C1
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
					"itemsFactory":bottomMarkLineFactory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["border2"]
				}),new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
			})];
		}
		
		public static function set watcherSetupUtil(value:IWatcherSetupUtil2) : void
		{
			ButtonSkin._watcherSetupUtil = value;
		}
		
		protected function createOverToUpTransition() : Transition
		{
			var t:Transition = new Transition();
			t.fromState = "over";
			t.toState = "up";
			t.effect = this.createOverToUpAnimate();
			return t;
		}
		
		protected function createOverToUpAnimate() : AnimateColor
		{
			var a:AnimateColor = new AnimateColor();
			a.duration = 100;
			this.overToUpAnimate = a;
			BindingManager.executeBindings(this,"overToUpAnimate",this.overToUpAnimate);
			return a;
		}
		
		protected function createUpToOverTransition() : Transition
		{
			var t:Transition = new Transition();
			t.fromState = "up";
			t.toState = "over";
			t.effect = this.createUpToOverAnimate();
			return t;
		}
		
		protected function createUpToOverAnimate() : AnimateColor
		{
			var a:AnimateColor = new AnimateColor();
			a.duration = 100;
			this.upToOverAnimate = a;
			BindingManager.executeBindings(this,"upToOverAnimate",this.upToOverAnimate);
			return a;
		}
		
		protected function createBorder() : Rect
		{
			var r:Rect = new Rect();
			r.left = 0;
			r.right = 0;
			r.top = 0;
			r.bottom = 0;
			r.radiusX = this.cornerRadius;
			r.stroke = this.createBorderStroke();
			r.fill = this.createBorderFill();
			r.initialized(this,"border");
			this.border = r;
			BindingManager.executeBindings(this,"border",this.border);
			BindingUtils.bindSetter(function(v:Object):void
			{
				bindBorderVisibleStates("border");
			},this, "borderVisibleStates");
			return r;
		}
		
		protected function createBorderStroke() : LinearGradientStroke
		{
			var s:LinearGradientStroke = new LinearGradientStroke();
			s.rotation = 90;
			s.entries = [this.createBorderStrokeEntry1(),this.createBorderStrokeEntry3()];
			this.borderStroke = s;
			BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
			return s;
		}
		
		protected function createBorderStrokeEntry1() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.ratio = 0;
			e.color = 11250603;
			this.borderStrokeEntry1 = e;
			BindingManager.executeBindings(this,"borderStrokeEntry1",this.borderStrokeEntry1);
			return e;
		}
		
		protected function createBorderStrokeEntry2() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.ratio = 0.1;
			e.color = 11119017;
			this.borderStrokeEntry2 = e;
			BindingManager.executeBindings(this,"borderStrokeEntry2",this.borderStrokeEntry2);
			return e;
		}
		
		protected function createBorderStrokeEntry3() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.ratio = 1;
			e.color = 10066329;
			this.borderStrokeEntry3 = e;
			BindingManager.executeBindings(this,"borderStrokeEntry3",this.borderStrokeEntry3);
			return e;
		}
		
		protected function createBorderFill() : LinearGradient
		{
			var f:LinearGradient = new LinearGradient();
			f.rotation = 90;
			f.entries = [this.createFillA(),this.createFillB()];
			return f;
		}
		
		protected function createFillA() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.color = 15658734;
			e.ratio = 0;
			this.fillA = e;
			BindingManager.executeBindings(this,"fillA",this.fillA);
			return e;
		}
		
		protected function createFillB() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.color = 15132390;
			e.ratio = 1;
			this.fillB = e;
			BindingManager.executeBindings(this,"fillB",this.fillB);
			return e;
		}
		
		protected function createBorder2() : Rect
		{
			var r:Rect = new Rect();
			r.left = 1;
			r.right = 1;
			r.top = 1;
			r.bottom = 1;
			r.radiusX = this.cornerRadius;
			r.stroke = this.createBorder2Stroke();
			r.initialized(this,"border2");
			this.border2 = r;
			BindingManager.executeBindings(this,"border2",this.border2);
			BindingUtils.bindSetter(function(v:Object):void
			{
				bindBorderVisibleStates("border2");
			},this, "borderVisibleStates");
			return r;
		}
		
		protected function createBorder2Stroke() : LinearGradientStroke
		{
			var s:LinearGradientStroke = new LinearGradientStroke();
			s.rotation = 90;
			s.entries = [this.createBorder2Entry1(),this.createBorder2Entry2()];
			return s;
		}
		
		protected function createBorder2Entry1() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.ratio = 0;
			e.color = 16448250;
			this.border2Entry1 = e;
			BindingManager.executeBindings(this,"border2Entry1",this.border2Entry1);
			return e;
		}
		
		protected function createBorder2Entry2() : GradientEntry
		{
			var e:GradientEntry = new GradientEntry();
			e.ratio = 1;
			e.color = 15395562;
			this.border2Entry2 = e;
			BindingManager.executeBindings(this,"border2Entry2",this.border2Entry2);
			return e;
		}
		
		protected function createBottomMarkLine() : Line
		{
			var l:Line = new Line();
			l.right = 3;
			l.bottom = -1;
			l.left = 3;
			l.stroke = this.createPressedMarkLineStroke();
			l.initialized(this,"bottomMarkLine");
			this.bottomMarkLine = l;
			BindingManager.executeBindings(this,"bottomMarkLine",this.bottomMarkLine);
			BindingUtils.bindSetter(function(v:Object):void
			{
				bindBorderVisibleStates("bottomMarkLine");
			},this, "borderVisibleStates");
			return l;
		}
		
		protected function createPressedMarkLineStroke() : SolidColorStroke
		{
			var s:SolidColorStroke = new SolidColorStroke();
			s.color = 8026746;
			s.alpha = 0.2;
			s.weight = 1;
			s.caps = "square";
			return s;
		}
		
		protected function createLabelDisplay() : Label
		{
			var l:Label = new Label();
			l.left = 10;
			l.right = 10;
			l.horizontalCenter = 0;
			l.verticalCenter = 1;
			l.maxDisplayedLines = 1;
			l.setStyle("textAlign","center");
			l.id = "labelDisplay";
			if(!l.document)
			{
				l.document = this;
			}
			labelDisplay = l;
			BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
			return l;
		}
		
		protected function skin_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Array
			{
				var a:* = [fillA,fillB];
				return a == null || a is Array || a is Proxy?a:[a];
			},null,"overToUpAnimate.targets");
			result[1] = new Binding(this,function():Array
			{
				var a:* = [fillA,fillB];
				return a == null || a is Array || a is Proxy?a:[a];
			},null,"upToOverAnimate.targets");
			return result;
		}
		
		public function get borderStrokeEntry1() : GradientEntry
		{
			return this._aButtonSkin_GradientEntry1;
		}
		
		public function set borderStrokeEntry1(value:GradientEntry) : void
		{
			var o:Object = this._aButtonSkin_GradientEntry1;
			if(o !== value)
			{
				this._aButtonSkin_GradientEntry1 = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStrokeEntry1",o,value));
				}
			}
		}
		
		public function get borderStrokeEntry3() : GradientEntry
		{
			return this._borderStrokeEntry3;
		}
		
		public function set borderStrokeEntry3(value:GradientEntry) : void
		{
			var o:Object = this._borderStrokeEntry3;
			if(o !== value)
			{
				this._borderStrokeEntry3 = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStrokeEntry3",o,value));
				}
			}
		}
		
		public function get border2Entry1() : GradientEntry
		{
			return this._border2Entry1;
		}
		
		public function set border2Entry1(value:GradientEntry) : void
		{
			var o:Object = this._border2Entry1;
			if(o !== value)
			{
				this._border2Entry1 = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border2Entry1",o,value));
				}
			}
		}
		
		public function get border2Entry2() : GradientEntry
		{
			return this._border2Entry2;
		}
		
		public function set border2Entry2(value:GradientEntry) : void
		{
			var o:Object = this._border2Entry2;
			if(o !== value)
			{
				this._border2Entry2 = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border2Entry2",o,value));
				}
			}
		}
		
		public function get borderStroke() : LinearGradientStroke
		{
			return this._borderStroke;
		}
		
		public function set borderStroke(value:LinearGradientStroke) : void
		{
			var o:Object = this._borderStroke;
			if(o !== value)
			{
				this._borderStroke = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",o,value));
				}
			}
		}
		
		public function get fillA() : GradientEntry
		{
			return this._fillA;
		}
		
		public function set fillA(value:GradientEntry) : void
		{
			var o:Object = this._fillA;
			if(o !== value)
			{
				this._fillA = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fillA",o,value));
				}
			}
		}
		
		public function get fillB() : GradientEntry
		{
			return this._fillB;
		}
		
		public function set fillB(value:GradientEntry) : void
		{
			var o:Object = this._fillB;
			if(o !== value)
			{
				this._fillB = value;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fillB",o,value));
				}
			}
		}
	}
}
