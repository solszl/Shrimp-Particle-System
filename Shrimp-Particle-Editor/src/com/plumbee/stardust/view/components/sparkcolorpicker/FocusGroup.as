package com.plumbee.stardust.view.components.sparkcolorpicker
{

import mx.core.IFlexDisplayObject;
import mx.managers.IFocusManagerContainer;

import spark.components.Group;

public class FocusGroup extends Group implements IFocusManagerContainer
{
    public function get defaultButton() : IFlexDisplayObject
    {
        return null;
    }

    public function set defaultButton( value : IFlexDisplayObject ) : void
    {

    }

}

}
