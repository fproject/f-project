package net.fproject.tool.ascode;

import java.io.File;
import java.util.Stack;

public class FlexCodeInjector {
	public static void main(String[] args) {
		 injectAllSourceFiles("F:\\Workspace\\fprj-pert\\src");
	}

	public static void injectAllSourceFiles(String srcFolderPath) {
		Stack<String> stack = new Stack<String>();
		stack.push(srcFolderPath);
		while (!stack.empty()) {
			String currentPath = stack.pop();
			File curFile = new File(currentPath);

			File[] files = curFile.listFiles();

			for (int i = 0; i < files.length; i++) {
				if (files[i].isFile() && !files[i].isHidden()) {
					String curAsFile = files[i].getAbsolutePath();
					if (curAsFile.toLowerCase().endsWith("as")) {
						System.out.println("Source file: " + curAsFile);
						ActionScriptFile asFile = ActionScriptFile
								.load(curAsFile);
						AsCodeFileInjector injector = new AsCodeFileInjector(asFile);
						injector.injectCode();
						injector.save(null);
					}
				} else if (files[i].isDirectory() && !files[i].isHidden()) {
					stack.push(files[i].getAbsolutePath());
				}
			}
		}
	}
}