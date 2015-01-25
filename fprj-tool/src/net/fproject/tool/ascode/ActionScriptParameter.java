package net.fproject.tool.ascode;

import java.util.ArrayList;
import java.util.List;

import net.fproject.tool.flexunit.FlexUnitTestCase;
import net.fproject.tool.flexunit.HierachicalCaseInput;

public class ActionScriptParameter extends ActionScriptElement {

	public ActionScriptParameter() {
		super(null, null, null);
	}

	public String type;
	public String defaultValue;

	public ActionScriptClass typeClass;

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		return null;
	}

	@Override
	protected Position getNextChildKeyWordPos(Position lastKeyPos) {
		return null;
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		return null;
	}

	public void parse(String s, ActionScriptMethod parent) {
		this.sourceLines = parent.sourceLines;
		this.parent = parent;
		s = trimEx(s);

		int i = s.indexOf(":");
		if (i == -1) {
			this.name = s;
			this.type = "Object";
		}
		else
		{
			this.name = trimEx(s.substring(0, i));
			if (!this.name.matches(VARIABLE_NAME_REGEX)) {
				throw new IllegalArgumentException("Invalid parameter name: "
						+ name);
			}

			int j = s.indexOf("=", i + 1);
			if (j > -1) {
				this.type = trimEx(s.substring(i + 1, j));
				this.defaultValue = trimEx(s.substring(j + 1));
			} else
				this.type = trimEx(s.substring(i + 1));

			if (!"*".equals(this.type) && !this.type.matches(TYPE_NAME_REGEX)
					&& !this.type.matches(TYPE_NAME_REGEX2)) {
				throw new IllegalArgumentException("Invalid parameter type: "
						+ this.type);
			}
		}

		this.scope = new ActionScriptScope(this);
		this.scope.name = "local";

		addToSourceLines();
	}

	public String toString() {
		return name + ":" + type
				+ (this.defaultValue != null ? "=" + this.defaultValue : "");
	}

	public boolean isNumericType() {
		if ("int".equals(type) || "uint".equals(type) || "Number".equals(type))
			return true;
		else
			return false;
	}

	public boolean isBuiltinType() {
		if ("int".equals(type) || "uint".equals(type) || "Number".equals(type)
				|| "String".equals(type)|| "Boolean".equals(type)
				|| "Object".equals(type)|| "Function".equals(type))
			return true;
		else
			return false;
	}
	
	public boolean isStringType() {
		return "String".equals(type);
	}

	public boolean isObjectType() {
		return !isStringType() && !isNumericType();
	}

	public List<String> getDefaultBoundaryValues() {
		List<String> values = new ArrayList<String>();
		if (isNumericType()) {
			values.add("NaN");
			if ("Number".equals(this.type) || "int".equals(this.type)
					|| "uint".equals(this.type)) {
				values.add(this.type + ".MIN_VALUE");
				values.add(this.type + ".MAX_VALUE");
			}
			if ("Number".equals(this.type)) {
				values.add(this.type + ".NEGATIVE_INFINITY");
				values.add(this.type + ".POSITIVE_INFINITY");
			}
		} else if ("Boolean".equals(type)) {
			//Boolean type has no normal value	
		} else if (isObjectType()) {
			values.add("null");
			if ("Array".equals(this.type)) {
				values.add("[]");
			} else if ("String".equals(type)) {
				values.add("\"\"");			
			} else if ("ArrayCollection".equals(this.type)) {
				values.add("new " + this.type + "([])");
			}

		} else if (isStringType()) {
			values.add("null");
			values.add("\"\"");
		} else
			values.add("undefined");
		return values;
	}

	public List<String> getDefaultNormalValues() {
		List<String> values = new ArrayList<String>();
		if (isNumericType()) {
			if ("uint".equals(this.type))
				values.add("1");
			else
				values.add("0");
		} else if ("Boolean".equals(type)) {
			values.add("true");
			values.add("false");			
		} else if ("Function".equals(type)) {
			values.add("function():void{}");
		} else if (isObjectType()) {
			if ("Array".equals(this.type)) {
				values.add("[new Object()]");
			} else if ("ArrayCollection".equals(this.type)) {
				values.add("new " + this.type + "([new Object()])");
			} else
				values.add("new " + this.type + "()");
		} else if (isStringType())
			values.add("\"ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789\"");

		return values;
	}

	public List<HierachicalCaseInput> getParameterInputCases() {
		List<String> valueHash = new ArrayList<String>();
		List<HierachicalCaseInput> cases = new ArrayList<HierachicalCaseInput>();
		HierachicalCaseInput c;

		List<String> values = getDefaultBoundaryValues();
		for (String s : values) {
			if (-1 == valueHash.indexOf(s)) {
				c = new HierachicalCaseInput(this,
						FlexUnitTestCase.CASE_BOUNDARY, s);
				cases.add(c);
				valueHash.add(s);
			}
		}

		if (this.defaultValue != null
				&& -1 == valueHash.indexOf(this.defaultValue)) {
			c = new HierachicalCaseInput(this, FlexUnitTestCase.CASE_BOUNDARY,
					this.defaultValue);
			cases.add(c);
			valueHash.add(this.defaultValue);
		}

		values = getDefaultNormalValues();
		for (String s : values) {
			if (-1 == valueHash.indexOf(s)) {
				c = new HierachicalCaseInput(this,
						FlexUnitTestCase.CASE_NORMAL, s);
				cases.add(c);
				valueHash.add(s);
			}
		}

		values = getUserDefinedBoundaryValues();
		for (String s : values) {
			if (-1 == valueHash.indexOf(s)) {
				c = new HierachicalCaseInput(this,
						FlexUnitTestCase.CASE_BOUNDARY, s);
				cases.add(c);
				valueHash.add(s);
			}
		}

		values = getUserDefinedNormalValues();
		for (String s : values) {
			if (-1 == valueHash.indexOf(s)) {
				c = new HierachicalCaseInput(this,
						FlexUnitTestCase.CASE_NORMAL, s);
				cases.add(c);
				valueHash.add(s);
			}
		}

		return cases;
	}

	public List<String> getUserDefinedBoundaryValues() {
		List<String> values = new ArrayList<String>();
		// Some code here!!!
		return values;
	}

	public List<String> getUserDefinedNormalValues() {
		List<String> values = new ArrayList<String>();
		// Some code here!!!
		return values;
	}

	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return null;
	}
}
