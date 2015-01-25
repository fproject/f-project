package net.fproject.tool.ascode;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FlexCodeReviewer {
	public static void main(String[] args) {
		reviewIfBlogType2("F:\\Workspace\\fprj-org\\src","F:/Tmp/FlexCodeReviewer.txt");
	}

	public static void reviewIfBlogType2(String srcFolderPath, String reportPath) {
		FileWriter reportWriter = null;
		try {
			reportWriter = new FileWriter(reportPath);
		
			// if \(.*\)\r\n[ \t]*\{\r\n[ \t]*\}
			String suspiciousBlockRegex = "\\r\\n[ \\t]*\\{\\r\\n.*\\r\\n[ \\t]*\\}";
			Pattern pattern = Pattern.compile(suspiciousBlockRegex);
			Stack<String> stack = new Stack<String>();
			stack.push(srcFolderPath);
			ActionScriptFile asFile = new ActionScriptFile();
			while (!stack.empty()) {
				String currentPath = stack.pop();
				File curFile = new File(currentPath);

				File[] files = curFile.listFiles();

				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile() && !files[i].isHidden()) {
						String curAsFile = files[i].getAbsolutePath();
						if (curAsFile.toLowerCase().endsWith("as")) {
							System.out.println("Source file: " + curAsFile);
							reportWriter.append("\r\nSource file: " + curAsFile);
							asFile.setPath(curAsFile);
							String allContent = asFile.getAllContent();
							Matcher matcher = pattern.matcher(allContent);
							while (matcher.find()) {
								/*
								 * if (i == fromPos.line) { if (matcher.start() >
								 * fromPos.col) break; } p.col = matcher.start();
								 */
								String s = matcher.group();
								s = s.replaceAll("[ \\t\\{\\}\\r\\n]+", "");
								int pos = matcher.start();
								while (pos > 0) {
									pos--;
									if (matcher.start() - pos > 2000)
										break;
									if (allContent.charAt(pos) == '\r'
											|| allContent.charAt(pos) == '\n') {
										String prevLine = allContent.substring(
												pos + 1, matcher.start());
										prevLine = prevLine.replaceAll("[ \\t]+",
												"");
										if (prevLine.startsWith("if(")) {
											prevLine = prevLine.substring(3,
													prevLine.length() - 1) + ";";
											if (prevLine.equals(s))
											{
												System.out.println("Suspicious line: " + s);
												reportWriter.append("\r\nSuspicious line: " + s);
											}
										}
									}
								}
							}
						}
					} else if (files[i].isDirectory() && !files[i].isHidden()) {
						stack.push(files[i].getAbsolutePath());
					}
				}
			}
			reportWriter.flush();
			reportWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}