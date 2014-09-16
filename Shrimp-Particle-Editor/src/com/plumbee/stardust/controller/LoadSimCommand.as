package com.plumbee.stardust.controller
{

import com.plumbee.stardust.controller.events.LoadSimEvent;
import com.plumbee.stardust.controller.events.RefreshBitmapParticleInitializerRendererEvent;
import com.plumbee.stardust.controller.events.StartSimEvent;
import com.plumbee.stardust.helpers.Globals;
import com.plumbee.stardust.model.ProjectModel;
import com.plumbee.stardust.view.events.RefreshBackgroundViewEvent;
import com.shrimp.extensions.particle.player.ISimLoader;
import com.shrimp.extensions.particle.player.SimPlayer;
import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;
import com.shrimp.extensions.particle.twoD.handlers.DisplayObjectHandler;

import flash.events.Event;
import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class LoadSimCommand implements ICommand
{
    [Inject]
    public var simLoader : ISimLoader;

    [Inject]
    public var dispatcher : IEventDispatcher;

    [Inject]
    public var projectSettings : ProjectModel;

    [Inject]
    public var event : LoadSimEvent;

    [Inject]
    public var simPlayer : SimPlayer;

    public function execute() : void
    {
        simLoader.addEventListener(Event.COMPLETE, onLoaded);
        simLoader.loadSim( event.sdeFile );
    }

    private function onLoaded(event : Event) : void
    {
        simLoader.removeEventListener(Event.COMPLETE, onLoaded);

        if ( projectSettings.stadustSim )
        {
            for each (var oldEmitterVO : EmitterValueObject in projectSettings.stadustSim.emitters)
            {
                oldEmitterVO.emitter.clearActions();
                oldEmitterVO.emitter.clearInitializers();
                oldEmitterVO.emitter.clearParticles()
            }
        }

        projectSettings.stadustSim = simLoader.project;
        for each (var emitterVO : EmitterValueObject in projectSettings.stadustSim.emitters)
        {
            projectSettings.emitterInFocus = emitterVO;
            break;
        }
        if (projectSettings.emitterInFocus.emitter.particleHandler is DisplayObjectHandler)
        {
            simPlayer.setSimulation( projectSettings.stadustSim, Globals.canvas);
        }
        else
        {
            simPlayer.setSimulation( projectSettings.stadustSim, Globals.bitmapData);
        }

        dispatcher.dispatchEvent( new RefreshBitmapParticleInitializerRendererEvent() );

        dispatcher.dispatchEvent( new RefreshBackgroundViewEvent() );

        dispatcher.dispatchEvent( new StartSimEvent() );
    }


}
}
