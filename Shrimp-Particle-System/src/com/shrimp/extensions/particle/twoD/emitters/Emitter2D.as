﻿package com.shrimp.extensions.particle.twoD.emitters {
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	import com.shrimp.extensions.particle.common.actions.Action;
	import com.shrimp.extensions.particle.common.clocks.Clock;
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.handlers.ParticleHandler;
	import com.shrimp.extensions.particle.common.initializers.Initializer;
	import com.shrimp.extensions.particle.twoD.particles.PooledParticle2DFactory;
	
	/**
	 * 2D Emitter.
	 */
	public class Emitter2D extends Emitter {
		
		public function Emitter2D(clock:Clock = null, particleHandler:ParticleHandler = null) {
			super(clock, particleHandler);
			factory = new PooledParticle2DFactory();
		}
		
		override public final function addAction(action:Action):void {
			if (!action.supports2D) {
				throw new IllegalOperationError("This action does not support 2D: " + getQualifiedClassName(Object(action).constructor as Class));
			}
			super.addAction(action);
		}
		
		override public final function addInitializer(initializer:Initializer):void {
			if (!initializer.supports2D) {
				throw new IllegalOperationError("This initializer does not support 2D: " + getQualifiedClassName(Object(initializer).constructor as Class));
			}
			super.addInitializer(initializer);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Emitter2D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}