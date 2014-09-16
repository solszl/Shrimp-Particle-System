package com.shrimp.extensions.particle.player.sequenceLoader
{

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;

public class LoadByteArrayJob extends EventDispatcher
{
    protected var _data : ByteArray;
    protected var _loader : Loader;
    public var jobName : String;
    public var fileName : String;

    public function LoadByteArrayJob( jobName : String, fileName : String, data : ByteArray )
    {
        _loader = new Loader();
        _data = data;
        this.jobName = jobName;
        this.fileName = fileName;
    }

    public function load() : void
    {
        _loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoadComplete );
        _loader.loadBytes( _data );
    }

    public function get byteArray() : ByteArray
    {
        return _data;
    }

    protected function onLoadComplete( event : Event ) : void
    {
        dispatchEvent( new Event( Event.COMPLETE ) );
    }

    public function get content() : DisplayObject
    {
        return _loader.content;
    }
}
}
