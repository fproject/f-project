///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2013 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.utils
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;
	
	import mx.containers.accordionClasses.AccordionHeader;
	import mx.controls.menuClasses.MenuItemRenderer;
	import mx.controls.tabBarClasses.Tab;
	import mx.core.BitmapAsset;
	import mx.core.UIComponent;
	
	/**
	 * Provides a workaround for using run-time loaded graphics in styles and properties which require a Class reference
	 */
	public class BitmapFactory extends BitmapAsset
	{
		private static var targetToSourceInfo:Dictionary;
		private static var bitmapCache:Object;
		/**
		 * Get the bitmap factory (class) from a URL and bind it to a displaying target.<br/>
		 * Used to associate run-time graphics with a target.
		 * @param target A reference to the component associated with this icon
		 * @param url A relative url to a JPG, PNG or GIF file you wish to be loaded and displayed.
		 * @param width Defines the width of the graphic when displayed
		 * @param height Defines the height of the graphic when displayed
		 * @return A reference to the BitmapFactory class which may be treated as a BitmapAsset
		 * @example &lt;mx:Button id="button" icon="{BitmapFactory.fromUrl(button, 'http://www.yourdomain.com/images/test.jpg')}" /&gt;
		 */
		public static function fromUrl(target:Object, url:String, width:Number=NaN, height:Number=NaN):Class 
		{
			if(targetToSourceInfo == null) 
			{
				targetToSourceInfo = new Dictionary();
				bitmapCache = {};
			}
			
			if(url != null && url.length > 0) 
			{
				var src:Object;
				if (bitmapCache[url] !== undefined)
				{
					src = bitmapCache[url];
				}
				else
				{
					var loader:Loader = new Loader();
					loader.load(new URLRequest(url), new LoaderContext(true));
					src = loader;
				}
				
				targetToSourceInfo[target] = {source:src, width:width, height:height};
			}
			return BitmapFactory;
		}
		
		private function bitmap_Added(event:Event):void
		{
			if(event.currentTarget != null && event.currentTarget is IEventDispatcher)
				IEventDispatcher(event.currentTarget).removeEventListener(Event.ADDED, bitmap_Added);
			
			if(parent)
			{
				if(parent is AccordionHeader)
				{
					var header:AccordionHeader = parent as AccordionHeader;
					display(header.data);
				}
				else if(parent is Tab)
				{
					display(Tab(parent).data);
				}
				else if(parent is MenuItemRenderer)
				{
					display(MenuItemRenderer(parent).data);
				}
				else
				{
					display(parent);
				}
			}
		}
		
		private function display(target:Object):void 
		{
			var sourceInfo:Object = targetToSourceInfo[target];
			if(sourceInfo) 
			{
				var source:Object = sourceInfo.source;
				if(sourceInfo.width > 0 && sourceInfo.height > 0) 
				{
					bitmapData = new BitmapData(sourceInfo.width, sourceInfo.height, true, 0x00FFFFFF);
				}
				if(source is Loader) 
				{
					var loader:Loader = source as Loader;
					if(!loader.content) 
					{
						loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderInfo_complete);
						loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderInfo_ioError);
					}
					else 
					{
						displayLoader(loader);
					}
				}
				else if(source is BitmapData) 
				{
					var bmp:BitmapData = source as BitmapData;
					if(bmp.width != this.bitmapData.width || bmp.height != this.bitmapData.height)
						this.bitmapData.copyPixels(BitmapData(source), this.bitmapData.rect, new Point());
					else
						this.bitmapData = bmp;
				}
			}
		}
		
		private function displayLoader(loader:Loader):void
		{
			if(!bitmapData)
			{
				bitmapData = new BitmapData(loader.content.width, loader.content.height, true, 0x00FFFFFF);
			}
			bitmapData.draw(loader, new Matrix(bitmapData.width/loader.width, 0, 0, bitmapData.height/loader.height, 0, 0));
			bitmapCache[loader.contentLoaderInfo.url] = bitmapData;
			
			if(parent is UIComponent)
			{
				var component:UIComponent = parent as UIComponent;
				component.invalidateDisplayList();
			}
		}
		
		private function loaderInfo_complete(event:Event):void
		{
			if(event && event.target && event.target is LoaderInfo)
			{
				LoaderInfo(event.target).removeEventListener(Event.COMPLETE, loaderInfo_complete);
				displayLoader(event.target.loader as Loader);
			}
		}
		
		private function loaderInfo_ioError(event:IOErrorEvent):void
		{
			trace("BitmapFactory " + event.text);
		}
		
		/**
		 * Constructor
		 */
		public function BitmapFactory():void
		{
			addEventListener(Event.ADDED, bitmap_Added);
		}
	}
}