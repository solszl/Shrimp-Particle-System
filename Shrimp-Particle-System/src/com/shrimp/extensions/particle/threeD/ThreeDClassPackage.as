package com.shrimp.extensions.particle.threeD {
	import com.shrimp.extensions.particle.common.xml.ClassPackage;
	import com.shrimp.extensions.particle.threeD.actions.Accelerate3D;
	import com.shrimp.extensions.particle.threeD.actions.BillboardOriented;
	import com.shrimp.extensions.particle.threeD.actions.Collide3D;
	import com.shrimp.extensions.particle.threeD.actions.Damping3D;
	import com.shrimp.extensions.particle.threeD.actions.DeathZone3D;
	import com.shrimp.extensions.particle.threeD.actions.Deflect3D;
	import com.shrimp.extensions.particle.threeD.actions.Explode3D;
	import com.shrimp.extensions.particle.threeD.actions.Gravity3D;
	import com.shrimp.extensions.particle.threeD.actions.Move3D;
	import com.shrimp.extensions.particle.threeD.actions.MutualGravity3D;
	import com.shrimp.extensions.particle.threeD.actions.NormalDrift3D;
	import com.shrimp.extensions.particle.threeD.actions.Oriented3D;
	import com.shrimp.extensions.particle.threeD.actions.RandomDrift3D;
	import com.shrimp.extensions.particle.threeD.actions.Snapshot3D;
	import com.shrimp.extensions.particle.threeD.actions.SnapshotRestore3D;
	import com.shrimp.extensions.particle.threeD.actions.Spawn3D;
	import com.shrimp.extensions.particle.threeD.actions.SpeedLimit3D;
	import com.shrimp.extensions.particle.threeD.actions.Spin3D;
	import com.shrimp.extensions.particle.threeD.actions.StardustSpriteUpdate3D;
	import com.shrimp.extensions.particle.threeD.actions.triggers.DeflectorTrigger3D;
	import com.shrimp.extensions.particle.threeD.actions.triggers.ZoneTrigger3D;
	import com.shrimp.extensions.particle.threeD.actions.VelocityField3D;
	import com.shrimp.extensions.particle.threeD.deflectors.BoundingCube;
	import com.shrimp.extensions.particle.threeD.deflectors.BoundingSphere;
	import com.shrimp.extensions.particle.threeD.deflectors.PlaneDeflector;
	import com.shrimp.extensions.particle.threeD.deflectors.SphereDeflector;
	import com.shrimp.extensions.particle.threeD.deflectors.WrappingCube;
	import com.shrimp.extensions.particle.threeD.emitters.Emitter3D;
	import com.shrimp.extensions.particle.threeD.fields.RadialField3D;
	import com.shrimp.extensions.particle.threeD.fields.UniformField3D;
	import com.shrimp.extensions.particle.threeD.handlers.DisplayObjectHandler3D;
	import com.shrimp.extensions.particle.threeD.initializers.DisplayObjectClass3D;
	import com.shrimp.extensions.particle.threeD.initializers.Omega3D;
	import com.shrimp.extensions.particle.threeD.initializers.PooledDisplayObjectClass3D;
	import com.shrimp.extensions.particle.threeD.initializers.Position3D;
	import com.shrimp.extensions.particle.threeD.initializers.Rotation3D;
	import com.shrimp.extensions.particle.threeD.initializers.StardustSpriteInit3D;
	import com.shrimp.extensions.particle.threeD.initializers.Velocity3D;
	import com.shrimp.extensions.particle.threeD.zones.CubeZone;
	import com.shrimp.extensions.particle.threeD.zones.DiskZone;
	import com.shrimp.extensions.particle.threeD.zones.SinglePoint3D;
	import com.shrimp.extensions.particle.threeD.zones.SphereCap;
	import com.shrimp.extensions.particle.threeD.zones.SphereShell;
	import com.shrimp.extensions.particle.threeD.zones.SphereSurface;
	import com.shrimp.extensions.particle.threeD.zones.SphereZone;
	
	/**
	 * Packs together classes for 3D.
	 */
	public class ThreeDClassPackage extends ClassPackage {
		
		private static var _instance:ThreeDClassPackage;
		
		public static function getInstance():ThreeDClassPackage {
			if (!_instance) _instance = new ThreeDClassPackage();
			return _instance;
		}
		
		public function ThreeDClassPackage() {
			
		}
		
		
		override protected final function populateClasses():void {
			//3D actions
			classes.push(RandomDrift3D);
			classes.push(Accelerate3D);
			classes.push(BillboardOriented);
			classes.push(Collide3D);
			classes.push(DeathZone3D);
			classes.push(Damping3D);
			classes.push(Deflect3D);
			classes.push(Explode3D);
			classes.push(Gravity3D);
			classes.push(Move3D);
			classes.push(MutualGravity3D);
			classes.push(NormalDrift3D);
			classes.push(Oriented3D);
			classes.push(Snapshot3D);
			classes.push(SnapshotRestore3D);
			classes.push(Spawn3D);
			classes.push(SpeedLimit3D);
			classes.push(Spin3D);
			classes.push(StardustSpriteUpdate3D);
			classes.push(VelocityField3D);
			
			//3D action triggers
			classes.push(DeflectorTrigger3D);
			classes.push(ZoneTrigger3D);
			
			//3D deflectors
			classes.push(BoundingCube);
			classes.push(BoundingSphere);
			classes.push(PlaneDeflector);
			classes.push(SphereDeflector);
			classes.push(WrappingCube);
			
			//3D emitters
			classes.push(Emitter3D);
			
			//3D fields
			classes.push(RadialField3D);
			classes.push(UniformField3D);
			
			//3D initializers
			classes.push(DisplayObjectClass3D);
			classes.push(Omega3D);
			classes.push(PooledDisplayObjectClass3D);
			classes.push(Position3D);
			classes.push(Rotation3D);
			classes.push(StardustSpriteInit3D);
			classes.push(Velocity3D);
			
			//3D particle handlers
			classes.push(DisplayObjectHandler3D);
			
			//3D zones
			classes.push(CubeZone);
			classes.push(DiskZone);
			classes.push(SinglePoint3D);
			classes.push(SphereCap);
			classes.push(SphereShell);
			classes.push(SphereSurface);
			classes.push(SphereZone);
		}
	}
}