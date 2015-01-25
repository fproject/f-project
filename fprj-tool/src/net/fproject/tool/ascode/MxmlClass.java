package net.fproject.tool.ascode;

import java.util.List;

public class MxmlClass extends ActionScriptElement {
	public static final String CLASS = "class";
	public static final String INTERFACE = "interface";
	public String packageName;
	public ActionScriptMethod constructor;
	public boolean isMxmlScript;
	
	public MxmlClass(AsCodeLines sourceLines, Position start, Position end) {
		super(sourceLines, start, end);
	}

	public ActionScriptFile getActionScriptFile() {
		return (ActionScriptFile) parent;
	}

	@Override
	protected Position getNextChildKeyWordPos(Position lastKeyPos) {
		return null;
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		return null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		return null;
	}
	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return null;
	}
	
	@Override
	protected int getCommentLinesCount() {
		Position p = new Position(0, 0);
		int count = 0;
		while (p != null) {
			if (p.line >= sourceLines.size())
				break;

			AsCodeComment acc = new AsCodeComment();

			acc.type = AsCodeComment.TYPE3;

			acc.start = ownsPosition(p)? getPositionOf(AsCodeComment.TYPE3_START, p,
					AsCodeComment.TYPE3_END) : null;

			if (acc.start != null) {
				acc.end = getPositionOf(AsCodeComment.TYPE3_END, acc.start,
						AsCodeComment.TYPE3_START);

				if (acc.isValid()) {
					int blankCnt = 0;
					for (int i = acc.start.line; i <= acc.end.line; i++) {
						if ("".equals(trimEx(sourceLines.get(i))))
							blankCnt++;
					}
					count += acc.end.line - acc.start.line + 1 - blankCnt;
					if (!trimEx(sourceLines.get(acc.start.line)).startsWith(
							AsCodeComment.TYPE3_START))
						count--;
					if (!trimEx(sourceLines.get(acc.end.line)).endsWith(
							AsCodeComment.TYPE3_END)
							&& acc.start.line != acc.end.line)
						count--;
					p = acc.end.add(sourceLines, 1);
					continue;
				}
			}
			else
				break;

			p.line = p.line + 1;
			p.col = 0;
		}

		return count;
	}
}
