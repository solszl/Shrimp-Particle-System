package com.plumbee.stardust.controller
{
import com.plumbee.stardust.controller.events.InitCompleteEvent;
import com.plumbee.stardust.controller.events.InitalizeZoneDrawerEvent;
import com.plumbee.stardust.controller.events.SetBlendModeSelectedEvent;
import com.plumbee.stardust.controller.events.SetSmoothingCheckBoxEvent;
import com.plumbee.stardust.controller.events.UpdateClockContainerFromEmitter;
import com.plumbee.stardust.controller.events.UpdateEmitterDropDownListEvent;
import com.plumbee.stardust.controller.events.UpdateEmitterFromViewUICollectionsEvent;
import com.plumbee.stardust.helpers.Globals;
import com.plumbee.stardust.model.ProjectModel;
import com.shrimp.extensions.particle.player.SimPlayer;
import com.shrimp.extensions.particle.sd;
import com.shrimp.extensions.particle.twoD.handlers.DisplayObjectHandler;

import flash.display.MovieClip;
import flash.events.IEventDispatcher;
import flash.utils.getQualifiedClassName;

import mx.logging.ILogger;
import mx.logging.Log;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

use namespace sd;

public class StartSimCommand implements ICommand
{

    [Inject]
    public var dispatcher : IEventDispatcher;

    [Inject]
    public var simPlayer : SimPlayer;

    private static const LOG : ILogger = Log.getLogger( getQualifiedClassName( StartSimCommand ).replace( "::", "." ) );

    [Inject]
    public var projectSettings : ProjectModel;

    public function execute() : void
    {
        LOG.info( "Restart SIM" );

        simPlayer.resetSimulation();

        if (Globals.bitmapData)
        {
            Globals.bitmapData.fillRect(Globals.bitmapData.rect, 0xFF00FF00FF);
        }
        // refresh the initializer/action arrayCollections
        dispatcher.dispatchEvent( new UpdateEmitterFromViewUICollectionsEvent( UpdateEmitterFromViewUICollectionsEvent.UPDATE, projectSettings.emitterInFocus ) );

        dispatcher.dispatchEvent( new UpdateClockContainerFromEmitter( UpdateClockContainerFromEmitter.UPDATE, projectSettings.emitterInFocus ) );

        Globals.textureManager.clear();

        //If the bg is a .swf, restart it so it syncs up with the animated emitter path.
        if (projectSettings.stadustSim.backgroundImage is MovieClip)
        {
            MovieClip(projectSettings.stadustSim.backgroundImage).gotoAndPlay(1);
        }

        //refresh the emitter dropdown list.
        dispatcher.dispatchEvent( new UpdateEmitterDropDownListEvent( UpdateEmitterDropDownListEvent.UPDATE ) );

        //refresh the smoothing checkbox.
        dispatcher.dispatchEvent( new SetSmoothingCheckBoxEvent( projectSettings.emitterInFocus.smoothing ) );

        //refresh the displayMode radiobuttons and the blendMode dropdown.
        const blendMode : String = DisplayObjectHandler(projectSettings.emitterInFocus.emitter.particleHandler).blendMode;
        dispatcher.dispatchEvent( new SetBlendModeSelectedEvent( SetBlendModeSelectedEvent.DISPLAY_LIST, blendMode ) );

        // setup zone drawer
        dispatcher.dispatchEvent( new InitalizeZoneDrawerEvent( InitalizeZoneDrawerEvent.RESET ) );

        dispatcher.dispatchEvent( new InitCompleteEvent() );
    }
}
}
