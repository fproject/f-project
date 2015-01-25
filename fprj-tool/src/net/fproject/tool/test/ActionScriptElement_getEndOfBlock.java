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
public class ActionScriptElement_getEndOfBlock extends ActionScriptElement{
	public ActionScriptElement_getEndOfBlock(AsCodeLines sourceLines,
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
				TestUtil.loadTestData("ActionScriptElement_getEndOfBlock_001");
		Position start = getPositionOf("{", null);
		
		//Call the target method
		Position end = getEndOfBlock(start, "{", "}");
		
		//Check the result
		assertTrue(end.equals(new Position(18,0)));
	}

	@Test
	public void test002() {
		//Prepare input data
		sourceLines = 
				TestUtil.loadTestData("ActionScriptElement_getEndOfBlock_001");
		Position start = getPositionOf("{", new Position(2,0));
		
		//Call the target method
		Position end = getEndOfBlock(start, "{", "}");
		
		//Check the result
		assertTrue(end.equals(new Position(16, 1)));
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
