package net.fproject.tool.ascode;

import java.io.IOException;
import java.util.regex.Pattern;

public class AsCodeFileInjector extends AsCodeFileWriter {
	public static final String METHOD_INJECT_REGEX = 
			"(^| |\\n|\\r|\\t)+(while|for|for each)+( |\\n|\\r|\\t)*\\(.*";
	public AsCodeFileInjector(ActionScriptFile asFile) {
		super(asFile);		
	}

	public void injectCode() {
		Pattern pattern = Pattern.compile(METHOD_INJECT_REGEX);
		for (ActionScriptClass c : asFile.classes) {
			for (ActionScriptMethod m : c.methods) {
				if (m.getBodyStart() != null)
				{
					Position start = m.getPositionOf(pattern, m.getBodyStart());
					if (start != null && start.isBefore(m.getBodyEnd())) {
						start = m.getBodyStart();
						start = start.add(asFile.sourceLines, 1);
						asFile.insertText(start, "\r\n" + "trace(\"Start method: "
								+ c.name +"."+ m.name+"()\");\r\n");
					}
				}
			}
		}		
	}
	
	public void save(String path) {
		try {
			this.write(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
