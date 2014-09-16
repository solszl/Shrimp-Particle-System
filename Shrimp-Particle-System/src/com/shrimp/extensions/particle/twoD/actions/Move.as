﻿package com.shrimp.extensions.particle.twoD.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.twoD.particles.Particle2D;
	
	/**
	 * Causes a particle's position to change according to its velocity.
	 * 
	 * <p>
	 * Default priority = -4;
	 * </p>
	 */
	public class Move extends Action2D {
		
		/**
		 * The multiplier of movement, 1 by default.
		 * 
		 * <p>
		 * For instance, a multiplier value of 2 causes a particle to move twice as fast as normal.
		 * </p>
		 */
		public var multiplier:Number;
		
		public function Move(multiplier:Number = 1) {
			priority = -4;
			
			this.multiplier = multiplier;
		}
		
		private var p2D:Particle2D;
		private var factor:Number;
		override public function preUpdate(emitter:Emitter, time:Number):void {
			factor = time * multiplier;
		}
		
		override public function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			p2D = Particle2D(particle);
			p2D.x += p2D.vx * factor;
			p2D.y += p2D.vy * factor;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Move";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@multiplier = multiplier;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@multiplier.length()) multiplier = parseFloat(xml.@multiplier);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}