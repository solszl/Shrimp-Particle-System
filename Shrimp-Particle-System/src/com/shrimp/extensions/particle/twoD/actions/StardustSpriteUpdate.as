package com.shrimp.extensions.particle.twoD.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.twoD.display.IStardustSprite;
	
	public class StardustSpriteUpdate extends Action2D {
		
		public function StardustSpriteUpdate() {
			
		}
		
		/**
		 * Calls the <code>IStardustSprite.update()</code> method of a particle's target if the target implements the <code>IStardustSprite</code> interface.
		 * @see idv.cjcat.stardustextended.twoD.display.IStardustSprite
		 */
		override public function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			var target:IStardustSprite = particle.target as IStardustSprite;
			if (target) target.update(emitter, particle, timeDelta);
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "StardustSpriteUpdate";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}