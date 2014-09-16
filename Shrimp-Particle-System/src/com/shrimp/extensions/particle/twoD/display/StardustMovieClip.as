package com.shrimp.extensions.particle.twoD.display {
	import flash.display.MovieClip;
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.particles.Particle;
	
	public class StardustMovieClip extends MovieClip implements IStardustSprite {
		
		public function StardustMovieClip() {
			
		}
		
		/**
		 * Default behavior: MovieClip.gotoAndPlay(1);
		 */
		public function init(particle:Particle):void {
			gotoAndPlay(1);
		}
		
		/**
		 * @inheritDoc
		 */
		public function update(emitter:Emitter, particle:Particle, time:Number):void {
			
		}
		
		/**
		 * Default behavior: MovieClip.stop();
		 */
		public function disable():void {
			stop();
		}
	}
}