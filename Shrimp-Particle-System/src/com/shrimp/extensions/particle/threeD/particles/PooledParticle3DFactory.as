package com.shrimp.extensions.particle.threeD.particles {
	import com.shrimp.extensions.particle.common.particles.PooledParticleFactory;
	
	/** @private */
	public class PooledParticle3DFactory extends PooledParticleFactory {
		
		public function PooledParticle3DFactory() {
			particlePool = Particle3DPool.getInstance();
		}
	}
}