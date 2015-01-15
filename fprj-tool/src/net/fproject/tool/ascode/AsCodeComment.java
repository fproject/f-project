package net.fproject.tool.ascode;


public class AsCodeComment extends AsCodeBlockBase{
	public static final String TYPE1 = "/**/";
	public static final String TYPE1_START = "/*";
	public static final String TYPE1_END = "*/";
	public static final String TYPE2 = "//";
	public static final String NEW_LINE = "\n";
	public static final String TYPE3 = "<!---->";
	public static final String TYPE3_START = "<!--";
	public static final String TYPE3_END = "-->";
	
	public String type;

	public AsCodeComment() {
		super(new Position(), new Position());
	}

	public boolean isValid() {
		if (start == null || end== null)
			return false;
		if (type == TYPE1 || type == TYPE3) {
			if (start.line == end.line)
				return start.line > -1 && start.col + Math.ceil(type.length()/2) <= end.col;
			else
				return start.line > -1 && start.line < end.line;
		} else {
			return start.line == end.line && start.line > -1 && start.col <= end.col;
		}
	}

	public boolean isCommentedCodeAt(Position p) {
		if (!isValid())
			return false;
		if (type == TYPE1 || type == TYPE3) {
			if (start.line == end.line)
				return p.line == start.line && p.col >= start.col && p.col <= end.col;
			else
				return p.line >= start.line && p.line <= end.line;
		} else {
			return p.line == start.line && p.col >= start.col && p.col <= end.col;
		}
	}	
}
