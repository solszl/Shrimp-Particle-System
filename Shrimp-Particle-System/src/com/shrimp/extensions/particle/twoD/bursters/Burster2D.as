package com.shrimp.extensions.particle.twoD.bursters {
	import com.shrimp.extensions.particle.common.bursters.Burster;
	import com.shrimp.extensions.particle.twoD.particles.Particle2DFactory;
	
	/**
	 * Base class for 2D bursters.
	 */
	public class Burster2D extends Burster {
		
		public function Burster2D() {
			factory = new Particle2DFactory();
		}
	}
}