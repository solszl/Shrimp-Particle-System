package com.shrimp.extensions.particle.twoD.handlers {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import com.shrimp.extensions.particle.common.handlers.ParticleHandler;
import com.shrimp.extensions.particle.common.particles.Particle;
import com.shrimp.extensions.particle.common.xml.XMLBuilder;
import com.shrimp.extensions.particle.twoD.display.AddChildMode;
import com.shrimp.extensions.particle.twoD.particles.Particle2D;

/**
 * This handler adds display object particles to the target container's display list,
 * removes dead particles from the display list,
 * and updates the display object's x, y, rotation, scaleX, scaleY, and alpha properties.
 */
public class DisplayObjectHandler extends ParticleHandler {

    public var addChildMode:int;
    /**
     * The target container.
     */
    public var container:DisplayObjectContainer;
    /**
     * Whether to change a display object's parent to the target container if the object already belongs to another parent.
     */
    public var forceParentChange:Boolean;
    /**
     * The blend mode for drawing.
     */
    public var blendMode:String;

    public function DisplayObjectHandler(container:DisplayObjectContainer = null, blendMode:String = "normal", addChildMode:int = 0) {
        this.container = container;
        this.addChildMode = addChildMode;
        this.blendMode = blendMode;
        forceParentChange = false;
    }

    private var p2D:Particle2D;
    private var displayObj:DisplayObject;

    override public function particleAdded(particle:Particle):void {
        displayObj = DisplayObject(particle.target);
        displayObj.blendMode = blendMode;

        if (!forceParentChange && displayObj.parent) return;

        switch (addChildMode) {
            case AddChildMode.RANDOM:
                container.addChildAt(displayObj, Math.floor(Math.random() * container.numChildren));
                break;
            case AddChildMode.TOP:
                container.addChild(displayObj);
                break;
            case AddChildMode.BOTTOM:
                container.addChildAt(displayObj, 0);
                break;
            default:
                container.addChildAt(displayObj, Math.floor(Math.random() * container.numChildren));
                break;
        }
    }

    override public function particleRemoved(particle:Particle):void {
        displayObj = DisplayObject(particle.target);
        displayObj.parent.removeChild(displayObj);
    }

    override public function readParticle(particle:Particle):void {
        p2D = Particle2D(particle);
        displayObj = DisplayObject(particle.target);

        displayObj.x = p2D.x;
        displayObj.y = p2D.y;
        displayObj.rotation = p2D.rotation;
        displayObj.scaleX = displayObj.scaleY = p2D.scale;
        displayObj.alpha = p2D.alpha;
    }


    //XML
    //------------------------------------------------------------------------------------------------

    override public function getXMLTagName():String {
        return "DisplayObjectHandler";
    }

    override public function toXML():XML {
        var xml:XML = super.toXML();

        xml.@addChildMode = addChildMode;
        xml.@forceParentChange = forceParentChange;
        xml.@blendMode = blendMode;

        return xml;
    }

    override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
        super.parseXML(xml, builder);

        if (xml.@addChildMode.length()) addChildMode = parseInt(xml.@addChildMode);
        if (xml.@forceParentChange.length()) forceParentChange = (xml.@forceParentChange == "true");
        if (xml.@blendMode.length()) blendMode = (xml.@blendMode);
    }

    //------------------------------------------------------------------------------------------------
    //end of XML
}
}