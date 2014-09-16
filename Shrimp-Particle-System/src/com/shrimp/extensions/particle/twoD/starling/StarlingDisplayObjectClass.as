package com.shrimp.extensions.particle.twoD.starling
{

import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import com.shrimp.extensions.particle.common.particles.Particle;
import com.shrimp.extensions.particle.common.utils.construct;
import com.shrimp.extensions.particle.common.xml.XMLBuilder;
import com.shrimp.extensions.particle.twoD.initializers.Initializer2D;

public class StarlingDisplayObjectClass extends Initializer2D
{
    public var displayObjectClass:Class;
    public var constructorParams:Array;

    public function StarlingDisplayObjectClass(displayObjectClass:Class = null, constructorParams:Array = null)
    {
        this.displayObjectClass = displayObjectClass;
        this.constructorParams = constructorParams;
    }

    override public function initialize(particle:Particle):void
    {
        // starling.display.DisplayObject
        var displayObject : * = construct(displayObjectClass, constructorParams);
        displayObject.pivotX = 0.5 * displayObject.width;
        displayObject.pivotY = 0.5 * displayObject.height;
        particle.target = displayObject;
    }

    //XML
    //------------------------------------------------------------------------------------------------

    override public function getXMLTagName():String {
        return "StarlingDisplayObjectClass";
    }

    override public function toXML():XML {
        var xml:XML = super.toXML();
        if (displayObjectClass) {
            xml.@displayObjectClass = getQualifiedClassName( displayObjectClass );
        }
        if (constructorParams && constructorParams.length > 0)
        {
            var paramStr : String = "";
            for (var i:int=0; i< constructorParams.length; i++) {
                paramStr += constructorParams[i] + ",";
            }
            paramStr = paramStr.substr(0, paramStr.length-1);
            xml.@constructorParameters = paramStr;
        }
        return xml;
    }

    override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
        super.parseXML(xml, builder);
        if (xml.@constructorParameters.length()) {
            constructorParams = String(xml.@constructorParameters ).split(",");
        }
        if (xml.@displayObjectClass.length()) {
            displayObjectClass = getDefinitionByName( xml.@displayObjectClass ) as Class;
        }
    }

    //------------------------------------------------------------------------------------------------
    //end of XML
}
}