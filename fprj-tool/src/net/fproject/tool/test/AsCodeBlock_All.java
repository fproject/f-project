/**
 * 
 */
package net.fproject.tool.test;

import static org.junit.Assert.*;

import java.util.regex.Pattern;

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
public class AsCodeBlock_All{
	private String[] actionScriptLines;
	private AsCodeLines lines;
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
		actionScriptLines = 
				TestUtil.loadTestDataAsStrings("AsCodeBlock_All_001");
		actionScriptLines = TestUtil.subArray(actionScriptLines, 4, 17);
		lines = new AsCodeLines(actionScriptLines);
		Position start = new Position(1,2);
		Position end = new Position(12,3);
		block = new AsCodeBlock(lines, start, end);
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test_Constructor() {
		System.out.println("========= Constructor ==========");
		int i = 0;
		for (String s : block.toStrings()) {
			System.out.println((i++)+"["+s+"]");
		}
		assertTrue(lines.size() == 13);
	}
	
	@Test
	public void test_getLastPositionOf_001() {
		System.out.println("========= 001 : getLastPositionOf(regex, null) ==========");
		Position p = null;
		p = block.getLastPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p.line == 9 && p.col == 5);
	}

	@Test
	public void test_getLastPositionOf_002() {
		System.out.println("========= 002 : getLastPositionOf(regex, (7,0)) ==========");
		Position p = new Position(7, 0);
		p = block.getLastPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p == null);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getLastPositionOf_003() {
		System.out.println("========= 003 : getLastPositionOf(regex, outOfBound) ==========");
		Position p = new Position(13, 1);
		p = block.getLastPositionOf(Pattern.compile("\\(.*Abc"), p);
	}
	
	@Test
	public void test_getLastPositionOf_004() {
		System.out.println("========= 004 : getLastPositionOf(string, (10,0), null) ==========");
		Position p = new Position(10, 0);
		p = block.getLastPositionOf("(node is Abc)", p, null);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getLastPositionOf_005() {
		System.out.println("========= 005 : getLastPositionOf(string, (10,0), '(') ==========");
		Position p = new Position(11, 0);
		p = block.getLastPositionOf("Subgraph", p, "(");
		assertTrue(p == null);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getLastPositionOf_006() {
		System.out.println("========= 006 : getLastPositionOf(regex, outOfBound, '(') ==========");
		Position p = new Position(13, 1);
		p = block.getLastPositionOf("Subgraph", p, "(");
	}
	
	@Test
	public void test_getLastPositionOf_007() {
		System.out.println("========= 007 : getPositionOf(regex, null) ==========");
		Position p = null;
		p = block.getLastPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getLastPositionOf_008() {
		System.out.println("========= 008 : getPositionOf(regex, null) ==========");
		prepareInput_2();
		Position p = null;
		p = block.getLastPositionOf(Pattern.compile(ActionScriptClass.FUNCTION_REGEX), p);
		assertTrue(p.line == 4 && p.col == 2);
	}
	
	@Test
	public void test_getLastPositionOf_009() {
		System.out.println("========= 009 : getLastPositionOf(regex, (9,5)) ==========");
		Position p = new Position(9, 5);
		p = block.getLastPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_001() {
		System.out.println("========= 001 : getPositionOf(regex, (8,0)) ==========");
		Position p = new Position(9, 0);
		p = block.getPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_002() {
		System.out.println("========= 002 : getPositionOf(regex, (8,5)) ==========");
		Position p = new Position(9, 5);
		p = block.getPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_003() {
		System.out.println("========= 003 : getPositionOf(regex, null) ==========");
		Position p = null;
		p = block.getPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getPositionOf_004() {
		System.out.println("========= 004 : getPositionOf(regex, outOfBound) ==========");
		Position p = new Position(18, 5);
		p = block.getPositionOf(Pattern.compile("\\(.*Abc"), p);
	}
	
	@Test
	public void test_getPositionOf_005() {
		System.out.println("========= 005 : getPositionOf(regex, (10,3)) ==========");
		Position p = new Position(10, 3);
		p = block.getPositionOf(Pattern.compile("\\(.*Abc"), p);
		assertNull(p);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getPositionOf_006() {
		System.out.println("========= 006 : getPositionOf(notFoundRegex, (0,0)) ==========");
		Position p = new Position(0, 0);
		p = block.getPositionOf(Pattern.compile("\\(.*Xyz"), p);
	}
	
	@Test
	public void test_getPositionOf_007() {
		System.out.println("========= 007 : getPositionOf(notFoundRegex, null) ==========");
		Position p = null;
		p = block.getPositionOf(Pattern.compile("\\(.*Xyz"), p);
		assertNull(p);
	}
	
	@Test
	public void test_getPositionOf_008() {
		System.out.println("========= 008 : getPositionOf(string, null) ==========");
		Position p = null;
		p = block.getPositionOf("(node is Abc)", p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_009() {
		System.out.println("========= 009 : getPositionOf(string, (8,5)) ==========");
		Position p = new Position(9, 5);
		p = block.getPositionOf("(node is Abc)", p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_010() {
		System.out.println("========= 010 : getPositionOf(string, (8,0)) ==========");
		Position p = new Position(9, 0);
		p = block.getPositionOf("(node is Abc)", p);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getPositionOf_011() {
		System.out.println("========= 011 : getPositionOf(string, outOfBound) ==========");
		Position p = new Position(18, 5);
		p = block.getPositionOf("(node is Abc)", p);
	}
	
	@Test
	public void test_getPositionOf_012() {
		System.out.println("========= 012 : getPositionOf(string, (9,3), notFoundPos) ==========");
		Position p = new Position(10, 3);
		p = block.getPositionOf("(node is Abc)", p);
		assertNull(p);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getPositionOf_013() {
		System.out.println("========= 013 : getPositionOf(notFoundString, outOfBound) ==========");
		Position p = new Position(0, 0);
		p = block.getPositionOf("(node is Xyz)", p);
	}
	
	@Test
	public void test_getPositionOf_014() {
		System.out.println("========= 014 : getPositionOf(notFoundRegex, null) ==========");
		Position p = null;
		p = block.getPositionOf("(node is Xyz)", p);
		assertNull(p);
	}
	
	@Test
	public void test_getPositionOf_015() {
		System.out.println("========= 015 : getPositionOf(string, null, null) ==========");
		Position p = null;
		String stopSign = null;
		p = block.getPositionOf("(node is Abc)", p, stopSign);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_016() {
		System.out.println("========= 016 : getPositionOf(string, null, existingSignInside) ==========");
		Position p = null;
		String stopSign = "Abc";
		p = block.getPositionOf("(node is Abc)", p, stopSign);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_017() {
		System.out.println("========= 017 : getPositionOf(string, null, existingSignAfter) ==========");
		Position p = null;
		String stopSign = "Subgraph";
		p = block.getPositionOf("locationFieldChangedImpl", p, stopSign);
		assertTrue(p.line == 6 && p.col == 9);
	}
	
	@Test
	public void test_getPositionOf_018() {
		System.out.println("========= 018 : getPositionOf(string, null, existingSignBefore) ==========");
		Position p = null;
		String stopSign = ".";
		p = block.getPositionOf("locationFieldChangedImpl", p, stopSign);
		assertNull(p);
	}
	
	@Test
	public void test_getPositionOf_019() {
		System.out.println("========= 019 : getPositionOf(string, (8,5), null) ==========");
		Position p = new Position(9, 5);
		String stopSign = null;
		p = block.getPositionOf("(node is Abc)", p, stopSign);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test
	public void test_getPositionOf_020() {
		System.out.println("========= 020 : getPositionOf(string, (8,0), null) ==========");
		Position p = new Position(9, 0);
		String stopSign = null;
		p = block.getPositionOf("(node is Abc)", p, stopSign);
		assertTrue(p.line == 9 && p.col == 5);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getPositionOf_021() {
		System.out.println("========= 021 : getPositionOf(string, outOfBound, null) ==========");
		Position p = new Position(18, 5);
		String stopSign = null;
		p = block.getPositionOf("(node is Abc)", p, stopSign);
	}
	
	@Test
	public void test_getPositionOf_022() {
		System.out.println("========= 022 : getPositionOf(string, (9,3), notFoundPos, null) ==========");
		Position p = new Position(10, 3);
		String stopSign = null;
		p = block.getPositionOf("(node is Abc)", p, stopSign);
		assertNull(p);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_getPositionOf_023() {
		System.out.println("========= 023 : getPositionOf(notFoundString, outOfBound, null) ==========");
		Position p = new Position(0, 0);
		String stopSign = null;
		p = block.getPositionOf("(node is Xyz)", p, stopSign);
	}
	
	@Test
	public void test_getPositionOf_024() {
		System.out.println("========= 024 : getPositionOf(notFoundString, null, null) ==========");
		Position p = null;
		p = block.getPositionOf("(node is Xyz)", p);
		assertNull(p);
	}
	
	private void prepareInput_1() {
		actionScriptLines = 
				TestUtil.loadTestDataAsStrings("AsCodeBlock_All_001");
		lines = new AsCodeLines(actionScriptLines);
		Position start = new Position(0,2);
		Position end = new Position(12,3);
		block = new AsCodeBlock(lines, start, end);
	}
	
	private void prepareInput_2() {
		actionScriptLines = 
				TestUtil.loadTestDataAsStrings("AsCodeBlock_All_002");
		
		lines = new AsCodeLines(actionScriptLines);
		Position start = new Position(0,2);
		Position end = new Position(12,3);
		block = new AsCodeBlock(lines, start, end);
	}
	
	private void prepareInput_3() {
		actionScriptLines = 
				TestUtil.loadTestDataAsStrings("AsCodeBlock_All_003");
		lines = new AsCodeLines(actionScriptLines);
		Position start = new Position(0,0);
		Position end = new Position(12,3);
		block = new AsCodeBlock(lines, start, end);
	}
	
	@Test
	public void test_getPositionOfWord_001() {
		System.out.println("========= 001 : getPositionOfWord(string, FUNCTION_REGEX, null) ==========");
		prepareInput_1();
		Pattern pattern = Pattern.compile(ActionScriptElement.FUNCTION_REGEX);
		Position p = null;
		p = block.getPositionOfWord(ActionScriptMethod.FUNCTION, pattern, p);
		assertTrue(p.line == 1 && p.col == 8);
	}
	
	@Test
	public void test_getPositionOfWord_002() {
		System.out.println("========= 002 : getPositionOfWord(string, CLASS_REGEX, null) ==========");
		prepareInput_2();
		Pattern pattern = Pattern.compile(ActionScriptElement.CLASS_REGEX);
		Position p = null;
		p = block.getPositionOfWord(ActionScriptClass.CLASS, pattern, p);
		assertTrue(p.line == 2 && p.col == 14);
	}
	
	@Test
	public void test_getPositionOfWord_003() {
		System.out.println("========= 003 : getPositionOfWord(string, INTERFACE_REGEX, null) ==========");
		prepareInput_3();
		Pattern pattern = Pattern.compile(ActionScriptElement.INTERFACE_REGEX);
		Position p = null;
		p = block.getPositionOfWord(ActionScriptClass.INTERFACE, pattern, p);
		assertTrue(p.line == 6 && p.col == 8);
	}
	
	@Test
	public void test_getPositionOfWord_004() {
		System.out.println("========= 004 : getPositionOfWord(string, IMPORT_REGEX, null) ==========");
		prepareInput_3();
		Pattern pattern = Pattern.compile(ActionScriptElement.IMPORT_REGEX);
		Position p = null;
		p = block.getPositionOfWord("import", pattern, p);
		assertTrue(p.line == 2 && p.col == 1);
	}
	
	@Test
	public void test_getPositionOfWord_005() {
		System.out.println("========= 005 : getPositionOfWord(string, PACKAGE_NAME_REGEX, null) ==========");
		prepareInput_3();
		Pattern pattern = Pattern.compile(ActionScriptElement.PACKAGE_NAME_REGEX);
		Position p = null;
		p = block.getPositionOfWord("package", pattern, p);
		assertTrue(p.line == 0 && p.col == 0);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_hitPreviousWord_001() {
		System.out.println("========= 001 : hitPreviousWord(null) ==========");
		Position p = null;
		block.hitPreviousWord(p);
	}
	
	@Test
	public void test_hitPreviousWord_002() {
		System.out.println("========= 002 : hitPreviousWord((5,8)) ==========");
		Position p = new Position(11, 8);
		AsCodeBlockBase word = block.hitPreviousWord(p);
		assertTrue(word.equals(new AsCodeBlock(block.sourceLines,11,4,11,8)));
	}
	
	@Test
	public void test_hitPreviousWord_003() {
		System.out.println("========= 003 : hitPreviousWord((5,7)) ==========");
		Position p = new Position(6, 7);
		AsCodeBlockBase word = block.hitPreviousWord(p);
		assertTrue(word.equals(new AsCodeBlock(block.sourceLines,4,14,4,22)));
	}
	
	@Test
	public void test_hitPreviousWord_004() {
		System.out.println("========= 004 : hitPreviousWord((0,0) ==========");
		Position p = new Position(1, 2);
		AsCodeBlockBase word = block.hitPreviousWord(p);
		assertNull(word);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_hitPreviousWord_005() {
		System.out.println("========= 005 : hitPreviousWord(outOfBound) ==========");
		Position p = new Position(50, 0);
		block.hitPreviousWord(p);
	}

	@Test(expected = IndexOutOfBoundsException.class)
	public void test_hitNextWord_001() {
		System.out.println("========= 001 : hitNextWord(null) ==========");
		Position p = null;
		block.hitNextWord(p);
	}
	
	@Test
	public void test_hitNextWord_002() {
		System.out.println("========= 002 : hitNextWord((5,8)) ==========");
		Position p = new Position(6, 8);
		AsCodeBlock word = block.hitNextWord(p);
		assertTrue(word.equals(new AsCodeBlock(block.sourceLines,6,9,6,33)));
	}
	
	@Test
	public void test_hitNextWord_003() {
		System.out.println("========= 003 : hitNextWord((5,7)) ==========");
		Position p = new Position(6, 9);
		AsCodeBlock word = block.hitNextWord(p);
		assertTrue(word.equals(new AsCodeBlock(block.sourceLines,6,34,6,42)));
	}
	
	@Test
	public void test_hitNextWord_004() {
		System.out.println("========= 004 : hitNextWord((12,2) ==========");
		Position p = new Position(12, 2);//== block.end -1
		AsCodeBlock word = block.hitNextWord(p);
		assertNull(word);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_hitNextWord_005() {
		System.out.println("========= 005 : hitNextWord(outOfBound) ==========");
		Position p = new Position(12, 3);//== block.end
		block.hitNextWord(p);
	}
	
	@Test(expected = IndexOutOfBoundsException.class)
	public void test_hitNextWord_006() {
		System.out.println("========= 006 : hitNextWord(outOfBound) ==========");
		Position p = new Position(50, 0);
		block.hitNextWord(p);
	}
}
