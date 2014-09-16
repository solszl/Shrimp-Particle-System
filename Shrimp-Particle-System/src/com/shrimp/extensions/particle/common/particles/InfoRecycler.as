package com.shrimp.extensions.particle.common.particles {
	
	public interface InfoRecycler {
		function recycleInfo(particle:Particle):void;
		function get needsRecycle():Boolean;
	}
}