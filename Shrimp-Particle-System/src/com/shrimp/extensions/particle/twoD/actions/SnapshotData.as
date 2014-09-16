package com.shrimp.extensions.particle.twoD.actions {
	import com.shrimp.extensions.particle.twoD.particles.Particle2D;
	
	internal class SnapshotData {
		
		public var x:Number;
		public var y:Number;
		public var rotation:Number;
		public var scale:Number;
		
		public function SnapshotData(particle:Particle2D) {
			this.x = particle.x;
			this.y = particle.y;
			this.rotation = particle.rotation;
			this.scale = particle.scale;
		}
	}
}