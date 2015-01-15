/**
 * 
 */
package net.fproject.tool.test;

import static org.junit.Assert.*;

import java.io.InputStreamReader;

import net.fproject.tool.ToolUtil;
import net.fproject.tool.ascode.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 * @author Jack
 *
 */
public class AsCodeBlock_insertSubBlock{
	private ActionScriptFile asf;
	private AsCodeBlock block;
	/**
	 * @throws java.lang.Exception
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		InputStreamReader reader = TestUtil.getReaderForTest("AsCodeBlock_insertSubBlock_001");
		asf = new ActionScriptFile(reader);
		asf.parse(null);
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test_insertSubBlock_001() {
		System.out.println("========= 001 : insertSubBlock(block) ==========");
		Position p = new Position(11,5);
		AsCodeLines lines = new AsCodeLines(
				ToolUtil.textToArray("ABCDEF\r\nGHIJKL\r\nOPQRS"));
		block = new AsCodeBlock(lines);
		
		boolean b;
		int blockSize = block.size();
		int lineIncrement = lines.size() - 1;
		Position fileStart = asf.start.clone();
		Position fileEnd = asf.end.clone();
		ActionScriptClass asc = asf.classes.get(0);
		Position classStart = asc.start.clone();
		Position classEnd = asc.end.clone();
		int fileSize = asf.size();
		int classSize = asc.size();
		int method0Size = asc.methods.get(0).size();
		int method1Size = asc.methods.get(1).size();
		int method2Size = asc.methods.get(2).size();
		int method3Size = asc.methods.get(3).size();
		
		Position method0Start = asc.methods.get(0).start.clone();
		Position method0End = asc.methods.get(0).end.clone();
		Position method1Start = asc.methods.get(1).start.clone();
		Position method1End = asc.methods.get(1).end.clone();
		Position method2Start = asc.methods.get(2).start.clone();
		Position method2End = asc.methods.get(2).end.clone();
		Position method3Start = asc.methods.get(3).start.clone();
		Position method3End = asc.methods.get(3).end.clone();
		
		//Invoke target method
		asf.insertSubBlock(p, block);
		
		b = fileStart.equals(asf.start) && classStart.equals(classStart);
		b = b && method0Start.equals(asc.methods.get(0).start);
		b = b && asf.size() == fileSize + blockSize;
		b = b && asc.size() == classSize + blockSize;
		b = b && asc.methods.get(0).size() == method0Size + blockSize;
		b = b && asc.methods.get(1).size() == method1Size;
		b = b && asc.methods.get(2).size() == method2Size;
		b = b && asc.methods.get(3).size() == method3Size;
		b = b && asc.methods.get(0).end.line == method0End.line + lineIncrement;
		b = b && asc.methods.get(1).start.line == method1Start.line + lineIncrement;
		b = b && asc.methods.get(1).end.line == method1End.line + lineIncrement;
		b = b && asc.methods.get(2).start.line == method2Start.line + lineIncrement;
		b = b && asc.methods.get(2).end.line == method2End.line + lineIncrement;
		b = b && asc.methods.get(3).start.line == method3Start.line + lineIncrement;
		b = b && asc.methods.get(3).end.line == method3End.line + lineIncrement;
		assertTrue(b);
	}

}
