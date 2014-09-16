package com.shrimp.extensions.particle.twoD.particles {
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.particles.ParticlePool;
	
	public class Particle2DPool extends ParticlePool {
		
		private static var _instance:Particle2DPool;
		public static function getInstance():Particle2DPool {
			if (!_instance) _instance = new Particle2DPool();
			return _instance;
		}
		
		public function Particle2DPool() {
			
		}
		
		override protected function createNewParticle():Particle {
			return new Particle2D();
		}
	}
}