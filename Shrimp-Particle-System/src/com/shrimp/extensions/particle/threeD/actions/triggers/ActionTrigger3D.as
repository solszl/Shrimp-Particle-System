package com.shrimp.extensions.particle.threeD.actions.triggers {
	import com.shrimp.extensions.particle.common.actions.triggers.ActionTrigger;
	import com.shrimp.extensions.particle.threeD.actions.Action3DPriority;
	
	/**
	 * Base class for 3D action triggers.
	 */
	public class ActionTrigger3D extends ActionTrigger {
		
		public function ActionTrigger3D() {
			_supports2D = false;
			
			priority = Action3DPriority.getInstance().getPriority(Object(this).constructor as Class);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "ActionTrigger3D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}