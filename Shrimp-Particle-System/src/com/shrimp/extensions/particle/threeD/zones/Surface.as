﻿package com.shrimp.extensions.particle.threeD.zones {
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	
	public class Surface extends Zone3D {
		
		private var _virtualThickness:Number;
		
		public function Surface() {
			_virtualThickness = 1;
		}
		
		public final function get virtualThickness():Number { return _virtualThickness; }
		public final function set virtualThickness(value:Number):void {
			_virtualThickness = value;
			updateVolume();
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Surface";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@virtualThickness = virtualThickness;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@virtualThickness.length()) virtualThickness = parseFloat(xml.@virtualThickness);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}