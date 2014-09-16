﻿package com.shrimp.extensions.particle.common.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	
	/**
	 * Mark a particle as dead if its life reaches zero.
	 * <p>
	 * Remember to add this action to the emitter if you wish particles to be removed from simulation when their lives reach zero. 
	 * Otherwise, the particles will not be removed.
	 * </p>
	 * 
	 * <p>
	 * Default priority = -1;
	 * </p>
	 */
	public class DeathLife extends Action {
		
		public var threshold:Number;
		public function DeathLife() {
			
		}
		
		override public final function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			if (particle.life <= 0) {
				particle.isDead = true;
			}
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "DeathLife";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}