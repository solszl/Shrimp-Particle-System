package com.shrimp.extensions.particle.common.easing {
	
	/**
	 *  Easing Equations
	 *  <p>(c) 2003 Robert Penner, all rights reserved.</p>
	 *  <p>This work is subject to the terms in http://www.robertpenner.com/easing_terms_of_use.html.</p>
	 */
	public class Quart {
		public static function easeIn (t:Number, b:Number, c:Number, d:Number):Number {
			return c*(t/=d)*t*t*t + b;
		}
		public static function easeOut (t:Number, b:Number, c:Number, d:Number):Number {
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		}
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number):Number {
			if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
			return -c/2 * ((t-=2)*t*t*t - 2) + b;
		}
	}
}