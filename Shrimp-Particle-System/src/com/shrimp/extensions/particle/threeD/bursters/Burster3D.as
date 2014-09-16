package com.shrimp.extensions.particle.threeD.bursters {
	import com.shrimp.extensions.particle.common.bursters.Burster;
	import com.shrimp.extensions.particle.threeD.particles.Particle3DFactory;
	
	/**
	 * Base class for 3D bursters.
	 */
	public class Burster3D extends Burster {
		
		public function Burster3D() {
			factory = new Particle3DFactory();
		}
	}
}