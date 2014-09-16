package com.plumbee.stardust.view.stardust.twoD.zones
{
	import com.shrimp.extensions.particle.twoD.zones.Zone;

	import mx.core.IVisualElement;

	public interface IZoneRenderer extends IVisualElement
	{

		function setData(d:Zone):void;
	}
}
