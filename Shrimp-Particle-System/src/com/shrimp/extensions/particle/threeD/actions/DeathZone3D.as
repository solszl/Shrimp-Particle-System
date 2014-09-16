package com.shrimp.extensions.particle.threeD.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.threeD.particles.Particle3D;
	import com.shrimp.extensions.particle.threeD.zones.Zone3D;
	
	/**
	 * Causes particles to be marked dead when they are not contained inside a specified zone.
	 * 
	 * <p>
	 * Default priority = -6;
	 * </p>
	 */
	public class DeathZone3D extends Action3D {
		
		/**
		 * If a particle leave this zone (<code>Zone3D.contains()</code> returns false), it will be marked dead.
		 */
		public var zone:Zone3D;
		/**
		 * Inverts the zone region.
		 */
		public var inverted:Boolean;
		
		public function DeathZone3D(zone:Zone3D = null, inverted:Boolean = false) {
			priority = -6;
			
			this.zone = zone;
			this.inverted = inverted;
		}
		
		override final public function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			var p3D:Particle3D = Particle3D(particle);
			var live:Boolean = !zone.contains(p3D.x, p3D.y, p3D.z);
			if (inverted) live = !live;
			if (!live) particle.isDead = true;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getRelatedObjects():Array {
			if (!zone) return [];
			else return [zone];
		}
		
		override public function getXMLTagName():String {
			return "DeathZone3D";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			if (!zone) xml.@zone = "null";
			else xml.@zone = zone.name;
			xml.@inverted = inverted;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@zone == "null") zone = null;
			else if (xml.@zone.length()) zone = builder.getElementByName(xml.@zone) as Zone3D;
			if (xml.@inverted.length()) inverted = (xml.@inverted == "true");
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}