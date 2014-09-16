﻿package com.shrimp.extensions.particle.twoD.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.twoD.particles.Particle2D;
import com.shrimp.extensions.particle.twoD.zones.RectZone;
import com.shrimp.extensions.particle.twoD.zones.Zone;
	
	/**
	 * Causes particles to be marked dead when they are not contained inside a specified zone.
	 * 
	 * <p>
	 * Default priority = -6;
	 * </p>
	 */
	public class DeathZone extends Action2D {
		
		/**
		 * If a particle leave this zone (<code>Zone.contains()</code> returns false), it will be marked dead.
		 */
        public function get zone():Zone { return _zone; }
        public function set zone(value:Zone):void {
            if (!value) value = new RectZone();
            _zone = value;
        }
		private var _zone:Zone;
		/**
		 * Inverts the zone region.
		 */
		public var inverted:Boolean;
		
		public function DeathZone(zone:Zone = null, inverted:Boolean = false) {
			priority = -6;
			
			this.zone = zone;
			this.inverted = inverted;
		}
		
		override public function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			var p2D:Particle2D = Particle2D(particle);
			var dead:Boolean = _zone.contains(p2D.x, p2D.y);
			if (inverted) dead = !dead;
			if (dead) particle.isDead = true;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getRelatedObjects():Array {
			return [_zone];
		}
		
		override public function getXMLTagName():String {
			return "DeathZone";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();

			xml.@zone = _zone.name;

			xml.@inverted = inverted;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);

			if (xml.@zone.length()) _zone = builder.getElementByName(xml.@zone) as Zone;
			if (xml.@inverted.length()) inverted = (xml.@inverted == "true");
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}