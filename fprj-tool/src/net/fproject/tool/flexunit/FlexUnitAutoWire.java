package net.fproject.tool.flexunit;

import java.io.File;
import java.util.Stack;

import net.fproject.tool.ascode.ActionScriptClass;
import net.fproject.tool.ascode.ActionScriptFile;
import net.fproject.tool.ascode.ActionScriptMethod;
import net.fproject.tool.ascode.ActionScriptParameter;

public class FlexUnitAutoWire {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// testAsFileLoadAndGeneratingScript();
		// autoWire("D:\\FI2\\WorkSpace\\fi2flex\\src",
		// "D:\\FI2\\Workspace\\fi2flex-test\\src");
		// autoWire("D:\\FI2\\WorkSpace\\fi2-client-ut\\fi2src",
		// "D:\\FI2\\WorkSpace\\fi2-client-ut\\src");
		// autoWire("D:\\FI2\\WorkSpace\\fi2flex\\src",
		//	"D:\\FI2\\WorkSpace\\fi2flex-test\\src");
		autoWire("F:/Tmp/unittestsrc",
		"F:/GitRepo/common/fprj-ut/src");
	}

	public static void autoWire(String srcFolderPath, String destFolderPath) {
		Stack<String> stack = new Stack<String>();
		stack.push(srcFolderPath);
		int suiteCount = 0;
		int testClassCount = 0;
		int methodCount = 0;
		int caseCount = 0;
		while (!stack.empty()) {
			String currentPath = stack.pop();
			File curFile = new File(currentPath);

			File[] files = curFile.listFiles();

			for (int i = 0; i < files.length; i++) {
				if (files[i].isFile() && !files[i].isHidden()) {
					String curAsFile = files[i].getAbsolutePath();
					if (curAsFile.toLowerCase().endsWith("as")) {
						System.out.print("Processing: " + curAsFile);
						int fileCaseCount = 0;
						int fileMethodCount = 0;
						ActionScriptFile asFile = ActionScriptFile
								.load(curAsFile);
						for (ActionScriptClass c : asFile.classes) {
							fileMethodCount += c
									.countMethodByScope("public")
									+ c.countMethodByScope("internal");

							suiteCount++;
							FlexUnitTestSuite testSuite = new FlexUnitTestSuite(
									c);
							testClassCount += testSuite.flexUnitClasses.size();
							fileCaseCount += testSuite
									.countTestCasesByScope(null);
							testSuite.writeFile(destFolderPath);
						}
						System.out.println("(" + fileMethodCount
								+ " exposed methods)");
						System.out.println("(" + fileCaseCount + " cases)");
						methodCount += fileMethodCount;
						caseCount += fileCaseCount;
					}
				} else if (files[i].isDirectory() && !files[i].isHidden()) {
					stack.push(files[i].getAbsolutePath());
				}
			}
		}
		System.out.println("Successfuly generated FlexUnit script for "
				+ suiteCount + " Test Suites, " + testClassCount
				+ " Test Classes, " + methodCount + " exposed methods, "
				+ caseCount + " Test Cases");
	}

	@SuppressWarnings("unused")
	private static void testAsFileLoadAndGeneratingScript() {
		ActionScriptFile asf = ActionScriptFile
				.load("C:\\TEMP\\TaskTimesheetDto.as");
		System.out.println(asf.classes.size() + " classes loaded");
		System.out.println("Package name: " + asf.packageName);

		for (ActionScriptClass c : asf.classes) {
			System.out.println("Class: " + c.name + ", type: " + c.type
					+ ", scope: " + c.scope);
			for (ActionScriptMethod m : c.methods) {
				System.out.print("Method: " + m.name + ", type: " + m.type
						+ ", return type: " + m.returnType + ", scope: "
						+ m.scope + ", parameters: (");
				for (ActionScriptParameter p : m.parameters) {
					System.out.print(p.toString() + ",");
				}
				System.out.println(")");
			}

			FlexUnitTestSuite testSuite = new FlexUnitTestSuite(c);
			testSuite.writeFile("C:\\TEMP");
		}
	}
}
