package net.fproject.tool.gui;

import net.fproject.tool.asdoc.Html2AsDoc;

public class HtmlToASDocHelper implements IActionHelper{

	@Override
	public void runAction(Object model) {
		HtmlToASDocModel m = (HtmlToASDocModel)model;
		Html2AsDoc.convertHtmlToASDoc(m.htmlFolder, m.exampleFolder);
	}

}
