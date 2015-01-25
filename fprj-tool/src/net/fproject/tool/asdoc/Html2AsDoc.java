package net.fproject.tool.asdoc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Stack;
import org.htmlparser.Parser;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class Html2AsDoc {
	public static void main(String[] args) {

		Html2AsDoc h = new Html2AsDoc();
		// h.html2AsDoc("G:\\Tmp\\BackgroundGrid.htm",
		// "G:\\Tmp\\BackgroundGrid.as", "G:\\Tmp\\examples");
		h.htmlFolder2AsDocFolder("F:/Google Drive/F-PROJECT/Html2AsDoc/com/ibm/ilog/elixir/gantt", "G:\\Tmp\\examples");
		// h.test01();
		// h.test02();

	}

	public static void convertHtmlToASDoc(String htmlFolder, String exampleFolder)
	{
		Html2AsDoc h = new Html2AsDoc();
		h.htmlFolder2AsDocFolder(htmlFolder, exampleFolder);
	}
	
	public void htmlFolder2AsDocFolder(String htmlFolder, String exampleFolder) {
		try {
			FileWriter cssWriter = new FileWriter(htmlFolder + "\\defaults.css");

			Stack<String> stack = new Stack<String>();
			stack.push(htmlFolder);
			while (!stack.empty()) {
				String currentPath = stack.pop();
				File curFile = new File(currentPath);

				File[] files = curFile.listFiles();

				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile() && !files[i].isHidden()) {
						String curHtmlFile = files[i].getAbsolutePath();
						if (curHtmlFile.toLowerCase().endsWith("htm")
								|| curHtmlFile.toLowerCase().endsWith("html")) {
							int pos = curHtmlFile.lastIndexOf('.');
							String asOutputFile = curHtmlFile.substring(0, pos)
									+ ".as";
							html2AsDoc(curHtmlFile, asOutputFile,
									exampleFolder, cssWriter);
						}
					} else if (files[i].isDirectory() && !files[i].isHidden()) {
						stack.push(files[i].getAbsolutePath());
					}
				}
			}

			cssWriter.flush();
			cssWriter.close();
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void html2AsDoc(String htmlFile, String asOutputFile,
			String exampleFolder, FileWriter defaultCSSWriter) {
		FileWriter fwriter;
		try {

			AsDocClass clazz = new AsDocClass();

			clazz.parse(htmlFile);

			System.out.println(clazz.buildClassPrototype());

			if (asOutputFile != null) {
				fwriter = new FileWriter(asOutputFile);

				BufferedWriter out = new BufferedWriter(fwriter);
				out.write(clazz.buildClassPrototype());
				out.flush();
				out.close();
			}

			if (defaultCSSWriter != null) {
				String s = clazz.getDefaultCSS();
				if (s != null)
					defaultCSSWriter.append(s + "\r\n");
			}

			clazz.saveExampleFiles(exampleFolder);

		} catch (ParserException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object runTest_parse(Class clazz, String testDataPath,
			String outputPath, String ouputMethodName) {
		// Class paramsEmpty[] = {};
		Class[] paramObject = new Class[1];
		paramObject[0] = Object.class;
		try {
			Parser p = HtmlUtil.getParser();
			p.setResource(testDataPath);
			NodeList rootNl = p.parse(null);
			HtmlUtil.setCurrentRootNodeList(rootNl);

			Object obj = clazz.newInstance();
			AsDocElement parent = new AsDocElement();
			parent.name = "Calendar";

			AsDocElement ae = (AsDocElement) obj;
			ae.parent = parent;

			ae.parse(rootNl.elementAt(0));
			if (ouputMethodName == null)
				ouputMethodName = "getAsDoc";
			Class paramEmpty[] = {};
			Method method = clazz
					.getDeclaredMethod(ouputMethodName, paramEmpty);
			String s = (String) method.invoke(ae, (Object[]) null);

			FileWriter fwriter = new FileWriter(outputPath);

			BufferedWriter out = new BufferedWriter(fwriter);
			out.write(s);
			out.flush();
			out.close();
			return ae;

		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;
	}
}
