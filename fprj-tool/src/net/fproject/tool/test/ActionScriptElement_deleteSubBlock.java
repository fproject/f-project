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
public class ActionScriptElement_deleteSubBlock extends ActionScriptElement{
	public ActionScriptElement_deleteSubBlock(AsCodeLines sourceLines,
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
				TestUtil.loadTestData("ActionScriptElement_deleteSubBlock_001");
		Position start = new Position(1,1);
		Position end = new Position(2,5);
		
		//Call the target method
		this.deleteSubBlock(start, end);
		
		//Prepare output check data
		ActionScriptFile asf = TestUtil.loadAsFileForTest("ActionScriptElement_deleteSubBlock_001check");
		
		//Check the result
		assertTrue(this.sourceLines.equals(asf.sourceLines));
	}

	@Test
	public void test002() {
		//Prepare input data
		sourceLines = 
				TestUtil.loadTestData("ActionScriptElement_deleteSubBlock_001");
		Position start = new Position(6,8);
		Position end = new Position(6,19);
		
		//Call the target method
		this.deleteSubBlock(start, end);
		
		//Prepare output check data
		ActionScriptFile asf = TestUtil.loadAsFileForTest("ActionScriptElement_deleteSubBlock_002check");
		
		//Check the result
		assertTrue(this.sourceLines.equals(asf.sourceLines));
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
