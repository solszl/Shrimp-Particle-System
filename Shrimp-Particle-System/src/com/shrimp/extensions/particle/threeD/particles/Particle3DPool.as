package com.shrimp.extensions.particle.threeD.particles {
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.particles.ParticlePool;
	
	public class Particle3DPool extends ParticlePool {
		
		private static var _instance:Particle3DPool;
		public static function getInstance():Particle3DPool {
			if (!_instance) _instance = new Particle3DPool();
			return _instance;
		}
		
		public function Particle3DPool() {
			
		}
		
		override protected final function createNewParticle():Particle {
			return new Particle3D();
		}
	}
}