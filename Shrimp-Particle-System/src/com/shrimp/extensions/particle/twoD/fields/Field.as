package com.shrimp.extensions.particle.twoD.fields {
	import com.shrimp.extensions.particle.common.StardustElement;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.twoD.geom.MotionData2D;
	import com.shrimp.extensions.particle.twoD.geom.MotionData2DPool;
	import com.shrimp.extensions.particle.twoD.particles.Particle2D;
	
	/**
	 * 2D vector field.
	 */
	public class Field extends StardustElement {
		
		public var active:Boolean;
		public var massless:Boolean;
		
		public function Field() {
			active = true;
			massless = true;
		}
		
		private var md2D:MotionData2D;
		private var mass_inv:Number;
		public final function getMotionData2D(particle:Particle2D):MotionData2D {
			if (!active) return MotionData2DPool.get(0, 0);
			
			md2D = calculateMotionData2D(particle);
			if (!massless) {
				mass_inv = 1 / particle.mass;
				md2D.x *= mass_inv;
				md2D.y *= mass_inv;
			}
			return md2D;
		}
		
		protected function calculateMotionData2D(particle:Particle2D):MotionData2D {
			return null;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Field";
		}
		
		override public function getElementTypeXMLTag():XML {
			return <fields/>;
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@active = active;
			xml.@massless = massless;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
            if (xml.@active.length()) active = (xml.@active == "true");
            if (xml.@massless.length()) massless = (xml.@massless == "true");
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}