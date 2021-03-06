﻿package com.shrimp.extensions.particle.twoD.initializers  {
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.twoD.display.IStardustSprite;
	
	public class StardustSpriteInit extends Initializer2D {
		
		public function StardustSpriteInit() {
			
		}
		
		/**
		 * Calls the <code>IStardustSprite.init()</code> method of a particle's target if the target implements the <code>IStardustSprite</code> interface.
		 * @see idv.cjcat.stardustextended.twoD.display.IStardustSprite
		 */
		override public function initialize(particle:Particle):void {
			var target:IStardustSprite = particle.target as IStardustSprite;
			if (target) target.init(particle);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "StardustSpriteInit";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}