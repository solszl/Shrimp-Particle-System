package com.shrimp.extensions.particle.twoD.particles {
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	import com.shrimp.extensions.particle.common.initializers.Initializer;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.particles.ParticleFactory;
	import com.shrimp.extensions.particle.sd;
	
	use namespace sd;
	
	public class Particle2DFactory extends ParticleFactory {
		
		public function Particle2DFactory() {
			
		}
		
		override protected function createNewParticle():Particle {
			return new Particle2D();
		}
		
		override public function addInitializer(initializer:Initializer):void {
			if (!initializer.supports2D) {
				throw new IllegalOperationError("This initializer does not support 2D: " + getQualifiedClassName(Object(initializer).constructor as Class));
			}
			super.addInitializer(initializer);
		}
	}
}