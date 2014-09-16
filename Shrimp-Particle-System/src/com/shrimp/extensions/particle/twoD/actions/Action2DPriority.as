package com.shrimp.extensions.particle.twoD.actions {
	import com.shrimp.extensions.particle.common.actions.ActionPriority;
	import com.shrimp.extensions.particle.twoD.actions.triggers.DeflectorTrigger;
	import com.shrimp.extensions.particle.twoD.actions.triggers.ZoneTrigger;
	
	/**
	 * Defines priorities of some 2D actions.
	 */
	public class Action2DPriority extends ActionPriority {
		
		private static var _instance:Action2DPriority;
		
		public static function getInstance():Action2DPriority {
			if (!_instance) _instance = new Action2DPriority();
			return _instance;
		}
		
		public function Action2DPriority() {
			
		}
		
		override protected final function populatePriorities():void {
			priorities[Damping] = -1;
			
			priorities[VelocityField] = -2;
			
			priorities[Gravity] = -3;
			priorities[MutualGravity] = -3;
			priorities[RandomDrift] = -3;
			
			priorities[Move] = -4;
			priorities[Spin] = -4;
			
			priorities[Deflect] = -5;
			
			priorities[Collide] = -6;
			priorities[DeathZone] = -6;
			priorities[Oriented] = -6;
			priorities[ZoneTrigger] = -6;
			priorities[DeflectorTrigger] = -6;
			
			priorities[SnapshotRestore] = -7;
		}
	}
}