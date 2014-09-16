package com.shrimp.extensions.particle.threeD.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.threeD.geom.Vec3D;
	import com.shrimp.extensions.particle.threeD.geom.Vec3DPool;
	import com.shrimp.extensions.particle.threeD.particles.Particle3D;
	
	/**
	 * Accelerates particles along their velocity directions.
	 */
	public class Accelerate3D extends Action3D {
		
		/**
		 * The amount of acceleration in each emitter step.
		 */
		public var acceleration:Number;
		
		public function Accelerate3D(acceleration:Number = 0.1) {
			this.acceleration = acceleration;
		}
		
		override public final function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			var p3D:Particle3D = Particle3D(particle);
			var v:Vec3D = Vec3DPool.get(p3D.vx, p3D.vy, p3D.vz);
			if (v.length > 0) {
				v.length += acceleration * timeDelta;
				p3D.vx = v.x;
				p3D.vy = v.y;
				p3D.vz = v.z;
			}
			Vec3DPool.recycle(v);
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Accelerate3D";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@acceleration = acceleration;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@acceleration.length()) acceleration = parseFloat(xml.@acceleration);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}