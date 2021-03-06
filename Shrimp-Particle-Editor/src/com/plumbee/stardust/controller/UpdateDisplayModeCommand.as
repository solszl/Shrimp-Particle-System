package com.plumbee.stardust.controller
{

import com.plumbee.stardust.controller.events.SetBlendModeSelectedEvent;
import com.plumbee.stardust.controller.events.UpdateDisplayModeEvent;
import com.plumbee.stardust.helpers.Globals;
import com.plumbee.stardust.model.ProjectModel;
import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;
import com.shrimp.extensions.particle.player.project.DisplayModes;
import com.shrimp.extensions.particle.sd;
import com.shrimp.extensions.particle.twoD.handlers.DisplayObjectHandler;

import flash.display.BlendMode;
import flash.events.IEventDispatcher;
import flash.utils.Dictionary;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

use namespace sd;
// not used now
public class UpdateDisplayModeCommand implements ICommand
{
    [Inject]
    public var event : UpdateDisplayModeEvent;

    [Inject]
    public var dispatcher : IEventDispatcher;

    [Inject]
    public var projectSettings : ProjectModel;

    public function execute() : void
    {
        var mode : String = event.mode;
        switch ( mode )
        {
            case DisplayModes.DISPLAY_LIST :
                setDisplayModeDisplayList();
                break;
            case DisplayModes.STARLING :
                setDisplayModeStarling();
            break;
            default :
                break;
        }
    }

    private function setDisplayModeStarling() : void
    {
        const emitters : Dictionary = projectSettings.stadustSim.emitters;
        for each( var emitterVO : EmitterValueObject in emitters )
        {
            var blendMode : String = DisplayObjectHandler(emitterVO.emitter.particleHandler).blendMode;
            if ( !isBlendModeStarlingSafe( blendMode ) )
            {
                DisplayObjectHandler(emitterVO.emitter.particleHandler).blendMode = BlendMode.NORMAL;
            }
        }
        projectSettings.setDisplayMode( DisplayModes.STARLING );
        const currentBlendMode:String = DisplayObjectHandler(projectSettings.emitterInFocus.emitter.particleHandler).blendMode;
        dispatcher.dispatchEvent( new SetBlendModeSelectedEvent( SetBlendModeSelectedEvent.STARLING, currentBlendMode ) );
    }

    private function setDisplayModeDisplayList() : void
    {
        projectSettings.setDisplayMode( DisplayModes.DISPLAY_LIST );
        // TODO store BlendMode in a model when switching so its remembered
        dispatcher.dispatchEvent( new SetBlendModeSelectedEvent( SetBlendModeSelectedEvent.DISPLAY_LIST, BlendMode.NORMAL ) );
    }

    private function isBlendModeStarlingSafe( targetBlendMode : String ) : Boolean
    {
        var starlingBlendModes : Array = Globals.blendModesStarling.source;
        var numBlendModes : int = starlingBlendModes.length;
        for ( var i : int = 0; i < numBlendModes; i ++ )
        {
            if ( starlingBlendModes[i] == targetBlendMode )
            {
                return true;
            }
        }
        return false;
    }
}
}
