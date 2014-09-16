package com.shrimp.extensions.particle.twoD.display {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	
	/**
	 * ...
	 * @author 
	 */
	public interface IStardustSprite {
		/**
		 * [Template Method] This method is called by the <code>StardustSpriteInit</code> initializer.
		 * @param	particle
		 */
		function init(particle:Particle):void;
		
		/**
		 * [Template Method] This method is called by the <code>StardustSpriteUpdate</code> action.
		 * @param	emitter
		 * @param	particle
		 * @param	time
		 */
		function update(emitter:Emitter, particle:Particle, time:Number):void;
		
		/**
		 * [Template Method] This method is called by the <code>PooledDisplayObjectClass</code> initializer's <code>recycleInfo()</code> method. 
		 * Release your display object's resource here.
		 * @param	emitter
		 * @param	particle
		 * @param	time
		 */
		function disable():void;
	}
}