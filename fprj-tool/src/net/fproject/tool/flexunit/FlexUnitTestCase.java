package net.fproject.tool.flexunit;

import java.util.ArrayList;
import java.util.List;

import net.fproject.tool.ascode.ActionScriptMethod;
import net.fproject.tool.spring.Helper;

public class FlexUnitTestCase {
	ActionScriptMethod method;
	List<HierachicalCaseInput> caseInputs;
	public String testCaseId = "000";
	public String description;
	public String issueId;
	public String expected;
	public String type;
	public static final String CASE_NORMAL = "Normal";
	public static final String CASE_BOUNDARY = "Boundary";
	public static final String CASE_EXCEPTION = "Exception";

	public FlexUnitTestCase(ActionScriptMethod method, String testCaseId,
			HierachicalCaseInput leaf, String description, String issueId,
			String expected) {
		this.testCaseId = testCaseId;
		this.description = description;
		this.issueId = issueId;
		this.expected = expected;
		this.method = method;
		this.caseInputs = new ArrayList<HierachicalCaseInput>();
		while (!leaf.isRoot()) {
			this.caseInputs.add(leaf);
			leaf = leaf.parent;
		}

	}

	public FlexUnitTestCase(ActionScriptMethod method, String testCaseId,
			List<HierachicalCaseInput> caseInputs, String description,
			String issueId, String expected) {
		this.testCaseId = testCaseId;
		this.description = description;
		this.issueId = issueId;
		this.expected = expected;
		this.method = method;
		this.caseInputs = caseInputs;
	}

	public String getType() {
		if (this.type != null)
			return this.type;
		int caseType = 0;// 0:Normal,1:Boundary;2:Exception
		for (HierachicalCaseInput hci : caseInputs) {
			if (CASE_EXCEPTION.equals(hci.caseType)) {
				caseType = 2;
				break;
			}
			if (CASE_BOUNDARY.equals(hci.caseType))
				caseType = 1;
		}
		return caseType == 0 ? CASE_NORMAL : (caseType == 1 ? CASE_BOUNDARY
				: CASE_EXCEPTION);
	}

	public String getDescriptionScript() {
		if (this.description != null)
			return this.description;
		int caseType = 0;// 0:Normal,1:Boundary;2:Exception
		String s = "";
		for (HierachicalCaseInput hci : caseInputs) {
			s += hci.parameter.name + " = " + hci.inputValue.replace("\"", "'")
					+ ", ";
			if (CASE_EXCEPTION.equals(hci.caseType)) {
				caseType = 2;
			}
			if (caseType != 2 && CASE_BOUNDARY.equals(hci.caseType))
				caseType = 1;
		}
		if (s.length() > 2)
			s = s.substring(0, s.length() - 2);
		return (caseType == 0 ? CASE_NORMAL : (caseType == 1 ? CASE_BOUNDARY
				: CASE_EXCEPTION))
				+ " case: [" + s + "]";
	}

	private String getInputConditionsASDoc() {
		String s = "";
		for (HierachicalCaseInput hci : caseInputs) {
			s += "\r\n* <code>" + hci.parameter.name + " = " + hci.inputValue
					+ "</code><br/>";
		}
		return s;
	}

	private String getMethodInvocationScript() {
		String s = "";
		for (HierachicalCaseInput hci : caseInputs) {
			s += "var " + hci.parameter.name + ":" + hci.parameter.type + " = "
					+ hci.inputValue + ";\r\n";
		}

		if (!"void".equals(method.returnType))
			s += "var returnTestValue:" + method.returnType + " = ";
		if (method.isConstructor())
			s += "new ";
		else {
			if (method.isStatic())
				s += method.parent.name + ".";
			else
				s += Helper.convertToCamelName(method.parent.name) + ".";
		}
		s += method.name;
		if (method.isSetter()) {
			s += " = " + caseInputs.get(0).inputValue + ";";
		} else if (method.isGetter()) {
			s += ";";
		} else {
			s += "(";
			for (HierachicalCaseInput hci : caseInputs) {
				s += hci.parameter.name + ", ";
			}
			if (s.endsWith(", "))
				s = s.substring(0, s.length() - 2);
			s += ");";
		}
		return s;
	}

	public String getTestCaseScript(String padding) {
		String s = "[Test (description=\"" + getDescriptionScript() + "\"";
		if (issueId != null)
			s += ", issueID=\"" + issueId.replace("\"", "'") + "\"";
		if (expected != null)
			s += ", expected=\"" + expected.replace("\"", "'") + "\"";
		s += ")]\r\n";
		s += "/**\r\n * Test Case Type: " + getType();
		if (issueId != null)
			s += "<br/>\r\n * Fixed bug for Defect No." + issueId + ".";
		s += "<br/>\r\n * <br/>\r\n * INPUT VALUES:<br/>";
		s += getInputConditionsASDoc().replace("\r\n", "\r\n ")
				+ "\r\n * <br/>\r\n * OUTPUT EXPECTED:<br/>\r\n"
				+ " * ---- expectations ----\r\n *\r\n */\r\n";
		s += "public function testCase" + testCaseId + "():void\r\n{\r\n\t";
		s += getMethodInvocationScript().replace("\r\n", "\r\n\t")
				+ "\r\n\t//---- Place result assertion here ----";
		s += "\r\n\t// You must replace this code by function specifications or "
				+ "\r\n\t// the test always returns false!";
		s += "\r\n\tassertFalse(true);";
		s += "\r\n\t//-------------------------------------";
		return s + "\r\n}";
	}
}
