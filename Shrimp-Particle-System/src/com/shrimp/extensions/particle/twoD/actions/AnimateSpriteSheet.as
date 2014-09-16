package com.shrimp.extensions.particle.twoD.actions {

import com.shrimp.extensions.particle.common.emitters.Emitter;
import com.shrimp.extensions.particle.common.particles.Particle;
import com.shrimp.extensions.particle.common.xml.XMLBuilder;
import com.shrimp.extensions.particle.twoD.display.bitmapParticle.IBitmapParticle;

public class AnimateSpriteSheet extends Action2D{

    override public function update(emitter:Emitter, particle:Particle, timeDelta:Number, currentTime:Number):void {
        const target : IBitmapParticle = particle.target as IBitmapParticle;
        if (target)
        {
            target.stepSpriteSheet( timeDelta );
        }
    }

    //XML
    //------------------------------------------------------------------------------------------------

    override public function getXMLTagName():String {
        return "AnimateSpriteSheet";
    }

    override public function toXML():XML {
        var xml:XML = super.toXML();

        return xml;
    }

    override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
        super.parseXML(xml, builder);
    }

    //------------------------------------------------------------------------------------------------
    //end of XML

}
}
