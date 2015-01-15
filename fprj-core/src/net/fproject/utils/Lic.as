///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.ApplicationDomain;
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import mx.core.Container;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.resources.ResourceManager;
	
	/**
	 * License handler class. 
	 * Un-comment the code in attachToContainer() method to enable 
	 * F-Project component license validation.
	 * 
	 */
	public class Lic
	{
		//1365699600000 (12/04), 1367341200000 (01/05), 1368291600000 (12/05), 1360602000000 (12/02), 
		//1365958800000 (15/04), 1365872400000 (14/04), 1383590100000 (05/11)
		/** 
		 * Build time
		 * */
		private static const btime:Number = 1415187406435;//build date-time: 2014-11-05 hh:mm:ss.ttt
		private var _c:DisplayObjectContainer;
		private var _tf:TextField;
		private var _foregrnd:Sprite;
		private var _time:Number;
		private var _darkbgrnd:Boolean = false;
		private var _tfPosition:String = "central";
		private var _tfRotation:Number;
		
		private static const wmAfter:Number = 0;		
		private static const wmText:String = getString("lic.wmtext");
		private static const wmTextEnd:String = getString("lic.wmtext.end");
		private static const mnuAbtCaption:String = getString("lic.mnu.abt.caption");
		private static const mnuAbtUrl:String = getString("lic.mnu.abt.url");
		private static const mnuPcNowCaption:String = getString("lic.mnu.pcnow.caption");
		private static const mnuPcNowUrl:String = getString("lic.mnu.pcnow.url");
		
		private static const dayMillis:Number = 86400000;
		
		private static const dev:Boolean = true; //Developer license
		/** 
		 * Trial period: 100 days
		 * */
		private static const tprd:Number = dayMillis * (dev? 365 : 100);
		
		public static function getString(key:String):String
		{
			var s:String = Hex.toString(ResourceManager.getInstance().getString("fprjcore", key));
			s.replace(/\\r\\n/g, "\r\n");
			return s;
		}
		
		private function attachLic(c:DisplayObjectContainer, darkbgrnd:Boolean, time:Number,
								   tfPosition:String="central", tfRotation:Number=NaN):void
		{
			this._c = c;
			this._time = time;
			this._darkbgrnd = darkbgrnd;
			this._tfPosition = tfPosition;
			this._tfRotation = tfRotation;
			this._c.addEventListener("enterFrame", this.enterFrameHandler);
		}// end function
		
		protected function checkVisible(c:DisplayObjectContainer) : Boolean
		{
			return true;
		}// end function
		
		private function enterFrameHandler(event:Event) : void
		{
			if (this._tf != null && !this.checkVisible(this._c))
			{
				this._tf.visible = false;
				return;
			}
			var cp:Point = new Point(this._c.width, this._c.height);
			var p:Point = this._c.localToGlobal(new Point());
			cp = this._c.localToGlobal(cp);
			var dx:Number = Math.abs(cp.x - p.x);
			var dy:Number = Math.abs(cp.y - p.y);
			if (this._time > btime + tprd)//The license is expired
			{
				if (!this._foregrnd)
				{
					this._foregrnd = new Sprite();
					this._foregrnd.mouseEnabled = false;
				}
				if (!this._foregrnd.parent)
				{
					if (this._c is Container)
					{
						var uic:UIComponent = new UIComponent();
						this._c.addChild(uic);
						uic.addChild(this._foregrnd);
					}
					else
					{
						this._c.addChild(this._foregrnd);
					}
				}
				this._foregrnd.width = this._c.width;
				this._foregrnd.height = this._c.height;
				var g:Graphics = this._foregrnd.graphics;
				g.clear();
				var alp:Number = (this._time - btime - tprd) / (7 * dayMillis);
				if (alp > 0.95) 
					alp = 0.95;
				if (alp < 0) 
					alp = 0;
				g.beginFill(0x222222, alp);
				g.drawRect(0, 0, this._c.width, this._c.height);
				g.endFill();
			}
			if (dx < 20 && dy < 20 || !this._c.visible)
			{
				if (this._tf != null)
				{
					this._tf.visible = false;
				}
				return;
			}
			if (!this._tf)
			{
				this._tf = new TextField();
				this._tf.type = TextFieldType.DYNAMIC;
				this._tf.selectable = false;
				this._tf.autoSize = TextFieldAutoSize.CENTER;
				this._tf.textColor = 0xFFFFFF;
				this._tf.backgroundColor = 0;
				this._tf.multiline = true;
				
				var tf:TextFormat = new TextFormat();
				//tf.font = "Verdana";
				tf.size = 24;
				tf.bold = true;
				this._tf.defaultTextFormat = tf;
				
				if (this._time < btime + tprd)
				{
					var txt:String = dev? "" :
						wmText.replace("{0}", Math.round((btime + tprd - this._time) / dayMillis));
				}
				else
				{
					txt = wmTextEnd;
				}
				this._tf.text = txt;
				this._tf.alpha = 0.35;
				this._tf.mouseEnabled = false;
				var a:Array = [];
				a.push(new GlowFilter(this._darkbgrnd ? 0xFFFFFF : 0, 1, 9, 9, 2, 1, false, true));
				this._tf.filters = a;
				this._tf.x = Math.round(-10 * Math.random());
				this._tf.y = Math.round(-40 * Math.random());
			}
			if (!this._tf.parent)
			{
				if (ApplicationDomain.currentDomain.hasDefinition("mx.core.Container") && this._c is Container)
				{
					uic = new UIComponent();
					this._c.addChild(uic);
					uic.addChild(this._tf);
				}
				else
				{
					this._c.addChild(this._tf);
				}
			}
			if (!this._tf.visible)
			{
				this._tf.visible = true;
			}
			
			p = computeTfLocAndRot();
			if (!isNaN(this._tfRotation) && _tf.rotationZ != _tfRotation)
				_tf.rotationZ = _tfRotation;
			
			this._tf.x = p.x;
			this._tf.y = p.y;
			
		}// end function
		
		public static function addLicInfoToMnu(moduleId:String) : void
		{
			var mnu:ContextMenu = FlexGlobals.topLevelApplication.contextMenu;
			if (mnu == null)
			{
				mnu = new ContextMenu();
				if (mnu.customItems == null)
				{
					return;
				}
				FlexGlobals.topLevelApplication.contextMenu = mnu;
			}
			for each (var item:ContextMenuItem in mnu.customItems)
			{				
				if (item.caption == mnuAbtCaption)
				{
					return;
				}
			}
			
			if (Security.sandboxType == Security.LOCAL_WITH_FILE)
			{
				return;
			}
			
			addToMnu(mnu, mnuAbtCaption, mnuAbtUrl);
			addToMnu(mnu, mnuPcNowCaption, mnuPcNowUrl + moduleId);	
		}// end function
		
		private static function addToMnu(mnu:ContextMenu, menuText:String, url:String) : void
		{	
			var item:ContextMenuItem = new ContextMenuItem(menuText);
			item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, function (event:ContextMenuEvent) : void
			{
				navigateToURL(new URLRequest(url));				
			}// end function
			);
			mnu.customItems.push(item);
			mnu.customItems = mnu.customItems;//???
			
		}// end function
		
		public static function attachToContainer(c:DisplayObjectContainer, darkbgrnd:Boolean = false,
												 tfPosition:String="central", tfRotation:Number=NaN) : void
		{
			//Un-comment the code below to enable F-Project component license validation.
			
			var lic:Lic = new Lic();
			lic.attachLic(c, darkbgrnd, new Date().time, tfPosition, tfRotation);
		}// end function
		
		private function computeTfLocAndRot() : Point
		{
			var p:Point = new Point();
			switch (this._tfPosition)
			{
				case "topleft":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = 0;
					p.y = 0;
					break;
				case "topcenter":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = this._c.width / 2 - this._tf.width / 2;
					p.y = 0;
					break;
				case "topright":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = this._c.width - this._tf.width - 15;
					p.y = 0;
					break;
				case "middleleft":
					if (isNaN(_tfRotation))
						_tfRotation = -90;
					p.x = 0;
					p.y = this._c.height / 2 + this._tf.width / 2;
					break;
				case "middlecenter":
				case "central":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = this._c.width / 2 - this._tf.width / 2;
					p.y = this._c.height / 2 - this._tf.height / 2;
					break;
				case "middleright":
					if (isNaN(_tfRotation))
						_tfRotation = 90;
					p.x = this._c.width - 15;
					p.y = this._c.height / 2 + this._tf.width / 2;
					break;
				case "bottomleft":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = 0;
					p.y = this._c.height - this._tf.height;
					break;
				case "bottomcenter":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = this._c.width / 2 - this._tf.width / 2;
					p.y = this._c.height - this._tf.height;
					break;
				case "bottomright":
					if (isNaN(_tfRotation))
						_tfRotation = 0;
					p.x = this._c.width - this._tf.width - 15;
					p.y = this._c.height - this._tf.height;
					break;
				default:
					break;
			}
			
			return p;
		}
	}
}