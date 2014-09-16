﻿package com.shrimp.extensions.particle.twoD.bursters {
	import flash.display.BitmapData;

    import com.shrimp.extensions.particle.common.particles.Particle;
    import com.shrimp.extensions.particle.twoD.particles.Particle2D;
	
	public class PixelBurster extends Burster2D {
		
		/**
		 * The X coordinate of the top-left corner of the top-left cell.
		 */
		public var offsetX:Number;
		/**
		 * The Y coordinate of the top-left corner of the top-left cell.
		 */
		public var offsetY:Number;
		
		public var bitmapData:BitmapData;
		
		public function PixelBurster(offsetX:Number = 0, offsetY:Number = 0) {
			this.offsetX = offsetX;
			this.offsetY = offsetY;
		}
		
		override public function createParticles(currentTime : Number): Vector.<Particle> {
			if (!bitmapData) return null;
			
			var rows:int = bitmapData.height;
			var columns:int = bitmapData.width;
			var particles:Vector.<Particle> = factory.createParticles(rows * columns, currentTime);
			
			var index:int = 0;
			var p:Particle2D;
			var inv255:Number = 1 / 255;
			for (var j:int = 0; j < rows; j++) {
				for (var i:int = 0; i < columns; i++) {
					p = Particle2D(particles[index]);
					var color:uint = bitmapData.getPixel32(i, j);
					p.alpha = Number(uint(color & 0xFF000000) >> 24) * inv255;
					if (!p.alpha) continue;
					p.color = color & 0xFFFFFF;
					p.x = i + offsetX;
					p.y = j + offsetY;

					index++;
				}
			}
			
			return particles;
		}
	}
}