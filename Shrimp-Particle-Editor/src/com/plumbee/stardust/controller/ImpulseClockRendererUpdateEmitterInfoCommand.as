package com.plumbee.stardust.controller
{
import com.plumbee.stardust.model.ProjectModel;
import com.plumbee.stardust.view.events.ImpulseClockRendererUpdateEmitterInfoEvent;
import com.shrimp.extensions.particle.common.clocks.ImpulseClock;
import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class ImpulseClockRendererUpdateEmitterInfoCommand implements ICommand
{
    [Inject]
    public var projectSetting : ProjectModel;

    [Inject]
    public var event : ImpulseClockRendererUpdateEmitterInfoEvent;

    public function execute() : void
    {
        const info : EmitterValueObject = projectSetting.emitterInFocus;
        ImpulseClock(info.emitter.clock).impulseCount = event.numParticles;
        ImpulseClock(info.emitter.clock).repeatCount = event.numBursts;
        ImpulseClock(info.emitter.clock).burstInterval = event.burstInterval;
    }
}
}
