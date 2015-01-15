package net.fproject.tool.test;

import java.io.*;
import java.util.*;

import net.fproject.tool.ascode.ActionScriptFile;
import net.fproject.tool.ascode.AsCodeLines;

public class TestUtil {
	
	public static AsCodeLines loadTestData(String testName) {
		return new AsCodeLines(loadTestDataAsStrings(testName));
	}
	
	public static String[] loadTestDataAsStrings(String testName) {
		List<String> cntent = new ArrayList<String>();
		try {
			BufferedReader input = new BufferedReader(getReaderForTest(testName));
			try {
				String line = null;
				while ((line = input.readLine()) != null) {
					cntent.add(line);
				}				
			} finally {
				input.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return cntent.toArray(new String[0]);
	}
	
	public static ActionScriptFile parseAsFileForTest(String testName) {
		ActionScriptFile asFile= loadAsFileForTest(testName);
		asFile.parse(null);
		return asFile;
	}
	
	public static ActionScriptFile loadAsFileForTest(String testName) {
		try {
			return new ActionScriptFile(getReaderForTest(testName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static InputStreamReader getReaderForTest(String testName) {
		InputStream is = TestUtil.class.getResourceAsStream("/net/fproject/tool/test/data/"+testName+".as");
		return new InputStreamReader (is);
	}
	
	public static boolean checkAsFileContent(ActionScriptFile asFile, String checkerName) {
		ActionScriptFile checker = loadAsFileForTest(checkerName);
		return checker.sourceLines.equals(asFile.sourceLines);
	}
	
	public static final String ouputDataPath = "F:/Tmp/TestOutput/";
	
	public static final String[] subArray(String[] array, int start, int end) {
		String[] a = new String[end - start];
		System.arraycopy(array, start, a, 0, a.length);
		return a;
	}
}
