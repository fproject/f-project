package net.fproject.tool.ascode;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


public class ActionScriptClass extends ActionScriptElement {
	public static final String CLASS = "class";
	public static final String INTERFACE = "interface";
	public String packageName;
	public String type = CLASS;
	public List<ActionScriptMethod> methods = new ArrayList<ActionScriptMethod>();
	public String importLines;
	public ActionScriptMethod constructor;
	public boolean isMxmlScript;
	
	public ActionScriptClass(AsCodeLines sourceLines, Position start, Position end) {
		super(sourceLines, start, end);
	}
	
	public int countMethodByScope(String scope)
	{
		int count=0;
		for (ActionScriptMethod m:methods)
		{
			if(scope.equals(m.scope.name))
			{
				count++;
			}				
		}		
		return count;
	}
	public String getTypeRegex() {
		if (type == CLASS)
			return CLASS_REGEX;
		else if (type == INTERFACE)
			return INTERFACE_REGEX;
		else
			return null;
	}

	public ActionScriptFile getActionScriptFile() {
		return (ActionScriptFile) parent;
	}

	@Override
	public void parse(ActionScriptElement parent) {
		methods = new ArrayList<ActionScriptMethod>();
		this.parent = parent;

		if(isMxmlScript)
		{
			this.scope = ActionScriptScope.createPublicScope(this);
			super.parse(parent);
			return;
		}
		
		if (this.type != null) {
			keyWordPos = getPositionOfWord(type, Pattern
					.compile(getTypeRegex()), null);
		} else {
			keyWordPos = getPositionOfWord(CLASS, Pattern.compile(CLASS_REGEX),
					null);
			if (keyWordPos == null) {
				keyWordPos = getPositionOfWord(INTERFACE, Pattern
						.compile(INTERFACE_REGEX), null);
				if (keyWordPos != null)
					this.type = INTERFACE;
			} else
				this.type = CLASS;
		}

		if (keyWordPos == null)
			throw new IllegalArgumentException("Invalid class declaraion: "
					+ sourceLines.toString());

		Position nextPos = keyWordPos
				.add(sourceLines, this.type.length());
		Position bracePos = getPositionOf("{", nextPos, null);
		if (bracePos == null)
			throw new IllegalArgumentException("Invalid class declaraion: "
					+ sourceLines.toString());

		
		String className = trimEx(subString(nextPos, bracePos));
		if (!className.matches(VARIABLE_NAME_REGEX)) {
			int i = className.indexOf(" ");
			if (i == -1)
				i = className.indexOf("\t");
			if (i > -1)
				className = trimEx(className.substring(0, i));
			if (!className.matches(VARIABLE_NAME_REGEX))
				throw new IllegalArgumentException("Invalid class name: "
						+ className);
		}
		this.name = className;
		
		this.scope = new ActionScriptScope(this);
		this.scope.parse(this);
		super.parse(parent);
	}

	@Override
	protected Position getNextChildKeyWordPos(Position lastKeyPos) {
		Position p;
		if (lastKeyPos == null)
			p = null;
		else
			p = lastKeyPos.add(sourceLines, ActionScriptMethod.FUNCTION.length());
		if(p == null || ownsPosition(p))
			p = getPositionOfWord(ActionScriptMethod.FUNCTION, Pattern.compile(FUNCTION_REGEX), p);
		return ownsPosition(p) ? p : null;
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		ActionScriptMethod m = new ActionScriptMethod(sourceLines, childBlock.start, childBlock.end);
		try {
			m.parse(this);
			this.methods.add(m);
			if (m.isConstructor())
				this.constructor = m;
			return m;
		} catch (IllegalArgumentException iae) {
			iae.printStackTrace();
		}
		return null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		Position p;
		if (childKeyWordPos == null) {
			p = getPositionOf(Pattern.compile(FUNCTION_REGEX), null);
		} else {
			p = getLastPositionOf(Pattern.compile(FUNCTION_REGEX),
					childKeyWordPos);
		}
		if (p != null) {
			int i = sourceLines.get(p.line).indexOf(ActionScriptMethod.FUNCTION);
			if (i == -1 || i > p.col)
				p.col = 0;
		}
		return p;
	}
	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return this.methods;
	}
}
