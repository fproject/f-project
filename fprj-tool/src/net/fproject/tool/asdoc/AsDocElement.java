package net.fproject.tool.asdoc;

import java.util.ArrayList;
import java.util.List;

import net.fproject.tool.ToolUtil;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.OrFilter;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.LineBreakTag;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class AsDocElement {
	protected NodeList contentNodes;
	protected List<String> asDocLines;
	protected List<AsMetadata> metadata;
	protected String name;

	protected String type;
	protected List<AsDocSeeAlso> seeAlsoes;
	protected List<AsDocExample> examples;

	protected AsDocElement parent;

	private String _asDoc;

	protected static int MAX_LINE_LEN = 80;
	protected static String ASDOC_START = "	 /**";
	protected static String ASDOC_END = "	 */";
	protected static String ASDOC_LINE_HEAD = "	 * ";
	protected static String TAB = "	";

	public AsDocElement() {
		// Default constructor
	}

	public AsDocElement(NodeList content) {
		try {
			parse(content);
		} catch (ParserException e) {
			e.printStackTrace();
		}
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setParent(AsDocElement parent) {
		this.parent = parent;
	}

	public boolean parse(Object source) throws ParserException {
		_asDoc = null;
		if (source instanceof String) {
			Parser p = HtmlUtil.getParser();
			p.setResource((String) source);
			NodeList rootNl = p.parse(null);
			HtmlUtil.setCurrentRootNodeList(rootNl);
			contentNodes = parseContentNodes(rootNl);
		} else if (source instanceof NodeList) {
			seeAlsoes = getSeeAlsoes((NodeList) source);
			examples = getExamples((NodeList) source);
			contentNodes = parseContentNodes((NodeList) source);
		} else if (source instanceof Node) {
			seeAlsoes = getSeeAlsoes(((Node) source).getChildren());
			examples = getExamples(((Node) source).getChildren());
			contentNodes = parseContentNodes(((Node) source).getChildren());
		} else
			return false;
		if (contentNodes == null)
			return false;
		removeUnusedNodes(null);
		return true;
	}

	public NodeList parseContentNodes(NodeList sourceNodes) {
		return sourceNodes;
	}

	protected final List<AsDocSeeAlso> getSeeAlsoes(NodeList sourceNodes) {
		NodeList nl = HtmlUtil.searchFor(sourceNodes, Div.class, "class",
				"seeAlso", true);
		NodeFilter childFilter = new OrFilter(
				new NodeClassFilter(LinkTag.class), new NodeClassFilter(
						TextNode.class));
		List<AsDocSeeAlso> sees = new ArrayList<AsDocSeeAlso>();
		if (nl.size() == 0)
			return sees;

		NodeList dummy = new NodeList();
		try {
			Node n = nl.elementAt(0);
			NodeList children = n.getChildren();
			if (children != null) {
				children.keepAllNodesThatMatch(childFilter, true);
				for (int j = 0; j < children.size(); j++) {
					AsDocSeeAlso see = new AsDocSeeAlso();
					dummy.removeAll();
					dummy.add(children.elementAt(j));
					see.parse(dummy);
					sees.add(see);
				}
			}
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return sees;
	}

	protected final List<AsDocExample> getExamples(NodeList sourceNodes) {
		NodeList nl = HtmlUtil.searchFor(sourceNodes, Div.class, "class",
				"listing", true);
		List<AsDocExample> exs = new ArrayList<AsDocExample>();
		if (nl.size() == 0)
			return exs;

		try {
			for (int i = 0; i < nl.size(); i++) {
				Node n = nl.elementAt(i);
				AsDocExample see = new AsDocExample();
				see.parse(n);
				see.parent = this;
				exs.add(see);
			}
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return exs;
	}

	public void contentToAsDoc() {
		if (asDocLines != null)
			return;
		asDocLines = new ArrayList<String>();
		String s = HtmlUtil.toHtml(contentNodes,
				MAX_LINE_LEN - ASDOC_LINE_HEAD.length());
		String[] lines = s.split("\r\n");
		for (String line : lines) {
			asDocLines.add(ASDOC_LINE_HEAD + line);
		}
	}

	public final List<String> getAsDocLines() {
		contentToAsDoc();
		return asDocLines;
	}

	public final String getAsDocLineAt(int i) {
		if (asDocLines == null)
			contentToAsDoc();
		if (asDocLines == null || asDocLines.size() < i + 1)
			return null;
		return asDocLines.get(i);
	}

	public final String getAsDoc() {
		if (_asDoc == null) {
			contentToAsDoc();
			StringBuffer sb = new StringBuffer();
			sb.append(ASDOC_START + "\r\n");
			for (String s : asDocLines) {
				sb.append(s);
				sb.append("\r\n");
			}

			if (this.seeAlsoes != null && this.seeAlsoes.size() > 0) {
				sb.append(ASDOC_LINE_HEAD + "\r\n");
				for (AsDocSeeAlso see : this.seeAlsoes) {
					if (see.getAsDocLines().size() > 0)
						sb.append(see.getAsDocLineAt(0) + "\r\n");
				}
			}

			if (this.examples != null && this.examples.size() > 0) {
				for (AsDocExample ex : this.examples) {
					sb.append(ASDOC_LINE_HEAD + "\r\n" + ASDOC_LINE_HEAD
							+ "@example\r\n");
					for (int i = 0; i < ex.getAsDocLines().size(); i++) {
						sb.append(ex.getAsDocLineAt(i) + "\r\n");
					}
				}
			}

			sb.append(ASDOC_END);
			_asDoc = sb.toString();
		}

		return _asDoc;
	}

	protected final String getTabs(int tabs) {
		String s = "";
		for (int i = 0; i < tabs; i++) {
			s += TAB;
		}
		return s;
	}

	public final String getAsDoc(int tabs) {
		String s = getAsDoc();
		if (s == null || tabs <= 0 || "".equals(s))
			return "";

		int i = 0;
		while (i < s.length()) {
			if (i < s.length() - 2 && s.charAt(i) == '\r'
					&& s.charAt(i + 1) == '\n' && s.charAt(i + 2) != '\r'
					&& s.charAt(i + 2) != '\n') {
				s = s.substring(0, i + 2) + getTabs(tabs) + s.substring(i + 2);
				i += tabs;
			}
			i++;
		}

		return getTabs(tabs) + s;
	}

	@SuppressWarnings("serial")
	protected void removeUnusedNodes(NodeFilter filter) {
		if (filter == null)
			filter = new NodeFilter() {
				@Override
				public boolean accept(Node node) {
					if (node instanceof TextNode)
						return true;
					else if (node instanceof TagNode)
						if (HtmlUtil.contentAllowedTag(node)) {
							if (node instanceof LineBreakTag
									|| !"".equals(ToolUtil.trim(node
											.toPlainTextString())))
								return true;
						}
					return false;
				}
			};
		contentNodes.keepAllNodesThatMatch(filter, true);
		int i = 0;
		while (i < contentNodes.size()) {
			Node node = contentNodes.elementAt(i);
			if ("".equals(ToolUtil.trim(node.toPlainTextString())))
				contentNodes.remove(i);
			else
				i++;
		}
	}

	protected final void appendAsDocBlankLine() {
		int i = asDocLines.size();
		if (ASDOC_END.equals(asDocLines.get(i - 1))) {
			i--;
		}
		asDocLines.add(i, ASDOC_LINE_HEAD);
	}

	protected final void appendAsDocLine(String line) {
		if (line == null || asDocLines == null || asDocLines.size() == 0)
			return;
		if (!line.startsWith(ASDOC_LINE_HEAD))
			line = ASDOC_LINE_HEAD + line;
		int i = asDocLines.size();
		if (ASDOC_END.equals(asDocLines.get(i - 1))) {
			i--;
		}
		asDocLines.add(i, line);
	}

	protected final void setAsDocLine(int index, String line) {
		if (line == null || asDocLines == null || asDocLines.size() < index + 1)
			return;
		asDocLines.set(index, line);
	}

	protected final void appendAsDocLines(List<String> lines) {
		if (lines == null)
			return;
		for (String line : lines) {
			appendAsDocLine(line);
		}
	}

	protected final void insertAsDocLine(int position, String line) {
		if (line == null || asDocLines == null || position > asDocLines.size())
			return;
		if (!line.startsWith(ASDOC_LINE_HEAD))
			line = ASDOC_LINE_HEAD + line;
		asDocLines.add(position, line);
	}

	protected final void insertAsDocLines(int position, List<String> lines) {
		if (lines == null)
			return;
		for (String line : lines) {
			insertAsDocLine(position++, line);
		}
	}
}
