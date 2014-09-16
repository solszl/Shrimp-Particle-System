package com.shrimp.extensions.particle.player
{

import com.shrimp.extensions.particle.common.clocks.ImpulseClock;
import com.shrimp.extensions.particle.common.handlers.ParticleHandler;
import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;
import com.shrimp.extensions.particle.player.project.ProjectValueObject;
import com.shrimp.extensions.particle.twoD.handlers.BitmapHandler;
import com.shrimp.extensions.particle.twoD.handlers.DisplayObjectHandler;
import com.shrimp.extensions.particle.twoD.handlers.PixelHandler;
import com.shrimp.extensions.particle.twoD.handlers.SingularBitmapHandler;
import com.shrimp.extensions.particle.twoD.starling.StarlingHandler;

import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;

/** Simple class to play back simulations. If you need something more custom write your own. */
public class SimPlayer
{
    private var _sim : ProjectValueObject;

    public function setSimulation( sim : ProjectValueObject, renderTarget : Object ) : void
    {
        _sim = sim;
        for each (var emitterValueObject : EmitterValueObject in sim.emitters)
        {
            const handler : ParticleHandler = emitterValueObject.emitter.particleHandler;
            if (handler is DisplayObjectHandler)
            {
                DisplayObjectHandler(handler).container = DisplayObjectContainer(renderTarget);
            }
            else if (handler is BitmapHandler)
            {
                BitmapHandler(handler).targetBitmapData = BitmapData(renderTarget);
            }
            else if (handler is SingularBitmapHandler)
            {
                SingularBitmapHandler(handler).targetBitmapData = BitmapData(renderTarget);
            }
            else if (handler is PixelHandler)
            {
                PixelHandler(handler).targetBitmapData = BitmapData(renderTarget);
            }
            else if (handler is StarlingHandler)
            {
                StarlingHandler(handler).container = renderTarget;
            }
        }
    }

    public function stepSimulation( numSteps : uint = 1) : void
    {
        for each (var emitterValueObject : EmitterValueObject in _sim.emitters)
        {
            emitterValueObject.emitter.step( numSteps );
	        if (emitterValueObject.emitter.clock is ImpulseClock)
	        {
		        const impulseClock : ImpulseClock = ImpulseClock(emitterValueObject.emitter.clock);
		        if (emitterValueObject.emitter.currentTime % impulseClock.burstInterval == 1)
		        {
			        ImpulseClock(emitterValueObject.emitter.clock ).impulse();
		        }
	        }
        }
    }

    /** When calling this the Emitter2D objects will be recreated, so make sure you update your references. */
    public function resetSimulation() : void
    {
        for each (var emitterValueObject : EmitterValueObject in _sim.emitters)
        {
            emitterValueObject.emitter.reset();
        }
    }

}
}
