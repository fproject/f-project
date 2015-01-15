package net.fproject.tool.flexunit;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import net.fproject.tool.ascode.ActionScriptMethod;
import net.fproject.tool.ascode.ActionScriptParameter;
import net.fproject.tool.spring.Helper;

public class FlexUnitClass extends FlexUnitFile {
	public ActionScriptMethod actionScriptMethod;
	public int count;

	public FlexUnitClass(ActionScriptMethod m) {
		actionScriptMethod = m;
		this.name = m.parent.name + "_" + actionScriptMethod.getFlexUnitName();
		this.packageName = actionScriptMethod.getActionScriptClass().packageName;
		String script = "package " + this.packageName
				+ "\r\n{\r\n"
				+ "\timport org.flexunit.Assert;\r\n"
				+ "\timport org.flexunit.asserts.assertEquals;\r\n"
				+ "\timport org.flexunit.asserts.assertFalse;\r\n"
				+ (actionScriptMethod.getActionScriptClass().importLines != null? "\t"
				+ actionScriptMethod.getActionScriptClass().importLines : "")
				+ "\r\n\t/**\r\n\t * FlexUnit test case class for method<br/>\r\n\t * <code>"
				+ getProrotype() + "</code><br/>\r\n\t * of class<br/>\r\n\t * "
				+ actionScriptMethod.getActionScriptClass().packageName + "." + actionScriptMethod.getActionScriptClass().name
				+ "\r\n\t */\r\n\tpublic class " + this.name + "\r\n\t{\r\n"
				+ (actionScriptMethod.isConstructor() || 
						actionScriptMethod.isStatic() ? "" : "\t\tprivate var " + Helper
										.convertToCamelName(actionScriptMethod.parent.name)
										+ ":" + actionScriptMethod.parent.name + ";\r\n\r\n")
				+ "\t\t[Before]\r\n"
				+ "\t\tpublic function runBeforeEveryTest():void\r\n\t\t{\r\n\t\t"
				+ (actionScriptMethod.isConstructor() || actionScriptMethod.isStatic() ? "" : "\t" + Helper
						.convertToCamelName(actionScriptMethod.parent.name)
						+ " = new " + actionScriptMethod.parent.name + "();\r\n\t\t")
				+ "\t//Your test data initialization\r\n\t\t}\r\n\r\n"
				+ "\t\t[After]\r\n"
				+ "\t\tpublic function runAfterEveryTest():void\r\n\t\t{\r\n\t\t"
				+ (actionScriptMethod.isConstructor()
						|| actionScriptMethod.isStatic() ? "" : "\t" + Helper
						.convertToCamelName(actionScriptMethod.parent.name) + " = null;\r\n\t\t")
				+ "\t//Your test data cleaning\r\n\t\t}\r\n";
		script += getTestCasesScript("\t\t");
		this.content = script + "\r\n\t}\r\n}";
	}

	private String getTestCasesScript(String pading) {
		String script = "";
		HierachicalCaseInput root = new HierachicalCaseInput(null, null, null);

		for (int i = actionScriptMethod.parameters.size() - 1; i > -1; i--) {
			ActionScriptParameter p = actionScriptMethod.parameters.get(i);
			addParameterToHierachicalCases(root, p);
		}
		count = 0;

		Stack<HierachicalCaseInput> stack = new Stack<HierachicalCaseInput>();
		stack.push(root);
		HierachicalCaseInput currentItem;
		while (!stack.empty()) {
			currentItem = stack.pop();
			if (currentItem.isLeaf()) {
				count++;
				FlexUnitTestCase futc = new FlexUnitTestCase(
						actionScriptMethod, getTestCaseId(count), currentItem,
						null, null, null);
				script += "\r\n" + pading + futc.getTestCaseScript("\t" + pading).replace("\r\n", "\r\n" + pading) + "\r\n";
			} else
				for (HierachicalCaseInput c : currentItem.children) {
					stack.push(c);
				}
		}

		List<HierachicalCaseInput> caseInputs;
		for (String s : actionScriptMethod.throwTypes) {
			caseInputs = new ArrayList<HierachicalCaseInput>();
			for (ActionScriptParameter p : actionScriptMethod.parameters) {
				HierachicalCaseInput input = new HierachicalCaseInput(p,
						FlexUnitTestCase.CASE_BOUNDARY, p
								.getDefaultNormalValues().get(0));
				caseInputs.add(input);
			}
			count++;
			FlexUnitTestCase futc = new FlexUnitTestCase(actionScriptMethod,
					getTestCaseId(count), caseInputs, null, null, s);
			script += "\r\n" + pading + futc.getTestCaseScript("\t" + pading).replace("\r\n", "\r\n" + pading) + "\r\n";
		}
		return script;
	}

	private String getTestCaseId(int count) {
		NumberFormat formatter = new DecimalFormat("000");
		return formatter.format(count);
	}

	private void addParameterToHierachicalCases(HierachicalCaseInput root,
			ActionScriptParameter p) {
		Stack<HierachicalCaseInput> stack = new Stack<HierachicalCaseInput>();
		stack.push(root);
		HierachicalCaseInput currentItem;
		while (!stack.empty()) {
			currentItem = stack.pop();
			if (currentItem.isLeaf()) {
				List<HierachicalCaseInput> cases = p.getParameterInputCases();
				for (HierachicalCaseInput c : cases) {
					currentItem.addChild(c);
				}
			} else
				for (HierachicalCaseInput c : currentItem.children) {
					stack.push(c);
				}
		}
	}

	private String getProrotype() {
		String s = actionScriptMethod.scope.name;
		if (actionScriptMethod.isStatic())
			s += " static";
		s += " function ";
		if (actionScriptMethod.isGetter())
			s += "get ";
		if (actionScriptMethod.isSetter())
			s += "set ";
		s += actionScriptMethod.name + "(";
		for (ActionScriptParameter p : actionScriptMethod.parameters) {
			s += p.name + ":" + p.type
					+ (p.defaultValue != null ? " = " + p.defaultValue : "")
					+ ", ";
		}
		if (s.endsWith(", "))
			s = s.substring(0, s.length() - 2);
		s += ")";
		if (!actionScriptMethod.isConstructor())
			s += ":" + actionScriptMethod.returnType;
		return s;
	}
}
