package com.plumbee.stardust.model
{

import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;
import com.shrimp.extensions.particle.player.project.ProjectValueObject;

import flash.display.DisplayObject;
import flash.utils.ByteArray;

public class ProjectModel
{

    public var emitterInFocus : EmitterValueObject;
    public var stadustSim : ProjectValueObject;

    public function getDisplayMode() : String
    {
        return stadustSim.displayMode;
    }

    public function setDisplayMode( displayMode : String ) : void
    {
        stadustSim.displayMode = displayMode;
    }

}
}