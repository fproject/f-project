/**
 * 
 */
package net.fproject.tool.test;

import static org.junit.Assert.assertTrue;

import java.io.IOException;

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
public class AsCodeInjector_injectCode{
	private AsCodeFileInjector injector;
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
		try {
			injector.write(TestUtil.ouputDataPath + "AsCodeInjector_injectCode_out.as");
		} catch (IOException ex) {
			ex.printStackTrace();
		}		
	}

	@Test
	public void test001() {
		//Prepare input data
		ActionScriptFile asf = TestUtil.parseAsFileForTest("AsCodeInjector_injectCode_001");
		injector = new AsCodeFileInjector(asf);		
		
		//Call the target method
		injector.injectCode();
		
		//Prepare output check data
		asf = TestUtil.loadAsFileForTest("AsCodeInjector_injectCode_001check");
		
		//Check the result
		assertTrue(asf.sourceLines.equals(injector.asFile.sourceLines));
	}
	
	@Test
	public void test002() {
		//Prepare input data
		ActionScriptFile asf = TestUtil.parseAsFileForTest("AsCodeInjector_injectCode_002");
		injector = new AsCodeFileInjector(asf);		
		
		//Call the target method
		injector.injectCode();
		
		//Prepare output check data
		//asf = TestUtil.loadAsFileForTest("AsCodeInjector_injectCode_002check");
		
		//Check the result
		//assertTrue(FprjToolUtil.compareTwoStringArrays(
		//		asf.actionScriptLines, injector.asFile.actionScriptLines));
	}
}
