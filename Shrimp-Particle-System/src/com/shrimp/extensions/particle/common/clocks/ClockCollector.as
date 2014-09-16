package com.shrimp.extensions.particle.common.clocks {
	
	public interface ClockCollector {
		
		function addClock(clock:Clock):void;
		function removeClock(clock:Clock):void;
		function clearClocks():void;
	}
}