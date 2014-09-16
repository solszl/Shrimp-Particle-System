package com.shrimp.extensions.particle.common {
	import com.shrimp.extensions.particle.common.actions.Age;
	import com.shrimp.extensions.particle.common.actions.AlphaCurve;
	import com.shrimp.extensions.particle.common.actions.CompositeAction;
	import com.shrimp.extensions.particle.common.actions.DeathLife;
	import com.shrimp.extensions.particle.common.actions.Die;
	import com.shrimp.extensions.particle.common.actions.ScaleCurve;
	import com.shrimp.extensions.particle.common.actions.triggers.DeathTrigger;
	import com.shrimp.extensions.particle.common.actions.triggers.LifeTrigger;
	import com.shrimp.extensions.particle.common.clocks.CompositeClock;
	import com.shrimp.extensions.particle.common.clocks.ImpulseClock;
	import com.shrimp.extensions.particle.common.clocks.RandomClock;
	import com.shrimp.extensions.particle.common.clocks.SteadyClock;
	import com.shrimp.extensions.particle.common.handlers.PollingStation;
	import com.shrimp.extensions.particle.common.initializers.Alpha;
	import com.shrimp.extensions.particle.common.initializers.CollisionRadius;
	import com.shrimp.extensions.particle.common.initializers.Color;
	import com.shrimp.extensions.particle.common.handlers.ParticleHandler;
	import com.shrimp.extensions.particle.common.initializers.CompositeInitializer;
	import com.shrimp.extensions.particle.common.initializers.Life;
	import com.shrimp.extensions.particle.common.initializers.Mask;
	import com.shrimp.extensions.particle.common.initializers.Mass;
	import com.shrimp.extensions.particle.common.initializers.Scale;
	import com.shrimp.extensions.particle.common.initializers.SwitchInitializer;
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.math.AveragedRandom;
	import com.shrimp.extensions.particle.common.math.UniformRandom;
	import com.shrimp.extensions.particle.common.xml.ClassPackage;
	
	/**
	 * Packs together common classes for both 2D and 3D.
	 */
	public class CommonClassPackage extends ClassPackage {
		
		private static var _instance:CommonClassPackage;
		
		public static function getInstance():CommonClassPackage {
			if (!_instance) _instance = new CommonClassPackage();
			return _instance;
		}
		
		public function CommonClassPackage() {
			
		}
		
		
		override protected final function populateClasses():void {
			//common actions
			classes.push(AlphaCurve);
			classes.push(CompositeAction);
			classes.push(DeathLife);
			classes.push(Die);
			classes.push(ScaleCurve);
			
			//common action triggers
			classes.push(DeathTrigger);
			classes.push(LifeTrigger);
			
			//common clocks
			classes.push(CompositeClock);
			classes.push(ImpulseClock);
			classes.push(RandomClock);
			classes.push(SteadyClock);
			
			//common emitters
			classes.push(Emitter);
			
			//common initializers
			classes.push(Age);
			classes.push(Alpha);
			classes.push(CollisionRadius);
			classes.push(Color);
			classes.push(CompositeInitializer);
			classes.push(Life);
			classes.push(Mask);
			classes.push(Mass);
			classes.push(Scale);
			classes.push(SwitchInitializer);
			
			//common particle handlers
			classes.push(PollingStation);
			
			//common randoms
			classes.push(AveragedRandom);
			classes.push(UniformRandom);
			
			classes.push(ParticleHandler);
		}
	}
}