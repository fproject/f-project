package net.fproject.tool.test;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import net.fproject.tool.ascode.ActionScriptElement;
import net.fproject.tool.ascode.AsCodeFileInjector;
import net.fproject.tool.asdoc.*;

import org.htmlparser.Parser;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class Html2AsDocTest {
	public static void main(String[] args) {
		// test01();
		// test02();
		//test03();
		test05();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	static Object runTest_parse(Class clazz, String testDataPath,
			String outputPath, String ouputMethodName, String parentName) {
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
			if (parentName == null)
				parentName = "Calendar";
			parent.setName(parentName);

			AsDocElement ae = (AsDocElement) obj;
			ae.setParent(parent);

			ae.parse(rootNl.elementAt(0));
			if (ouputMethodName == null)
				ouputMethodName = "getAsDoc";
			Class paramEmpty[] = {};
			Method method = clazz.getMethod(ouputMethodName, paramEmpty);
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

	static Boolean testRegex(String pattern, String target) {
		return target.matches(pattern);
	}
	
	/**********************************************************************/
	
	// AsDocStyle.parse()
	static void test01() {
		runTest_parse(AsDocStyle.class, "G:\\Tmp\\Test01_1.htm",
				"G:\\Tmp\\Test01_1_Output.as", null, null);
	}

	// AsDocClass.parse()
	static void test02() {
		runTest_parse(AsDocClass.class, "G:\\Tmp\\Test02_1.htm",
				"G:\\Tmp\\Test02_Output.as", "buildClassPrototype", null);
	}

	// AsDocEvent.parse() error
	static void test03() {
		Html2AsDoc h = new Html2AsDoc();
		h.html2AsDoc("G:\\Tmp\\Test03_1.htm", "G:\\Tmp\\Test03_1.as", null,
				null);
	}
	
	// ActionScriptElement.MEMBER_VARIABLE_REGEX
	static void test04() {
		String regex = ActionScriptElement.MEMBER_VARIABLE_REGEX;
		System.out.println("1.[expected: false]" + testRegex(regex, " var a"));
		System.out.println("2.[expected: true]" + testRegex(regex, "var a;"));
		System.out.println("3.[expected: true]" + testRegex(regex, " var aa;"));
		System.out.println("4.[expected: true]" + testRegex(regex, "\nprivate var aa;"));
		System.out.println("5.[expected: true]" + testRegex(regex, "\npublic var aa:String;"));
		System.out.println("6.[expected: true]" + testRegex(regex, "\npublic var aa:  String;"));
		System.out.println("7.[expected: true]" + testRegex(regex, "\npublic var aa :  String;"));
		System.out.println("8.[expected: false]" + testRegex(regex, "\npublic var aa:  String"));
		System.out.println("9.[expected: false]" + testRegex(regex, "\npublic var 1aa:String"));
		System.out.println("10.[expected: false]" + testRegex(regex, "\npublic var aa:1String"));
	}

	// AsCodeInjector.METHOD_INJECT_REGEX
	static void test05() {
		String regex = AsCodeFileInjector.METHOD_INJECT_REGEX;
		System.out.println("1.[expected: true]" + testRegex(regex, "			for (var i:int =1; i < 101; i++)"));
		System.out.println("2.[expected: true]" + testRegex(regex, "for (var i:int =1; i < 101; i++)"));
		System.out.println("3.[expected: true]" + testRegex(regex, "for(var i:int =1; i < 101; i++)"));
		System.out.println("4.[expected: true]" + testRegex(regex, "			while (i<1000)"));
		System.out.println("5.[expected: true]" + testRegex(regex, "while (i<1000)"));
		System.out.println("6.[expected: true]" + testRegex(regex, "while(i<1000)"));
		System.out.println("7.[expected: true]" + testRegex(regex, "			for each (wt in wts)"));
		System.out.println("8.[expected: true]" + testRegex(regex, "for each (wt in wts)"));
		System.out.println("9.[expected: true]" + testRegex(regex, "for each(wt in wts)"));
		System.out.println("10.[expected: false]" + testRegex(regex, "foreach(wt in wts)"));
	}
}
