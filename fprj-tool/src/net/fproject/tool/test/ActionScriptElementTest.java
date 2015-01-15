package net.fproject.tool.test;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ 
	ActionScriptElement_getEndOfBlock.class,
	ActionScriptElement_insertText.class,
	ActionScriptElement_deleteSubBlock.class})
public class ActionScriptElementTest {

}
