/**
 * 
 */
package net.fproject.tool.test;

import static org.junit.Assert.*;
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
public class AsCodeLines_All{
	private String[] actionScriptLines;
	private AsCodeLines lines;
	
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
		actionScriptLines = 
				TestUtil.loadTestDataAsStrings("AsCodeLines_All_001");
		actionScriptLines = TestUtil.subArray(actionScriptLines, 4, 17);
		lines = new AsCodeLines(actionScriptLines);
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test001() {
		System.out.println("========= 001 : Constructor ==========");
		int i = 0;
		for (String s : lines) {
			System.out.println((i++)+"["+s+"]");
		}
		assertTrue(lines.size() == 13);
	}
	
	@Test
	public void test002() {
		System.out.println("========= 002 : remove(0) ==========");
		lines.remove(0);
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 12 && lines.get(0).equals("\t\t{"));
	}

	@Test
	public void test003() {
		System.out.println("========= 003 : remove(10) ==========");
		lines.remove(10);
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 12 && lines.get(10).equals("\t\t\t}"));
	}
	
	@Test
	public void test004() {
		System.out.println("========= 004 : remove(size() - 1) ==========");
		lines.remove(12);//size() - 1
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 12);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test005() {
		System.out.println("========= 005 : remove(out of bound) ==========");
		lines.remove(19);
	}
	
	@Test
	public void test006() {
		System.out.println("========= 006 : add() ==========");
		lines.add("New String");
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 14 && lines.get(13).equals("New String"));
	}
	
	@Test
	public void test007() {
		System.out.println("========= 007 : add(0,element) ==========");
		lines.add(0, "New String");
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 14);
	}
	
	@Test
	public void test008() {
		System.out.println("========= 008 : add(10,element) ==========");
		lines.add(10, "New String");
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 14);
	}
	
	@Test
	public void test009() {
		System.out.println("========= 009 : add(13,element) ==========");
		lines.add(13, "New String");
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 14);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test010() {
		System.out.println("========= 010 : add(out of bound,element) ==========");
		lines.add(19, "New String");
	}
	
	@Test
	public void test011() {
		System.out.println("========= 011 : remove(index, count) ==========");
		lines.remove(7, 4);
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 9 && lines.get(7).equals("\t\t\t}"));
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test012() {
		System.out.println("========= 012 : remove(index, outOfBound) ==========");
		lines.remove(7, 14);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test013() {
		System.out.println("========= 013 : remove(outOfBound, count) ==========");
		lines.remove(14, 2);
	}
	
	@Test
	public void test014() {
		System.out.println("========= 014 : add(index, String[]) ==========");
		String[] a = new String[] {"New String 0", "New String 1", "New String 2", "New String 3"};
		lines.add(7, a);
		for (String s : lines) {
			System.out.println("["+s+"]");
		}
		assertTrue(lines.size() == 17 && 
				lines.get(7).equals("New String 0") &&
				lines.get(11).equals("") &&
				lines.get(16).equals("\t\t}"));
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test015() {
		System.out.println("========= 015 : remove(outOfBound, String[]) ==========");
		String[] a = new String[] {"New String 0", "New String 1", "New String 2", "New String 3"};
		lines.add(14, a);
	}
}
