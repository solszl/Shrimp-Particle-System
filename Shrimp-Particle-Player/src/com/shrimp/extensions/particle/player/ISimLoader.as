package com.shrimp.extensions.particle.player
{

import com.shrimp.extensions.particle.player.project.ProjectValueObject;

import flash.events.IEventDispatcher;
import flash.utils.ByteArray;

public interface ISimLoader extends IEventDispatcher
{
    function loadSim(data : ByteArray) : void;

    function get project() : ProjectValueObject;
}
}
