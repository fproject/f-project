package net.fproject.tool.ascode;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Stack;

public class FlexCodeCounter {
	public static void main(String[] args) {
		 countFlexCode("F:/GitRepo/pk/pk-myhome/src",
				 "F:/GoogleDrive/F-PROJECT/FlexCodeCounterReport_PK-MyHome.csv");
	}

	public static void countFlexCode(String srcFolderPath, String destFolderPath) {
		FileWriter fwriter;
		BufferedWriter out = null;
		try {
			if(destFolderPath != null)
			{
				fwriter = new FileWriter(destFolderPath);
				out = new BufferedWriter(fwriter);
				out.write("Source file,Package,Total lines,Comment lines,Blank lines,Code lines,Classes,Methods\r\n");
			}
			
			Stack<String> stack = new Stack<String>();
			stack.push(srcFolderPath);
			while (!stack.empty()) {
				String currentPath = stack.pop();
				File curFile = new File(currentPath);

				File[] files = curFile.listFiles();

				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile() && !files[i].isHidden()) {
						String curAsFile = files[i].getAbsolutePath();
						if (curAsFile.toLowerCase().endsWith(".as")
								||curAsFile.toLowerCase().endsWith(".mxml")) {
							System.out.println("Source file: " + curAsFile);
							
							ActionScriptElement srcFile = 
									curAsFile.toLowerCase().endsWith(".as")? 
											ActionScriptFile.load(curAsFile):
												MxmlFile.load(curAsFile);
							System.out
									.println("Package: " + ((AsSourceFile)srcFile).getPackageName());
							int blankCount = srcFile.getBlankLinesCount();
							int commentCount = srcFile.getCommentLinesCount();
							int classesCount = ((AsSourceFile)srcFile).getClassesCount();
							int methodsCount = ((AsSourceFile)srcFile).getMethodsCount();
							System.out.println("Total lines: "
									+ srcFile.sourceLines.size());
							System.out
									.println("Comment lines: " + commentCount);
							System.out.println("Blank lines: " + blankCount);
							System.out.println("Code lines: "
									+ (srcFile.sourceLines.size()
											- blankCount - commentCount));
							if(destFolderPath != null)
								out.write(srcFile.name
										+ ","
										+ ((AsSourceFile)srcFile).getPackageName()
										+ ","
										+ srcFile.sourceLines.size()
										+ ","
										+ commentCount
										+ ","
										+ blankCount
										+ ","
										+ (srcFile.sourceLines.size()
												- blankCount - commentCount)
												+ ","
												+ classesCount
												+ ","
												+ methodsCount
												+ "\r\n");
						}
					} else if (files[i].isDirectory() && !files[i].isHidden()) {
						stack.push(files[i].getAbsolutePath());
					}
				}
			}

			if(destFolderPath != null)
				out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}