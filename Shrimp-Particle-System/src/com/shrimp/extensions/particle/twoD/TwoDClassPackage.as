package com.shrimp.extensions.particle.twoD
{
	import com.shrimp.extensions.particle.common.xml.ClassPackage;
	import com.shrimp.extensions.particle.twoD.actions.Accelerate;
	import com.shrimp.extensions.particle.twoD.actions.AnimateSpriteSheet;
	import com.shrimp.extensions.particle.twoD.actions.Collide;
	import com.shrimp.extensions.particle.twoD.actions.Damping;
	import com.shrimp.extensions.particle.twoD.actions.DeathZone;
	import com.shrimp.extensions.particle.twoD.actions.Deflect;
	import com.shrimp.extensions.particle.twoD.actions.Explode;
	import com.shrimp.extensions.particle.twoD.actions.FollowWaypoints;
	import com.shrimp.extensions.particle.twoD.actions.Gravity;
	import com.shrimp.extensions.particle.twoD.actions.Impulse;
	import com.shrimp.extensions.particle.twoD.actions.Move;
	import com.shrimp.extensions.particle.twoD.actions.MutualGravity;
	import com.shrimp.extensions.particle.twoD.actions.NormalDrift;
	import com.shrimp.extensions.particle.twoD.actions.Oriented;
	import com.shrimp.extensions.particle.twoD.actions.RandomDrift;
	import com.shrimp.extensions.particle.twoD.actions.ReorderDisplayObject;
	import com.shrimp.extensions.particle.twoD.actions.Snapshot;
	import com.shrimp.extensions.particle.twoD.actions.SnapshotRestore;
	import com.shrimp.extensions.particle.twoD.actions.Spawn;
	import com.shrimp.extensions.particle.twoD.actions.SpeedLimit;
	import com.shrimp.extensions.particle.twoD.actions.Spin;
	import com.shrimp.extensions.particle.twoD.actions.StardustSpriteUpdate;
	import com.shrimp.extensions.particle.twoD.actions.triggers.DeflectorTrigger;
	import com.shrimp.extensions.particle.twoD.actions.triggers.ZoneTrigger;
	import com.shrimp.extensions.particle.twoD.actions.VelocityField;
	import com.shrimp.extensions.particle.twoD.deflectors.BoundingBox;
	import com.shrimp.extensions.particle.twoD.deflectors.BoundingCircle;
	import com.shrimp.extensions.particle.twoD.deflectors.CircleDeflector;
	import com.shrimp.extensions.particle.twoD.deflectors.LineDeflector;
	import com.shrimp.extensions.particle.twoD.deflectors.WrappingBox;
	import com.shrimp.extensions.particle.twoD.emitters.Emitter2D;
	import com.shrimp.extensions.particle.twoD.fields.BitmapField;
	import com.shrimp.extensions.particle.twoD.fields.RadialField;
	import com.shrimp.extensions.particle.twoD.fields.UniformField;
	import com.shrimp.extensions.particle.twoD.handlers.BitmapHandler;
	import com.shrimp.extensions.particle.twoD.handlers.DisplayObjectHandler;
	import com.shrimp.extensions.particle.twoD.handlers.PixelHandler;
	import com.shrimp.extensions.particle.twoD.handlers.SingularBitmapHandler;
	import com.shrimp.extensions.particle.twoD.initializers.BitmapParticleInit;
	import com.shrimp.extensions.particle.twoD.initializers.DisplayObjectClass;
	import com.shrimp.extensions.particle.twoD.initializers.DisplayObjectParent;
	import com.shrimp.extensions.particle.twoD.initializers.LazyInitializer;
	import com.shrimp.extensions.particle.twoD.initializers.Omega;
	import com.shrimp.extensions.particle.twoD.initializers.PooledDisplayObjectClass;
	import com.shrimp.extensions.particle.twoD.initializers.Position;
	import com.shrimp.extensions.particle.twoD.initializers.PositionAnimated;
	import com.shrimp.extensions.particle.twoD.initializers.Rotation;
	import com.shrimp.extensions.particle.twoD.initializers.StardustSpriteInit;
	import com.shrimp.extensions.particle.twoD.initializers.Velocity;
	import com.shrimp.extensions.particle.twoD.zones.BitmapZone;
	import com.shrimp.extensions.particle.twoD.zones.CircleContour;
	import com.shrimp.extensions.particle.twoD.zones.CircleZone;
	import com.shrimp.extensions.particle.twoD.zones.Composite;
	import com.shrimp.extensions.particle.twoD.zones.Line;
	import com.shrimp.extensions.particle.twoD.zones.RectContour;
	import com.shrimp.extensions.particle.twoD.zones.RectZone;
	import com.shrimp.extensions.particle.twoD.zones.Sector;
	import com.shrimp.extensions.particle.twoD.zones.SinglePoint;

	/**
	 * Packs together classes for 2D.
	 */
	public class TwoDClassPackage extends ClassPackage
	{

		private static var _instance:TwoDClassPackage;

		public static function getInstance():TwoDClassPackage
		{
			if (!_instance)
				_instance=new TwoDClassPackage();
			return _instance;
		}

		public function TwoDClassPackage()
		{

		}


		override protected final function populateClasses():void
		{
			//2D actions
			classes.push(RandomDrift);
			classes.push(Accelerate);
			classes.push(Collide);
			classes.push(Damping);
			classes.push(DeathZone);
			classes.push(Deflect);
			classes.push(Explode);
			classes.push(Gravity);
			classes.push(Impulse);
			classes.push(Move);
			classes.push(MutualGravity);
			classes.push(NormalDrift);
			classes.push(Oriented);
			classes.push(ReorderDisplayObject);
			classes.push(Snapshot);
			classes.push(SnapshotRestore);
			classes.push(Spawn);
			classes.push(SpeedLimit);
			classes.push(Spin);
			classes.push(StardustSpriteUpdate);
			classes.push(VelocityField);
			classes.push(AnimateSpriteSheet);

			//2D action triggers
			classes.push(DeflectorTrigger);
			classes.push(ZoneTrigger);

			//2D deflectors
			classes.push(BoundingBox);
			classes.push(BoundingCircle);
			classes.push(CircleDeflector);
			classes.push(LineDeflector);
			classes.push(WrappingBox);

			//2D emitters
			classes.push(Emitter2D);

			//2D fields
			classes.push(BitmapField);
			classes.push(RadialField);
			classes.push(UniformField);

			//2D initializers
			classes.push(DisplayObjectClass);
			classes.push(DisplayObjectParent);
			classes.push(LazyInitializer);
			classes.push(Omega);
			classes.push(PooledDisplayObjectClass);
			classes.push(Position);
			classes.push(Rotation);
			classes.push(StardustSpriteInit);
			classes.push(Velocity);
			classes.push(PositionAnimated);
			classes.push(BitmapParticleInit);

			//2D particle handlers
			classes.push(BitmapHandler);
			classes.push(DisplayObjectHandler);
			classes.push(SingularBitmapHandler);
			classes.push(PixelHandler);

			//2D zones
			classes.push(BitmapZone);
			classes.push(CircleContour);
			classes.push(CircleZone);
			classes.push(Composite);
			classes.push(Line);
			classes.push(RectContour);
			classes.push(RectZone);
			classes.push(Sector);
			classes.push(SinglePoint);

			classes.push(FollowWaypoints);
		}
	}
}
