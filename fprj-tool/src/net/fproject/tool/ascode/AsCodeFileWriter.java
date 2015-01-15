package net.fproject.tool.ascode;

import java.io.FileWriter;
import java.io.IOException;

public class AsCodeFileWriter {
	public ActionScriptFile asFile;
	
	public AsCodeFileWriter(ActionScriptFile asFile)
	{
		this.asFile = asFile;
	}
	
	public void write(String path) throws IOException
	{
		if (path == null)
			path = asFile.getPath();
		FileWriter writer = new FileWriter(path);
		boolean isFirst = true;
		for (String s:asFile.sourceLines)
		{
			if (isFirst)
				isFirst = false;
			else
				writer.append("\r\n");
			writer.append(s);			
		}
		writer.flush();
		writer.close();
	}
	
	public void write() throws IOException
	{
		this.write(null);
	}
}
