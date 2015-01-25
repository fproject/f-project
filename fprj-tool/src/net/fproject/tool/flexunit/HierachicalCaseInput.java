package net.fproject.tool.flexunit;

import java.util.ArrayList;
import java.util.List;

import net.fproject.tool.ascode.ActionScriptParameter;

public class HierachicalCaseInput {
	public List<HierachicalCaseInput> children = new ArrayList<HierachicalCaseInput>();
	public HierachicalCaseInput parent;

	public String caseType;
	public String inputValue;
	public String outputValue;
	public ActionScriptParameter parameter;

	public HierachicalCaseInput(ActionScriptParameter parameter,
			String caseType, String inputValue) {
		this.inputValue = inputValue;
		this.parameter = parameter;
		this.caseType = caseType;
	}

	public boolean isRoot() {
		return parent == null;
	}

	public boolean isLeaf() {
		return children.isEmpty();
	}

	public void addChild(HierachicalCaseInput child) {
		children.add(child);
		child.parent = this;
	}
}
