package net.fproject.tool.ascode;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


public class ActionScriptMethod extends ActionScriptElement implements AsCodeBody {

	public ActionScriptMethod(AsCodeLines sourceLines, Position start,
			Position end) {
		super(sourceLines, start, end);
	}

	public static final String FUNCTION = "function";
	public static final String CONSTRUCTOR= "constructor";
	public static final String PARAMETER_END_REGEX = "\\)( |\\t)*(:|\\{|;|$)";
	public static final String THROW_REGEX = "(^| |\\t)+throw($| |\\t)+";
	public static final String CATCH_REGEX = "(^| |\\t)+catch($| |\\t)*\\(";
	public String returnType = null;
	public List<String> throwTypes = new ArrayList<String>();
	public List<ActionScriptParameter> parameters = new ArrayList<ActionScriptParameter>();
	public String type;

	private boolean bStatic = false;

	public boolean isGetter() {
		return "get".equals(type);
	}

	public boolean isSetter() {
		return "set".equals(type);
	}

	public boolean isConstructor() {
		return "constructor".equals(type);
	}

	public boolean isStatic() {
		return bStatic;
	}

	public ActionScriptClass getActionScriptClass() {
		return (ActionScriptClass) parent;
	}

	@Override
	public void parse(ActionScriptElement parent) {
		parameters = new ArrayList<ActionScriptParameter>();
		this.parent = parent;

		keyWordPos = getPositionOfWord(FUNCTION, Pattern
				.compile(FUNCTION_REGEX), start);
		Position nextPos = keyWordPos.add(sourceLines, FUNCTION.length());
		Position leftBracePos = getPositionOf("(", nextPos, null);

		// Parse method name
		String functionName = trimEx(subString(nextPos, leftBracePos));
		if (functionName.startsWith("get ") || functionName.startsWith("set ")) {
			this.type = functionName.substring(0, 3);
			functionName = trimEx(functionName.substring(3));
		}
		if (!functionName.matches(VARIABLE_NAME_REGEX)) {
			throw new IllegalArgumentException("Invalid method name: "
					+ functionName);
		}
		this.name = functionName;
		if (functionName.equals(parent.name)) {
			this.type = CONSTRUCTOR;
			this.returnType = this.name;
		}
		if (this.type == null)
			this.type = FUNCTION;

		int count = 0;
		AsCodeBlockBase acp = hitPreviousWord(keyWordPos);
		while (ownsSubBlock(acp) && count < 4) {
			String word = trimEx(subString(acp.start, acp.end));
			count++;
			if ("static".equals(word)) {
				this.bStatic = true;
				break;
			}
			acp = hitPreviousWord(acp.start);
		}

		this.scope = new ActionScriptScope(this);

		this.scope.parse(this);

		// Parse method parameters
		Position rightBracePos = getPositionOf(Pattern
				.compile(PARAMETER_END_REGEX), leftBracePos);
		if (rightBracePos == null) {
			throw new IllegalArgumentException("Invalid method declaration: "
					+ sourceLines.toString());
		}
		//if (this.returnType == null) {
			bodyStart = this.getActionScriptClass().type == ActionScriptClass.CLASS ?
					getPositionOf("{", rightBracePos) : null;

			if (bodyStart == null) {
				acp = hitNextWord(rightBracePos);
				if (ownsSubBlock(acp)) {
					String word = subString(acp.start, acp.end).replaceAll(
							"\\{|\\}|\\(|\\)", " ")
							+ " ";
					int i = word.indexOf(":");
					int j = -1;
					if (i > -1)
						j = word.indexOf(" ", i);
					if (i < j)
						this.returnType = trimEx(word.substring(i + 1, j));
				}
				if (this.returnType == null)
					this.returnType = "Object";
			} else {
				if (this.returnType == null) {
					String sreturn = subString(rightBracePos.add(sourceLines,
							1), bodyStart);
					int i = sreturn.indexOf(":");
					if (i > -1) {
						this.returnType = trimEx(sreturn.substring(i + 1));
					}
				}
				bodyEnd = getEndOfBlock(bodyStart, "{", "}");
				if (bodyEnd == null)
				{
					bodyStart = null;
					System.out.println("Invalid Method Body: " + this.name);
				}
				else
					end = bodyEnd.clone();
			}
		//}
		String paramStr = trimEx(subString(leftBracePos.add(sourceLines,
				1), rightBracePos));
		if (paramStr.length() > 0) {
			String[] params = paramStr.split(",");

			for (String s : params) {
				ActionScriptParameter asp = new ActionScriptParameter();
				asp.parse(s, this);
				this.parameters.add(asp);
			}
		}

		nextPos = getPositionOfWord("throw", Pattern.compile(THROW_REGEX),
				rightBracePos);
		if (nextPos != null) {
			acp = hitNextWord(nextPos.add(sourceLines, 5));
			if (ownsSubBlock(acp)) {
				String word = trimEx(subString(acp.start, acp.end));
				if (!"new".equals(word)) {
					do {
						leftBracePos = getPositionOfWord("(", Pattern
								.compile(CATCH_REGEX), rightBracePos);
						if (leftBracePos != null) {
							nextPos = getPositionOf(":", leftBracePos);
							if (nextPos == null)
								break;
							String catchVar = trimEx(subString(leftBracePos
									.add(sourceLines, 1), nextPos));
							if (catchVar.equals(word)) {
								rightBracePos = getPositionOf(")", nextPos);
								word = trimEx(subString(nextPos.add(
										sourceLines, 1), rightBracePos));
								if (word.matches(PARAMETER_END_REGEX)) {
									throwTypes.add(word);
								}
								break;
							} else
								rightBracePos = nextPos;

						}
					} while (leftBracePos != null);
				} else {
					acp = hitNextWord(acp.end);
					if (ownsSubBlock(acp)) {
						word = trimEx(subString(acp.start, acp.end));
						int i = word.indexOf("(");
						if (i > -1)
							word = trimEx(word.substring(0, i));
						if (word.matches(PARAMETER_END_REGEX))
							throwTypes.add(word);
					}

				}
			}
		}
		
		addToSourceLines();
	}

	@Override
	protected Position getNextChildKeyWordPos(Position fromPos) {
		// Do nothing
		return null;
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		// Do nothing
		return null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		return null;
	}

	public String getFlexUnitName() {
		if (isGetter())
			return "get_" + this.name;
		else if (isSetter())
			return "set_" + this.name;
		else
			return this.name;
	}

	private Position bodyStart;
	@Override
	public Position getBodyStart() {
		return this.bodyStart;
	}

	private Position bodyEnd;
	@Override
	public Position getBodyEnd() {
		return this.bodyEnd;
	}

	@Override
	public String getBodyCode() {
		return subString(bodyStart, bodyEnd);
	}

	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return this.parameters;
	}
}
