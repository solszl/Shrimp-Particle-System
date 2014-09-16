package com.shrimp.extensions.particle.common.initializers {
	
	public interface InitializerCollector {
		
		function addInitializer(initializer:Initializer):void;
		function removeInitializer(initializer:Initializer):void;
		function clearInitializers():void;
	}
}