package com.shrimp.extensions.particle.threeD.actions {
	import com.shrimp.extensions.particle.common.emitters.Emitter;
	import com.shrimp.extensions.particle.common.initializers.Initializer;
	import com.shrimp.extensions.particle.common.initializers.InitializerCollector;
	import com.shrimp.extensions.particle.common.math.Random;
	import com.shrimp.extensions.particle.common.math.StardustMath;
	import com.shrimp.extensions.particle.common.math.UniformRandom;
	import com.shrimp.extensions.particle.common.particles.Particle;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.sd;
	import com.shrimp.extensions.particle.threeD.geom.Vec3D;
	import com.shrimp.extensions.particle.threeD.geom.Vec3DPool;
    import com.shrimp.extensions.particle.threeD.particles.Particle3D;
	import com.shrimp.extensions.particle.threeD.particles.Particle3DFactory;
	
	/**
	 * Spawns new particles at the position of existing particles.
	 * 
	 * <p>
	 * This action can be used to create effects such as fireworks, rocket trails, etc.
	 * </p>
	 * 
	 * <p>
	 * Newly spawned particles are initialized by initializers added to the spawning process through the <code>addInitializer()</code> method.
	 * </p>
	 */
	public class Spawn3D extends Action3D implements InitializerCollector {
		
		public var inheritDirection:Boolean;
		public var inheritVelocity:Boolean;
		private var _countRandom:Random;
		private var _factory:Particle3DFactory;

		public function Spawn3D(count:Random = null, inheritDirection:Boolean = true, inheritVelocity:Boolean = false) {
			this.inheritDirection = inheritDirection;
			this.inheritVelocity = inheritVelocity;
			this.countRandom = count;
			_factory = new Particle3DFactory();
		}
		
		private var p3D:Particle3D;
		private var particles:Vector.<Particle>;
		private var p:Particle3D;
		private var v:Vec3D;
		override public final function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
			p3D = Particle3D(particle);
			particles = _factory.createParticles(StardustMath.randomFloor(_countRandom.random()), currentTime);
            const plen : uint = particles.length;
            for (var m : int = 0; m < plen; ++m) {
                p = Particle3D(particles[m]);
				p.x += p3D.x;
				p.y += p3D.y;
				p.z += p3D.z;
				if (inheritVelocity) {
					p.vx += p3D.vx;
					p.vy += p3D.vy;
					p.vz += p3D.vz;
				}
				if (inheritDirection) {
					v = Vec3DPool.get(p.vx, p.vy, p.vz);
					
					v.rotateXThis(Math.atan2(Math.sqrt(p3D.vx * p3D.vx + p3D.vz * p3D.vz), -p3D.vy), true);
					v.rotateYThis(Math.atan2( -p3D.vz, p3D.vx) - StardustMath.HALF_PI, true);
					
					p.vx = v.x;
					p.vy = v.y;
					p.vz = v.z;
					Vec3DPool.recycle(v);
				}
			}
			emitter.addParticles(particles);
		}
		
		/**
		 * Adds an initializer to the spawning action.
		 * @param	initializer
		 */
		public final function addInitializer(initializer:Initializer):void {
			_factory.addInitializer(initializer);
		}
		
		/**
		 * Removes an initializer from the spawning action.
		 * @param	initializer
		 */
		public final function removeInitializer(initializer:Initializer):void {
			_factory.removeInitializer(initializer);
		}
		
		/**
		 * Removes all initializers from the spawning action.
		 */
		public final function clearInitializers():void {
			_factory.clearInitializers();
		}
		
		/**
		 * The <code>Random</code> object that determines how many particles to spawn each time.
		 */
		public function get countRandom():Random { return _countRandom; }
		public function set countRandom(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_countRandom = value;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getRelatedObjects():Array {
			return [_countRandom].concat(_factory.sd::initializerCollection.sd::initializers);
		}
		
		override public function getXMLTagName():String {
			return "Spawn3D";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@inheritDirection = inheritDirection;
			xml.@inheritVelocity = inheritVelocity;
			xml.@countRandom = _countRandom.name;
			
			if (_factory.sd::initializerCollection.sd::initializers.length > 0) {
				xml.appendChild(<initializers/>);
				var initializer:Initializer;
				for each (initializer in _factory.sd::initializerCollection.sd::initializers) {
					xml.initializers.appendChild(initializer.getXMLTag());
				}
			}
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@inheritDirection.length()) inheritDirection = (xml.@inheritDirection == "true");
			if (xml.@inheritVelocity.length()) inheritVelocity = (xml.@inheritVelocity == "true");
			if (xml.@countRandom.length()) countRandom = builder.getElementByName(xml.@countRandom) as Random;
			
			clearInitializers();
			for each (var node:XML in xml.initializers.*) {
				addInitializer(builder.getElementByName(node.@name) as Initializer);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}