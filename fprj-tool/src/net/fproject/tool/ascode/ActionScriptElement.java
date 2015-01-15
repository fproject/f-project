package net.fproject.tool.ascode;

import java.util.List;

public abstract class ActionScriptElement extends AsCodeBlock{
	public String name;
	public ActionScriptScope scope;
	public ActionScriptElement parent;
	public Position keyWordPos;
	public static final String VARIABLE_NAME_REGEX = "^[a-zA-Z_][a-zA-Z0-9_]*$";
	public static final String PACKAGE_NAME_REGEX = "(^|( |\\n|\\r|\\t)*)package($| |\\n|\\r|\\t)*($|[a-zA-Z_][a-zA-Z0-9_\\.]*)";
	public static final String TYPE_NAME_REGEX = "^[a-zA-Z_][a-zA-Z0-9_]*((|[a-zA-Z_][a-zA-Z0-9_]*\\.)*[a-zA-Z_][a-zA-Z0-9_]*)$";
	public static final String TYPE_NAME_REGEX2 = "^Vector\\.<[a-zA-Z_][\\.<>a-zA-Z0-9_]*>$";
	public static final String IMPORT_REGEX = "^( |\\n|\\r|\\t)*import($| |\\n|\\r|\\t)*($|[a-zA-Z_][a-zA-Z0-9_\\.]*)";
	public static final String CLASS_REGEX = "(public|dynamic|internal|static|final)*( |\\n|\\r|\\t)+class( |\\n|\\r|\\t)+";
	public static final String INTERFACE_REGEX = "(public|internal|static)*( |\\n|\\r|\\t)+interface( |\\n|\\r|\\t)+";
	public static final String FUNCTION_REGEX = "(|[a-zA-Z_][a-zA-Z0-9_]*)( |\\n|\\r|\\t)+function( |\\n|\\r|\\t)+((get|set)( |\\n|\\r|\\t)+)*[a-zA-Z_][a-zA-Z0-9_]*( |\\n|\\r|\\t)*\\(";
	public static final String MEMBER_VARIABLE_REGEX = "((^|( |\\n|\\r|\\t)+)|[a-zA-Z_][a-zA-Z0-9_]*( |\\n|\\r|\\t)+)var( |\\n|\\r|\\t)+[a-zA-Z_][a-zA-Z0-9_]*( |\\n|\\r|\\t)*(|:( |\\n|\\r|\\t)*[a-zA-Z_][a-zA-Z0-9_]*)( |\\n|\\r|\\t)*;";

	public ActionScriptElement(AsCodeLines sourceLines, Position start,
			Position end) {
		super(sourceLines, start, end);
	}

	public ActionScriptElement(AsCodeLines sourceLines, int startLine, int startCol, int endLine, int endCol) {
		super(sourceLines, startLine, startCol, endLine, endCol);
	}
	
	public void parse(ActionScriptElement parent) {
		boolean failure = false;
		int count = 0;
		Position keyWordPos = getNextChildKeyWordPos(null);
		while (keyWordPos != null) {

			AsCodeComment acc = getCodeCommentAt(keyWordPos);
			if (acc != null) {
				keyWordPos = getNextChildKeyWordPos(acc.end);
				continue;
			}

			Position nextKeyWordPos = getNextChildKeyWordPos(keyWordPos);

			if (nextKeyWordPos != null) {
				acc = getCodeCommentAt(nextKeyWordPos);
				while (acc != null) {
					nextKeyWordPos = getNextChildKeyWordPos(acc.end);
					if (nextKeyWordPos == null)
						break;
					acc = getCodeCommentAt(nextKeyWordPos);
				}
			}
			Position childStartPos = getChildElementStartPos(keyWordPos);
			if (nextKeyWordPos != null) {
				keyWordPos = nextKeyWordPos;
			} else {
				nextKeyWordPos = end;
				keyWordPos = null;// This is the last loop
			}

			AsCodeBlockBase childBlock = new AsCodeBlockBase(childStartPos, nextKeyWordPos);
			if (ownsSubBlock(childBlock)) {
				ActionScriptElement elt = parseChild(childBlock);
				if (elt != null) {
					elt.start = childBlock.start;
					if (elt instanceof AsCodeBody && ((AsCodeBody) elt).getBodyEnd() != null)
						elt.end = ((AsCodeBody) elt).getBodyEnd().add(sourceLines, 1);
					else
						elt.end = childBlock.end.clone();
					count++;
				} else {
					failure = true;
				}
			}

		}

		if (failure && count == 0)
			throw new IllegalArgumentException(
					"Invalid Action Script file content: \r\n" + sourceLines.toString());
		
		addToSourceLines();
	}

	protected abstract ActionScriptElement parseChild(AsCodeBlockBase childBlock);

	protected abstract Position getNextChildKeyWordPos(Position lastKeyPos);

	protected abstract Position getChildElementStartPos(Position childKeyWordPos);

	protected abstract List<? extends ActionScriptElement> getAllChildren();
	
	/**
	 * Get the code AsCodeComment object represents a comment code piece at a
	 * source code position
	 * 
	 * @param p
	 *            the source code position interest
	 * @return The code AsCodeComment object at the source position.
	 * 			<code>null</code> if the position does not belong to any comment block.
	 */
	protected AsCodeComment getCodeCommentAt(Position p) {
		if (!ownsPosition(p))
			return null;

		AsCodeComment acc = new AsCodeComment();

		acc.type = AsCodeComment.TYPE1;

		acc.start = getLastPositionOf(AsCodeComment.TYPE1_START, p,
				AsCodeComment.TYPE1_END);

		if (acc.start != null) {
			acc.end = getPositionOf(AsCodeComment.TYPE1_END, acc.start,
					AsCodeComment.TYPE1_START);

			if (acc.isCommentedCodeAt(p)) {
				return acc;
			}
		}

		acc.type = AsCodeComment.TYPE2;
		acc.start = new Position();
		acc.start.col = sourceLines.get(p.line).lastIndexOf(AsCodeComment.TYPE2,
				p.col);
		if (acc.start.col > -1) {
			acc.end.col =  sourceLines.get(p.line).length();
			acc.end.line = acc.start.line = p.line;
		}

		if (acc.isCommentedCodeAt(p))
			return acc;
		else
			return null;
	}

	protected int getBlankLinesCount() {
		int count = 0;
		for (String s : this.sourceLines) {
			if ("".equals(trimEx(s)))
				count++;
		}
		return count;
	}

	protected int getCommentLinesCount() {
		Position p = new Position(start.line, start.col);
		int count = 0;
		while (p != null) {
			if (p.line >= sourceLines.size())
				break;

			AsCodeComment acc = new AsCodeComment();

			acc.type = AsCodeComment.TYPE1;

			acc.start = ownsPosition(p)? getPositionOf(AsCodeComment.TYPE1_START, p,
					AsCodeComment.TYPE1_END) : null;

			if (acc.start != null) {
				acc.end = getPositionOf(AsCodeComment.TYPE1_END, acc.start,
						AsCodeComment.TYPE1_START);

				if (acc.isValid()) {
					int blankCnt = 0;
					for (int i = acc.start.line; i <= acc.end.line; i++) {
						if ("".equals(trimEx(sourceLines.get(i))))
							blankCnt++;
					}
					count += acc.end.line - acc.start.line + 1 - blankCnt;
					if (!trimEx(sourceLines.get(acc.start.line)).startsWith(
							AsCodeComment.TYPE1_START))
						count--;
					if (!trimEx(sourceLines.get(acc.end.line)).endsWith(
							AsCodeComment.TYPE1_END)
							&& acc.start.line != acc.end.line)
						count--;
					p = acc.end.add(sourceLines, 1);
					continue;
				}
			}

			if (trimEx(sourceLines.get(p.line)).startsWith(AsCodeComment.TYPE2))
				count++;

			p.line = p.line + 1;
			p.col = 0;
		}

		return count;
	}

	/**
	 * Remove all code comment from a code string.
	 * 
	 * @param s
	 *            the source code string.
	 * @return the source code string with all code comment removed.
	 */
	protected String removeComment(String s) {
		return s.replaceAll("/\\*[^(/\\*)]*\\*/", "");
	}

	protected String trimEx(String s) {
		int j = s.length() - 1;
		while (j > -1
				&& (s.charAt(j) == ' ' || s.charAt(j) == '\r'
						|| s.charAt(j) == '\n' || s.charAt(j) == '\t')) {
			j--;
		}

		int i = 0;
		while (i < s.length()
				&& (s.charAt(i) == ' ' || s.charAt(i) == '\r'
						|| s.charAt(i) == '\n' || s.charAt(i) == '\t')) {
			i++;
		}

		if (i <= j)
			return removeComment(s.substring(i, j + 1));
		else
			return "";
	}
	
	protected Position getEndOfBlock(Position start, String startSign, String endSign) {
		Position end = getCodePositionOf(endSign, start);
		while (true)
		{
			if (end == null)
				break;
			if (checkBalancedBlock (start, end, startSign, endSign))
				break;
			
			end = getCodePositionOf(endSign, end.add(sourceLines, 1));
		}
		
		return end;
	}
	
	private boolean checkBalancedBlock(Position start, Position end, String startSign, String endSign)
	{
		int openCount = 0;
		int closeCount = 0;
		Position ps = start;
		Position pe = start;
		while (true)
		{
			if (ps != null)
			{
				ps = getCodePositionOf(startSign, ps);
				if (ps != null && !end.isBefore(ps))
				{
					openCount++;
					ps = ps.add(sourceLines, 1);
				}
				else
					ps = null;
			}
			if (pe != null)
			{
				pe = getCodePositionOf(endSign, pe);
				if (pe != null && !end.isBefore(pe))
				{
					closeCount++;
					pe = pe.add(sourceLines, 1);
				}
				else
					pe = null;
			}
			
			if (ps == null && pe == null)
				break;
		}
		
		return openCount == closeCount;
	}
	
	protected Position getCodePositionOf(String code, Position fromPos) {
		Position pos = getPositionOf(code, fromPos);
		while (pos != null)
		{
			AsCodeComment comment = getCodeCommentAt(pos);
			if (comment != null)
				pos = getPositionOf(code, comment.end);
			else
				break;
		}
		return pos;
	}
	
	protected void addToSourceLines() {
		if (sourceLines != null)
			sourceLines.addElement(this);
	}
}
