package net.fproject.tool.flexunit;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public abstract class FlexUnitFile {
	public String content;
	public String name;
	public String packageName;

	public void writeFile(String rootFolder) {
		String dirs = rootFolder + "/" + packageName.replace(".", "/");

		(new File(dirs)).mkdirs();

		FileWriter fwriter;
		try {
			fwriter = new FileWriter(dirs + "/" + name+".as");

			BufferedWriter out = new BufferedWriter(fwriter);
			out.write(content);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
