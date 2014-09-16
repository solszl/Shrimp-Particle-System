package com.shrimp.extensions.particle.threeD.actions {
	import com.shrimp.extensions.particle.common.actions.Action;
	
	/**
	 * Base class for 3D actions.
	 */
	public class Action3D extends Action {
		
		public function Action3D() {
			_supports2D = false;
			
			//priority = Action3DPriority.getInstance().getPriority(Object(this).constructor as Class);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Action3D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}