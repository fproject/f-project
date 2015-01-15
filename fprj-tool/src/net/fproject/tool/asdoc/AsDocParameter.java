package net.fproject.tool.asdoc;

public class AsDocParameter extends AsDocElement {

	@Override
	public void contentToAsDoc() {
		super.contentToAsDoc();
		if (asDocLines == null || asDocLines.size() == 0)
			return;
		String s = super.getAsDocLineAt(0);
		if (s.startsWith(ASDOC_LINE_HEAD))
			s = s.substring(ASDOC_LINE_HEAD.length());
		if (this.name == null)
			throw new IllegalAccessError();
		super.setAsDocLine(0, ASDOC_LINE_HEAD + "@param " + this.name + " " + s);
	}
}
