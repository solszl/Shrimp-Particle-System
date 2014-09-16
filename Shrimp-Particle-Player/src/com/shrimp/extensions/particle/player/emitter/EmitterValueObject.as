package com.shrimp.extensions.particle.player.emitter
{

import com.shrimp.extensions.particle.sd;
import com.shrimp.extensions.particle.twoD.emitters.Emitter2D;
import com.shrimp.extensions.particle.twoD.initializers.BitmapParticleInit;

import flash.display.BitmapData;

use namespace sd;

public class EmitterValueObject
{
    private var _emitter : Emitter2D;
    private var _id : uint;
    private var _image : BitmapData;

    public function EmitterValueObject( emitterId : uint, emitter : Emitter2D )
    {
        _emitter = emitter;
        _id = emitterId;
    }

    public function get id() : uint
    {
        return _id;
    }

    public function get emitter():Emitter2D
    {
        return _emitter;
    }

    public function get image() : BitmapData
    {
        return _image;
    }

    public function get smoothing() : Boolean
    {
        const inits : Array = _emitter.sd::initializers;
        const numInits : uint = inits.length;
        for (var i:uint=0; i < numInits; i++)
        {
            var bitmapInit : BitmapParticleInit = inits[i] as BitmapParticleInit;
            if ( bitmapInit )
            {
                return bitmapInit.smoothing;
            }
        }

        return false;
    }

    public function set image(imageBD : BitmapData) : void
    {
        _image = imageBD;
        const initializers : Array = _emitter.sd::initializers;
        for (var k:int = 0; k < initializers.length; k++)
        {
            var bitmapParticleInit : BitmapParticleInit = initializers[k] as BitmapParticleInit;
            if ( bitmapParticleInit )
            {
                bitmapParticleInit.bitmapData = _image;
                return;
            }
        }
    }

}
}
