﻿package com.shrimp.extensions.particle.twoD.events {
	import flash.events.Event;
	import com.shrimp.extensions.particle.twoD.geom.Vec2D;
	
	public class Vec2DEvent extends Event {
		
		public static const CHANGE:String = "stardustVec2DChange";
		
		private var _vec:Vec2D;
		public function Vec2DEvent(type:String, vec:Vec2D) {
			super(type);
			_vec = vec;
		}
		
		public function get vec():Vec2D { return _vec ; }
	}
}