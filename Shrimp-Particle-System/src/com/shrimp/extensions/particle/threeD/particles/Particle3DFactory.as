package com.shrimp.extensions.particle.threeD.particles {
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	import com.shrimp.extensions.particle.common.initializers.Initializer;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.particles.ParticleFactory;
	import com.shrimp.extensions.particle.sd;
	
	use namespace sd;
	
	public class Particle3DFactory extends ParticleFactory {
		
		public function Particle3DFactory() {
			
		}
		
		override protected final function createNewParticle():Particle {
			return new Particle3D();
		}
		
		override public final function addInitializer(initializer:Initializer):void {
			if (!initializer.supports3D) {
				throw new IllegalOperationError("This initializer does not support 3D: " + getQualifiedClassName(Object(initializer).constructor as Class));
			}
			super.addInitializer(initializer);
		}
	}
}