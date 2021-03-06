﻿package com.shrimp.extensions.particle.twoD.zones {
	import com.shrimp.extensions.particle.common.StardustElement;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.twoD.geom.MotionData2D;
	import com.shrimp.extensions.particle.twoD.geom.Vec2D;
	import com.shrimp.extensions.particle.twoD.geom.Vec2DPool;
	
	/**
	 * This class defines a 2D zone.
	 * 
	 * <p>
	 * The <code>calculateMotionData2D()</code> method returns a <code>MotionData2D</code> object 
	 * which corresponds to a random point within the zone.
	 * </p>
	 */
	public class Zone extends StardustElement {
		
		public var rotation:Number;
		
		protected var area:Number;
		public function Zone() {
			rotation = 0;
		}
		
		/**
		 * [Abstract Method] Updates the area of the zone.
		 */
		protected function updateArea():void {
			//abstract method
		}
		
		/**
		 * [Abstract Method] Determines if a point is contained in the zone, true if contained.
		 * @param	x
		 * @param	y
		 * @return
		 */
		public function contains(x:Number, y:Number):Boolean {
			//abstract method
			return false;
		}
		
		/**
		 * Returns a random point in the zone.
		 * @return
		 */
		public final function getPoint():MotionData2D {
			var md2D:MotionData2D = calculateMotionData2D();
			if (rotation != 0) {
				var v:Vec2D = Vec2DPool.get(md2D.x, md2D.y);
				v.rotateThis(rotation);
				md2D.x = v.x;
				md2D.y = v.y;
				Vec2DPool.recycle(v);
			}
			return md2D;
		}
		
		/**
		 * [Abstract Method] Returns a <code>MotionData2D</code> object representing a random point in the zone.
		 * @return
		 */
		public function calculateMotionData2D():MotionData2D {
			//abstract method
			return null;
		}
		
		/**
		 * Returns the area of the zone. 
		 * Areas are used by the <code>CompositeZone</code> class to determine which area is bigger and deserves more weight.
		 * @return
		 */
		public final function getArea():Number {
			return area;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Zone";
		}
		
		override public function getElementTypeXMLTag():XML {
			return <zones/>;
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			
			xml.@rotation = rotation;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			rotation = parseFloat(xml.@rotation);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}