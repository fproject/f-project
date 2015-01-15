/**
 * 
 */
package net.fproject.tool.test;

import static org.junit.Assert.*;

import java.util.List;

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
public class ActionScriptElement_insertText extends ActionScriptElement{
	public ActionScriptElement_insertText(AsCodeLines sourceLines,
			Position start, Position end) {
		super(sourceLines, start, end);
	}

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
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test001() {
		//Prepare input data
		sourceLines = 
				TestUtil.loadTestData("ActionScriptElement_insertText_001");
		Position p = new Position(1,1);
		
		//Call the target method
		this.insertText(p, "ABCXYZ\r\n	1234567890\r\n	");
		
		//Prepare output check data
		ActionScriptFile asf = TestUtil.loadAsFileForTest("ActionScriptElement_insertText_001check");
		
		//Check the result
		assertTrue(sourceLines.equals(asf.sourceLines));
	}

	@Test
	public void test002() {
		//Prepare input data
		sourceLines = 
				TestUtil.loadTestData("ActionScriptElement_insertText_001");
		Position p = new Position(1,1);
		
		//Call the target method
		this.insertText(p, "\r\nABCXYZ\r\n	1234567890\r\n	");
		
		//Prepare output check data
		ActionScriptFile asf = TestUtil.loadAsFileForTest("ActionScriptElement_insertText_002check");
		
		//Check the result
		assertTrue(sourceLines.equals(asf.sourceLines));
	}

	@Test
	public void test003() {
		//Prepare input data
		sourceLines = 
				TestUtil.loadTestData("ActionScriptElement_insertText_001");
		Position p = new Position(17,8);
		
		//Call the target method
		this.insertText(p, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
		
		//Prepare output check data
		ActionScriptFile asf = TestUtil.loadAsFileForTest("ActionScriptElement_insertText_003check");
		
		//Check the result
		assertTrue(sourceLines.equals(asf.sourceLines));
	}
	
	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		return null;
	}

	@Override
	protected Position getNextChildKeyWordPos(Position lastKeyPos) {
		return null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		return null;
	}

	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return null;
	}
}
