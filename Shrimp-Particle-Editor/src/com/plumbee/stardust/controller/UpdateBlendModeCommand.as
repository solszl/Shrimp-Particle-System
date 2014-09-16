package com.plumbee.stardust.controller
{

import com.plumbee.stardust.controller.events.StartSimEvent;
import com.plumbee.stardust.model.ProjectModel;
import com.plumbee.stardust.view.events.UpdateBlendModeEvent;
import com.shrimp.extensions.particle.common.handlers.ParticleHandler;
import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;
import com.shrimp.extensions.particle.twoD.handlers.DisplayObjectHandler;

import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class UpdateBlendModeCommand implements ICommand
{
    [Inject]
    public var dispatcher : IEventDispatcher;

    [Inject]
    public var projectSettings : ProjectModel;

    [Inject]
    public var event : UpdateBlendModeEvent;

    public function execute() : void
    {

        var emitterVO : EmitterValueObject = projectSettings.emitterInFocus;

        var handler : ParticleHandler = emitterVO.emitter.particleHandler;

        if ( handler is DisplayObjectHandler )
        {
            (handler as DisplayObjectHandler).blendMode = event.newBlendMode;
        }

        dispatcher.dispatchEvent( new StartSimEvent() );
    }
}
}
