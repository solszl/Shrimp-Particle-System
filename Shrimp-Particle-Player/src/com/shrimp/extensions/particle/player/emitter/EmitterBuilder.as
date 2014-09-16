package com.shrimp.extensions.particle.player.emitter
{
	import com.shrimp.extensions.particle.common.CommonClassPackage;
	import com.shrimp.extensions.particle.common.StardustElement;
	import com.shrimp.extensions.particle.common.xml.XMLBuilder;
	import com.shrimp.extensions.particle.twoD.TwoDClassPackage;
	import com.shrimp.extensions.particle.twoD.emitters.Emitter2D;
	import com.shrimp.extensions.particle.twoD.starling.StarlingDisplayObjectClass;
	import com.shrimp.extensions.particle.twoD.starling.StarlingHandler;

	public class EmitterBuilder
	{

		private static var builder:XMLBuilder;

		public static function buildEmitter(sourceXML:XML):Emitter2D
		{
			if (builder == null)
			{
				builder=new XMLBuilder();
				builder.registerClassesFromClassPackage(CommonClassPackage.getInstance());
				builder.registerClassesFromClassPackage(TwoDClassPackage.getInstance());
				builder.registerClass(StarlingDisplayObjectClass);
				builder.registerClass(StarlingHandler);
			}
			builder.buildFromXML(sourceXML);
			return (builder.getElementsByClass(Emitter2D) as Vector.<StardustElement>)[0] as Emitter2D;
		}
	}
}
