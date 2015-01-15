package net.fproject.tool.gui;

import net.fproject.tool.ascode.FlexCodeCounter;

public class FlexCodeCounterHelper implements IActionHelper{

	@Override
	public void runAction(Object model) {
		FlexCodeCounterModel m = (FlexCodeCounterModel)model;
		if(m.noOutput)
			m.outputFile = null;
		FlexCodeCounter.countFlexCode(m.inputFolder, m.outputFile);
	}

}
