package net.fproject.tool.ascode;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import net.fproject.tool.ToolUtil;

public class ActionScriptFile extends ActionScriptElement implements AsSourceFile{
	public List<ActionScriptClass> classes = new ArrayList<ActionScriptClass>();
	public String packageName;
	public String getPackageName() {
		return packageName;
	}

	public String importLines;
	
	public ActionScriptFile () {
		super(null, null, null);
	}
	public ActionScriptFile (Reader reader) throws IOException {
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
	
	public static ActionScriptFile load(String path) {
		File file = new File(path);
		ActionScriptFile asf = getContents(file);
		int pos = path.lastIndexOf("\\");
		if (pos == -1)
			pos = path.lastIndexOf("/");
		if (pos == -1)
			pos = 0;
		asf.name = path.substring(pos + 1);
		asf.setPath(path);
		
		if (asf.sourceLines == null)
			return null;

		asf.parse(null);

		return asf;
	}

	public void parse(ActionScriptElement parent) {
		Position p = getPositionOfWord("package",
				Pattern.compile(PACKAGE_NAME_REGEX), null);
		if (p != null) {
			Position p1 = getPositionOf("{", p);
			if (p1 != null) {
				packageName = trimEx(subString(p.add(sourceLines, 7), p1));
			}
		}

		AsCodeBlockBase acp = getImportationAt(null);
		if (acp != null) {
			p = acp.start;
			Position p1 = null;
			while (acp != null) {
				p1 = acp.end;
				acp = getImportationAt(acp.end);
			}

			if (p1 != null)
				importLines = subString(p, p1.add(sourceLines, 1));
		}
		super.parse(parent);
	}

	private AsCodeBlockBase getImportationAt(Position fromPos) {
		AsCodeBlockBase acp = new AsCodeBlockBase();

		acp.start = getPositionOfWord("import", Pattern.compile(IMPORT_REGEX),
				fromPos);
		if (acp.start != null) {
			acp.end = getPositionOf(";", acp.start);
		}

		return ownsSubBlock(acp) ? acp : null;
	}

	/**
	 * Fetch the entire contents of a text file. Do not throw Exceptions to the
	 * caller.
	 * 
	 * @param aFile
	 *            is a file which already exists and can be read.
	 */
	private static ActionScriptFile getContents(File aFile) {
		ActionScriptFile asf = null;
		try {
			// use buffering, reading one line at a time
			// FileReader always assumes default encoding is OK!
			BufferedReader input = new BufferedReader(new FileReader(aFile));
			asf = new ActionScriptFile(input);
			try {
				
			} finally {
				input.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return asf;
	}
	
	private String allContent = null;

	private String path = null;
	public void setPath(String value)
	{
		this.path = value;
		this.allContent = null;
	}
	
	public String getPath() {
		return path;
	}
	
	public String getAllContent()
	{
		if (allContent == null && path != null)
		{
			File aFile = new File(this.path);
			StringBuffer contentBuff = new StringBuffer();
			try {
				BufferedReader input = new BufferedReader(new FileReader(aFile));
				try {
					String line = null; // not declared within while loop
					while ((line = input.readLine()) != null) {
						contentBuff.append(line + "\r\n" );
					}
					allContent = contentBuff.toString();
				} finally {
					input.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return allContent;
	}
	
	private String lastKeyWord = null;

	@Override
	protected Position getNextChildKeyWordPos(Position lastKeyPos) {
		Position startPos;
		Position p = lastKeyPos;
		if (lastKeyPos != null && lastKeyWord != null)
			startPos = lastKeyPos.add(sourceLines, lastKeyWord.length());
		else
			startPos = null;

		p = getPositionOf(Pattern.compile(CLASS_REGEX), startPos);
		if (p == null) {
			p = getPositionOf(Pattern.compile(INTERFACE_REGEX), startPos);
			if (p != null)
				lastKeyWord = ActionScriptClass.INTERFACE;
		} else
			lastKeyWord = ActionScriptClass.CLASS;

		if (p != null)
			p = getPositionOf(lastKeyWord, p);

		return ownsPosition(p) ? p : null;
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		ActionScriptClass c = new ActionScriptClass(sourceLines, childBlock.start, childBlock.end);
		try {
			c.type = lastKeyWord;
			c.packageName = this.packageName;
			c.importLines = this.importLines;
			c.parse(this);
			this.classes.add(c);
			return c;
		} catch (IllegalArgumentException iae) {
			iae.printStackTrace();
		}
		return null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		Position p = null;
		boolean isClass = false;
		if (childKeyWordPos == null) {
			p = getPositionOf(Pattern.compile(CLASS_REGEX), null);
			if (p == null)
				p = getPositionOf(Pattern.compile(INTERFACE_REGEX), null);
			else
				isClass = true;

		} else {
			p = getLastPositionOf(Pattern.compile(CLASS_REGEX), childKeyWordPos);
			if (p == null)
				p = getLastPositionOf(Pattern.compile(INTERFACE_REGEX),
						childKeyWordPos);
			else
				isClass = true;
		}
		if (p != null) {
			int i = sourceLines.get(p.line).indexOf(isClass ? ActionScriptClass.CLASS
							: ActionScriptClass.INTERFACE);
			if (i == -1 || i > p.col)
			{
				p.col = ToolUtil.indexOf(sourceLines.get(p.line), "[^ \\t]+");
				if (p.col < 0)
					p.col = 0;
			}
		}
		return p;
	}
	
	public int getClassesCount() {
		return this.classes.size();
	}
	
	public int getMethodsCount() {
		int count = 0;
		for (ActionScriptClass c : this.classes)
		{
			count+= c.methods.size();
		}
		return count;
	}
	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return this.classes;
	}
}
