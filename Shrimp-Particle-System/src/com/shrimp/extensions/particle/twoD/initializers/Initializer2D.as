package com.shrimp.extensions.particle.twoD.initializers {
	import com.shrimp.extensions.particle.common.initializers.Initializer;
	
	/**
	 * Base class for 2D initializers.
	 */
	public class Initializer2D extends Initializer {
		
		public function Initializer2D() {
			_supports3D = false;
			
			//priority = Initializer2DPriority.getInstance().getPriority(Object(this).constructor as Class);
		}
	}
}