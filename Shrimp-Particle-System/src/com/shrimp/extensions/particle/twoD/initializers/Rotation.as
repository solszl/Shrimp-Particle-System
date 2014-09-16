﻿package com.shrimp.extensions.particle.twoD.initializers {
	import com.shrimp.extensions.particle.common.math.Random;
	import com.shrimp.extensions.particle.common.math.UniformRandom;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.twoD.particles.Particle2D;
	
	/**
	 * Sets a particle's rotation value, in degrees, based on the <code>random</code> property.
	 */
	public class Rotation extends Initializer2D {
		
		private var _random:Random;
		public function Rotation(random:Random = null) {
			this.random = random;
		}
		
		override public function initialize(particle:Particle):void {
			var p2D:Particle2D = Particle2D(particle);
			p2D.rotation = random.random();
		}
		
		public function get random():Random { return _random; }
		public function set random(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_random = value;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getRelatedObjects():Array {
			return [_random];
		}
		
		override public function getXMLTagName():String {
			return "Rotation";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@random = _random.name;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@random.length()) random = builder.getElementByName(xml.@random) as Random;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}