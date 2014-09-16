/**
 * Created with IntelliJ IDEA.
 * User: BenP
 * Date: 13/01/14
 * Time: 15:07
 * To change this template use File | Settings | File Templates.
 */
package com.plumbee.stardust.controller
{

import com.plumbee.stardust.controller.events.UpdateImpulseClockRendererEvent;
import com.plumbee.stardust.controller.events.UpdateSteadyClockRendererEvent;
import com.plumbee.stardust.model.ProjectModel;
import com.shrimp.extensions.particle.common.clocks.Clock;
import com.shrimp.extensions.particle.common.clocks.ImpulseClock;
import com.shrimp.extensions.particle.common.clocks.SteadyClock;
import com.shrimp.extensions.particle.player.emitter.EmitterValueObject;

import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class UpdateClockValuesFromModelCommand implements ICommand
{

    [Inject]
    public var projectSettings : ProjectModel;

    [Inject]
    public var dispatcher : IEventDispatcher;

    public function execute() : void
    {
        var emitterVO : EmitterValueObject = projectSettings.emitterInFocus;

        var clock : Clock = emitterVO.emitter.clock;

        if ( clock is SteadyClock )
        {
            var ticksPerCall : Number = SteadyClock( clock ).ticksPerCall;
            dispatcher.dispatchEvent( new UpdateSteadyClockRendererEvent( UpdateSteadyClockRendererEvent.UPDATE, SteadyClock( clock ), ticksPerCall ) );
        }
        else if ( clock is ImpulseClock )
        {
            dispatcher.dispatchEvent( new UpdateImpulseClockRendererEvent( UpdateImpulseClockRendererEvent.UPDATE, ImpulseClock( clock ) ) );
        }
    }
}
}
