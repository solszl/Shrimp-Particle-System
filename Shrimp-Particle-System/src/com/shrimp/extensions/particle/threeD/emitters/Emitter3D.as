package com.shrimp.extensions.particle.threeD.emitters {
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	import com.shrimp.extensions.particle.common.actions.Action;
	import com.shrimp.extensions.particle.common.clocks.Clock;
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.handlers.ParticleHandler;
	import com.shrimp.extensions.particle.common.initializers.Initializer;
	import com.shrimp.extensions.particle.threeD.particles.PooledParticle3DFactory;
	
	/**
	 * 3D Emitter.
	 */
	public class Emitter3D extends Emitter {
		
		public function Emitter3D(clock:Clock = null, particleHandler:ParticleHandler = null) {
			super(clock, particleHandler);
			factory = new PooledParticle3DFactory();
		}
		
		override public final function addAction(action:Action):void {
			if (!action.supports3D) {
				throw new IllegalOperationError("This action does not support 3D: " + getQualifiedClassName(Object(action).constructor as Class));
			}
			super.addAction(action);
		}
		
		override public final function addInitializer(initializer:Initializer):void {
			if (!initializer.supports3D) {
				throw new IllegalOperationError("This initializer does not support 3D: " + getQualifiedClassName(Object(initializer).constructor as Class));
			}
			super.addInitializer(initializer);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Emitter3D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}