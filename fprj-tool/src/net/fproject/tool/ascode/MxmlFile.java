package net.fproject.tool.ascode;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public class MxmlFile extends ActionScriptElement implements AsSourceFile{
	public List<ActionScriptClass> classes = new ArrayList<ActionScriptClass>();
	public MxmlClass mxmlClass;
	public String[] mxmlLines;
	public String packageName;
	public String getPackageName() {
		String p = path.replaceAll("\\\\|/", ".");
		int start = p.lastIndexOf(".src.");
		int end = p.lastIndexOf(".");
		if (end > 0)
			end = p.lastIndexOf(".", end - 1);
		if (end >= start + 5)
			packageName = p.substring(start + 5, end);
		else
			packageName = "";
		return packageName;
	}
	private String path = null;
	public void setPath(String value)
	{
		this.path = value;
	}
	
	public MxmlFile(Reader reader) throws IOException {
		super(null, 0, 0, -1, -1);
		List<String> cntent = new ArrayList<String>();
		BufferedReader input = new BufferedReader(reader);
		String line = null;
		while ((line = input.readLine()) != null) {
			cntent.add(line);
		}
		sourceLines = new AsCodeLines(cntent.toArray(new String[0]));
		end.line = sourceLines.size() - 1;
		end.col = sourceLines.getLast().length();
	}

	public static final String[] SCRIPT_OPEN = { "<mx:Script>", "<fx:Script>" };
	public static final String[] SCRIPT_CLOSE = { "</mx:Script>",
			"</fx:Script>" };
	public static final String CDATA_OPEN = "<![CDATA[";
	public static final String CDATA_CLOSE = "]]>";

	public static MxmlFile load(String path) {
		File file = new File(path);
		FileReader input;
		try {
			input = new FileReader(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		}
		MxmlFile mf;
		try {
			mf = new MxmlFile(input);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		int pos = path.lastIndexOf("\\");
		if (pos == -1)
			pos = path.lastIndexOf("/");
		if (pos == -1)
			pos = 0;
		mf.name = path.substring(pos + 1);
		mf.setPath(path);
		
		if (mf.sourceLines == null)
			return null;

		mf.parse(null);

		return mf;
	}
	
	@Override
	public void parse(ActionScriptElement parent) {
		super.parse(parent);
		parseMxmlClass();
	}
	
	private void parseMxmlClass()
	{
		mxmlClass = new MxmlClass(sourceLines, start, end);
		mxmlClass.name= this.name.toLowerCase().endsWith(".mxml") ? 
				this.name.substring(0, this.name.length()-5) : this.name;
		mxmlClass.parse(this);
	}
	
	protected void getContents(File aFile) {
		List<String> asLines = new ArrayList<String>();
		List<String> xmlLines = new ArrayList<String>();

		try {
			// use buffering, reading one line at a time
			// FileReader always assumes default encoding is OK!
			BufferedReader input = new BufferedReader(new FileReader(aFile));
			try {
				String line = null; // not declared within while loop
				/*
				 * readLine is a bit quickly : it returns the content of a line
				 * MINUS the newline. it returns null only for the END of the
				 * stream. it returns an empty String if two newlines appear in
				 * a row.
				 */
				boolean scriptOpened = false;
				@SuppressWarnings("unused")
				String scriptOpenTag = null;
				while ((line = input.readLine()) != null) {
					for (String oTag : SCRIPT_OPEN) {
						int i = line.indexOf(oTag);
						if (i > -1) {
							scriptOpened = true;
							scriptOpenTag = oTag;

							if ((i = line.indexOf(CDATA_OPEN)) > -1) {
								line = line.substring(i + CDATA_OPEN.length());
							} else {
								while ((line = input.readLine()) != null) {
									line = line.replaceAll(" |\t" + CDATA_OPEN,
											CDATA_OPEN);
									if (line.startsWith(CDATA_OPEN)) {
										line = line.substring(CDATA_OPEN
												.length());
										break;
									}
								}
							}
							break;
						}
					}
					if (!scriptOpened && line != null)
						xmlLines.add(line);
					else if (scriptOpened) {
						
					}

				}
				this.sourceLines = new AsCodeLines(asLines.toArray(new String[0]));
			} finally {
				input.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		Position end = getPositionOf("</fx:Script>", childBlock.start);
		if(end == null || childBlock.end.isBefore(end))
			end = childBlock.end;
			
		ActionScriptClass c = new ActionScriptClass(sourceLines, childBlock.start, end);
		try {
			//c.type = lastKeyWord;
			c.packageName = this.packageName;
			//c.importLines = this.importLines;
			c.isMxmlScript = true;
			c.name = this.name.toLowerCase().endsWith(".mxml") ? 
					this.name.substring(0, this.name.length()-5) : this.name;
			c.parse(this);
			for(ActionScriptClass cls:this.classes) {
				if(c.name.equals(cls.name))
					c.name += this.classes.size();
			}
			this.classes.add(c);
			return c;
		} catch (IllegalArgumentException iae) {
			iae.printStackTrace();
		}
		return null;
	}

	@Override
	protected Position getNextChildKeyWordPos(Position lastKeyPos) {
		Position searchStart = lastKeyPos == null? null : lastKeyPos.add(sourceLines, 1);
		Position p = this.getPositionOf("<fx:Script", searchStart);
		return ownsPosition(p) ? p : null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		if(childKeyWordPos != null)
			return childKeyWordPos.clone();
		else
			return null;
	}

	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return this.classes;
	}
	
	@Override
	public int getClassesCount() {
		int count = this.classes.size();
		if (count == 0)
			count = 1;
		return count;
	}
	
	@Override
	public int getMethodsCount() {
		int count = 0;
		for (ActionScriptClass c : this.classes)
		{
			count+= c.methods.size();
		}
		return count;
	}
	
	@Override
	protected int getCommentLinesCount() {
		int count = mxmlClass.getCommentLinesCount();
		for (ActionScriptClass c : this.classes)
		{
			count += c.getCommentLinesCount();
		}
		
		return count;
	}
}
