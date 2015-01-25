package net.fproject.tool.gui;

public class FlexCodeCounterModel {
	public String inputFolder;
	public String outputFile;
	public boolean noOutput;
	public FlexCodeCounterModel(String inputFolder, String outputFile, boolean noOutput)
	{
		this.inputFolder = inputFolder;
		this.outputFile = outputFile;
		this.noOutput = noOutput;
	}
}
