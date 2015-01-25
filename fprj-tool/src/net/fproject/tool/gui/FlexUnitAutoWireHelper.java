package net.fproject.tool.gui;

import net.fproject.tool.flexunit.FlexUnitAutoWire;

public class FlexUnitAutoWireHelper implements IActionHelper{

	@Override
	public void runAction(Object model) {
		FlexUnitAutoWireModel m = (FlexUnitAutoWireModel)model;
		FlexUnitAutoWire.autoWire(m.inputFolder, m.outputFolder);
	}

}
