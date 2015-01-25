package net.fproject.tool.flexunit;

import java.util.ArrayList;
import java.util.List;

import net.fproject.tool.ascode.ActionScriptClass;
import net.fproject.tool.ascode.ActionScriptMethod;
import net.fproject.tool.spring.Helper;

public class FlexUnitTestSuite extends FlexUnitFile {
	List<FlexUnitClass> flexUnitClasses;

	public int countTestCasesByScope(String scope) {
		//TODO not implemented for scope
		int count = 0;
		for (FlexUnitClass c : flexUnitClasses) {
			count += c.count;
		}
		return count;
	}

	public FlexUnitTestSuite(ActionScriptClass asClass) {
		flexUnitClasses = new ArrayList<FlexUnitClass>();
		this.name = asClass.name + "_TestSuite";
		this.packageName = asClass.packageName;
		for (ActionScriptMethod m : asClass.methods) {
			if (m.scope.isPublic() || m.scope.isInternal())
				flexUnitClasses.add(new FlexUnitClass(m));
		}
		this.content = getContent(asClass);
	}

	private String getContent(ActionScriptClass asClass) {
		String s = "package "
				+ this.packageName
				+ "\r\n{\r\n\t[Suite]\r\n\t[RunWith(\"org.flexunit.runners.Suite\")]\r\n"
				+ "\tpublic class " + this.name + "\r\n\t{\r\n";
		for (FlexUnitClass c : flexUnitClasses) {
			s += "\t\tpublic var " + Helper.convertToCamelName(c.name) + ":"
					+ c.name + ";\r\n";
		}
		return s + "\t}\r\n}";
	}

	public void writeFile(String rootFolder) {
		super.writeFile(rootFolder);
		for (FlexUnitClass c : flexUnitClasses) {
			c.writeFile(rootFolder);
		}
	}
}
