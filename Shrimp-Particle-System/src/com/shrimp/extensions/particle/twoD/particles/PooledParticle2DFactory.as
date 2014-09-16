package com.shrimp.extensions.particle.twoD.particles {
	import com.shrimp.extensions.particle.common.particles.PooledParticleFactory;
	
	/** @private */
	public class PooledParticle2DFactory extends PooledParticleFactory {
		
		public function PooledParticle2DFactory() {
			particlePool = Particle2DPool.getInstance();
		}
	}
}