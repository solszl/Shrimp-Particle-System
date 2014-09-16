package com.shrimp.extensions.particle.twoD.display {
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.math.StardustMath;
	import com.shrimp.extensions.particle.common.math.UniformRandom;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.utils.construct;
	
	public class Snow extends StardustSprite {
		
		private static var _random:UniformRandom = new UniformRandom();
		
		private var _child:DisplayObject;
		private var _frequency:Number;
		private var _amplitude:Number;
		private var _phase:Number;
		public function Snow(displayObjectClass:Class = null, amplitude:Number = 20, frequency:Number = 0.05, params:Array = null, amplitudeVar:Number = 0, frequencyVar:Number = 0) {
			if (!displayObjectClass) displayObjectClass = Shape;
			
			_child = addChild(DisplayObject(construct(displayObjectClass, params)));
			
			_random.center = frequency;
			_random.radius = frequencyVar;
			_frequency = _random.random();
			
			_random.center = amplitude;
			_random.radius = amplitudeVar;
			_amplitude = _random.random();
			
			_phase = StardustMath.TWO_PI * Math.random();
		}
		
		override public function update(emitter:Emitter, particle:Particle, time:Number):void {
			_phase += _frequency * time;
			_child.x = _amplitude * Math.sin(_phase);
		}
		
		public function setDisplayObjectClass(displayObjectClass:Class, params:Array = null):void {
			if (!displayObjectClass) return;
			
			removeChild(_child);
			_child = addChild(construct(displayObjectClass, params) as DisplayObject);
		}
	}
}